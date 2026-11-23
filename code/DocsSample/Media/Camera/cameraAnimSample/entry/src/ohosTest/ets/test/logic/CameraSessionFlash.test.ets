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

/** CameraSessionFlashTest logic checks (46 cases). */
export default function cameraSessionFlashTest(): void {
  describe('CameraSessionFlashTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0001
     * @tc.name      Camera_SessionFlash_0001
     * @tc.desc      setFlashMode(0, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionFlash_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionFlash_0001 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(0, true)");
      const actual: boolean = subject.setFlashMode(0, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0002
     * @tc.name      Camera_SessionFlash_0002
     * @tc.desc      setFlashMode(0, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0002 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(0, false)");
      const actual: boolean = subject.setFlashMode(0, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0003
     * @tc.name      Camera_SessionFlash_0003
     * @tc.desc      setFlashMode(1, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0003 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(1, true)");
      const actual: boolean = subject.setFlashMode(1, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0004
     * @tc.name      Camera_SessionFlash_0004
     * @tc.desc      setFlashMode(1, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0004 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(1, false)");
      const actual: boolean = subject.setFlashMode(1, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0005
     * @tc.name      Camera_SessionFlash_0005
     * @tc.desc      setFlashMode(2, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0005 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(2, true)");
      const actual: boolean = subject.setFlashMode(2, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0006
     * @tc.name      Camera_SessionFlash_0006
     * @tc.desc      setFlashMode(2, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0006 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(2, false)");
      const actual: boolean = subject.setFlashMode(2, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0007
     * @tc.name      Camera_SessionFlash_0007
     * @tc.desc      setFlashMode(3, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0007 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(3, true)");
      const actual: boolean = subject.setFlashMode(3, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0008
     * @tc.name      Camera_SessionFlash_0008
     * @tc.desc      setFlashMode(3, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0008 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(3, false)");
      const actual: boolean = subject.setFlashMode(3, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0009
     * @tc.name      Camera_SessionFlash_0009
     * @tc.desc      setFlashMode(4, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0009 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(4, true)");
      const actual: boolean = subject.setFlashMode(4, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0010
     * @tc.name      Camera_SessionFlash_0010
     * @tc.desc      setFlashMode(4, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0010 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(4, false)");
      const actual: boolean = subject.setFlashMode(4, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0011
     * @tc.name      Camera_SessionFlash_0011
     * @tc.desc      setFlashMode(5, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0011 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(5, true)");
      const actual: boolean = subject.setFlashMode(5, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0012
     * @tc.name      Camera_SessionFlash_0012
     * @tc.desc      setFlashMode(5, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionFlash_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionFlash_0012 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(5, false)");
      const actual: boolean = subject.setFlashMode(5, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0013
     * @tc.name      Camera_SessionFlash_0013
     * @tc.desc      setFlashMode(6, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0013 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(6, false)");
      const actual: boolean = subject.setFlashMode(6, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0014
     * @tc.name      Camera_SessionFlash_0014
     * @tc.desc      setFlashMode(7, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0014 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(7, true)");
      const actual: boolean = subject.setFlashMode(7, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0015
     * @tc.name      Camera_SessionFlash_0015
     * @tc.desc      setFlashMode(7, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0015 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(7, false)");
      const actual: boolean = subject.setFlashMode(7, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0016
     * @tc.name      Camera_SessionFlash_0016
     * @tc.desc      setFlashMode(8, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0016 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(8, true)");
      const actual: boolean = subject.setFlashMode(8, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0017
     * @tc.name      Camera_SessionFlash_0017
     * @tc.desc      setFlashMode(8, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0017 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(8, false)");
      const actual: boolean = subject.setFlashMode(8, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0018
     * @tc.name      Camera_SessionFlash_0018
     * @tc.desc      setFlashMode(9, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SessionFlash_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionFlash_0018 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(9, true)");
      const actual: boolean = subject.setFlashMode(9, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0019
     * @tc.name      Camera_SessionFlash_0019
     * @tc.desc      setFlashMode(9, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0019 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(9, false)");
      const actual: boolean = subject.setFlashMode(9, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0020
     * @tc.name      Camera_SessionFlash_0020
     * @tc.desc      setFlashMode(10, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0020 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(10, true)");
      const actual: boolean = subject.setFlashMode(10, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0021
     * @tc.name      Camera_SessionFlash_0021
     * @tc.desc      setFlashMode(10, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0021 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(10, false)");
      const actual: boolean = subject.setFlashMode(10, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0022
     * @tc.name      Camera_SessionFlash_0022
     * @tc.desc      setFlashMode(11, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0022 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(11, true)");
      const actual: boolean = subject.setFlashMode(11, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0023
     * @tc.name      Camera_SessionFlash_0023
     * @tc.desc      setFlashMode(11, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionFlash_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionFlash_0023 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(11, false)");
      const actual: boolean = subject.setFlashMode(11, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0024
     * @tc.name      Camera_SessionFlash_0024
     * @tc.desc      setFlashMode(12, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0024 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(12, false)");
      const actual: boolean = subject.setFlashMode(12, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0025
     * @tc.name      Camera_SessionFlash_0025
     * @tc.desc      setFlashMode(13, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0025 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(13, true)");
      const actual: boolean = subject.setFlashMode(13, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0026
     * @tc.name      Camera_SessionFlash_0026
     * @tc.desc      setFlashMode(13, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0026 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(13, false)");
      const actual: boolean = subject.setFlashMode(13, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0027
     * @tc.name      Camera_SessionFlash_0027
     * @tc.desc      setFlashMode(14, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0027 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(14, true)");
      const actual: boolean = subject.setFlashMode(14, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0028
     * @tc.name      Camera_SessionFlash_0028
     * @tc.desc      setFlashMode(14, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0028 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(14, false)");
      const actual: boolean = subject.setFlashMode(14, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0029
     * @tc.name      Camera_SessionFlash_0029
     * @tc.desc      setFlashMode(15, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0029 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(15, true)");
      const actual: boolean = subject.setFlashMode(15, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0030
     * @tc.name      Camera_SessionFlash_0030
     * @tc.desc      setFlashMode(15, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0030 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(15, false)");
      const actual: boolean = subject.setFlashMode(15, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0031
     * @tc.name      Camera_SessionFlash_0031
     * @tc.desc      setFlashMode(16, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0031 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(16, true)");
      const actual: boolean = subject.setFlashMode(16, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0032
     * @tc.name      Camera_SessionFlash_0032
     * @tc.desc      setFlashMode(16, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0032 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(16, false)");
      const actual: boolean = subject.setFlashMode(16, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0033
     * @tc.name      Camera_SessionFlash_0033
     * @tc.desc      setFlashMode(17, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0033 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(17, true)");
      const actual: boolean = subject.setFlashMode(17, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0034
     * @tc.name      Camera_SessionFlash_0034
     * @tc.desc      setFlashMode(17, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionFlash_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionFlash_0034 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(17, false)");
      const actual: boolean = subject.setFlashMode(17, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0035
     * @tc.name      Camera_SessionFlash_0035
     * @tc.desc      setFlashMode(18, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SessionFlash_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionFlash_0035 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(18, true)");
      const actual: boolean = subject.setFlashMode(18, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0036
     * @tc.name      Camera_SessionFlash_0036
     * @tc.desc      setFlashMode(19, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0036 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(19, true)");
      const actual: boolean = subject.setFlashMode(19, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0037
     * @tc.name      Camera_SessionFlash_0037
     * @tc.desc      setFlashMode(19, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0037 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(19, false)");
      const actual: boolean = subject.setFlashMode(19, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0038
     * @tc.name      Camera_SessionFlash_0038
     * @tc.desc      setFlashMode(20, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0038 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(20, true)");
      const actual: boolean = subject.setFlashMode(20, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0039
     * @tc.name      Camera_SessionFlash_0039
     * @tc.desc      setFlashMode(20, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0039 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(20, false)");
      const actual: boolean = subject.setFlashMode(20, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0040
     * @tc.name      Camera_SessionFlash_0040
     * @tc.desc      setFlashMode(21, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0040 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(21, true)");
      const actual: boolean = subject.setFlashMode(21, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0041
     * @tc.name      Camera_SessionFlash_0041
     * @tc.desc      setFlashMode(21, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0041 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(21, false)");
      const actual: boolean = subject.setFlashMode(21, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0042
     * @tc.name      Camera_SessionFlash_0042
     * @tc.desc      setFlashMode(22, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0042 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(22, true)");
      const actual: boolean = subject.setFlashMode(22, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0043
     * @tc.name      Camera_SessionFlash_0043
     * @tc.desc      setFlashMode(22, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0043 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(22, false)");
      const actual: boolean = subject.setFlashMode(22, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0044
     * @tc.name      Camera_SessionFlash_0044
     * @tc.desc      setFlashMode(23, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0044 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(23, true)");
      const actual: boolean = subject.setFlashMode(23, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0045
     * @tc.name      Camera_SessionFlash_0045
     * @tc.desc      setFlashMode(23, supported=false) stores the mode only when supported -> false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionFlash_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionFlash_0045 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(23, false)");
      const actual: boolean = subject.setFlashMode(23, false);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FLASH_0046
     * @tc.name      Camera_SessionFlash_0046
     * @tc.desc      setFlashMode(24, supported=true) stores the mode only when supported -> true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFlash_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFlash_0046 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFlashMode(24, true)");
      const actual: boolean = subject.setFlashMode(24, true);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SessionFlash_0046 end`);
    });
  });
}
