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
  profileMatches,
  Profile,
} from '../model/CameraLogic';

/** ProfileMatchTest logic checks (44 cases). */
export default function profileMatchTest(): void {
  describe('ProfileMatchTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0001
     * @tc.name      Camera_ProfileMatch_0001
     * @tc.desc      profileMatches(0, Profile(1920, 1080, 1003, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ProfileMatch_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileMatch_0001 begin`);
      logInfo("profileMatches(0, new Profile(1920, 1080, 1003, 30, 60))");
      const actual: boolean = profileMatches(0, new Profile(1920, 1080, 1003, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0002
     * @tc.name      Camera_ProfileMatch_0002
     * @tc.desc      profileMatches(1, Profile(1920, 1080, 1003, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0002 begin`);
      logInfo("profileMatches(1, new Profile(1920, 1080, 1003, 30, 60))");
      const actual: boolean = profileMatches(1, new Profile(1920, 1080, 1003, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0003
     * @tc.name      Camera_ProfileMatch_0003
     * @tc.desc      profileMatches(2, Profile(1920, 1080, 1003, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0003 begin`);
      logInfo("profileMatches(2, new Profile(1920, 1080, 1003, 30, 60))");
      const actual: boolean = profileMatches(2, new Profile(1920, 1080, 1003, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ProfileMatch_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0004
     * @tc.name      Camera_ProfileMatch_0004
     * @tc.desc      profileMatches(0, Profile(1920, 1080, 2000, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0004 begin`);
      logInfo("profileMatches(0, new Profile(1920, 1080, 2000, 30, 60))");
      const actual: boolean = profileMatches(0, new Profile(1920, 1080, 2000, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0005
     * @tc.name      Camera_ProfileMatch_0005
     * @tc.desc      profileMatches(2, Profile(1920, 1080, 2000, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0005 begin`);
      logInfo("profileMatches(2, new Profile(1920, 1080, 2000, 30, 60))");
      const actual: boolean = profileMatches(2, new Profile(1920, 1080, 2000, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0006
     * @tc.name      Camera_ProfileMatch_0006
     * @tc.desc      profileMatches(0, Profile(1920, 1080, 1003, 0, 0)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0006 begin`);
      logInfo("profileMatches(0, new Profile(1920, 1080, 1003, 0, 0))");
      const actual: boolean = profileMatches(0, new Profile(1920, 1080, 1003, 0, 0));
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ProfileMatch_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0007
     * @tc.name      Camera_ProfileMatch_0007
     * @tc.desc      profileMatches(1, Profile(1920, 1080, 1003, 0, 0)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0007 begin`);
      logInfo("profileMatches(1, new Profile(1920, 1080, 1003, 0, 0))");
      const actual: boolean = profileMatches(1, new Profile(1920, 1080, 1003, 0, 0));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0008
     * @tc.name      Camera_ProfileMatch_0008
     * @tc.desc      profileMatches(0, Profile(1920, 1080, 2000, 0, 0)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0008 begin`);
      logInfo("profileMatches(0, new Profile(1920, 1080, 2000, 0, 0))");
      const actual: boolean = profileMatches(0, new Profile(1920, 1080, 2000, 0, 0));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0009
     * @tc.name      Camera_ProfileMatch_0009
     * @tc.desc      profileMatches(1, Profile(1920, 1080, 2000, 0, 0)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0009 begin`);
      logInfo("profileMatches(1, new Profile(1920, 1080, 2000, 0, 0))");
      const actual: boolean = profileMatches(1, new Profile(1920, 1080, 2000, 0, 0));
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ProfileMatch_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0010
     * @tc.name      Camera_ProfileMatch_0010
     * @tc.desc      profileMatches(2, Profile(1920, 1080, 2000, 0, 0)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0010 begin`);
      logInfo("profileMatches(2, new Profile(1920, 1080, 2000, 0, 0))");
      const actual: boolean = profileMatches(2, new Profile(1920, 1080, 2000, 0, 0));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0011
     * @tc.name      Camera_ProfileMatch_0011
     * @tc.desc      profileMatches(1, Profile(1080, 1920, 1003, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0011 begin`);
      logInfo("profileMatches(1, new Profile(1080, 1920, 1003, 30, 60))");
      const actual: boolean = profileMatches(1, new Profile(1080, 1920, 1003, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0012
     * @tc.name      Camera_ProfileMatch_0012
     * @tc.desc      profileMatches(2, Profile(1080, 1920, 1003, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ProfileMatch_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileMatch_0012 begin`);
      logInfo("profileMatches(2, new Profile(1080, 1920, 1003, 30, 60))");
      const actual: boolean = profileMatches(2, new Profile(1080, 1920, 1003, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0013
     * @tc.name      Camera_ProfileMatch_0013
     * @tc.desc      profileMatches(0, Profile(1920, 1080, 999, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0013 begin`);
      logInfo("profileMatches(0, new Profile(1920, 1080, 999, 30, 60))");
      const actual: boolean = profileMatches(0, new Profile(1920, 1080, 999, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0014
     * @tc.name      Camera_ProfileMatch_0014
     * @tc.desc      profileMatches(1, Profile(1920, 1080, 999, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0014 begin`);
      logInfo("profileMatches(1, new Profile(1920, 1080, 999, 30, 60))");
      const actual: boolean = profileMatches(1, new Profile(1920, 1080, 999, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0015
     * @tc.name      Camera_ProfileMatch_0015
     * @tc.desc      profileMatches(0, Profile(1920, 1080, 1003, 30, 61)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0015 begin`);
      logInfo("profileMatches(0, new Profile(1920, 1080, 1003, 30, 61))");
      const actual: boolean = profileMatches(0, new Profile(1920, 1080, 1003, 30, 61));
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ProfileMatch_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0016
     * @tc.name      Camera_ProfileMatch_0016
     * @tc.desc      profileMatches(1, Profile(1920, 1080, 1003, 30, 61)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0016 begin`);
      logInfo("profileMatches(1, new Profile(1920, 1080, 1003, 30, 61))");
      const actual: boolean = profileMatches(1, new Profile(1920, 1080, 1003, 30, 61));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0017
     * @tc.name      Camera_ProfileMatch_0017
     * @tc.desc      profileMatches(2, Profile(1920, 1080, 1003, 30, 61)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0017 begin`);
      logInfo("profileMatches(2, new Profile(1920, 1080, 1003, 30, 61))");
      const actual: boolean = profileMatches(2, new Profile(1920, 1080, 1003, 30, 61));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0018
     * @tc.name      Camera_ProfileMatch_0018
     * @tc.desc      profileMatches(1, Profile(1920, 1080, 1003, 61, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ProfileMatch_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProfileMatch_0018 begin`);
      logInfo("profileMatches(1, new Profile(1920, 1080, 1003, 61, 60))");
      const actual: boolean = profileMatches(1, new Profile(1920, 1080, 1003, 61, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0019
     * @tc.name      Camera_ProfileMatch_0019
     * @tc.desc      profileMatches(2, Profile(1920, 1080, 1003, 61, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0019 begin`);
      logInfo("profileMatches(2, new Profile(1920, 1080, 1003, 61, 60))");
      const actual: boolean = profileMatches(2, new Profile(1920, 1080, 1003, 61, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0020
     * @tc.name      Camera_ProfileMatch_0020
     * @tc.desc      profileMatches(0, Profile(1280, 720, 1003, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0020 begin`);
      logInfo("profileMatches(0, new Profile(1280, 720, 1003, 30, 60))");
      const actual: boolean = profileMatches(0, new Profile(1280, 720, 1003, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0021
     * @tc.name      Camera_ProfileMatch_0021
     * @tc.desc      profileMatches(2, Profile(1280, 720, 1003, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0021 begin`);
      logInfo("profileMatches(2, new Profile(1280, 720, 1003, 30, 60))");
      const actual: boolean = profileMatches(2, new Profile(1280, 720, 1003, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0022
     * @tc.name      Camera_ProfileMatch_0022
     * @tc.desc      profileMatches(0, Profile(1920, 1080, 1003, 60, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0022 begin`);
      logInfo("profileMatches(0, new Profile(1920, 1080, 1003, 60, 60))");
      const actual: boolean = profileMatches(0, new Profile(1920, 1080, 1003, 60, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0023
     * @tc.name      Camera_ProfileMatch_0023
     * @tc.desc      profileMatches(1, Profile(1920, 1080, 1003, 60, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ProfileMatch_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileMatch_0023 begin`);
      logInfo("profileMatches(1, new Profile(1920, 1080, 1003, 60, 60))");
      const actual: boolean = profileMatches(1, new Profile(1920, 1080, 1003, 60, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0024
     * @tc.name      Camera_ProfileMatch_0024
     * @tc.desc      profileMatches(1, Profile(1920, 1080, 2000, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0024 begin`);
      logInfo("profileMatches(1, new Profile(1920, 1080, 2000, 30, 60))");
      const actual: boolean = profileMatches(1, new Profile(1920, 1080, 2000, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ProfileMatch_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0025
     * @tc.name      Camera_ProfileMatch_0025
     * @tc.desc      profileMatches(0, Profile(1920, 1080, 1003, 30, 30)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0025 begin`);
      logInfo("profileMatches(0, new Profile(1920, 1080, 1003, 30, 30))");
      const actual: boolean = profileMatches(0, new Profile(1920, 1080, 1003, 30, 30));
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0026
     * @tc.name      Camera_ProfileMatch_0026
     * @tc.desc      profileMatches(2, Profile(1920, 1080, 1003, 30, 30)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0026 begin`);
      logInfo("profileMatches(2, new Profile(1920, 1080, 1003, 30, 30))");
      const actual: boolean = profileMatches(2, new Profile(1920, 1080, 1003, 30, 30));
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ProfileMatch_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0027
     * @tc.name      Camera_ProfileMatch_0027
     * @tc.desc      profileMatches(0, Profile(0, 0, 0, 0, 0)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0027 begin`);
      logInfo("profileMatches(0, new Profile(0, 0, 0, 0, 0))");
      const actual: boolean = profileMatches(0, new Profile(0, 0, 0, 0, 0));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0028
     * @tc.name      Camera_ProfileMatch_0028
     * @tc.desc      profileMatches(1, Profile(0, 0, 0, 0, 0)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0028 begin`);
      logInfo("profileMatches(1, new Profile(0, 0, 0, 0, 0))");
      const actual: boolean = profileMatches(1, new Profile(0, 0, 0, 0, 0));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0029
     * @tc.name      Camera_ProfileMatch_0029
     * @tc.desc      profileMatches(0, Profile(-1920, -1080, -1003, -30, -60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0029 begin`);
      logInfo("profileMatches(0, new Profile(-1920, -1080, -1003, -30, -60))");
      const actual: boolean = profileMatches(0, new Profile(-1920, -1080, -1003, -30, -60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0030
     * @tc.name      Camera_ProfileMatch_0030
     * @tc.desc      profileMatches(1, Profile(-1920, -1080, -1003, -30, -60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0030 begin`);
      logInfo("profileMatches(1, new Profile(-1920, -1080, -1003, -30, -60))");
      const actual: boolean = profileMatches(1, new Profile(-1920, -1080, -1003, -30, -60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0031
     * @tc.name      Camera_ProfileMatch_0031
     * @tc.desc      profileMatches(2, Profile(-1920, -1080, -1003, -30, -60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0031 begin`);
      logInfo("profileMatches(2, new Profile(-1920, -1080, -1003, -30, -60))");
      const actual: boolean = profileMatches(2, new Profile(-1920, -1080, -1003, -30, -60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0032
     * @tc.name      Camera_ProfileMatch_0032
     * @tc.desc      profileMatches(1, Profile(1921, 1080, 1003, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0032 begin`);
      logInfo("profileMatches(1, new Profile(1921, 1080, 1003, 30, 60))");
      const actual: boolean = profileMatches(1, new Profile(1921, 1080, 1003, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0033
     * @tc.name      Camera_ProfileMatch_0033
     * @tc.desc      profileMatches(2, Profile(1921, 1080, 1003, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0033 begin`);
      logInfo("profileMatches(2, new Profile(1921, 1080, 1003, 30, 60))");
      const actual: boolean = profileMatches(2, new Profile(1921, 1080, 1003, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0034
     * @tc.name      Camera_ProfileMatch_0034
     * @tc.desc      profileMatches(0, Profile(1920, 1081, 1003, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ProfileMatch_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileMatch_0034 begin`);
      logInfo("profileMatches(0, new Profile(1920, 1081, 1003, 30, 60))");
      const actual: boolean = profileMatches(0, new Profile(1920, 1081, 1003, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0035
     * @tc.name      Camera_ProfileMatch_0035
     * @tc.desc      profileMatches(1, Profile(1920, 1081, 1003, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ProfileMatch_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProfileMatch_0035 begin`);
      logInfo("profileMatches(1, new Profile(1920, 1081, 1003, 30, 60))");
      const actual: boolean = profileMatches(1, new Profile(1920, 1081, 1003, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0036
     * @tc.name      Camera_ProfileMatch_0036
     * @tc.desc      profileMatches(0, Profile(1920, 1080, 1004, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0036 begin`);
      logInfo("profileMatches(0, new Profile(1920, 1080, 1004, 30, 60))");
      const actual: boolean = profileMatches(0, new Profile(1920, 1080, 1004, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0037
     * @tc.name      Camera_ProfileMatch_0037
     * @tc.desc      profileMatches(1, Profile(1920, 1080, 1004, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0037 begin`);
      logInfo("profileMatches(1, new Profile(1920, 1080, 1004, 30, 60))");
      const actual: boolean = profileMatches(1, new Profile(1920, 1080, 1004, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0038
     * @tc.name      Camera_ProfileMatch_0038
     * @tc.desc      profileMatches(2, Profile(1920, 1080, 1004, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0038 begin`);
      logInfo("profileMatches(2, new Profile(1920, 1080, 1004, 30, 60))");
      const actual: boolean = profileMatches(2, new Profile(1920, 1080, 1004, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0039
     * @tc.name      Camera_ProfileMatch_0039
     * @tc.desc      profileMatches(1, Profile(1920, 1080, 1003, 30.5, 60.5)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0039 begin`);
      logInfo("profileMatches(1, new Profile(1920, 1080, 1003, 30.5, 60.5))");
      const actual: boolean = profileMatches(1, new Profile(1920, 1080, 1003, 30.5, 60.5));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0040
     * @tc.name      Camera_ProfileMatch_0040
     * @tc.desc      profileMatches(2, Profile(1920, 1080, 1003, 30.5, 60.5)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0040 begin`);
      logInfo("profileMatches(2, new Profile(1920, 1080, 1003, 30.5, 60.5))");
      const actual: boolean = profileMatches(2, new Profile(1920, 1080, 1003, 30.5, 60.5));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0041
     * @tc.name      Camera_ProfileMatch_0041
     * @tc.desc      profileMatches(0, Profile(3840, 2160, 1003, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0041 begin`);
      logInfo("profileMatches(0, new Profile(3840, 2160, 1003, 30, 60))");
      const actual: boolean = profileMatches(0, new Profile(3840, 2160, 1003, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0042
     * @tc.name      Camera_ProfileMatch_0042
     * @tc.desc      profileMatches(2, Profile(3840, 2160, 1003, 30, 60)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0042 begin`);
      logInfo("profileMatches(2, new Profile(3840, 2160, 1003, 30, 60))");
      const actual: boolean = profileMatches(2, new Profile(3840, 2160, 1003, 30, 60));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}ProfileMatch_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0043
     * @tc.name      Camera_ProfileMatch_0043
     * @tc.desc      profileMatches(0, Profile(1920, 1080, 2000, 61, 61)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0043 begin`);
      logInfo("profileMatches(0, new Profile(1920, 1080, 2000, 61, 61))");
      const actual: boolean = profileMatches(0, new Profile(1920, 1080, 2000, 61, 61));
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ProfileMatch_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_MATCH_0044
     * @tc.name      Camera_ProfileMatch_0044
     * @tc.desc      profileMatches(1, Profile(1920, 1080, 2000, 61, 61)) matches the service profile table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileMatch_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileMatch_0044 begin`);
      logInfo("profileMatches(1, new Profile(1920, 1080, 2000, 61, 61))");
      const actual: boolean = profileMatches(1, new Profile(1920, 1080, 2000, 61, 61));
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ProfileMatch_0044 end`);
    });
  });
}
