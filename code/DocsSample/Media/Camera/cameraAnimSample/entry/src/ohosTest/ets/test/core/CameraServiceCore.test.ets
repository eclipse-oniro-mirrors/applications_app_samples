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
  PREVIEW_FORMAT,
  PHOTO_FORMAT,
  VIDEO_FORMAT,
  PROFILE_WIDTH,
  PROFILE_HEIGHT,
  VIDEO_FRAME_MIN,
  VIDEO_FRAME_MAX,
  previewProfileMatch,
  photoProfileMatch,
  videoProfileMatch,
  videoFrameAllowed,
  deviceIndexValid,
  sceneModeSupported,
} from '../model/CameraLogic';

/** CameraServiceCoreTest logic checks (48 cases). */
export default function cameraServiceCoreTest(): void {
  describe('CameraServiceCoreTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0001
     * @tc.name      Camera_ServiceCore_0001
     * @tc.desc      PREVIEW_FORMAT is pinned to 1003 for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ServiceCore_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ServiceCore_0001 begin`);
      logInfo("service PREVIEW_FORMAT");
      const actual: number = PREVIEW_FORMAT;
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ServiceCore_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0002
     * @tc.name      Camera_ServiceCore_0002
     * @tc.desc      PHOTO_FORMAT is pinned to 2000 for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0002 begin`);
      logInfo("service PHOTO_FORMAT");
      const actual: number = PHOTO_FORMAT;
      logInfo('actual=' + String(actual) + ', expected=' + "2000");
      expect(actual).assertEqual(2000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ServiceCore_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0003
     * @tc.name      Camera_ServiceCore_0003
     * @tc.desc      VIDEO_FORMAT is pinned to 1003 for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0003 begin`);
      logInfo("service VIDEO_FORMAT");
      const actual: number = VIDEO_FORMAT;
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ServiceCore_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0004
     * @tc.name      Camera_ServiceCore_0004
     * @tc.desc      PROFILE_WIDTH is pinned to 1920 for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0004 begin`);
      logInfo("service PROFILE_WIDTH");
      const actual: number = PROFILE_WIDTH;
      logInfo('actual=' + String(actual) + ', expected=' + "1920");
      expect(actual).assertEqual(1920);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ServiceCore_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0005
     * @tc.name      Camera_ServiceCore_0005
     * @tc.desc      PROFILE_HEIGHT is pinned to 1080 for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0005 begin`);
      logInfo("service PROFILE_HEIGHT");
      const actual: number = PROFILE_HEIGHT;
      logInfo('actual=' + String(actual) + ', expected=' + "1080");
      expect(actual).assertEqual(1080);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ServiceCore_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0006
     * @tc.name      Camera_ServiceCore_0006
     * @tc.desc      VIDEO_FRAME_MIN is pinned to 30 for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0006 begin`);
      logInfo("service VIDEO_FRAME_MIN");
      const actual: number = VIDEO_FRAME_MIN;
      logInfo('actual=' + String(actual) + ', expected=' + "30");
      expect(actual).assertEqual(30);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ServiceCore_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0007
     * @tc.name      Camera_ServiceCore_0007
     * @tc.desc      VIDEO_FRAME_MAX is pinned to 60 for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0007 begin`);
      logInfo("service VIDEO_FRAME_MAX");
      const actual: number = VIDEO_FRAME_MAX;
      logInfo('actual=' + String(actual) + ', expected=' + "60");
      expect(actual).assertEqual(60);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ServiceCore_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0008
     * @tc.name      Camera_ServiceCore_0008
     * @tc.desc      previewProfileMatch(1920, 1080, 1003) is pinned to true for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0008 begin`);
      logInfo("service previewProfileMatch(1920, 1080, 1003)");
      const actual: boolean = previewProfileMatch(1920, 1080, 1003);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0009
     * @tc.name      Camera_ServiceCore_0009
     * @tc.desc      previewProfileMatch(1920, 1080, 2000) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0009 begin`);
      logInfo("service previewProfileMatch(1920, 1080, 2000)");
      const actual: boolean = previewProfileMatch(1920, 1080, 2000);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0010
     * @tc.name      Camera_ServiceCore_0010
     * @tc.desc      previewProfileMatch(1080, 1920, 1003) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0010 begin`);
      logInfo("service previewProfileMatch(1080, 1920, 1003)");
      const actual: boolean = previewProfileMatch(1080, 1920, 1003);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0011
     * @tc.name      Camera_ServiceCore_0011
     * @tc.desc      previewProfileMatch(1920, 1080, 1004) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0011 begin`);
      logInfo("service previewProfileMatch(1920, 1080, 1004)");
      const actual: boolean = previewProfileMatch(1920, 1080, 1004);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0012
     * @tc.name      Camera_ServiceCore_0012
     * @tc.desc      previewProfileMatch(0, 0, 0) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ServiceCore_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ServiceCore_0012 begin`);
      logInfo("service previewProfileMatch(0, 0, 0)");
      const actual: boolean = previewProfileMatch(0, 0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0013
     * @tc.name      Camera_ServiceCore_0013
     * @tc.desc      previewProfileMatch(1921, 1080, 1003) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0013 begin`);
      logInfo("service previewProfileMatch(1921, 1080, 1003)");
      const actual: boolean = previewProfileMatch(1921, 1080, 1003);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0014
     * @tc.name      Camera_ServiceCore_0014
     * @tc.desc      previewProfileMatch(1920, 1081, 1003) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0014 begin`);
      logInfo("service previewProfileMatch(1920, 1081, 1003)");
      const actual: boolean = previewProfileMatch(1920, 1081, 1003);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0015
     * @tc.name      Camera_ServiceCore_0015
     * @tc.desc      photoProfileMatch(1920, 1080, 2000) is pinned to true for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0015 begin`);
      logInfo("service photoProfileMatch(1920, 1080, 2000)");
      const actual: boolean = photoProfileMatch(1920, 1080, 2000);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0016
     * @tc.name      Camera_ServiceCore_0016
     * @tc.desc      photoProfileMatch(1920, 1080, 1003) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0016 begin`);
      logInfo("service photoProfileMatch(1920, 1080, 1003)");
      const actual: boolean = photoProfileMatch(1920, 1080, 1003);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0017
     * @tc.name      Camera_ServiceCore_0017
     * @tc.desc      photoProfileMatch(1280, 720, 2000) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0017 begin`);
      logInfo("service photoProfileMatch(1280, 720, 2000)");
      const actual: boolean = photoProfileMatch(1280, 720, 2000);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0018
     * @tc.name      Camera_ServiceCore_0018
     * @tc.desc      photoProfileMatch(1920, 1080, 1999) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ServiceCore_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ServiceCore_0018 begin`);
      logInfo("service photoProfileMatch(1920, 1080, 1999)");
      const actual: boolean = photoProfileMatch(1920, 1080, 1999);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0019
     * @tc.name      Camera_ServiceCore_0019
     * @tc.desc      photoProfileMatch(0, 0, 0) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0019 begin`);
      logInfo("service photoProfileMatch(0, 0, 0)");
      const actual: boolean = photoProfileMatch(0, 0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0020
     * @tc.name      Camera_ServiceCore_0020
     * @tc.desc      photoProfileMatch(1920, 1080, 3000) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0020 begin`);
      logInfo("service photoProfileMatch(1920, 1080, 3000)");
      const actual: boolean = photoProfileMatch(1920, 1080, 3000);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0021
     * @tc.name      Camera_ServiceCore_0021
     * @tc.desc      videoProfileMatch(1920, 1080, 1003, 30, 60) is pinned to true for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0021 begin`);
      logInfo("service videoProfileMatch(1920, 1080, 1003, 30, 60)");
      const actual: boolean = videoProfileMatch(1920, 1080, 1003, 30, 60);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0022
     * @tc.name      Camera_ServiceCore_0022
     * @tc.desc      videoProfileMatch(1920, 1080, 1003, 30, 61) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0022 begin`);
      logInfo("service videoProfileMatch(1920, 1080, 1003, 30, 61)");
      const actual: boolean = videoProfileMatch(1920, 1080, 1003, 30, 61);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0023
     * @tc.name      Camera_ServiceCore_0023
     * @tc.desc      videoProfileMatch(1920, 1080, 1003, 61, 60) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ServiceCore_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ServiceCore_0023 begin`);
      logInfo("service videoProfileMatch(1920, 1080, 1003, 61, 60)");
      const actual: boolean = videoProfileMatch(1920, 1080, 1003, 61, 60);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0024
     * @tc.name      Camera_ServiceCore_0024
     * @tc.desc      videoProfileMatch(1920, 1080, 2000, 30, 60) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0024 begin`);
      logInfo("service videoProfileMatch(1920, 1080, 2000, 30, 60)");
      const actual: boolean = videoProfileMatch(1920, 1080, 2000, 30, 60);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0025
     * @tc.name      Camera_ServiceCore_0025
     * @tc.desc      videoProfileMatch(0, 0, 0, 30, 60) is pinned to false for the service profile contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ServiceCore_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ServiceCore_0025 begin`);
      logInfo("service videoProfileMatch(0, 0, 0, 30, 60)");
      const actual: boolean = videoProfileMatch(0, 0, 0, 30, 60);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ServiceCore_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SERVICE_CORE_0026
