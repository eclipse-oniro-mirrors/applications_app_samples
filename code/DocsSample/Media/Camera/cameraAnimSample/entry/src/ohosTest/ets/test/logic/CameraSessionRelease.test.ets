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

/** CameraSessionReleaseTest logic checks (46 cases). */
export default function cameraSessionReleaseTest(): void {
  describe('CameraSessionReleaseTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0001
     * @tc.name      Camera_SessionRelease_0001
     * @tc.desc      release() after 1 inits and 1 explicit releases returns 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionRelease_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionRelease_0001 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 0, true, false);
      logInfo("release() after 1 inits and 1 releases open=false device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0002
     * @tc.name      Camera_SessionRelease_0002
     * @tc.desc      release() after 1 inits and 1 explicit releases returns 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0002 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, false);
      logInfo("release() after 1 inits and 1 releases open=false device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0003
     * @tc.name      Camera_SessionRelease_0003
     * @tc.desc      release() after 1 inits and 1 explicit releases returns 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0003 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, true);
      logInfo("release() after 1 inits and 1 releases open=true device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0004
     * @tc.name      Camera_SessionRelease_0004
     * @tc.desc      release() after 1 inits and 2 explicit releases returns 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0004 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 0, true, false);
      subject.release();
      logInfo("release() after 1 inits and 2 releases open=false device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0005
     * @tc.name      Camera_SessionRelease_0005
     * @tc.desc      release() after 1 inits and 2 explicit releases returns 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0005 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 0, true, true);
      subject.release();
      logInfo("release() after 1 inits and 2 releases open=true device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0006
     * @tc.name      Camera_SessionRelease_0006
     * @tc.desc      release() after 1 inits and 2 explicit releases returns 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0006 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 1, true, true);
      subject.release();
      logInfo("release() after 1 inits and 2 releases open=true device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0007
     * @tc.name      Camera_SessionRelease_0007
     * @tc.desc      release() after 1 inits and 3 explicit releases returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0007 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, false);
      subject.release();
      subject.release();
      logInfo("release() after 1 inits and 3 releases open=false device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0008
     * @tc.name      Camera_SessionRelease_0008
     * @tc.desc      release() after 1 inits and 3 explicit releases returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0008 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 0, true, true);
      subject.release();
      subject.release();
      logInfo("release() after 1 inits and 3 releases open=true device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0009
     * @tc.name      Camera_SessionRelease_0009
     * @tc.desc      release() after 1 inits and 4 explicit releases returns 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0009 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 0, true, false);
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 1 inits and 4 releases open=false device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0010
     * @tc.name      Camera_SessionRelease_0010
     * @tc.desc      release() after 1 inits and 4 explicit releases returns 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0010 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 0, true, true);
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 1 inits and 4 releases open=true device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0011
     * @tc.name      Camera_SessionRelease_0011
     * @tc.desc      release() after 1 inits and 4 explicit releases returns 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0011 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 1, true, true);
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 1 inits and 4 releases open=true device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0012
     * @tc.name      Camera_SessionRelease_0012
     * @tc.desc      release() after 1 inits and 5 explicit releases returns 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionRelease_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionRelease_0012 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, false);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 1 inits and 5 releases open=false device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0013
     * @tc.name      Camera_SessionRelease_0013
     * @tc.desc      release() after 1 inits and 5 explicit releases returns 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0013 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 0, true, true);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 1 inits and 5 releases open=true device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0014
     * @tc.name      Camera_SessionRelease_0014
     * @tc.desc      release() after 1 inits and 6 explicit releases returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0014 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 0, true, false);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 1 inits and 6 releases open=false device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "7");
      expect(actual).assertEqual(7);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0015
     * @tc.name      Camera_SessionRelease_0015
     * @tc.desc      release() after 1 inits and 6 explicit releases returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0015 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 1, true, false);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 1 inits and 6 releases open=false device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "7");
      expect(actual).assertEqual(7);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0016
     * @tc.name      Camera_SessionRelease_0016
     * @tc.desc      release() after 1 inits and 6 explicit releases returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0016 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 1, true, true);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 1 inits and 6 releases open=true device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "7");
      expect(actual).assertEqual(7);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0017
     * @tc.name      Camera_SessionRelease_0017
     * @tc.desc      release() after 2 inits and 1 explicit releases returns 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0017 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 1, true, false);
      subject.init(true, 3, 1, true, false);
      logInfo("release() after 2 inits and 1 releases open=false device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0018
     * @tc.name      Camera_SessionRelease_0018
     * @tc.desc      release() after 2 inits and 1 explicit releases returns 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SessionRelease_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionRelease_0018 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 0, true, true);
      subject.init(true, 3, 0, true, true);
      logInfo("release() after 2 inits and 1 releases open=true device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0019
     * @tc.name      Camera_SessionRelease_0019
     * @tc.desc      release() after 2 inits and 2 explicit releases returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0019 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 0, true, false);
      subject.init(true, 3, 0, true, false);
      subject.release();
      logInfo("release() after 2 inits and 2 releases open=false device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0020
     * @tc.name      Camera_SessionRelease_0020
     * @tc.desc      release() after 2 inits and 2 explicit releases returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0020 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, false);
      subject.init(true, 3, 1, true, false);
      subject.release();
      logInfo("release() after 2 inits and 2 releases open=false device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0021
     * @tc.name      Camera_SessionRelease_0021
     * @tc.desc      release() after 2 inits and 2 explicit releases returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0021 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, true);
      subject.init(true, 3, 1, true, true);
      subject.release();
      logInfo("release() after 2 inits and 2 releases open=true device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0022
     * @tc.name      Camera_SessionRelease_0022
     * @tc.desc      release() after 2 inits and 3 explicit releases returns 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0022 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 0, true, false);
      subject.init(true, 3, 0, true, false);
      subject.release();
      subject.release();
      logInfo("release() after 2 inits and 3 releases open=false device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0023
     * @tc.name      Camera_SessionRelease_0023
     * @tc.desc      release() after 2 inits and 3 explicit releases returns 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionRelease_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionRelease_0023 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 0, true, true);
      subject.init(true, 3, 0, true, true);
      subject.release();
      subject.release();
      logInfo("release() after 2 inits and 3 releases open=true device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0024
     * @tc.name      Camera_SessionRelease_0024
     * @tc.desc      release() after 2 inits and 4 explicit releases returns 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0024 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 0, true, false);
      subject.init(true, 3, 0, true, false);
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 2 inits and 4 releases open=false device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0025
     * @tc.name      Camera_SessionRelease_0025
     * @tc.desc      release() after 2 inits and 4 explicit releases returns 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0025 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, false);
      subject.init(true, 3, 1, true, false);
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 2 inits and 4 releases open=false device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0026
     * @tc.name      Camera_SessionRelease_0026
     * @tc.desc      release() after 2 inits and 4 explicit releases returns 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0026 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, true);
      subject.init(true, 3, 1, true, true);
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 2 inits and 4 releases open=true device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0027
     * @tc.name      Camera_SessionRelease_0027
     * @tc.desc      release() after 2 inits and 5 explicit releases returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0027 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 0, true, false);
      subject.init(true, 3, 0, true, false);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 2 inits and 5 releases open=false device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "7");
      expect(actual).assertEqual(7);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0028
     * @tc.name      Camera_SessionRelease_0028
     * @tc.desc      release() after 2 inits and 5 explicit releases returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0028 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 0, true, true);
      subject.init(true, 3, 0, true, true);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 2 inits and 5 releases open=true device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "7");
      expect(actual).assertEqual(7);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0029
     * @tc.name      Camera_SessionRelease_0029
     * @tc.desc      release() after 2 inits and 5 explicit releases returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0029 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 1, true, true);
      subject.init(true, 3, 1, true, true);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 2 inits and 5 releases open=true device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "7");
      expect(actual).assertEqual(7);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0030
     * @tc.name      Camera_SessionRelease_0030
     * @tc.desc      release() after 2 inits and 6 explicit releases returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0030 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, false);
      subject.init(true, 3, 1, true, false);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 2 inits and 6 releases open=false device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "8");
      expect(actual).assertEqual(8);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0031
     * @tc.name      Camera_SessionRelease_0031
     * @tc.desc      release() after 2 inits and 6 explicit releases returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0031 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 0, true, true);
      subject.init(true, 3, 0, true, true);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 2 inits and 6 releases open=true device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "8");
      expect(actual).assertEqual(8);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0032
     * @tc.name      Camera_SessionRelease_0032
     * @tc.desc      release() after 3 inits and 1 explicit releases returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0032 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 0, true, false);
      subject.init(true, 3, 0, true, false);
      subject.init(true, 3, 0, true, false);
      logInfo("release() after 3 inits and 1 releases open=false device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0033
     * @tc.name      Camera_SessionRelease_0033
     * @tc.desc      release() after 3 inits and 1 explicit releases returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0033 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 0, true, true);
      subject.init(true, 3, 0, true, true);
      subject.init(true, 3, 0, true, true);
      logInfo("release() after 3 inits and 1 releases open=true device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0034
     * @tc.name      Camera_SessionRelease_0034
     * @tc.desc      release() after 3 inits and 1 explicit releases returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionRelease_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionRelease_0034 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, true);
      subject.init(true, 3, 1, true, true);
      subject.init(true, 3, 1, true, true);
      logInfo("release() after 3 inits and 1 releases open=true device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0035
     * @tc.name      Camera_SessionRelease_0035
     * @tc.desc      release() after 3 inits and 2 explicit releases returns 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SessionRelease_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionRelease_0035 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 1, true, false);
      subject.init(true, 3, 1, true, false);
      subject.init(true, 3, 1, true, false);
      subject.release();
      logInfo("release() after 3 inits and 2 releases open=false device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0036
     * @tc.name      Camera_SessionRelease_0036
     * @tc.desc      release() after 3 inits and 2 explicit releases returns 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0036 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 0, true, true);
      subject.init(true, 3, 0, true, true);
      subject.init(true, 3, 0, true, true);
      subject.release();
      logInfo("release() after 3 inits and 2 releases open=true device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0037
     * @tc.name      Camera_SessionRelease_0037
     * @tc.desc      release() after 3 inits and 3 explicit releases returns 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0037 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 0, true, false);
      subject.init(true, 3, 0, true, false);
      subject.init(true, 3, 0, true, false);
      subject.release();
      subject.release();
      logInfo("release() after 3 inits and 3 releases open=false device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0038
     * @tc.name      Camera_SessionRelease_0038
     * @tc.desc      release() after 3 inits and 3 explicit releases returns 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0038 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, false);
      subject.init(true, 3, 1, true, false);
      subject.init(true, 3, 1, true, false);
      subject.release();
      subject.release();
      logInfo("release() after 3 inits and 3 releases open=false device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0039
     * @tc.name      Camera_SessionRelease_0039
     * @tc.desc      release() after 3 inits and 3 explicit releases returns 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0039 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, true);
      subject.init(true, 3, 1, true, true);
      subject.init(true, 3, 1, true, true);
      subject.release();
      subject.release();
      logInfo("release() after 3 inits and 3 releases open=true device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0040
     * @tc.name      Camera_SessionRelease_0040
     * @tc.desc      release() after 3 inits and 4 explicit releases returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0040 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 1, true, false);
      subject.init(true, 3, 1, true, false);
      subject.init(true, 3, 1, true, false);
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 3 inits and 4 releases open=false device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "7");
      expect(actual).assertEqual(7);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0041
     * @tc.name      Camera_SessionRelease_0041
     * @tc.desc      release() after 3 inits and 4 explicit releases returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0041 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 0, true, true);
      subject.init(true, 3, 0, true, true);
      subject.init(true, 3, 0, true, true);
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 3 inits and 4 releases open=true device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "7");
      expect(actual).assertEqual(7);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0042
     * @tc.name      Camera_SessionRelease_0042
     * @tc.desc      release() after 3 inits and 5 explicit releases returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0042 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 0, true, false);
      subject.init(true, 3, 0, true, false);
      subject.init(true, 3, 0, true, false);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 3 inits and 5 releases open=false device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "8");
      expect(actual).assertEqual(8);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0043
     * @tc.name      Camera_SessionRelease_0043
     * @tc.desc      release() after 3 inits and 5 explicit releases returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0043 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, false);
      subject.init(true, 3, 1, true, false);
      subject.init(true, 3, 1, true, false);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 3 inits and 5 releases open=false device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "8");
      expect(actual).assertEqual(8);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0044
     * @tc.name      Camera_SessionRelease_0044
     * @tc.desc      release() after 3 inits and 5 explicit releases returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0044 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(1);
      subject.init(true, 3, 1, true, true);
      subject.init(true, 3, 1, true, true);
      subject.init(true, 3, 1, true, true);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 3 inits and 5 releases open=true device=1");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "8");
      expect(actual).assertEqual(8);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0045
     * @tc.name      Camera_SessionRelease_0045
     * @tc.desc      release() after 3 inits and 6 explicit releases returns 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionRelease_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionRelease_0045 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 0, true, false);
      subject.init(true, 3, 0, true, false);
      subject.init(true, 3, 0, true, false);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 3 inits and 6 releases open=false device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_RELEASE_0046
     * @tc.name      Camera_SessionRelease_0046
     * @tc.desc      release() after 3 inits and 6 explicit releases returns 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionRelease_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionRelease_0046 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.setSceneMode(2);
      subject.init(true, 3, 0, true, true);
      subject.init(true, 3, 0, true, true);
      subject.init(true, 3, 0, true, true);
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      subject.release();
      logInfo("release() after 3 inits and 6 releases open=true device=0");
      const actual: number = subject.release();
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionRelease_0046 end`);
    });
  });
}
