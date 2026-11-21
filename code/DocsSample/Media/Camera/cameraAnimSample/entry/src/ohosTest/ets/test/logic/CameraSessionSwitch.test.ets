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

/** CameraSessionSwitchTest logic checks (46 cases). */
export default function cameraSessionSwitchTest(): void {
  describe('CameraSessionSwitchTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0001
     * @tc.name      Camera_SessionSwitch_0001
     * @tc.desc      switchCamera() repeated 1 times from slot 0 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionSwitch_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionSwitch_0001 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 0, true, true);
      logInfo("switchCamera() x1 pre=0 from slot 0 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0002
     * @tc.name      Camera_SessionSwitch_0002
     * @tc.desc      switchCamera() repeated 1 times from slot 0 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0002 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("switchCamera() x1 pre=0 from slot 0 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0003
     * @tc.name      Camera_SessionSwitch_0003
     * @tc.desc      switchCamera() repeated 1 times from slot 0 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0003 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 0, true, true);
      subject.switchCamera();
      logInfo("switchCamera() x1 pre=1 from slot 0 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0004
     * @tc.name      Camera_SessionSwitch_0004
     * @tc.desc      switchCamera() repeated 1 times from slot 0 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0004 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      subject.switchCamera();
      logInfo("switchCamera() x1 pre=1 from slot 0 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0005
     * @tc.name      Camera_SessionSwitch_0005
     * @tc.desc      switchCamera() repeated 1 times from slot 1 lands on slot -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0005 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 1, true, true);
      logInfo("switchCamera() x1 pre=0 from slot 1 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0006
     * @tc.name      Camera_SessionSwitch_0006
     * @tc.desc      switchCamera() repeated 1 times from slot 1 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0006 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 3, 1, true, true);
      logInfo("switchCamera() x1 pre=0 from slot 1 cameras=3");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0007
     * @tc.name      Camera_SessionSwitch_0007
     * @tc.desc      switchCamera() repeated 1 times from slot 1 lands on slot -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0007 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 1, true, true);
      subject.switchCamera();
      logInfo("switchCamera() x1 pre=1 from slot 1 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0008
     * @tc.name      Camera_SessionSwitch_0008
     * @tc.desc      switchCamera() repeated 1 times from slot 1 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0008 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 3, 1, true, true);
      subject.switchCamera();
      logInfo("switchCamera() x1 pre=1 from slot 1 cameras=3");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0009
     * @tc.name      Camera_SessionSwitch_0009
     * @tc.desc      switchCamera() repeated 2 times from slot 0 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0009 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 0, true, true);
      subject.switchCamera();
      logInfo("switchCamera() x2 pre=0 from slot 0 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0010
     * @tc.name      Camera_SessionSwitch_0010
     * @tc.desc      switchCamera() repeated 2 times from slot 0 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0010 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 3, 0, true, true);
      subject.switchCamera();
      logInfo("switchCamera() x2 pre=0 from slot 0 cameras=3");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0011
     * @tc.name      Camera_SessionSwitch_0011
     * @tc.desc      switchCamera() repeated 2 times from slot 0 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0011 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x2 pre=1 from slot 0 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0012
     * @tc.name      Camera_SessionSwitch_0012
     * @tc.desc      switchCamera() repeated 2 times from slot 0 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionSwitch_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionSwitch_0012 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 3, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x2 pre=1 from slot 0 cameras=3");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0013
     * @tc.name      Camera_SessionSwitch_0013
     * @tc.desc      switchCamera() repeated 2 times from slot 1 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0013 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 1, true, true);
      subject.switchCamera();
      logInfo("switchCamera() x2 pre=0 from slot 1 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0014
     * @tc.name      Camera_SessionSwitch_0014
     * @tc.desc      switchCamera() repeated 2 times from slot 1 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0014 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 3, 1, true, true);
      subject.switchCamera();
      logInfo("switchCamera() x2 pre=0 from slot 1 cameras=3");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0015
     * @tc.name      Camera_SessionSwitch_0015
     * @tc.desc      switchCamera() repeated 2 times from slot 1 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0015 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x2 pre=1 from slot 1 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0016
     * @tc.name      Camera_SessionSwitch_0016
     * @tc.desc      switchCamera() repeated 3 times from slot 0 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0016 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x3 pre=0 from slot 0 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0017
     * @tc.name      Camera_SessionSwitch_0017
     * @tc.desc      switchCamera() repeated 3 times from slot 0 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0017 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x3 pre=0 from slot 0 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0018
     * @tc.name      Camera_SessionSwitch_0018
     * @tc.desc      switchCamera() repeated 3 times from slot 0 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SessionSwitch_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionSwitch_0018 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x3 pre=1 from slot 0 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0019
     * @tc.name      Camera_SessionSwitch_0019
     * @tc.desc      switchCamera() repeated 3 times from slot 0 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0019 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x3 pre=1 from slot 0 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0020
     * @tc.name      Camera_SessionSwitch_0020
     * @tc.desc      switchCamera() repeated 3 times from slot 1 lands on slot -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0020 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x3 pre=0 from slot 1 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0021
     * @tc.name      Camera_SessionSwitch_0021
     * @tc.desc      switchCamera() repeated 3 times from slot 1 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0021 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 3, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x3 pre=0 from slot 1 cameras=3");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0022
     * @tc.name      Camera_SessionSwitch_0022
     * @tc.desc      switchCamera() repeated 3 times from slot 1 lands on slot -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0022 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x3 pre=1 from slot 1 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0023
     * @tc.name      Camera_SessionSwitch_0023
     * @tc.desc      switchCamera() repeated 3 times from slot 1 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionSwitch_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionSwitch_0023 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 3, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x3 pre=1 from slot 1 cameras=3");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0024
     * @tc.name      Camera_SessionSwitch_0024
     * @tc.desc      switchCamera() repeated 4 times from slot 0 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0024 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x4 pre=0 from slot 0 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0025
     * @tc.name      Camera_SessionSwitch_0025
     * @tc.desc      switchCamera() repeated 4 times from slot 0 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0025 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 3, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x4 pre=0 from slot 0 cameras=3");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0026
     * @tc.name      Camera_SessionSwitch_0026
     * @tc.desc      switchCamera() repeated 4 times from slot 0 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0026 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x4 pre=1 from slot 0 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0027
     * @tc.name      Camera_SessionSwitch_0027
     * @tc.desc      switchCamera() repeated 4 times from slot 0 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0027 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 3, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x4 pre=1 from slot 0 cameras=3");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0028
     * @tc.name      Camera_SessionSwitch_0028
     * @tc.desc      switchCamera() repeated 4 times from slot 1 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0028 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x4 pre=0 from slot 1 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0029
     * @tc.name      Camera_SessionSwitch_0029
     * @tc.desc      switchCamera() repeated 4 times from slot 1 lands on slot -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0029 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x4 pre=1 from slot 1 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0030
     * @tc.name      Camera_SessionSwitch_0030
     * @tc.desc      switchCamera() repeated 4 times from slot 1 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0030 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x4 pre=1 from slot 1 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0031
     * @tc.name      Camera_SessionSwitch_0031
     * @tc.desc      switchCamera() repeated 5 times from slot 0 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0031 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x5 pre=0 from slot 0 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0032
     * @tc.name      Camera_SessionSwitch_0032
     * @tc.desc      switchCamera() repeated 5 times from slot 0 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0032 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x5 pre=0 from slot 0 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0033
     * @tc.name      Camera_SessionSwitch_0033
     * @tc.desc      switchCamera() repeated 5 times from slot 0 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0033 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x5 pre=1 from slot 0 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0034
     * @tc.name      Camera_SessionSwitch_0034
     * @tc.desc      switchCamera() repeated 5 times from slot 0 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionSwitch_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionSwitch_0034 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 3, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x5 pre=1 from slot 0 cameras=3");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0035
     * @tc.name      Camera_SessionSwitch_0035
     * @tc.desc      switchCamera() repeated 5 times from slot 1 lands on slot -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SessionSwitch_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionSwitch_0035 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x5 pre=0 from slot 1 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0036
     * @tc.name      Camera_SessionSwitch_0036
     * @tc.desc      switchCamera() repeated 5 times from slot 1 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0036 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 3, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x5 pre=0 from slot 1 cameras=3");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0037
     * @tc.name      Camera_SessionSwitch_0037
     * @tc.desc      switchCamera() repeated 5 times from slot 1 lands on slot -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0037 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x5 pre=1 from slot 1 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0038
     * @tc.name      Camera_SessionSwitch_0038
     * @tc.desc      switchCamera() repeated 5 times from slot 1 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0038 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 3, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x5 pre=1 from slot 1 cameras=3");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0039
     * @tc.name      Camera_SessionSwitch_0039
     * @tc.desc      switchCamera() repeated 6 times from slot 0 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0039 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x6 pre=0 from slot 0 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0040
     * @tc.name      Camera_SessionSwitch_0040
     * @tc.desc      switchCamera() repeated 6 times from slot 0 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0040 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 3, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x6 pre=0 from slot 0 cameras=3");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0041
     * @tc.name      Camera_SessionSwitch_0041
     * @tc.desc      switchCamera() repeated 6 times from slot 0 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0041 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x6 pre=1 from slot 0 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0042
     * @tc.name      Camera_SessionSwitch_0042
     * @tc.desc      switchCamera() repeated 6 times from slot 0 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0042 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 3, 0, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x6 pre=1 from slot 0 cameras=3");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0043
     * @tc.name      Camera_SessionSwitch_0043
     * @tc.desc      switchCamera() repeated 6 times from slot 1 lands on slot 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0043 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x6 pre=0 from slot 1 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0044
     * @tc.name      Camera_SessionSwitch_0044
     * @tc.desc      switchCamera() repeated 6 times from slot 1 lands on slot -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0044 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 1, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x6 pre=1 from slot 1 cameras=1");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0045
     * @tc.name      Camera_SessionSwitch_0045
     * @tc.desc      switchCamera() repeated 6 times from slot 1 lands on slot 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionSwitch_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionSwitch_0045 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 1, true, true);
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      subject.switchCamera();
      logInfo("switchCamera() x6 pre=1 from slot 1 cameras=2");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_SWITCH_0046
     * @tc.name      Camera_SessionSwitch_0046
     * @tc.desc      switchCamera() before init returns -1 and does not move the device slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionSwitch_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionSwitch_0046 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      logInfo("switchCamera() before init");
      const actual: number = subject.switchCamera();
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SessionSwitch_0046 end`);
    });
  });
}
