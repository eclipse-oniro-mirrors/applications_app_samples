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
  CameraSessionModel,
} from '../model/CameraLogic';

/** CameraSessionZoomTest logic checks (46 cases). */
export default function cameraSessionZoomTest(): void {
  describe('CameraSessionZoomTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0001
     * @tc.name      Camera_SessionZoom_0001
     * @tc.desc      setZoom(-0.5) inside the 1-6 range resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionZoom_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionZoom_0001 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6);
      logInfo("setZoom(-0.5) range=1-6");
      const actual: number = subject.setZoom(-0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0002
     * @tc.name      Camera_SessionZoom_0002
     * @tc.desc      setZoom(-0.11) inside the 1-8 range resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0002 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 8);
      logInfo("setZoom(-0.11) range=1-8");
      const actual: number = subject.setZoom(-0.11);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0003
     * @tc.name      Camera_SessionZoom_0003
     * @tc.desc      setZoom(0.28) inside the 1-10 range resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0003 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 10);
      logInfo("setZoom(0.28) range=1-10");
      const actual: number = subject.setZoom(0.28);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0004
     * @tc.name      Camera_SessionZoom_0004
     * @tc.desc      setZoom(0.67) inside the 1-5 range resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0004 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 5);
      logInfo("setZoom(0.67) range=1-5");
      const actual: number = subject.setZoom(0.67);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0005
     * @tc.name      Camera_SessionZoom_0005
     * @tc.desc      setZoom(1.06) inside the 1-3 range resolves to 1.06.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0005 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 3);
      logInfo("setZoom(1.06) range=1-3");
      const actual: number = subject.setZoom(1.06);
      logInfo('actual=' + String(actual) + ', expected=' + "1.06");
      expect(actual).assertEqual(1.06);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0006
     * @tc.name      Camera_SessionZoom_0006
     * @tc.desc      setZoom(1.45) inside the 1-6.5 range resolves to 1.45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0006 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6.5);
      logInfo("setZoom(1.45) range=1-6.5");
      const actual: number = subject.setZoom(1.45);
      logInfo('actual=' + String(actual) + ', expected=' + "1.45");
      expect(actual).assertEqual(1.45);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0007
     * @tc.name      Camera_SessionZoom_0007
     * @tc.desc      setZoom(1.84) inside the 1-6 range resolves to 1.84.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0007 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6);
      logInfo("setZoom(1.84) range=1-6");
      const actual: number = subject.setZoom(1.84);
      logInfo('actual=' + String(actual) + ', expected=' + "1.84");
      expect(actual).assertEqual(1.84);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0008
     * @tc.name      Camera_SessionZoom_0008
     * @tc.desc      setZoom(2.23) inside the 1-8 range resolves to 2.23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0008 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 8);
      logInfo("setZoom(2.23) range=1-8");
      const actual: number = subject.setZoom(2.23);
      logInfo('actual=' + String(actual) + ', expected=' + "2.23");
      expect(actual).assertEqual(2.23);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0009
     * @tc.name      Camera_SessionZoom_0009
     * @tc.desc      setZoom(2.62) inside the 1-10 range resolves to 2.62.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0009 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 10);
      logInfo("setZoom(2.62) range=1-10");
      const actual: number = subject.setZoom(2.62);
      logInfo('actual=' + String(actual) + ', expected=' + "2.62");
      expect(actual).assertEqual(2.62);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0010
     * @tc.name      Camera_SessionZoom_0010
     * @tc.desc      setZoom(3.01) inside the 1-5 range resolves to 3.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0010 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 5);
      logInfo("setZoom(3.01) range=1-5");
      const actual: number = subject.setZoom(3.01);
      logInfo('actual=' + String(actual) + ', expected=' + "3.01");
      expect(actual).assertEqual(3.01);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0011
     * @tc.name      Camera_SessionZoom_0011
     * @tc.desc      setZoom(3.4) inside the 1-3 range resolves to 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0011 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 3);
      logInfo("setZoom(3.4) range=1-3");
      const actual: number = subject.setZoom(3.4);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0012
     * @tc.name      Camera_SessionZoom_0012
     * @tc.desc      setZoom(3.79) inside the 1-6.5 range resolves to 3.79.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionZoom_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionZoom_0012 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6.5);
      logInfo("setZoom(3.79) range=1-6.5");
      const actual: number = subject.setZoom(3.79);
      logInfo('actual=' + String(actual) + ', expected=' + "3.79");
      expect(actual).assertEqual(3.79);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0013
     * @tc.name      Camera_SessionZoom_0013
     * @tc.desc      setZoom(4.18) inside the 1-6 range resolves to 4.18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0013 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6);
      logInfo("setZoom(4.18) range=1-6");
      const actual: number = subject.setZoom(4.18);
      logInfo('actual=' + String(actual) + ', expected=' + "4.18");
      expect(actual).assertEqual(4.18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0014
     * @tc.name      Camera_SessionZoom_0014
     * @tc.desc      setZoom(4.57) inside the 1-8 range resolves to 4.57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0014 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 8);
      logInfo("setZoom(4.57) range=1-8");
      const actual: number = subject.setZoom(4.57);
      logInfo('actual=' + String(actual) + ', expected=' + "4.57");
      expect(actual).assertEqual(4.57);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0015
     * @tc.name      Camera_SessionZoom_0015
     * @tc.desc      setZoom(4.96) inside the 1-10 range resolves to 4.96.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0015 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 10);
      logInfo("setZoom(4.96) range=1-10");
      const actual: number = subject.setZoom(4.96);
      logInfo('actual=' + String(actual) + ', expected=' + "4.96");
      expect(actual).assertEqual(4.96);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0016
     * @tc.name      Camera_SessionZoom_0016
     * @tc.desc      setZoom(5.35) inside the 1-5 range resolves to 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0016 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 5);
      logInfo("setZoom(5.35) range=1-5");
      const actual: number = subject.setZoom(5.35);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0017
     * @tc.name      Camera_SessionZoom_0017
     * @tc.desc      setZoom(5.74) inside the 1-3 range resolves to 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0017 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 3);
      logInfo("setZoom(5.74) range=1-3");
      const actual: number = subject.setZoom(5.74);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0018
     * @tc.name      Camera_SessionZoom_0018
     * @tc.desc      setZoom(-0.5) inside the 1-6.5 range resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SessionZoom_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionZoom_0018 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6.5);
      logInfo("setZoom(-0.5) range=1-6.5");
      const actual: number = subject.setZoom(-0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0019
     * @tc.name      Camera_SessionZoom_0019
     * @tc.desc      setZoom(-0.11) inside the 1-6 range resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0019 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6);
      logInfo("setZoom(-0.11) range=1-6");
      const actual: number = subject.setZoom(-0.11);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0020
     * @tc.name      Camera_SessionZoom_0020
     * @tc.desc      setZoom(0.28) inside the 1-8 range resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0020 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 8);
      logInfo("setZoom(0.28) range=1-8");
      const actual: number = subject.setZoom(0.28);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0021
     * @tc.name      Camera_SessionZoom_0021
     * @tc.desc      setZoom(0.67) inside the 1-10 range resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0021 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 10);
      logInfo("setZoom(0.67) range=1-10");
      const actual: number = subject.setZoom(0.67);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0022
     * @tc.name      Camera_SessionZoom_0022
     * @tc.desc      setZoom(1.06) inside the 1-5 range resolves to 1.06.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0022 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 5);
      logInfo("setZoom(1.06) range=1-5");
      const actual: number = subject.setZoom(1.06);
      logInfo('actual=' + String(actual) + ', expected=' + "1.06");
      expect(actual).assertEqual(1.06);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0023
     * @tc.name      Camera_SessionZoom_0023
     * @tc.desc      setZoom(1.45) inside the 1-3 range resolves to 1.45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionZoom_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionZoom_0023 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 3);
      logInfo("setZoom(1.45) range=1-3");
      const actual: number = subject.setZoom(1.45);
      logInfo('actual=' + String(actual) + ', expected=' + "1.45");
      expect(actual).assertEqual(1.45);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0024
     * @tc.name      Camera_SessionZoom_0024
     * @tc.desc      setZoom(1.84) inside the 1-6.5 range resolves to 1.84.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0024 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6.5);
      logInfo("setZoom(1.84) range=1-6.5");
      const actual: number = subject.setZoom(1.84);
      logInfo('actual=' + String(actual) + ', expected=' + "1.84");
      expect(actual).assertEqual(1.84);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0025
     * @tc.name      Camera_SessionZoom_0025
     * @tc.desc      setZoom(2.23) inside the 1-6 range resolves to 2.23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0025 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6);
      logInfo("setZoom(2.23) range=1-6");
      const actual: number = subject.setZoom(2.23);
      logInfo('actual=' + String(actual) + ', expected=' + "2.23");
      expect(actual).assertEqual(2.23);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0026
     * @tc.name      Camera_SessionZoom_0026
     * @tc.desc      setZoom(2.62) inside the 1-8 range resolves to 2.62.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0026 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 8);
      logInfo("setZoom(2.62) range=1-8");
      const actual: number = subject.setZoom(2.62);
      logInfo('actual=' + String(actual) + ', expected=' + "2.62");
      expect(actual).assertEqual(2.62);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0027
     * @tc.name      Camera_SessionZoom_0027
     * @tc.desc      setZoom(3.01) inside the 1-10 range resolves to 3.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0027 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 10);
      logInfo("setZoom(3.01) range=1-10");
      const actual: number = subject.setZoom(3.01);
      logInfo('actual=' + String(actual) + ', expected=' + "3.01");
      expect(actual).assertEqual(3.01);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0028
     * @tc.name      Camera_SessionZoom_0028
     * @tc.desc      setZoom(3.4) inside the 1-5 range resolves to 3.4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0028 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 5);
      logInfo("setZoom(3.4) range=1-5");
      const actual: number = subject.setZoom(3.4);
      logInfo('actual=' + String(actual) + ', expected=' + "3.4");
      expect(actual).assertEqual(3.4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0029
     * @tc.name      Camera_SessionZoom_0029
     * @tc.desc      setZoom(3.79) inside the 1-3 range resolves to 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0029 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 3);
      logInfo("setZoom(3.79) range=1-3");
      const actual: number = subject.setZoom(3.79);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0030
     * @tc.name      Camera_SessionZoom_0030
     * @tc.desc      setZoom(4.18) inside the 1-6.5 range resolves to 4.18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0030 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6.5);
      logInfo("setZoom(4.18) range=1-6.5");
      const actual: number = subject.setZoom(4.18);
      logInfo('actual=' + String(actual) + ', expected=' + "4.18");
      expect(actual).assertEqual(4.18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0031
     * @tc.name      Camera_SessionZoom_0031
     * @tc.desc      setZoom(4.57) inside the 1-6 range resolves to 4.57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0031 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6);
      logInfo("setZoom(4.57) range=1-6");
      const actual: number = subject.setZoom(4.57);
      logInfo('actual=' + String(actual) + ', expected=' + "4.57");
      expect(actual).assertEqual(4.57);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0032
     * @tc.name      Camera_SessionZoom_0032
     * @tc.desc      setZoom(4.96) inside the 1-8 range resolves to 4.96.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0032 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 8);
      logInfo("setZoom(4.96) range=1-8");
      const actual: number = subject.setZoom(4.96);
      logInfo('actual=' + String(actual) + ', expected=' + "4.96");
      expect(actual).assertEqual(4.96);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0033
     * @tc.name      Camera_SessionZoom_0033
     * @tc.desc      setZoom(5.35) inside the 1-10 range resolves to 5.35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0033 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 10);
      logInfo("setZoom(5.35) range=1-10");
      const actual: number = subject.setZoom(5.35);
      logInfo('actual=' + String(actual) + ', expected=' + "5.35");
      expect(actual).assertEqual(5.35);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0034
     * @tc.name      Camera_SessionZoom_0034
     * @tc.desc      setZoom(5.74) inside the 1-5 range resolves to 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionZoom_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionZoom_0034 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 5);
      logInfo("setZoom(5.74) range=1-5");
      const actual: number = subject.setZoom(5.74);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0035
     * @tc.name      Camera_SessionZoom_0035
     * @tc.desc      setZoom(-0.5) inside the 1-3 range resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SessionZoom_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionZoom_0035 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 3);
      logInfo("setZoom(-0.5) range=1-3");
      const actual: number = subject.setZoom(-0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0036
     * @tc.name      Camera_SessionZoom_0036
     * @tc.desc      setZoom(-0.11) inside the 1-6.5 range resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0036 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6.5);
      logInfo("setZoom(-0.11) range=1-6.5");
      const actual: number = subject.setZoom(-0.11);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0037
     * @tc.name      Camera_SessionZoom_0037
     * @tc.desc      setZoom(0.28) inside the 1-6 range resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0037 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6);
      logInfo("setZoom(0.28) range=1-6");
      const actual: number = subject.setZoom(0.28);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0038
     * @tc.name      Camera_SessionZoom_0038
     * @tc.desc      setZoom(0.67) inside the 1-8 range resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0038 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 8);
      logInfo("setZoom(0.67) range=1-8");
      const actual: number = subject.setZoom(0.67);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0039
     * @tc.name      Camera_SessionZoom_0039
     * @tc.desc      setZoom(1.06) inside the 1-10 range resolves to 1.06.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0039 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 10);
      logInfo("setZoom(1.06) range=1-10");
      const actual: number = subject.setZoom(1.06);
      logInfo('actual=' + String(actual) + ', expected=' + "1.06");
      expect(actual).assertEqual(1.06);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0040
     * @tc.name      Camera_SessionZoom_0040
     * @tc.desc      setZoom(1.45) inside the 1-5 range resolves to 1.45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0040 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 5);
      logInfo("setZoom(1.45) range=1-5");
      const actual: number = subject.setZoom(1.45);
      logInfo('actual=' + String(actual) + ', expected=' + "1.45");
      expect(actual).assertEqual(1.45);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0041
     * @tc.name      Camera_SessionZoom_0041
     * @tc.desc      setZoom(1.84) inside the 1-3 range resolves to 1.84.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0041 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 3);
      logInfo("setZoom(1.84) range=1-3");
      const actual: number = subject.setZoom(1.84);
      logInfo('actual=' + String(actual) + ', expected=' + "1.84");
      expect(actual).assertEqual(1.84);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0042
     * @tc.name      Camera_SessionZoom_0042
     * @tc.desc      setZoom(2.23) inside the 1-6.5 range resolves to 2.23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0042 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6.5);
      logInfo("setZoom(2.23) range=1-6.5");
      const actual: number = subject.setZoom(2.23);
      logInfo('actual=' + String(actual) + ', expected=' + "2.23");
      expect(actual).assertEqual(2.23);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0043
     * @tc.name      Camera_SessionZoom_0043
     * @tc.desc      setZoom(2.62) inside the 1-6 range resolves to 2.62.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0043 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 6);
      logInfo("setZoom(2.62) range=1-6");
      const actual: number = subject.setZoom(2.62);
      logInfo('actual=' + String(actual) + ', expected=' + "2.62");
      expect(actual).assertEqual(2.62);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0044
     * @tc.name      Camera_SessionZoom_0044
     * @tc.desc      setZoom(3.01) inside the 1-8 range resolves to 3.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0044 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 8);
      logInfo("setZoom(3.01) range=1-8");
      const actual: number = subject.setZoom(3.01);
      logInfo('actual=' + String(actual) + ', expected=' + "3.01");
      expect(actual).assertEqual(3.01);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0045
     * @tc.name      Camera_SessionZoom_0045
     * @tc.desc      setZoom(3.4) inside the 1-10 range resolves to 3.4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionZoom_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionZoom_0045 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 10);
      logInfo("setZoom(3.4) range=1-10");
      const actual: number = subject.setZoom(3.4);
      logInfo('actual=' + String(actual) + ', expected=' + "3.4");
      expect(actual).assertEqual(3.4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_ZOOM_0046
     * @tc.name      Camera_SessionZoom_0046
     * @tc.desc      setZoom(3.79) inside the 1-5 range resolves to 3.79.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionZoom_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionZoom_0046 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.updateSlider(1, 5);
      logInfo("setZoom(3.79) range=1-5");
      const actual: number = subject.setZoom(3.79);
      logInfo('actual=' + String(actual) + ', expected=' + "3.79");
      expect(actual).assertEqual(3.79);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionZoom_0046 end`);
    });
  });
}
