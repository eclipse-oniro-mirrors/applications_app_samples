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
  concatTime,
} from '../model/CameraLogic';

/** ConcatTimeTest logic checks (45 cases). */
export default function concatTimeTest(): void {
  describe('ConcatTimeTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0001
     * @tc.name      Camera_ConcatTime_0001
     * @tc.desc      concatTime(0, 0, 0) formats the time as "000000".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ConcatTime_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConcatTime_0001 begin`);
      logInfo("concatTime(0, 0, 0)");
      const actual: string = concatTime(0, 0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "000000");
      expect(actual).assertEqual("000000");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0002
     * @tc.name      Camera_ConcatTime_0002
     * @tc.desc      concatTime(1, 2, 3) formats the time as "010203".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0002 begin`);
      logInfo("concatTime(1, 2, 3)");
      const actual: string = concatTime(1, 2, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "010203");
      expect(actual).assertEqual("010203");
      logInfo(`${BUNDLE}ConcatTime_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0003
     * @tc.name      Camera_ConcatTime_0003
     * @tc.desc      concatTime(9, 9, 9) formats the time as "090909".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0003 begin`);
      logInfo("concatTime(9, 9, 9)");
      const actual: string = concatTime(9, 9, 9);
      logInfo('actual=' + String(actual) + ', expected=' + "090909");
      expect(actual).assertEqual("090909");
      logInfo(`${BUNDLE}ConcatTime_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0004
     * @tc.name      Camera_ConcatTime_0004
     * @tc.desc      concatTime(10, 10, 10) formats the time as "101010".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0004 begin`);
      logInfo("concatTime(10, 10, 10)");
      const actual: string = concatTime(10, 10, 10);
      logInfo('actual=' + String(actual) + ', expected=' + "101010");
      expect(actual).assertEqual("101010");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0005
     * @tc.name      Camera_ConcatTime_0005
     * @tc.desc      concatTime(23, 59, 59) formats the time as "235959".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0005 begin`);
      logInfo("concatTime(23, 59, 59)");
      const actual: string = concatTime(23, 59, 59);
      logInfo('actual=' + String(actual) + ', expected=' + "235959");
      expect(actual).assertEqual("235959");
      logInfo(`${BUNDLE}ConcatTime_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0006
     * @tc.name      Camera_ConcatTime_0006
     * @tc.desc      concatTime(24, 0, 0) formats the time as "240000".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0006 begin`);
      logInfo("concatTime(24, 0, 0)");
      const actual: string = concatTime(24, 0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "240000");
      expect(actual).assertEqual("240000");
      logInfo(`${BUNDLE}ConcatTime_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0007
     * @tc.name      Camera_ConcatTime_0007
     * @tc.desc      concatTime(0, 59, 59) formats the time as "005959".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0007 begin`);
      logInfo("concatTime(0, 59, 59)");
      const actual: string = concatTime(0, 59, 59);
      logInfo('actual=' + String(actual) + ', expected=' + "005959");
      expect(actual).assertEqual("005959");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0008
     * @tc.name      Camera_ConcatTime_0008
     * @tc.desc      concatTime(12, 0, 0) formats the time as "120000".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0008 begin`);
      logInfo("concatTime(12, 0, 0)");
      const actual: string = concatTime(12, 0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "120000");
      expect(actual).assertEqual("120000");
      logInfo(`${BUNDLE}ConcatTime_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0009
     * @tc.name      Camera_ConcatTime_0009
     * @tc.desc      concatTime(12, 30, 45) formats the time as "123045".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0009 begin`);
      logInfo("concatTime(12, 30, 45)");
      const actual: string = concatTime(12, 30, 45);
      logInfo('actual=' + String(actual) + ', expected=' + "123045");
      expect(actual).assertEqual("123045");
      logInfo(`${BUNDLE}ConcatTime_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0010
     * @tc.name      Camera_ConcatTime_0010
     * @tc.desc      concatTime(99, 99, 99) formats the time as "999999".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0010 begin`);
      logInfo("concatTime(99, 99, 99)");
      const actual: string = concatTime(99, 99, 99);
      logInfo('actual=' + String(actual) + ', expected=' + "999999");
      expect(actual).assertEqual("999999");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0011
     * @tc.name      Camera_ConcatTime_0011
     * @tc.desc      concatTime(100, 100, 100) formats the time as "100100100".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0011 begin`);
      logInfo("concatTime(100, 100, 100)");
      const actual: string = concatTime(100, 100, 100);
      logInfo('actual=' + String(actual) + ', expected=' + "100100100");
      expect(actual).assertEqual("100100100");
      logInfo(`${BUNDLE}ConcatTime_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0012
     * @tc.name      Camera_ConcatTime_0012
     * @tc.desc      concatTime(-1, -2, -3) formats the time as "0-10-20-3".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ConcatTime_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConcatTime_0012 begin`);
      logInfo("concatTime(-1, -2, -3)");
      const actual: string = concatTime(-1, -2, -3);
      logInfo('actual=' + String(actual) + ', expected=' + "0-10-20-3");
      expect(actual).assertEqual("0-10-20-3");
      logInfo(`${BUNDLE}ConcatTime_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0013
     * @tc.name      Camera_ConcatTime_0013
     * @tc.desc      concatTime(-23, -59, -59) formats the time as "0-230-590-59".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0013 begin`);
      logInfo("concatTime(-23, -59, -59)");
      const actual: string = concatTime(-23, -59, -59);
      logInfo('actual=' + String(actual) + ', expected=' + "0-230-590-59");
      expect(actual).assertEqual("0-230-590-59");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0014
     * @tc.name      Camera_ConcatTime_0014
     * @tc.desc      concatTime(1, 1, 1) formats the time as "010101".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0014 begin`);
      logInfo("concatTime(1, 1, 1)");
      const actual: string = concatTime(1, 1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "010101");
      expect(actual).assertEqual("010101");
      logInfo(`${BUNDLE}ConcatTime_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0015
     * @tc.name      Camera_ConcatTime_0015
     * @tc.desc      concatTime(2, 2, 2) formats the time as "020202".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0015 begin`);
      logInfo("concatTime(2, 2, 2)");
      const actual: string = concatTime(2, 2, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "020202");
      expect(actual).assertEqual("020202");
      logInfo(`${BUNDLE}ConcatTime_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0016
     * @tc.name      Camera_ConcatTime_0016
     * @tc.desc      concatTime(3, 3, 3) formats the time as "030303".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0016 begin`);
      logInfo("concatTime(3, 3, 3)");
      const actual: string = concatTime(3, 3, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "030303");
      expect(actual).assertEqual("030303");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0017
     * @tc.name      Camera_ConcatTime_0017
     * @tc.desc      concatTime(4, 4, 4) formats the time as "040404".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0017 begin`);
      logInfo("concatTime(4, 4, 4)");
      const actual: string = concatTime(4, 4, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "040404");
      expect(actual).assertEqual("040404");
      logInfo(`${BUNDLE}ConcatTime_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0018
     * @tc.name      Camera_ConcatTime_0018
     * @tc.desc      concatTime(5, 5, 5) formats the time as "050505".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ConcatTime_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConcatTime_0018 begin`);
      logInfo("concatTime(5, 5, 5)");
      const actual: string = concatTime(5, 5, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "050505");
      expect(actual).assertEqual("050505");
      logInfo(`${BUNDLE}ConcatTime_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0019
     * @tc.name      Camera_ConcatTime_0019
     * @tc.desc      concatTime(6, 6, 6) formats the time as "060606".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0019 begin`);
      logInfo("concatTime(6, 6, 6)");
      const actual: string = concatTime(6, 6, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "060606");
      expect(actual).assertEqual("060606");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0020
     * @tc.name      Camera_ConcatTime_0020
     * @tc.desc      concatTime(7, 7, 7) formats the time as "070707".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0020 begin`);
      logInfo("concatTime(7, 7, 7)");
      const actual: string = concatTime(7, 7, 7);
      logInfo('actual=' + String(actual) + ', expected=' + "070707");
      expect(actual).assertEqual("070707");
      logInfo(`${BUNDLE}ConcatTime_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0021
     * @tc.name      Camera_ConcatTime_0021
     * @tc.desc      concatTime(8, 8, 8) formats the time as "080808".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0021 begin`);
      logInfo("concatTime(8, 8, 8)");
      const actual: string = concatTime(8, 8, 8);
      logInfo('actual=' + String(actual) + ', expected=' + "080808");
      expect(actual).assertEqual("080808");
      logInfo(`${BUNDLE}ConcatTime_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0022
     * @tc.name      Camera_ConcatTime_0022
     * @tc.desc      concatTime(11, 11, 11) formats the time as "111111".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0022 begin`);
      logInfo("concatTime(11, 11, 11)");
      const actual: string = concatTime(11, 11, 11);
      logInfo('actual=' + String(actual) + ', expected=' + "111111");
      expect(actual).assertEqual("111111");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0023
     * @tc.name      Camera_ConcatTime_0023
     * @tc.desc      concatTime(13, 13, 13) formats the time as "131313".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ConcatTime_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConcatTime_0023 begin`);
      logInfo("concatTime(13, 13, 13)");
      const actual: string = concatTime(13, 13, 13);
      logInfo('actual=' + String(actual) + ', expected=' + "131313");
      expect(actual).assertEqual("131313");
      logInfo(`${BUNDLE}ConcatTime_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0024
     * @tc.name      Camera_ConcatTime_0024
     * @tc.desc      concatTime(14, 14, 14) formats the time as "141414".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0024 begin`);
      logInfo("concatTime(14, 14, 14)");
      const actual: string = concatTime(14, 14, 14);
      logInfo('actual=' + String(actual) + ', expected=' + "141414");
      expect(actual).assertEqual("141414");
      logInfo(`${BUNDLE}ConcatTime_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0025
     * @tc.name      Camera_ConcatTime_0025
     * @tc.desc      concatTime(15, 15, 15) formats the time as "151515".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0025 begin`);
      logInfo("concatTime(15, 15, 15)");
      const actual: string = concatTime(15, 15, 15);
      logInfo('actual=' + String(actual) + ', expected=' + "151515");
      expect(actual).assertEqual("151515");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0026
     * @tc.name      Camera_ConcatTime_0026
     * @tc.desc      concatTime(16, 16, 16) formats the time as "161616".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0026 begin`);
      logInfo("concatTime(16, 16, 16)");
      const actual: string = concatTime(16, 16, 16);
      logInfo('actual=' + String(actual) + ', expected=' + "161616");
      expect(actual).assertEqual("161616");
      logInfo(`${BUNDLE}ConcatTime_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0027
     * @tc.name      Camera_ConcatTime_0027
     * @tc.desc      concatTime(17, 17, 17) formats the time as "171717".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0027 begin`);
      logInfo("concatTime(17, 17, 17)");
      const actual: string = concatTime(17, 17, 17);
      logInfo('actual=' + String(actual) + ', expected=' + "171717");
      expect(actual).assertEqual("171717");
      logInfo(`${BUNDLE}ConcatTime_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0028
     * @tc.name      Camera_ConcatTime_0028
     * @tc.desc      concatTime(18, 18, 18) formats the time as "181818".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0028 begin`);
      logInfo("concatTime(18, 18, 18)");
      const actual: string = concatTime(18, 18, 18);
      logInfo('actual=' + String(actual) + ', expected=' + "181818");
      expect(actual).assertEqual("181818");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0029
     * @tc.name      Camera_ConcatTime_0029
     * @tc.desc      concatTime(19, 19, 19) formats the time as "191919".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0029 begin`);
      logInfo("concatTime(19, 19, 19)");
      const actual: string = concatTime(19, 19, 19);
      logInfo('actual=' + String(actual) + ', expected=' + "191919");
      expect(actual).assertEqual("191919");
      logInfo(`${BUNDLE}ConcatTime_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0030
     * @tc.name      Camera_ConcatTime_0030
     * @tc.desc      concatTime(20, 20, 20) formats the time as "202020".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0030 begin`);
      logInfo("concatTime(20, 20, 20)");
      const actual: string = concatTime(20, 20, 20);
      logInfo('actual=' + String(actual) + ', expected=' + "202020");
      expect(actual).assertEqual("202020");
      logInfo(`${BUNDLE}ConcatTime_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0031
     * @tc.name      Camera_ConcatTime_0031
     * @tc.desc      concatTime(21, 21, 21) formats the time as "212121".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0031 begin`);
      logInfo("concatTime(21, 21, 21)");
      const actual: string = concatTime(21, 21, 21);
      logInfo('actual=' + String(actual) + ', expected=' + "212121");
      expect(actual).assertEqual("212121");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0032
     * @tc.name      Camera_ConcatTime_0032
     * @tc.desc      concatTime(22, 22, 22) formats the time as "222222".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0032 begin`);
      logInfo("concatTime(22, 22, 22)");
      const actual: string = concatTime(22, 22, 22);
      logInfo('actual=' + String(actual) + ', expected=' + "222222");
      expect(actual).assertEqual("222222");
      logInfo(`${BUNDLE}ConcatTime_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0033
     * @tc.name      Camera_ConcatTime_0033
     * @tc.desc      concatTime(0, 1, 2) formats the time as "000102".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0033 begin`);
      logInfo("concatTime(0, 1, 2)");
      const actual: string = concatTime(0, 1, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "000102");
      expect(actual).assertEqual("000102");
      logInfo(`${BUNDLE}ConcatTime_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0034
     * @tc.name      Camera_ConcatTime_0034
     * @tc.desc      concatTime(1, 0, 2) formats the time as "010002".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ConcatTime_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConcatTime_0034 begin`);
      logInfo("concatTime(1, 0, 2)");
      const actual: string = concatTime(1, 0, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "010002");
      expect(actual).assertEqual("010002");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0035
     * @tc.name      Camera_ConcatTime_0035
     * @tc.desc      concatTime(1, 2, 0) formats the time as "010200".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ConcatTime_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConcatTime_0035 begin`);
      logInfo("concatTime(1, 2, 0)");
      const actual: string = concatTime(1, 2, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "010200");
      expect(actual).assertEqual("010200");
      logInfo(`${BUNDLE}ConcatTime_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0036
     * @tc.name      Camera_ConcatTime_0036
     * @tc.desc      concatTime(0, 0, 59) formats the time as "000059".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0036 begin`);
      logInfo("concatTime(0, 0, 59)");
      const actual: string = concatTime(0, 0, 59);
      logInfo('actual=' + String(actual) + ', expected=' + "000059");
      expect(actual).assertEqual("000059");
      logInfo(`${BUNDLE}ConcatTime_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0037
     * @tc.name      Camera_ConcatTime_0037
     * @tc.desc      concatTime(0, 59, 0) formats the time as "005900".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0037 begin`);
      logInfo("concatTime(0, 59, 0)");
      const actual: string = concatTime(0, 59, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "005900");
      expect(actual).assertEqual("005900");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0038
     * @tc.name      Camera_ConcatTime_0038
     * @tc.desc      concatTime(59, 0, 0) formats the time as "590000".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0038 begin`);
      logInfo("concatTime(59, 0, 0)");
      const actual: string = concatTime(59, 0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "590000");
      expect(actual).assertEqual("590000");
      logInfo(`${BUNDLE}ConcatTime_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0039
     * @tc.name      Camera_ConcatTime_0039
     * @tc.desc      concatTime(1, 2, 59) formats the time as "010259".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0039 begin`);
      logInfo("concatTime(1, 2, 59)");
      const actual: string = concatTime(1, 2, 59);
      logInfo('actual=' + String(actual) + ', expected=' + "010259");
      expect(actual).assertEqual("010259");
      logInfo(`${BUNDLE}ConcatTime_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0040
     * @tc.name      Camera_ConcatTime_0040
     * @tc.desc      concatTime(1, 59, 2) formats the time as "015902".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0040 begin`);
      logInfo("concatTime(1, 59, 2)");
      const actual: string = concatTime(1, 59, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "015902");
      expect(actual).assertEqual("015902");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0041
     * @tc.name      Camera_ConcatTime_0041
     * @tc.desc      concatTime(59, 1, 2) formats the time as "590102".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0041 begin`);
      logInfo("concatTime(59, 1, 2)");
      const actual: string = concatTime(59, 1, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "590102");
      expect(actual).assertEqual("590102");
      logInfo(`${BUNDLE}ConcatTime_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0042
     * @tc.name      Camera_ConcatTime_0042
     * @tc.desc      concatTime(30, 15, 45) formats the time as "301545".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0042 begin`);
      logInfo("concatTime(30, 15, 45)");
      const actual: string = concatTime(30, 15, 45);
      logInfo('actual=' + String(actual) + ', expected=' + "301545");
      expect(actual).assertEqual("301545");
      logInfo(`${BUNDLE}ConcatTime_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0043
     * @tc.name      Camera_ConcatTime_0043
     * @tc.desc      concatTime(45, 30, 15) formats the time as "453015".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0043 begin`);
      logInfo("concatTime(45, 30, 15)");
      const actual: string = concatTime(45, 30, 15);
      logInfo('actual=' + String(actual) + ', expected=' + "453015");
      expect(actual).assertEqual("453015");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatTime_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0044
     * @tc.name      Camera_ConcatTime_0044
     * @tc.desc      concatTime(15, 45, 30) formats the time as "154530".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatTime_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatTime_0044 begin`);
      logInfo("concatTime(15, 45, 30)");
      const actual: string = concatTime(15, 45, 30);
      logInfo('actual=' + String(actual) + ', expected=' + "154530");
      expect(actual).assertEqual("154530");
      logInfo(`${BUNDLE}ConcatTime_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_TIME_0045
     * @tc.name      Camera_ConcatTime_0045
     * @tc.desc      concatTime(123, 456, 789) formats the time as "123456789".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ConcatTime_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConcatTime_0045 begin`);
      logInfo("concatTime(123, 456, 789)");
      const actual: string = concatTime(123, 456, 789);
      logInfo('actual=' + String(actual) + ', expected=' + "123456789");
      expect(actual).assertEqual("123456789");
      logInfo(`${BUNDLE}ConcatTime_0045 end`);
    });
  });
}
