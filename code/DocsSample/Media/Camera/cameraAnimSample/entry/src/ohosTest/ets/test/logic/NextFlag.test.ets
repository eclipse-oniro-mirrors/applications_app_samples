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
     * @tc.name      Camera_NextFlag_0020
     * @tc.desc      nextFlag(40) pre-increments the watcher flag -> 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0020 begin`);
      logInfo("nextFlag(40)");
      const actual: number = nextFlag(40);
      logInfo('actual=' + String(actual) + ', expected=' + "41");
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}NextFlag_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0021
     * @tc.name      Camera_NextFlag_0021
     * @tc.desc      nextFlag(50) pre-increments the watcher flag -> 51.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0021 begin`);
      logInfo("nextFlag(50)");
      const actual: number = nextFlag(50);
      logInfo('actual=' + String(actual) + ', expected=' + "51");
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}NextFlag_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0022
     * @tc.name      Camera_NextFlag_0022
     * @tc.desc      nextFlag(60) pre-increments the watcher flag -> 61.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0022 begin`);
      logInfo("nextFlag(60)");
      const actual: number = nextFlag(60);
      logInfo('actual=' + String(actual) + ', expected=' + "61");
      expect(actual).assertEqual(61);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0023
     * @tc.name      Camera_NextFlag_0023
     * @tc.desc      nextFlag(70) pre-increments the watcher flag -> 71.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_NextFlag_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextFlag_0023 begin`);
      logInfo("nextFlag(70)");
      const actual: number = nextFlag(70);
      logInfo('actual=' + String(actual) + ', expected=' + "71");
      expect(actual).assertEqual(71);
      logInfo(`${BUNDLE}NextFlag_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0024
     * @tc.name      Camera_NextFlag_0024
     * @tc.desc      nextFlag(80) pre-increments the watcher flag -> 81.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0024 begin`);
      logInfo("nextFlag(80)");
      const actual: number = nextFlag(80);
      logInfo('actual=' + String(actual) + ', expected=' + "81");
      expect(actual).assertEqual(81);
      logInfo(`${BUNDLE}NextFlag_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0025
     * @tc.name      Camera_NextFlag_0025
     * @tc.desc      nextFlag(90) pre-increments the watcher flag -> 91.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0025 begin`);
      logInfo("nextFlag(90)");
      const actual: number = nextFlag(90);
      logInfo('actual=' + String(actual) + ', expected=' + "91");
      expect(actual).assertEqual(91);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0026
     * @tc.name      Camera_NextFlag_0026
     * @tc.desc      nextFlag(100) pre-increments the watcher flag -> 101.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0026 begin`);
      logInfo("nextFlag(100)");
      const actual: number = nextFlag(100);
      logInfo('actual=' + String(actual) + ', expected=' + "101");
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}NextFlag_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0027
     * @tc.name      Camera_NextFlag_0027
     * @tc.desc      nextFlag(200) pre-increments the watcher flag -> 201.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0027 begin`);
      logInfo("nextFlag(200)");
      const actual: number = nextFlag(200);
      logInfo('actual=' + String(actual) + ', expected=' + "201");
      expect(actual).assertEqual(201);
      logInfo(`${BUNDLE}NextFlag_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0028
     * @tc.name      Camera_NextFlag_0028
     * @tc.desc      nextFlag(255) pre-increments the watcher flag -> 256.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0028 begin`);
      logInfo("nextFlag(255)");
      const actual: number = nextFlag(255);
      logInfo('actual=' + String(actual) + ', expected=' + "256");
      expect(actual).assertEqual(256);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0029
     * @tc.name      Camera_NextFlag_0029
     * @tc.desc      nextFlag(360) pre-increments the watcher flag -> 361.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0029 begin`);
      logInfo("nextFlag(360)");
      const actual: number = nextFlag(360);
      logInfo('actual=' + String(actual) + ', expected=' + "361");
      expect(actual).assertEqual(361);
      logInfo(`${BUNDLE}NextFlag_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0030
     * @tc.name      Camera_NextFlag_0030
     * @tc.desc      nextFlag(500) pre-increments the watcher flag -> 501.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0030 begin`);
      logInfo("nextFlag(500)");
      const actual: number = nextFlag(500);
      logInfo('actual=' + String(actual) + ', expected=' + "501");
      expect(actual).assertEqual(501);
      logInfo(`${BUNDLE}NextFlag_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0031
     * @tc.name      Camera_NextFlag_0031
     * @tc.desc      nextFlag(999) pre-increments the watcher flag -> 1000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0031 begin`);
      logInfo("nextFlag(999)");
      const actual: number = nextFlag(999);
      logInfo('actual=' + String(actual) + ', expected=' + "1000");
      expect(actual).assertEqual(1000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0032
     * @tc.name      Camera_NextFlag_0032
     * @tc.desc      nextFlag(1000) pre-increments the watcher flag -> 1001.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0032 begin`);
      logInfo("nextFlag(1000)");
      const actual: number = nextFlag(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "1001");
      expect(actual).assertEqual(1001);
      logInfo(`${BUNDLE}NextFlag_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0033
     * @tc.name      Camera_NextFlag_0033
     * @tc.desc      nextFlag(-1) pre-increments the watcher flag -> 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0033 begin`);
      logInfo("nextFlag(-1)");
      const actual: number = nextFlag(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextFlag_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0034
     * @tc.name      Camera_NextFlag_0034
     * @tc.desc      nextFlag(-10) pre-increments the watcher flag -> -9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_NextFlag_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextFlag_0034 begin`);
      logInfo("nextFlag(-10)");
      const actual: number = nextFlag(-10);
      logInfo('actual=' + String(actual) + ', expected=' + "-9");
      expect(actual).assertEqual(-9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0035
     * @tc.name      Camera_NextFlag_0035
     * @tc.desc      nextFlag(0) pre-increments the watcher flag -> 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_NextFlag_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextFlag_0035 begin`);
      logInfo("nextFlag(0)");
      const actual: number = nextFlag(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextFlag_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0036
     * @tc.name      Camera_NextFlag_0036
     * @tc.desc      nextFlag(1) pre-increments the watcher flag -> 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0036 begin`);
      logInfo("nextFlag(1)");
      const actual: number = nextFlag(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextFlag_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0037
     * @tc.name      Camera_NextFlag_0037
     * @tc.desc      nextFlag(2) pre-increments the watcher flag -> 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0037 begin`);
      logInfo("nextFlag(2)");
      const actual: number = nextFlag(2);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0038
     * @tc.name      Camera_NextFlag_0038
     * @tc.desc      nextFlag(3) pre-increments the watcher flag -> 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0038 begin`);
      logInfo("nextFlag(3)");
      const actual: number = nextFlag(3);
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}NextFlag_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0039
     * @tc.name      Camera_NextFlag_0039
     * @tc.desc      nextFlag(4) pre-increments the watcher flag -> 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0039 begin`);
      logInfo("nextFlag(4)");
      const actual: number = nextFlag(4);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextFlag_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0040
     * @tc.name      Camera_NextFlag_0040
     * @tc.desc      nextFlag(5) pre-increments the watcher flag -> 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0040 begin`);
      logInfo("nextFlag(5)");
      const actual: number = nextFlag(5);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0041
     * @tc.name      Camera_NextFlag_0041
     * @tc.desc      nextFlag(6) pre-increments the watcher flag -> 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0041 begin`);
      logInfo("nextFlag(6)");
      const actual: number = nextFlag(6);
      logInfo('actual=' + String(actual) + ', expected=' + "7");
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}NextFlag_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0042
     * @tc.name      Camera_NextFlag_0042
     * @tc.desc      nextFlag(7) pre-increments the watcher flag -> 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0042 begin`);
      logInfo("nextFlag(7)");
      const actual: number = nextFlag(7);
      logInfo('actual=' + String(actual) + ', expected=' + "8");
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}NextFlag_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0043
     * @tc.name      Camera_NextFlag_0043
     * @tc.desc      nextFlag(8) pre-increments the watcher flag -> 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0043 begin`);
      logInfo("nextFlag(8)");
      const actual: number = nextFlag(8);
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0044
     * @tc.name      Camera_NextFlag_0044
     * @tc.desc      nextFlag(9) pre-increments the watcher flag -> 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0044 begin`);
      logInfo("nextFlag(9)");
      const actual: number = nextFlag(9);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextFlag_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0045
     * @tc.name      Camera_NextFlag_0045
     * @tc.desc      nextFlag(10) pre-increments the watcher flag -> 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_NextFlag_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextFlag_0045 begin`);
      logInfo("nextFlag(10)");
      const actual: number = nextFlag(10);
      logInfo('actual=' + String(actual) + ', expected=' + "11");
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}NextFlag_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_NEXT_FLAG_0046
     * @tc.name      Camera_NextFlag_0046
     * @tc.desc      nextFlag(11) pre-increments the watcher flag -> 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_NextFlag_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextFlag_0046 begin`);
      logInfo("nextFlag(11)");
      const actual: number = nextFlag(11);
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}NextFlag_0046 end`);
    });
  });
}
