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
