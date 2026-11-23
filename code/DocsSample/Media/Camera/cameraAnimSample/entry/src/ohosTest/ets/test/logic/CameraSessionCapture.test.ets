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

/** CameraSessionCaptureTest logic checks (46 cases). */
export default function cameraSessionCaptureTest(): void {
  describe('CameraSessionCaptureTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0001
     * @tc.name      Camera_SessionCapture_0001
     * @tc.desc      takePicture() with photo scene 1, init=true, cameras=0, index=0 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionCapture_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCapture_0001 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 0, 0, true, true);
      logInfo("takePicture() scene=1 init=true cameras=0 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0002
     * @tc.name      Camera_SessionCapture_0002
     * @tc.desc      takePicture() with photo scene 1, init=true, cameras=0, index=1 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0002 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 0, 1, true, false);
      logInfo("takePicture() scene=1 init=true cameras=0 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0003
     * @tc.name      Camera_SessionCapture_0003
     * @tc.desc      takePicture() with photo scene 1, init=true, cameras=1, index=0 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0003 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 1, 0, true, true);
      logInfo("takePicture() scene=1 init=true cameras=1 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0004
     * @tc.name      Camera_SessionCapture_0004
     * @tc.desc      takePicture() with photo scene 1, init=true, cameras=1, index=1 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0004 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 1, 1, true, false);
      logInfo("takePicture() scene=1 init=true cameras=1 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0005
     * @tc.name      Camera_SessionCapture_0005
     * @tc.desc      takePicture() with photo scene 1, init=true, cameras=2, index=0 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0005 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 2, 0, true, true);
      logInfo("takePicture() scene=1 init=true cameras=2 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0006
     * @tc.name      Camera_SessionCapture_0006
     * @tc.desc      takePicture() with photo scene 1, init=true, cameras=2, index=1 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0006 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 2, 1, true, false);
      logInfo("takePicture() scene=1 init=true cameras=2 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0007
     * @tc.name      Camera_SessionCapture_0007
     * @tc.desc      takePicture() with photo scene 1, init=true, cameras=3, index=0 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0007 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 0, true, true);
      logInfo("takePicture() scene=1 init=true cameras=3 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0008
     * @tc.name      Camera_SessionCapture_0008
     * @tc.desc      takePicture() with photo scene 1, init=true, cameras=3, index=1 returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0008 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, false);
      logInfo("takePicture() scene=1 init=true cameras=3 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0009
     * @tc.name      Camera_SessionCapture_0009
     * @tc.desc      takePicture() with photo scene 1, init=false, cameras=0, index=0 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0009 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      logInfo("takePicture() scene=1 init=false cameras=0 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0010
     * @tc.name      Camera_SessionCapture_0010
     * @tc.desc      takePicture() with photo scene 1, init=false, cameras=0, index=2 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0010 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      logInfo("takePicture() scene=1 init=false cameras=0 index=2");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0011
     * @tc.name      Camera_SessionCapture_0011
     * @tc.desc      takePicture() with photo scene 1, init=false, cameras=1, index=0 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0011 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      logInfo("takePicture() scene=1 init=false cameras=1 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0012
     * @tc.name      Camera_SessionCapture_0012
     * @tc.desc      takePicture() with photo scene 1, init=false, cameras=1, index=2 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionCapture_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCapture_0012 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      logInfo("takePicture() scene=1 init=false cameras=1 index=2");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0013
     * @tc.name      Camera_SessionCapture_0013
     * @tc.desc      takePicture() with photo scene 1, init=false, cameras=2, index=0 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0013 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      logInfo("takePicture() scene=1 init=false cameras=2 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0014
     * @tc.name      Camera_SessionCapture_0014
     * @tc.desc      takePicture() with photo scene 1, init=false, cameras=2, index=2 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0014 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      logInfo("takePicture() scene=1 init=false cameras=2 index=2");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0015
     * @tc.name      Camera_SessionCapture_0015
     * @tc.desc      takePicture() with photo scene 1, init=false, cameras=3, index=0 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0015 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      logInfo("takePicture() scene=1 init=false cameras=3 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0016
     * @tc.name      Camera_SessionCapture_0016
     * @tc.desc      takePicture() with photo scene 1, init=false, cameras=3, index=2 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0016 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      logInfo("takePicture() scene=1 init=false cameras=3 index=2");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0017
     * @tc.name      Camera_SessionCapture_0017
     * @tc.desc      takePicture() with photo scene 2, init=true, cameras=0, index=1 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0017 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 0, 1, true, true);
      logInfo("takePicture() scene=2 init=true cameras=0 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0018
     * @tc.name      Camera_SessionCapture_0018
     * @tc.desc      takePicture() with photo scene 2, init=true, cameras=0, index=2 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SessionCapture_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCapture_0018 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 0, 2, true, false);
      logInfo("takePicture() scene=2 init=true cameras=0 index=2");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0019
     * @tc.name      Camera_SessionCapture_0019
     * @tc.desc      takePicture() with photo scene 2, init=true, cameras=1, index=1 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0019 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 1, 1, true, true);
      logInfo("takePicture() scene=2 init=true cameras=1 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0020
     * @tc.name      Camera_SessionCapture_0020
     * @tc.desc      takePicture() with photo scene 2, init=true, cameras=1, index=2 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0020 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 1, 2, true, false);
      logInfo("takePicture() scene=2 init=true cameras=1 index=2");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0021
     * @tc.name      Camera_SessionCapture_0021
     * @tc.desc      takePicture() with photo scene 2, init=true, cameras=2, index=1 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0021 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 1, true, true);
      logInfo("takePicture() scene=2 init=true cameras=2 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0022
     * @tc.name      Camera_SessionCapture_0022
     * @tc.desc      takePicture() with photo scene 2, init=true, cameras=2, index=2 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0022 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 2, true, false);
      logInfo("takePicture() scene=2 init=true cameras=2 index=2");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0023
     * @tc.name      Camera_SessionCapture_0023
     * @tc.desc      takePicture() with photo scene 2, init=true, cameras=3, index=1 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionCapture_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCapture_0023 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 1, true, true);
      logInfo("takePicture() scene=2 init=true cameras=3 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0024
     * @tc.name      Camera_SessionCapture_0024
     * @tc.desc      takePicture() with photo scene 2, init=false, cameras=0, index=0 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0024 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      logInfo("takePicture() scene=2 init=false cameras=0 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0025
     * @tc.name      Camera_SessionCapture_0025
     * @tc.desc      takePicture() with photo scene 2, init=false, cameras=0, index=1 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0025 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      logInfo("takePicture() scene=2 init=false cameras=0 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0026
     * @tc.name      Camera_SessionCapture_0026
     * @tc.desc      takePicture() with photo scene 2, init=false, cameras=1, index=0 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0026 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      logInfo("takePicture() scene=2 init=false cameras=1 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0027
     * @tc.name      Camera_SessionCapture_0027
     * @tc.desc      takePicture() with photo scene 2, init=false, cameras=1, index=1 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0027 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      logInfo("takePicture() scene=2 init=false cameras=1 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0028
     * @tc.name      Camera_SessionCapture_0028
     * @tc.desc      takePicture() with photo scene 2, init=false, cameras=2, index=0 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0028 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      logInfo("takePicture() scene=2 init=false cameras=2 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0029
     * @tc.name      Camera_SessionCapture_0029
     * @tc.desc      takePicture() with photo scene 2, init=false, cameras=2, index=1 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0029 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      logInfo("takePicture() scene=2 init=false cameras=2 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0030
     * @tc.name      Camera_SessionCapture_0030
     * @tc.desc      takePicture() with photo scene 2, init=false, cameras=3, index=0 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0030 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      logInfo("takePicture() scene=2 init=false cameras=3 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0031
     * @tc.name      Camera_SessionCapture_0031
     * @tc.desc      takePicture() with photo scene 2, init=false, cameras=3, index=1 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0031 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      logInfo("takePicture() scene=2 init=false cameras=3 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0032
     * @tc.name      Camera_SessionCapture_0032
     * @tc.desc      takePicture() with photo scene 3, init=true, cameras=0, index=0 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0032 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      subject.init(true, 0, 0, true, false);
      logInfo("takePicture() scene=3 init=true cameras=0 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0033
     * @tc.name      Camera_SessionCapture_0033
     * @tc.desc      takePicture() with photo scene 3, init=true, cameras=0, index=2 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0033 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      subject.init(true, 0, 2, true, true);
      logInfo("takePicture() scene=3 init=true cameras=0 index=2");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0034
     * @tc.name      Camera_SessionCapture_0034
     * @tc.desc      takePicture() with photo scene 3, init=true, cameras=1, index=0 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionCapture_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCapture_0034 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      subject.init(true, 1, 0, true, false);
      logInfo("takePicture() scene=3 init=true cameras=1 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0035
     * @tc.name      Camera_SessionCapture_0035
     * @tc.desc      takePicture() with photo scene 3, init=true, cameras=1, index=2 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SessionCapture_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCapture_0035 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      subject.init(true, 1, 2, true, true);
      logInfo("takePicture() scene=3 init=true cameras=1 index=2");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0036
     * @tc.name      Camera_SessionCapture_0036
     * @tc.desc      takePicture() with photo scene 3, init=true, cameras=2, index=0 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0036 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      subject.init(true, 2, 0, true, false);
      logInfo("takePicture() scene=3 init=true cameras=2 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0037
     * @tc.name      Camera_SessionCapture_0037
     * @tc.desc      takePicture() with photo scene 3, init=true, cameras=2, index=2 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0037 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      subject.init(true, 2, 2, true, true);
      logInfo("takePicture() scene=3 init=true cameras=2 index=2");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0038
     * @tc.name      Camera_SessionCapture_0038
     * @tc.desc      takePicture() with photo scene 3, init=true, cameras=3, index=0 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0038 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      subject.init(true, 3, 0, true, false);
      logInfo("takePicture() scene=3 init=true cameras=3 index=0");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0039
     * @tc.name      Camera_SessionCapture_0039
     * @tc.desc      takePicture() with photo scene 3, init=true, cameras=3, index=2 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0039 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      subject.init(true, 3, 2, true, true);
      logInfo("takePicture() scene=3 init=true cameras=3 index=2");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0040
     * @tc.name      Camera_SessionCapture_0040
     * @tc.desc      takePicture() with photo scene 3, init=false, cameras=0, index=1 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0040 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      logInfo("takePicture() scene=3 init=false cameras=0 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0041
     * @tc.name      Camera_SessionCapture_0041
     * @tc.desc      takePicture() with photo scene 3, init=false, cameras=0, index=2 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0041 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      logInfo("takePicture() scene=3 init=false cameras=0 index=2");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0042
     * @tc.name      Camera_SessionCapture_0042
     * @tc.desc      takePicture() with photo scene 3, init=false, cameras=1, index=1 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0042 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      logInfo("takePicture() scene=3 init=false cameras=1 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0043
     * @tc.name      Camera_SessionCapture_0043
     * @tc.desc      takePicture() with photo scene 3, init=false, cameras=1, index=2 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0043 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      logInfo("takePicture() scene=3 init=false cameras=1 index=2");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0044
     * @tc.name      Camera_SessionCapture_0044
     * @tc.desc      takePicture() with photo scene 3, init=false, cameras=2, index=1 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0044 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      logInfo("takePicture() scene=3 init=false cameras=2 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0045
     * @tc.name      Camera_SessionCapture_0045
     * @tc.desc      takePicture() with photo scene 3, init=false, cameras=2, index=2 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionCapture_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCapture_0045 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      logInfo("takePicture() scene=3 init=false cameras=2 index=2");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_CAPTURE_0046
     * @tc.name      Camera_SessionCapture_0046
     * @tc.desc      takePicture() with photo scene 3, init=false, cameras=3, index=1 returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionCapture_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCapture_0046 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(3);
      logInfo("takePicture() scene=3 init=false cameras=3 index=1");
      const actual: boolean = subject.takePicture();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionCapture_0046 end`);
    });
  });
}
