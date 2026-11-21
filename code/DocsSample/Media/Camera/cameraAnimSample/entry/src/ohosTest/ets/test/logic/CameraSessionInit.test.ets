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
  SCENE_NORMAL_PHOTO,
} from '../model/CameraLogic';

/** CameraSessionInitTest logic checks (46 cases). */
export default function cameraSessionInitTest(): void {
  describe('CameraSessionInitTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0001
     * @tc.name      Camera_SessionInit_0001
     * @tc.desc      init(managerReady=true, cameras=0, index=0, scene=true, open=true) returns "no-camera".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionInit_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionInit_0001 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 0, 0, true, true)");
      const actual: string = subject.init(true, 0, 0, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-camera");
      expect(actual).assertEqual("no-camera");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0002
     * @tc.name      Camera_SessionInit_0002
     * @tc.desc      init(managerReady=true, cameras=0, index=0, scene=false, open=true) returns "no-camera".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0002 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 0, 0, false, true)");
      const actual: string = subject.init(true, 0, 0, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-camera");
      expect(actual).assertEqual("no-camera");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0003
     * @tc.name      Camera_SessionInit_0003
     * @tc.desc      init(managerReady=true, cameras=0, index=1, scene=true, open=false) returns "no-camera".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0003 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 0, 1, true, false)");
      const actual: string = subject.init(true, 0, 1, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-camera");
      expect(actual).assertEqual("no-camera");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0004
     * @tc.name      Camera_SessionInit_0004
     * @tc.desc      init(managerReady=true, cameras=0, index=2, scene=true, open=true) returns "no-camera".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0004 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 0, 2, true, true)");
      const actual: string = subject.init(true, 0, 2, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-camera");
      expect(actual).assertEqual("no-camera");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0005
     * @tc.name      Camera_SessionInit_0005
     * @tc.desc      init(managerReady=true, cameras=0, index=2, scene=false, open=false) returns "no-camera".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0005 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 0, 2, false, false)");
      const actual: string = subject.init(true, 0, 2, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-camera");
      expect(actual).assertEqual("no-camera");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0006
     * @tc.name      Camera_SessionInit_0006
     * @tc.desc      init(managerReady=true, cameras=0, index=-1, scene=true, open=false) returns "no-camera".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0006 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 0, -1, true, false)");
      const actual: string = subject.init(true, 0, -1, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-camera");
      expect(actual).assertEqual("no-camera");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0007
     * @tc.name      Camera_SessionInit_0007
     * @tc.desc      init(managerReady=true, cameras=1, index=0, scene=true, open=true) returns "ok".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0007 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 1, 0, true, true)");
      const actual: string = subject.init(true, 1, 0, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0008
     * @tc.name      Camera_SessionInit_0008
     * @tc.desc      init(managerReady=true, cameras=1, index=0, scene=false, open=false) returns "scene-unsupported".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0008 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 1, 0, false, false)");
      const actual: string = subject.init(true, 1, 0, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "scene-unsupported");
      expect(actual).assertEqual("scene-unsupported");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0009
     * @tc.name      Camera_SessionInit_0009
     * @tc.desc      init(managerReady=true, cameras=1, index=1, scene=false, open=true) returns "no-camera".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0009 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 1, 1, false, true)");
      const actual: string = subject.init(true, 1, 1, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-camera");
      expect(actual).assertEqual("no-camera");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0010
     * @tc.name      Camera_SessionInit_0010
     * @tc.desc      init(managerReady=true, cameras=1, index=2, scene=true, open=false) returns "no-camera".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0010 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 1, 2, true, false)");
      const actual: string = subject.init(true, 1, 2, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-camera");
      expect(actual).assertEqual("no-camera");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0011
     * @tc.name      Camera_SessionInit_0011
     * @tc.desc      init(managerReady=true, cameras=1, index=2, scene=false, open=false) returns "no-camera".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0011 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 1, 2, false, false)");
      const actual: string = subject.init(true, 1, 2, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-camera");
      expect(actual).assertEqual("no-camera");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0012
     * @tc.name      Camera_SessionInit_0012
     * @tc.desc      init(managerReady=true, cameras=1, index=-1, scene=false, open=true) returns "scene-unsupported".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionInit_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionInit_0012 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 1, -1, false, true)");
      const actual: string = subject.init(true, 1, -1, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "scene-unsupported");
      expect(actual).assertEqual("scene-unsupported");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0013
     * @tc.name      Camera_SessionInit_0013
     * @tc.desc      init(managerReady=true, cameras=2, index=0, scene=true, open=false) returns "open-failed".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0013 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 2, 0, true, false)");
      const actual: string = subject.init(true, 2, 0, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "open-failed");
      expect(actual).assertEqual("open-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0014
     * @tc.name      Camera_SessionInit_0014
     * @tc.desc      init(managerReady=true, cameras=2, index=1, scene=true, open=true) returns "ok".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0014 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 2, 1, true, true)");
      const actual: string = subject.init(true, 2, 1, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0015
     * @tc.name      Camera_SessionInit_0015
     * @tc.desc      init(managerReady=true, cameras=2, index=1, scene=false, open=true) returns "scene-unsupported".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0015 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 2, 1, false, true)");
      const actual: string = subject.init(true, 2, 1, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "scene-unsupported");
      expect(actual).assertEqual("scene-unsupported");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0016
     * @tc.name      Camera_SessionInit_0016
     * @tc.desc      init(managerReady=true, cameras=2, index=2, scene=true, open=false) returns "no-camera".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0016 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 2, 2, true, false)");
      const actual: string = subject.init(true, 2, 2, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-camera");
      expect(actual).assertEqual("no-camera");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0017
     * @tc.name      Camera_SessionInit_0017
     * @tc.desc      init(managerReady=true, cameras=2, index=-1, scene=true, open=true) returns "ok".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0017 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 2, -1, true, true)");
      const actual: string = subject.init(true, 2, -1, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0018
     * @tc.name      Camera_SessionInit_0018
     * @tc.desc      init(managerReady=true, cameras=2, index=-1, scene=false, open=false) returns "scene-unsupported".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SessionInit_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionInit_0018 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 2, -1, false, false)");
      const actual: string = subject.init(true, 2, -1, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "scene-unsupported");
      expect(actual).assertEqual("scene-unsupported");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0019
     * @tc.name      Camera_SessionInit_0019
     * @tc.desc      init(managerReady=true, cameras=3, index=0, scene=false, open=true) returns "scene-unsupported".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0019 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 3, 0, false, true)");
      const actual: string = subject.init(true, 3, 0, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "scene-unsupported");
      expect(actual).assertEqual("scene-unsupported");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0020
     * @tc.name      Camera_SessionInit_0020
     * @tc.desc      init(managerReady=true, cameras=3, index=1, scene=true, open=true) returns "ok".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0020 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 3, 1, true, true)");
      const actual: string = subject.init(true, 3, 1, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0021
     * @tc.name      Camera_SessionInit_0021
     * @tc.desc      init(managerReady=true, cameras=3, index=1, scene=false, open=false) returns "scene-unsupported".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0021 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 3, 1, false, false)");
      const actual: string = subject.init(true, 3, 1, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "scene-unsupported");
      expect(actual).assertEqual("scene-unsupported");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0022
     * @tc.name      Camera_SessionInit_0022
     * @tc.desc      init(managerReady=true, cameras=3, index=2, scene=false, open=true) returns "scene-unsupported".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0022 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 3, 2, false, true)");
      const actual: string = subject.init(true, 3, 2, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "scene-unsupported");
      expect(actual).assertEqual("scene-unsupported");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0023
     * @tc.name      Camera_SessionInit_0023
     * @tc.desc      init(managerReady=true, cameras=3, index=-1, scene=true, open=false) returns "open-failed".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionInit_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionInit_0023 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(true, 3, -1, true, false)");
      const actual: string = subject.init(true, 3, -1, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "open-failed");
      expect(actual).assertEqual("open-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0024
     * @tc.name      Camera_SessionInit_0024
     * @tc.desc      init(managerReady=false, cameras=0, index=0, scene=true, open=true) returns "no-manager".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0024 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(false, 0, 0, true, true)");
      const actual: string = subject.init(false, 0, 0, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-manager");
      expect(actual).assertEqual("no-manager");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0025
     * @tc.name      Camera_SessionInit_0025
     * @tc.desc      init(managerReady=false, cameras=0, index=0, scene=false, open=true) returns "no-manager".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0025 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(false, 0, 0, false, true)");
      const actual: string = subject.init(false, 0, 0, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-manager");
      expect(actual).assertEqual("no-manager");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionInit_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_INIT_0026
     * @tc.name      Camera_SessionInit_0026
     * @tc.desc      init(managerReady=false, cameras=0, index=1, scene=true, open=false) returns "no-manager".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionInit_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionInit_0026 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init(false, 0, 1, true, false)");
      const actual: string = subject.init(false, 0, 1, true, false);
