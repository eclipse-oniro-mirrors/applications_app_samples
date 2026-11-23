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
  findProfileIndex,
  Profile,
} from '../model/CameraLogic';

/** ProfileFindTest logic checks (46 cases). */
export default function profileFindTest(): void {
  describe('ProfileFindTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0001
     * @tc.name      Camera_ProfileFind_0001
     * @tc.desc      findProfileIndex for kind 0 with 1 rows resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ProfileFind_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileFind_0001 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=0, rows=1, data=1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0002
     * @tc.name      Camera_ProfileFind_0002
     * @tc.desc      findProfileIndex for kind 1 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0002 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=1, rows=1, data=1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0003
     * @tc.name      Camera_ProfileFind_0003
     * @tc.desc      findProfileIndex for kind 2 with 1 rows resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0003 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=2, rows=1, data=1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0004
     * @tc.name      Camera_ProfileFind_0004
     * @tc.desc      findProfileIndex for kind 0 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0004 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 2000, 0, 0),
      ];
      logInfo("findProfileIndex(kind=0, rows=1, data=1920/1080/2000/0/0)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0005
     * @tc.name      Camera_ProfileFind_0005
     * @tc.desc      findProfileIndex for kind 1 with 1 rows resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0005 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 2000, 0, 0),
      ];
      logInfo("findProfileIndex(kind=1, rows=1, data=1920/1080/2000/0/0)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0006
     * @tc.name      Camera_ProfileFind_0006
     * @tc.desc      findProfileIndex for kind 2 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0006 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 2000, 0, 0),
      ];
      logInfo("findProfileIndex(kind=2, rows=1, data=1920/1080/2000/0/0)");
      const actual: number = findProfileIndex(profiles, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0007
     * @tc.name      Camera_ProfileFind_0007
     * @tc.desc      findProfileIndex for kind 0 with 2 rows resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0007 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=0, rows=2, data=1280/720/1003/30/60|1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0008
     * @tc.name      Camera_ProfileFind_0008
     * @tc.desc      findProfileIndex for kind 1 with 2 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0008 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=1, rows=2, data=1280/720/1003/30/60|1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0009
     * @tc.name      Camera_ProfileFind_0009
     * @tc.desc      findProfileIndex for kind 2 with 2 rows resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0009 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=2, rows=2, data=1280/720/1003/30/60|1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0010
     * @tc.name      Camera_ProfileFind_0010
     * @tc.desc      findProfileIndex for kind 0 with 2 rows resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0010 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 999, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=0, rows=2, data=1920/1080/999/30/60|1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0011
     * @tc.name      Camera_ProfileFind_0011
     * @tc.desc      findProfileIndex for kind 1 with 2 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0011 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 999, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=1, rows=2, data=1920/1080/999/30/60|1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0012
     * @tc.name      Camera_ProfileFind_0012
     * @tc.desc      findProfileIndex for kind 2 with 2 rows resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ProfileFind_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileFind_0012 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 999, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=2, rows=2, data=1920/1080/999/30/60|1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0013
     * @tc.name      Camera_ProfileFind_0013
     * @tc.desc      findProfileIndex for kind 0 with 2 rows resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0013 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 30, 61),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=0, rows=2, data=1920/1080/1003/30/61|1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0014
     * @tc.name      Camera_ProfileFind_0014
     * @tc.desc      findProfileIndex for kind 1 with 2 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0014 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 30, 61),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=1, rows=2, data=1920/1080/1003/30/61|1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0015
     * @tc.name      Camera_ProfileFind_0015
     * @tc.desc      findProfileIndex for kind 2 with 2 rows resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0015 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 30, 61),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=2, rows=2, data=1920/1080/1003/30/61|1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0016
     * @tc.name      Camera_ProfileFind_0016
     * @tc.desc      findProfileIndex for kind 0 with 1 rows resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0016 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 60, 60),
      ];
      logInfo("findProfileIndex(kind=0, rows=1, data=1920/1080/1003/60/60)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0017
     * @tc.name      Camera_ProfileFind_0017
     * @tc.desc      findProfileIndex for kind 1 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0017 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 60, 60),
      ];
      logInfo("findProfileIndex(kind=1, rows=1, data=1920/1080/1003/60/60)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0018
     * @tc.name      Camera_ProfileFind_0018
     * @tc.desc      findProfileIndex for kind 2 with 1 rows resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ProfileFind_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProfileFind_0018 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 60, 60),
      ];
      logInfo("findProfileIndex(kind=2, rows=1, data=1920/1080/1003/60/60)");
      const actual: number = findProfileIndex(profiles, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0019
     * @tc.name      Camera_ProfileFind_0019
     * @tc.desc      findProfileIndex for kind 0 with 2 rows resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0019 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 2000, 0, 0),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=0, rows=2, data=1920/1080/2000/0/0|1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0020
     * @tc.name      Camera_ProfileFind_0020
     * @tc.desc      findProfileIndex for kind 1 with 2 rows resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0020 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 2000, 0, 0),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=1, rows=2, data=1920/1080/2000/0/0|1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0021
     * @tc.name      Camera_ProfileFind_0021
     * @tc.desc      findProfileIndex for kind 2 with 2 rows resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0021 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 2000, 0, 0),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=2, rows=2, data=1920/1080/2000/0/0|1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0022
     * @tc.name      Camera_ProfileFind_0022
     * @tc.desc      findProfileIndex for kind 0 with 2 rows resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0022 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=0, rows=2, data=1920/1080/1003/30/60|1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0023
     * @tc.name      Camera_ProfileFind_0023
     * @tc.desc      findProfileIndex for kind 1 with 2 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ProfileFind_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileFind_0023 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 30, 60),
        new Profile(1920, 1080, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=1, rows=2, data=1920/1080/1003/30/60|1920/1080/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0024
     * @tc.name      Camera_ProfileFind_0024
     * @tc.desc      findProfileIndex for kind 0 with 0 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0024 begin`);
      const profiles: Array<Profile> = [
      ];
      logInfo("findProfileIndex(kind=0, rows=0, data=)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0025
     * @tc.name      Camera_ProfileFind_0025
     * @tc.desc      findProfileIndex for kind 1 with 0 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0025 begin`);
      const profiles: Array<Profile> = [
      ];
      logInfo("findProfileIndex(kind=1, rows=0, data=)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0026
     * @tc.name      Camera_ProfileFind_0026
     * @tc.desc      findProfileIndex for kind 2 with 0 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0026 begin`);
      const profiles: Array<Profile> = [
      ];
      logInfo("findProfileIndex(kind=2, rows=0, data=)");
      const actual: number = findProfileIndex(profiles, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0027
     * @tc.name      Camera_ProfileFind_0027
     * @tc.desc      findProfileIndex for kind 0 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0027 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 2000, 0, 0),
      ];
      logInfo("findProfileIndex(kind=0, rows=1, data=1280/720/2000/0/0)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0028
     * @tc.name      Camera_ProfileFind_0028
     * @tc.desc      findProfileIndex for kind 1 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0028 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 2000, 0, 0),
      ];
      logInfo("findProfileIndex(kind=1, rows=1, data=1280/720/2000/0/0)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0029
     * @tc.name      Camera_ProfileFind_0029
     * @tc.desc      findProfileIndex for kind 2 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0029 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 2000, 0, 0),
      ];
      logInfo("findProfileIndex(kind=2, rows=1, data=1280/720/2000/0/0)");
      const actual: number = findProfileIndex(profiles, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0030
     * @tc.name      Camera_ProfileFind_0030
     * @tc.desc      findProfileIndex for kind 0 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0030 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1081, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=0, rows=1, data=1920/1081/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0031
     * @tc.name      Camera_ProfileFind_0031
     * @tc.desc      findProfileIndex for kind 1 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0031 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1081, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=1, rows=1, data=1920/1081/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0032
     * @tc.name      Camera_ProfileFind_0032
     * @tc.desc      findProfileIndex for kind 2 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0032 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1081, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=2, rows=1, data=1920/1081/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0033
     * @tc.name      Camera_ProfileFind_0033
     * @tc.desc      findProfileIndex for kind 0 with 1 rows resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0033 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 0, 0),
      ];
      logInfo("findProfileIndex(kind=0, rows=1, data=1920/1080/1003/0/0)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0034
     * @tc.name      Camera_ProfileFind_0034
     * @tc.desc      findProfileIndex for kind 1 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ProfileFind_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileFind_0034 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 0, 0),
      ];
      logInfo("findProfileIndex(kind=1, rows=1, data=1920/1080/1003/0/0)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0035
     * @tc.name      Camera_ProfileFind_0035
     * @tc.desc      findProfileIndex for kind 2 with 1 rows resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ProfileFind_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProfileFind_0035 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 0, 0),
      ];
      logInfo("findProfileIndex(kind=2, rows=1, data=1920/1080/1003/0/0)");
      const actual: number = findProfileIndex(profiles, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0036
     * @tc.name      Camera_ProfileFind_0036
     * @tc.desc      findProfileIndex for kind 0 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0036 begin`);
      const profiles: Array<Profile> = [
        new Profile(3840, 2160, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=0, rows=1, data=3840/2160/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0037
     * @tc.name      Camera_ProfileFind_0037
     * @tc.desc      findProfileIndex for kind 1 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0037 begin`);
      const profiles: Array<Profile> = [
        new Profile(3840, 2160, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=1, rows=1, data=3840/2160/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0038
     * @tc.name      Camera_ProfileFind_0038
     * @tc.desc      findProfileIndex for kind 2 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0038 begin`);
      const profiles: Array<Profile> = [
        new Profile(3840, 2160, 1003, 30, 60),
      ];
      logInfo("findProfileIndex(kind=2, rows=1, data=3840/2160/1003/30/60)");
      const actual: number = findProfileIndex(profiles, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0039
     * @tc.name      Camera_ProfileFind_0039
     * @tc.desc      findProfileIndex for kind 0 with 2 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0039 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 2000, 30, 60),
        new Profile(1920, 1080, 2000, 30, 60),
      ];
      logInfo("findProfileIndex(kind=0, rows=2, data=1920/1080/2000/30/60|1920/1080/2000/30/60)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0040
     * @tc.name      Camera_ProfileFind_0040
     * @tc.desc      findProfileIndex for kind 1 with 2 rows resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0040 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 2000, 30, 60),
        new Profile(1920, 1080, 2000, 30, 60),
      ];
      logInfo("findProfileIndex(kind=1, rows=2, data=1920/1080/2000/30/60|1920/1080/2000/30/60)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0041
     * @tc.name      Camera_ProfileFind_0041
     * @tc.desc      findProfileIndex for kind 2 with 2 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0041 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 2000, 30, 60),
        new Profile(1920, 1080, 2000, 30, 60),
      ];
      logInfo("findProfileIndex(kind=2, rows=2, data=1920/1080/2000/30/60|1920/1080/2000/30/60)");
      const actual: number = findProfileIndex(profiles, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0042
     * @tc.name      Camera_ProfileFind_0042
     * @tc.desc      findProfileIndex for kind 0 with 2 rows resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0042 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 61, 60),
        new Profile(1920, 1080, 1003, 60, 60),
      ];
      logInfo("findProfileIndex(kind=0, rows=2, data=1920/1080/1003/61/60|1920/1080/1003/60/60)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0043
     * @tc.name      Camera_ProfileFind_0043
     * @tc.desc      findProfileIndex for kind 1 with 2 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0043 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 61, 60),
        new Profile(1920, 1080, 1003, 60, 60),
      ];
      logInfo("findProfileIndex(kind=1, rows=2, data=1920/1080/1003/61/60|1920/1080/1003/60/60)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0044
     * @tc.name      Camera_ProfileFind_0044
     * @tc.desc      findProfileIndex for kind 2 with 2 rows resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0044 begin`);
      const profiles: Array<Profile> = [
        new Profile(1920, 1080, 1003, 61, 60),
        new Profile(1920, 1080, 1003, 60, 60),
      ];
      logInfo("findProfileIndex(kind=2, rows=2, data=1920/1080/1003/61/60|1920/1080/1003/60/60)");
      const actual: number = findProfileIndex(profiles, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0045
     * @tc.name      Camera_ProfileFind_0045
     * @tc.desc      findProfileIndex for kind 0 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ProfileFind_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileFind_0045 begin`);
      const profiles: Array<Profile> = [
        new Profile(0, 0, 0, 0, 0),
      ];
      logInfo("findProfileIndex(kind=0, rows=1, data=0/0/0/0/0)");
      const actual: number = findProfileIndex(profiles, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PROFILE_FIND_0046
     * @tc.name      Camera_ProfileFind_0046
     * @tc.desc      findProfileIndex for kind 1 with 1 rows resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ProfileFind_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFind_0046 begin`);
      const profiles: Array<Profile> = [
        new Profile(0, 0, 0, 0, 0),
      ];
      logInfo("findProfileIndex(kind=1, rows=1, data=0/0/0/0/0)");
      const actual: number = findProfileIndex(profiles, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFind_0046 end`);
    });
  });
}
