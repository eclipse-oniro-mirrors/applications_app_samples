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

/** AnimateSwitchCameraTest logic checks (46 cases). */
export default function animateSwitchCameraTest(): void {
  describe('AnimateSwitchCameraTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0001
     * @tc.name      Camera_AnimateSwitchCamera_0001
     * @tc.desc      onSwitchCamera repeated 1 times ends at flip 180 with 9 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateSwitchCamera_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0001 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x1 back=false preMode=false preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:9");
      expect(actual).assertEqual("180:9");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0002
     * @tc.name      Camera_AnimateSwitchCamera_0002
     * @tc.desc      onSwitchCamera repeated 1 times ends at flip 180 with 12 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0002 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x1 back=false preMode=false preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:12");
      expect(actual).assertEqual("180:12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0003
     * @tc.name      Camera_AnimateSwitchCamera_0003
     * @tc.desc      onSwitchCamera repeated 1 times ends at flip 180 with 12 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0003 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x1 back=false preMode=true preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:12");
      expect(actual).assertEqual("180:12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0004
     * @tc.name      Camera_AnimateSwitchCamera_0004
     * @tc.desc      onSwitchCamera repeated 1 times ends at flip 180 with 15 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0004 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x1 back=false preMode=true preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:15");
      expect(actual).assertEqual("180:15");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0005
     * @tc.name      Camera_AnimateSwitchCamera_0005
     * @tc.desc      onSwitchCamera repeated 1 times ends at flip 0 with 9 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0005 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x1 back=true preMode=false preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:9");
      expect(actual).assertEqual("0:9");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0006
     * @tc.name      Camera_AnimateSwitchCamera_0006
     * @tc.desc      onSwitchCamera repeated 1 times ends at flip 0 with 12 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0006 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x1 back=true preMode=false preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:12");
      expect(actual).assertEqual("0:12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0007
     * @tc.name      Camera_AnimateSwitchCamera_0007
     * @tc.desc      onSwitchCamera repeated 1 times ends at flip 0 with 12 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0007 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x1 back=true preMode=true preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:12");
      expect(actual).assertEqual("0:12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0008
     * @tc.name      Camera_AnimateSwitchCamera_0008
     * @tc.desc      onSwitchCamera repeated 1 times ends at flip 0 with 15 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0008 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x1 back=true preMode=true preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:15");
      expect(actual).assertEqual("0:15");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0009
     * @tc.name      Camera_AnimateSwitchCamera_0009
     * @tc.desc      onSwitchCamera repeated 2 times ends at flip 180 with 18 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0009 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x2 back=false preMode=false preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:18");
      expect(actual).assertEqual("180:18");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0010
     * @tc.name      Camera_AnimateSwitchCamera_0010
     * @tc.desc      onSwitchCamera repeated 2 times ends at flip 180 with 21 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0010 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x2 back=false preMode=false preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:21");
      expect(actual).assertEqual("180:21");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0011
     * @tc.name      Camera_AnimateSwitchCamera_0011
     * @tc.desc      onSwitchCamera repeated 2 times ends at flip 180 with 21 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0011 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x2 back=false preMode=true preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:21");
      expect(actual).assertEqual("180:21");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0012
     * @tc.name      Camera_AnimateSwitchCamera_0012
     * @tc.desc      onSwitchCamera repeated 2 times ends at flip 180 with 24 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateSwitchCamera_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0012 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x2 back=false preMode=true preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:24");
      expect(actual).assertEqual("180:24");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0013
     * @tc.name      Camera_AnimateSwitchCamera_0013
     * @tc.desc      onSwitchCamera repeated 2 times ends at flip 0 with 18 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0013 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x2 back=true preMode=false preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:18");
      expect(actual).assertEqual("0:18");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0014
     * @tc.name      Camera_AnimateSwitchCamera_0014
     * @tc.desc      onSwitchCamera repeated 2 times ends at flip 0 with 21 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0014 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x2 back=true preMode=false preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:21");
      expect(actual).assertEqual("0:21");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0015
     * @tc.name      Camera_AnimateSwitchCamera_0015
     * @tc.desc      onSwitchCamera repeated 2 times ends at flip 0 with 21 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0015 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x2 back=true preMode=true preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:21");
      expect(actual).assertEqual("0:21");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0016
     * @tc.name      Camera_AnimateSwitchCamera_0016
     * @tc.desc      onSwitchCamera repeated 2 times ends at flip 0 with 24 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0016 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x2 back=true preMode=true preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:24");
      expect(actual).assertEqual("0:24");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0017
     * @tc.name      Camera_AnimateSwitchCamera_0017
     * @tc.desc      onSwitchCamera repeated 3 times ends at flip 180 with 27 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0017 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x3 back=false preMode=false preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:27");
      expect(actual).assertEqual("180:27");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0018
     * @tc.name      Camera_AnimateSwitchCamera_0018
     * @tc.desc      onSwitchCamera repeated 3 times ends at flip 180 with 30 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_AnimateSwitchCamera_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0018 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x3 back=false preMode=false preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:30");
      expect(actual).assertEqual("180:30");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0019
     * @tc.name      Camera_AnimateSwitchCamera_0019
     * @tc.desc      onSwitchCamera repeated 3 times ends at flip 180 with 30 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0019 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x3 back=false preMode=true preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:30");
      expect(actual).assertEqual("180:30");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0020
     * @tc.name      Camera_AnimateSwitchCamera_0020
     * @tc.desc      onSwitchCamera repeated 3 times ends at flip 180 with 33 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0020 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x3 back=false preMode=true preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:33");
      expect(actual).assertEqual("180:33");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0021
     * @tc.name      Camera_AnimateSwitchCamera_0021
     * @tc.desc      onSwitchCamera repeated 3 times ends at flip 0 with 27 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0021 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x3 back=true preMode=false preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:27");
      expect(actual).assertEqual("0:27");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0022
     * @tc.name      Camera_AnimateSwitchCamera_0022
     * @tc.desc      onSwitchCamera repeated 3 times ends at flip 0 with 30 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0022 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x3 back=true preMode=false preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:30");
      expect(actual).assertEqual("0:30");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0023
     * @tc.name      Camera_AnimateSwitchCamera_0023
     * @tc.desc      onSwitchCamera repeated 3 times ends at flip 0 with 30 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateSwitchCamera_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0023 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x3 back=true preMode=true preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:30");
      expect(actual).assertEqual("0:30");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0024
     * @tc.name      Camera_AnimateSwitchCamera_0024
     * @tc.desc      onSwitchCamera repeated 4 times ends at flip 180 with 36 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0024 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x4 back=false preMode=false preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:36");
      expect(actual).assertEqual("180:36");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0025
     * @tc.name      Camera_AnimateSwitchCamera_0025
     * @tc.desc      onSwitchCamera repeated 4 times ends at flip 180 with 39 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0025 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x4 back=false preMode=false preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:39");
      expect(actual).assertEqual("180:39");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0026
     * @tc.name      Camera_AnimateSwitchCamera_0026
     * @tc.desc      onSwitchCamera repeated 4 times ends at flip 180 with 39 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0026 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x4 back=false preMode=true preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:39");
      expect(actual).assertEqual("180:39");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0027
     * @tc.name      Camera_AnimateSwitchCamera_0027
     * @tc.desc      onSwitchCamera repeated 4 times ends at flip 180 with 42 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0027 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x4 back=false preMode=true preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:42");
      expect(actual).assertEqual("180:42");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0028
     * @tc.name      Camera_AnimateSwitchCamera_0028
     * @tc.desc      onSwitchCamera repeated 4 times ends at flip 0 with 36 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0028 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x4 back=true preMode=false preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:36");
      expect(actual).assertEqual("0:36");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0029
     * @tc.name      Camera_AnimateSwitchCamera_0029
     * @tc.desc      onSwitchCamera repeated 4 times ends at flip 0 with 39 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0029 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x4 back=true preMode=false preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:39");
      expect(actual).assertEqual("0:39");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0030
     * @tc.name      Camera_AnimateSwitchCamera_0030
     * @tc.desc      onSwitchCamera repeated 4 times ends at flip 0 with 39 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0030 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x4 back=true preMode=true preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:39");
      expect(actual).assertEqual("0:39");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0031
     * @tc.name      Camera_AnimateSwitchCamera_0031
     * @tc.desc      onSwitchCamera repeated 4 times ends at flip 0 with 42 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0031 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x4 back=true preMode=true preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:42");
      expect(actual).assertEqual("0:42");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0032
     * @tc.name      Camera_AnimateSwitchCamera_0032
     * @tc.desc      onSwitchCamera repeated 5 times ends at flip 180 with 45 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0032 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x5 back=false preMode=false preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:45");
      expect(actual).assertEqual("180:45");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0033
     * @tc.name      Camera_AnimateSwitchCamera_0033
     * @tc.desc      onSwitchCamera repeated 5 times ends at flip 180 with 48 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0033 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x5 back=false preMode=false preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:48");
      expect(actual).assertEqual("180:48");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0034
     * @tc.name      Camera_AnimateSwitchCamera_0034
     * @tc.desc      onSwitchCamera repeated 5 times ends at flip 180 with 48 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateSwitchCamera_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0034 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x5 back=false preMode=true preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:48");
      expect(actual).assertEqual("180:48");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0035
     * @tc.name      Camera_AnimateSwitchCamera_0035
     * @tc.desc      onSwitchCamera repeated 5 times ends at flip 180 with 51 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_AnimateSwitchCamera_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0035 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x5 back=false preMode=true preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:51");
      expect(actual).assertEqual("180:51");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0036
     * @tc.name      Camera_AnimateSwitchCamera_0036
     * @tc.desc      onSwitchCamera repeated 5 times ends at flip 0 with 45 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0036 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x5 back=true preMode=false preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:45");
      expect(actual).assertEqual("0:45");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0037
     * @tc.name      Camera_AnimateSwitchCamera_0037
     * @tc.desc      onSwitchCamera repeated 5 times ends at flip 0 with 48 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0037 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x5 back=true preMode=false preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:48");
      expect(actual).assertEqual("0:48");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0038
     * @tc.name      Camera_AnimateSwitchCamera_0038
     * @tc.desc      onSwitchCamera repeated 5 times ends at flip 0 with 48 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0038 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x5 back=true preMode=true preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:48");
      expect(actual).assertEqual("0:48");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0039
     * @tc.name      Camera_AnimateSwitchCamera_0039
     * @tc.desc      onSwitchCamera repeated 5 times ends at flip 0 with 51 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0039 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x5 back=true preMode=true preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:51");
      expect(actual).assertEqual("0:51");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0040
     * @tc.name      Camera_AnimateSwitchCamera_0040
     * @tc.desc      onSwitchCamera repeated 6 times ends at flip 180 with 54 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0040 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x6 back=false preMode=false preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:54");
      expect(actual).assertEqual("180:54");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0041
     * @tc.name      Camera_AnimateSwitchCamera_0041
     * @tc.desc      onSwitchCamera repeated 6 times ends at flip 180 with 57 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0041 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x6 back=false preMode=false preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:57");
      expect(actual).assertEqual("180:57");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0042
     * @tc.name      Camera_AnimateSwitchCamera_0042
     * @tc.desc      onSwitchCamera repeated 6 times ends at flip 180 with 57 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0042 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x6 back=false preMode=true preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:57");
      expect(actual).assertEqual("180:57");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0043
     * @tc.name      Camera_AnimateSwitchCamera_0043
     * @tc.desc      onSwitchCamera repeated 6 times ends at flip 180 with 60 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0043 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x6 back=false preMode=true preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "180:60");
      expect(actual).assertEqual("180:60");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0044
     * @tc.name      Camera_AnimateSwitchCamera_0044
     * @tc.desc      onSwitchCamera repeated 6 times ends at flip 0 with 54 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0044 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x6 back=true preMode=false preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:54");
      expect(actual).assertEqual("0:54");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0045
     * @tc.name      Camera_AnimateSwitchCamera_0045
     * @tc.desc      onSwitchCamera repeated 6 times ends at flip 0 with 57 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateSwitchCamera_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0045 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x6 back=true preMode=false preFrame=true");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:57");
      expect(actual).assertEqual("0:57");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_SWITCH_CAMERA_0046
     * @tc.name      Camera_AnimateSwitchCamera_0046
     * @tc.desc      onSwitchCamera repeated 6 times ends at flip 0 with 57 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateSwitchCamera_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateSwitchCamera_0046 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      subject.onSwitchCamera();
      logInfo("onSwitchCamera x6 back=true preMode=true preFrame=false");
      const actual: string = subject.rotation + ':' + subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "0:57");
      expect(actual).assertEqual("0:57");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}AnimateSwitchCamera_0046 end`);
    });
  });
}
