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

/** AnimateCaptureTest logic checks (46 cases). */
export default function animateCaptureTest(): void {
  describe('AnimateCaptureTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0001
     * @tc.name      Camera_AnimateCapture_0001
     * @tc.desc      onCaptureClick repeated 1 times restores flash opacity 1 after 3 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateCapture_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateCapture_0001 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      logInfo("onCaptureClick x1 back=false preMode=false preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0002
     * @tc.name      Camera_AnimateCapture_0002
     * @tc.desc      onCaptureClick repeated 1 times restores flash opacity 1 after 6 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0002 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onCaptureClick();
      logInfo("onCaptureClick x1 back=false preMode=false preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0003
     * @tc.name      Camera_AnimateCapture_0003
     * @tc.desc      onCaptureClick repeated 1 times restores flash opacity 1 after 6 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0003 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onCaptureClick();
      logInfo("onCaptureClick x1 back=false preMode=true preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0004
     * @tc.name      Camera_AnimateCapture_0004
     * @tc.desc      onCaptureClick repeated 1 times restores flash opacity 1 after 9 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0004 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onCaptureClick();
      logInfo("onCaptureClick x1 back=false preMode=true preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0005
     * @tc.name      Camera_AnimateCapture_0005
     * @tc.desc      onCaptureClick repeated 1 times restores flash opacity 1 after 3 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0005 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onCaptureClick();
      logInfo("onCaptureClick x1 back=true preMode=false preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0006
     * @tc.name      Camera_AnimateCapture_0006
     * @tc.desc      onCaptureClick repeated 1 times restores flash opacity 1 after 6 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0006 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onCaptureClick();
      logInfo("onCaptureClick x1 back=true preMode=false preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0007
     * @tc.name      Camera_AnimateCapture_0007
     * @tc.desc      onCaptureClick repeated 1 times restores flash opacity 1 after 6 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0007 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onCaptureClick();
      logInfo("onCaptureClick x1 back=true preMode=true preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0008
     * @tc.name      Camera_AnimateCapture_0008
     * @tc.desc      onCaptureClick repeated 1 times restores flash opacity 1 after 9 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0008 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onCaptureClick();
      logInfo("onCaptureClick x1 back=true preMode=true preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0009
     * @tc.name      Camera_AnimateCapture_0009
     * @tc.desc      onCaptureClick repeated 2 times restores flash opacity 1 after 6 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0009 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x2 back=false preMode=false preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0010
     * @tc.name      Camera_AnimateCapture_0010
     * @tc.desc      onCaptureClick repeated 2 times restores flash opacity 1 after 9 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0010 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x2 back=false preMode=false preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0011
     * @tc.name      Camera_AnimateCapture_0011
     * @tc.desc      onCaptureClick repeated 2 times restores flash opacity 1 after 9 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0011 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x2 back=false preMode=true preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0012
     * @tc.name      Camera_AnimateCapture_0012
     * @tc.desc      onCaptureClick repeated 2 times restores flash opacity 1 after 12 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateCapture_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateCapture_0012 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x2 back=false preMode=true preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0013
     * @tc.name      Camera_AnimateCapture_0013
     * @tc.desc      onCaptureClick repeated 2 times restores flash opacity 1 after 6 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0013 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x2 back=true preMode=false preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0014
     * @tc.name      Camera_AnimateCapture_0014
     * @tc.desc      onCaptureClick repeated 2 times restores flash opacity 1 after 9 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0014 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x2 back=true preMode=false preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0015
     * @tc.name      Camera_AnimateCapture_0015
     * @tc.desc      onCaptureClick repeated 2 times restores flash opacity 1 after 9 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0015 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x2 back=true preMode=true preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0016
     * @tc.name      Camera_AnimateCapture_0016
     * @tc.desc      onCaptureClick repeated 2 times restores flash opacity 1 after 12 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0016 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x2 back=true preMode=true preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0017
     * @tc.name      Camera_AnimateCapture_0017
     * @tc.desc      onCaptureClick repeated 3 times restores flash opacity 1 after 9 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0017 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x3 back=false preMode=false preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0018
     * @tc.name      Camera_AnimateCapture_0018
     * @tc.desc      onCaptureClick repeated 3 times restores flash opacity 1 after 12 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_AnimateCapture_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AnimateCapture_0018 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x3 back=false preMode=false preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0019
     * @tc.name      Camera_AnimateCapture_0019
     * @tc.desc      onCaptureClick repeated 3 times restores flash opacity 1 after 12 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0019 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x3 back=false preMode=true preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0020
     * @tc.name      Camera_AnimateCapture_0020
     * @tc.desc      onCaptureClick repeated 3 times restores flash opacity 1 after 15 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0020 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x3 back=false preMode=true preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0021
     * @tc.name      Camera_AnimateCapture_0021
     * @tc.desc      onCaptureClick repeated 3 times restores flash opacity 1 after 9 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0021 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x3 back=true preMode=false preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0022
     * @tc.name      Camera_AnimateCapture_0022
     * @tc.desc      onCaptureClick repeated 3 times restores flash opacity 1 after 12 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0022 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x3 back=true preMode=false preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0023
     * @tc.name      Camera_AnimateCapture_0023
     * @tc.desc      onCaptureClick repeated 3 times restores flash opacity 1 after 12 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimateCapture_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimateCapture_0023 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x3 back=true preMode=true preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0024
     * @tc.name      Camera_AnimateCapture_0024
     * @tc.desc      onCaptureClick repeated 4 times restores flash opacity 1 after 12 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0024 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x4 back=false preMode=false preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0025
     * @tc.name      Camera_AnimateCapture_0025
     * @tc.desc      onCaptureClick repeated 4 times restores flash opacity 1 after 15 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0025 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x4 back=false preMode=false preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0026
     * @tc.name      Camera_AnimateCapture_0026
     * @tc.desc      onCaptureClick repeated 4 times restores flash opacity 1 after 15 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0026 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x4 back=false preMode=true preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0027
     * @tc.name      Camera_AnimateCapture_0027
     * @tc.desc      onCaptureClick repeated 4 times restores flash opacity 1 after 18 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0027 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x4 back=false preMode=true preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0028
     * @tc.name      Camera_AnimateCapture_0028
     * @tc.desc      onCaptureClick repeated 4 times restores flash opacity 1 after 12 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0028 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x4 back=true preMode=false preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0029
     * @tc.name      Camera_AnimateCapture_0029
     * @tc.desc      onCaptureClick repeated 4 times restores flash opacity 1 after 15 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0029 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x4 back=true preMode=false preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0030
     * @tc.name      Camera_AnimateCapture_0030
     * @tc.desc      onCaptureClick repeated 4 times restores flash opacity 1 after 15 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0030 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x4 back=true preMode=true preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0031
     * @tc.name      Camera_AnimateCapture_0031
     * @tc.desc      onCaptureClick repeated 4 times restores flash opacity 1 after 18 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0031 begin`);
      const subject: AnimateModel = new AnimateModel(true);
      subject.onModeChange();
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x4 back=true preMode=true preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0032
     * @tc.name      Camera_AnimateCapture_0032
     * @tc.desc      onCaptureClick repeated 5 times restores flash opacity 1 after 15 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0032 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x5 back=false preMode=false preFrame=false");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0033
     * @tc.name      Camera_AnimateCapture_0033
     * @tc.desc      onCaptureClick repeated 5 times restores flash opacity 1 after 18 steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimateCapture_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimateCapture_0033 begin`);
      const subject: AnimateModel = new AnimateModel(false);
      subject.onFrameStart();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      subject.onCaptureClick();
      logInfo("onCaptureClick x5 back=false preMode=false preFrame=true");
      const actual: number = subject.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimateCapture_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIMATE_CAPTURE_0034
     * @tc.name      Camera_AnimateCapture_0034
