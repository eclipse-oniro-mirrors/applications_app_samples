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

/** CameraSessionVideoTest logic checks (34 cases). */
export default function cameraSessionVideoTest(): void {
  describe('CameraSessionVideoTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0001
     * @tc.name      Camera_SessionVideo_0001
     * @tc.desc      video op sequence stop>start on scene 1 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionVideo_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionVideo_0001 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      logInfo("scene=1 ops=stop>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0002
     * @tc.name      Camera_SessionVideo_0002
     * @tc.desc      video op sequence start>stop>start on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0002 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.startVideo();
      subject.stopVideo();
      logInfo("scene=2 ops=start>stop>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0003
     * @tc.name      Camera_SessionVideo_0003
     * @tc.desc      video op sequence stop>stop>start>start on scene 2 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0003 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.stopVideo();
      subject.startVideo();
      logInfo("scene=2 ops=stop>stop>start>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0004
     * @tc.name      Camera_SessionVideo_0004
     * @tc.desc      video op sequence start>start>stop>start>start on scene 2 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0004 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.startVideo();
      subject.startVideo();
      subject.stopVideo();
      subject.startVideo();
      logInfo("scene=2 ops=start>start>stop>start>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0005
     * @tc.name      Camera_SessionVideo_0005
     * @tc.desc      video op sequence stop>start>stop>start>start>start on scene 2 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0005 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.startVideo();
      subject.stopVideo();
      subject.startVideo();
      subject.startVideo();
      logInfo("scene=2 ops=stop>start>stop>start>start>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0006
     * @tc.name      Camera_SessionVideo_0006
     * @tc.desc      video op sequence start on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0006 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      logInfo("scene=2 ops=start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0007
     * @tc.name      Camera_SessionVideo_0007
     * @tc.desc      video op sequence stop>stop on scene 2 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0007 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      logInfo("scene=2 ops=stop>stop");
      const actual: boolean = subject.stopVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0008
     * @tc.name      Camera_SessionVideo_0008
     * @tc.desc      video op sequence start>start>start on scene 1 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0008 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 2, 0, true, true);
      subject.startVideo();
      subject.startVideo();
      logInfo("scene=1 ops=start>start>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0009
     * @tc.name      Camera_SessionVideo_0009
     * @tc.desc      video op sequence stop>start>start>stop on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0009 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.startVideo();
      subject.startVideo();
      logInfo("scene=2 ops=stop>start>start>stop");
      const actual: boolean = subject.stopVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0010
     * @tc.name      Camera_SessionVideo_0010
     * @tc.desc      video op sequence start>stop>start>stop>start on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0010 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.startVideo();
      subject.stopVideo();
      subject.startVideo();
      subject.stopVideo();
      logInfo("scene=2 ops=start>stop>start>stop>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0011
     * @tc.name      Camera_SessionVideo_0011
     * @tc.desc      video op sequence stop>stop>start>stop>start>start on scene 2 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0011 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.stopVideo();
      subject.startVideo();
      subject.stopVideo();
      subject.startVideo();
      logInfo("scene=2 ops=stop>stop>start>stop>start>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0012
     * @tc.name      Camera_SessionVideo_0012
     * @tc.desc      video op sequence stop>start on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionVideo_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionVideo_0012 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      logInfo("scene=2 ops=stop>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0013
     * @tc.name      Camera_SessionVideo_0013
     * @tc.desc      video op sequence start>stop>stop on scene 2 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0013 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.startVideo();
      subject.stopVideo();
      logInfo("scene=2 ops=start>stop>stop");
      const actual: boolean = subject.stopVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0014
     * @tc.name      Camera_SessionVideo_0014
     * @tc.desc      video op sequence stop>stop>stop>stop on scene 1 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0014 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.stopVideo();
      subject.stopVideo();
      logInfo("scene=1 ops=stop>stop>stop>stop");
      const actual: boolean = subject.stopVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0015
     * @tc.name      Camera_SessionVideo_0015
     * @tc.desc      video op sequence start>start>start>start>stop on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0015 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.startVideo();
      subject.startVideo();
      subject.startVideo();
      subject.startVideo();
      logInfo("scene=2 ops=start>start>start>start>stop");
      const actual: boolean = subject.stopVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0016
     * @tc.name      Camera_SessionVideo_0016
     * @tc.desc      video op sequence stop>start>start>start>stop>start on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0016 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.startVideo();
      subject.startVideo();
      subject.startVideo();
      subject.stopVideo();
      logInfo("scene=2 ops=stop>start>start>start>stop>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0017
     * @tc.name      Camera_SessionVideo_0017
     * @tc.desc      video op sequence start>start>stop on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0017 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.startVideo();
      subject.startVideo();
      logInfo("scene=2 ops=start>start>stop");
      const actual: boolean = subject.stopVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0018
     * @tc.name      Camera_SessionVideo_0018
     * @tc.desc      video op sequence stop>start>stop>start on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SessionVideo_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionVideo_0018 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.startVideo();
      subject.stopVideo();
      logInfo("scene=2 ops=stop>start>stop>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0019
     * @tc.name      Camera_SessionVideo_0019
     * @tc.desc      video op sequence start>stop>stop>start>stop on scene 1 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0019 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 2, 0, true, true);
      subject.startVideo();
      subject.stopVideo();
      subject.stopVideo();
      subject.startVideo();
      logInfo("scene=1 ops=start>stop>stop>start>stop");
      const actual: boolean = subject.stopVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0020
     * @tc.name      Camera_SessionVideo_0020
     * @tc.desc      video op sequence stop>stop>stop>start>stop>start on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0020 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.stopVideo();
      subject.stopVideo();
      subject.startVideo();
      subject.stopVideo();
      logInfo("scene=2 ops=stop>stop>stop>start>stop>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0021
     * @tc.name      Camera_SessionVideo_0021
     * @tc.desc      video op sequence stop>stop>start>stop on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0021 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.stopVideo();
      subject.startVideo();
      logInfo("scene=2 ops=stop>stop>start>stop");
      const actual: boolean = subject.stopVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0022
     * @tc.name      Camera_SessionVideo_0022
     * @tc.desc      video op sequence start>start>stop>stop>stop on scene 2 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0022 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.startVideo();
      subject.startVideo();
      subject.stopVideo();
      subject.stopVideo();
      logInfo("scene=2 ops=start>start>stop>stop>stop");
      const actual: boolean = subject.stopVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0023
     * @tc.name      Camera_SessionVideo_0023
     * @tc.desc      video op sequence stop>start>stop>stop>stop>start on scene 1 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionVideo_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionVideo_0023 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.startVideo();
      subject.stopVideo();
      subject.stopVideo();
      subject.stopVideo();
      logInfo("scene=1 ops=stop>start>stop>stop>stop>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0024
     * @tc.name      Camera_SessionVideo_0024
     * @tc.desc      video op sequence start>start>start on scene 2 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0024 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.startVideo();
      subject.startVideo();
      logInfo("scene=2 ops=start>start>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0025
     * @tc.name      Camera_SessionVideo_0025
     * @tc.desc      video op sequence stop>start>start>start on scene 2 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0025 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.startVideo();
      subject.startVideo();
      logInfo("scene=2 ops=stop>start>start>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0026
     * @tc.name      Camera_SessionVideo_0026
     * @tc.desc      video op sequence start>stop>start>start>start on scene 2 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0026 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.startVideo();
      subject.stopVideo();
      subject.startVideo();
      subject.startVideo();
      logInfo("scene=2 ops=start>stop>start>start>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0027
     * @tc.name      Camera_SessionVideo_0027
     * @tc.desc      video op sequence stop>stop>start>start>start>stop on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0027 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.stopVideo();
      subject.startVideo();
      subject.startVideo();
      subject.startVideo();
      logInfo("scene=2 ops=stop>stop>start>start>start>stop");
      const actual: boolean = subject.stopVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0028
     * @tc.name      Camera_SessionVideo_0028
     * @tc.desc      video op sequence start on scene 1 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0028 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 2, 0, true, true);
      logInfo("scene=1 ops=start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0029
     * @tc.name      Camera_SessionVideo_0029
     * @tc.desc      video op sequence stop>stop>stop>start on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0029 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.stopVideo();
      subject.stopVideo();
      logInfo("scene=2 ops=stop>stop>stop>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0030
     * @tc.name      Camera_SessionVideo_0030
     * @tc.desc      video op sequence start>start>start>stop>start on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0030 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.startVideo();
      subject.startVideo();
      subject.startVideo();
      subject.stopVideo();
      logInfo("scene=2 ops=start>start>start>stop>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0031
     * @tc.name      Camera_SessionVideo_0031
     * @tc.desc      video op sequence stop>start>start>stop>start>stop on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0031 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.startVideo();
      subject.startVideo();
      subject.stopVideo();
      subject.startVideo();
      logInfo("scene=2 ops=stop>start>start>stop>start>stop");
      const actual: boolean = subject.stopVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0032
     * @tc.name      Camera_SessionVideo_0032
     * @tc.desc      video op sequence stop>stop on scene 1 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0032 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      logInfo("scene=1 ops=stop>stop");
      const actual: boolean = subject.stopVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0033
     * @tc.name      Camera_SessionVideo_0033
     * @tc.desc      video op sequence stop>start>stop>stop on scene 2 ends with false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionVideo_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionVideo_0033 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.stopVideo();
      subject.startVideo();
      subject.stopVideo();
      logInfo("scene=2 ops=stop>start>stop>stop");
      const actual: boolean = subject.stopVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_VIDEO_0034
     * @tc.name      Camera_SessionVideo_0034
     * @tc.desc      video op sequence start>stop>stop>stop>start on scene 2 ends with true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionVideo_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionVideo_0034 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 2, 0, true, true);
      subject.startVideo();
      subject.stopVideo();
      subject.stopVideo();
      subject.stopVideo();
      logInfo("scene=2 ops=start>stop>stop>stop>start");
      const actual: boolean = subject.startVideo();
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionVideo_0034 end`);
    });
  });
}
