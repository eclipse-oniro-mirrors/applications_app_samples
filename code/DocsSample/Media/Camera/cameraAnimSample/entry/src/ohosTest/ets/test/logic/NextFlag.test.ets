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
  nextFlag,
} from '../model/CameraLogic';

/** NextFlagTest logic checks (46 cases). */
export default function nextFlagTest(): void {
  describe('NextFlagTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0001
     * @tc.name      Camera_NextFlag_0001
     * @tc.desc      nextFlag(12) pre-increments the watcher flag -> 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_NextFlag_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextFlag_0001 begin`);
      logInfo("nextFlag(12)");
      const actual: number = nextFlag(12);
      logInfo('actual=' + String(actual) + ', expected=' + "13");
      expect(actual).assertEqual(13);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0002
     * @tc.name      Camera_NextFlag_0002
     * @tc.desc      nextFlag(13) pre-increments the watcher flag -> 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0002 begin`);
      logInfo("nextFlag(13)");
      const actual: number = nextFlag(13);
      logInfo('actual=' + String(actual) + ', expected=' + "14");
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}NextFlag_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0003
     * @tc.name      Camera_NextFlag_0003
     * @tc.desc      nextFlag(14) pre-increments the watcher flag -> 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0003 begin`);
      logInfo("nextFlag(14)");
      const actual: number = nextFlag(14);
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}NextFlag_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0004
     * @tc.name      Camera_NextFlag_0004
     * @tc.desc      nextFlag(15) pre-increments the watcher flag -> 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0004 begin`);
      logInfo("nextFlag(15)");
      const actual: number = nextFlag(15);
      logInfo('actual=' + String(actual) + ', expected=' + "16");
      expect(actual).assertEqual(16);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0005
     * @tc.name      Camera_NextFlag_0005
     * @tc.desc      nextFlag(16) pre-increments the watcher flag -> 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0005 begin`);
      logInfo("nextFlag(16)");
      const actual: number = nextFlag(16);
      logInfo('actual=' + String(actual) + ', expected=' + "17");
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}NextFlag_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0006
     * @tc.name      Camera_NextFlag_0006
     * @tc.desc      nextFlag(17) pre-increments the watcher flag -> 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0006 begin`);
      logInfo("nextFlag(17)");
      const actual: number = nextFlag(17);
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}NextFlag_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0007
     * @tc.name      Camera_NextFlag_0007
     * @tc.desc      nextFlag(18) pre-increments the watcher flag -> 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0007 begin`);
      logInfo("nextFlag(18)");
      const actual: number = nextFlag(18);
      logInfo('actual=' + String(actual) + ', expected=' + "19");
      expect(actual).assertEqual(19);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0008
     * @tc.name      Camera_NextFlag_0008
     * @tc.desc      nextFlag(19) pre-increments the watcher flag -> 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0008 begin`);
      logInfo("nextFlag(19)");
      const actual: number = nextFlag(19);
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}NextFlag_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0009
     * @tc.name      Camera_NextFlag_0009
     * @tc.desc      nextFlag(20) pre-increments the watcher flag -> 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0009 begin`);
      logInfo("nextFlag(20)");
      const actual: number = nextFlag(20);
      logInfo('actual=' + String(actual) + ', expected=' + "21");
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}NextFlag_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0010
     * @tc.name      Camera_NextFlag_0010
     * @tc.desc      nextFlag(21) pre-increments the watcher flag -> 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0010 begin`);
      logInfo("nextFlag(21)");
      const actual: number = nextFlag(21);
      logInfo('actual=' + String(actual) + ', expected=' + "22");
      expect(actual).assertEqual(22);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0011
     * @tc.name      Camera_NextFlag_0011
     * @tc.desc      nextFlag(22) pre-increments the watcher flag -> 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0011 begin`);
      logInfo("nextFlag(22)");
      const actual: number = nextFlag(22);
      logInfo('actual=' + String(actual) + ', expected=' + "23");
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}NextFlag_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0012
     * @tc.name      Camera_NextFlag_0012
     * @tc.desc      nextFlag(23) pre-increments the watcher flag -> 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_NextFlag_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextFlag_0012 begin`);
      logInfo("nextFlag(23)");
      const actual: number = nextFlag(23);
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}NextFlag_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0013
     * @tc.name      Camera_NextFlag_0013
     * @tc.desc      nextFlag(24) pre-increments the watcher flag -> 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0013 begin`);
      logInfo("nextFlag(24)");
      const actual: number = nextFlag(24);
      logInfo('actual=' + String(actual) + ', expected=' + "25");
      expect(actual).assertEqual(25);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0014
     * @tc.name      Camera_NextFlag_0014
     * @tc.desc      nextFlag(25) pre-increments the watcher flag -> 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0014 begin`);
      logInfo("nextFlag(25)");
      const actual: number = nextFlag(25);
      logInfo('actual=' + String(actual) + ', expected=' + "26");
      expect(actual).assertEqual(26);
      logInfo(`${BUNDLE}NextFlag_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0015
     * @tc.name      Camera_NextFlag_0015
     * @tc.desc      nextFlag(26) pre-increments the watcher flag -> 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0015 begin`);
      logInfo("nextFlag(26)");
      const actual: number = nextFlag(26);
      logInfo('actual=' + String(actual) + ', expected=' + "27");
      expect(actual).assertEqual(27);
      logInfo(`${BUNDLE}NextFlag_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0016
     * @tc.name      Camera_NextFlag_0016
     * @tc.desc      nextFlag(27) pre-increments the watcher flag -> 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0016 begin`);
      logInfo("nextFlag(27)");
      const actual: number = nextFlag(27);
      logInfo('actual=' + String(actual) + ', expected=' + "28");
      expect(actual).assertEqual(28);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0017
     * @tc.name      Camera_NextFlag_0017
     * @tc.desc      nextFlag(28) pre-increments the watcher flag -> 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0017 begin`);
      logInfo("nextFlag(28)");
      const actual: number = nextFlag(28);
      logInfo('actual=' + String(actual) + ', expected=' + "29");
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}NextFlag_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0018
     * @tc.name      Camera_NextFlag_0018
     * @tc.desc      nextFlag(29) pre-increments the watcher flag -> 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_NextFlag_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextFlag_0018 begin`);
      logInfo("nextFlag(29)");
      const actual: number = nextFlag(29);
      logInfo('actual=' + String(actual) + ', expected=' + "30");
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NextFlag_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0019
     * @tc.name      Camera_NextFlag_0019
     * @tc.desc      nextFlag(30) pre-increments the watcher flag -> 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0019 begin`);
      logInfo("nextFlag(30)");
      const actual: number = nextFlag(30);
      logInfo('actual=' + String(actual) + ', expected=' + "31");
      expect(actual).assertEqual(31);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0020
