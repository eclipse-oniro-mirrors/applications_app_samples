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
  getVideoTime,
} from '../model/CameraLogic';

/** VideoTimeTest logic checks (48 cases). */
export default function videoTimeTest(): void {
  describe('VideoTimeTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0001
     * @tc.name      Camera_VideoTime_0001
     * @tc.desc      getVideoTime(1999) renders the recording clock "00 : 01".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_VideoTime_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VideoTime_0001 begin`);
      logInfo("getVideoTime(1999)");
      const actual: string = getVideoTime(1999);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 01");
      expect(actual).assertEqual("00 : 01");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0002
     * @tc.name      Camera_VideoTime_0002
     * @tc.desc      getVideoTime(2000) renders the recording clock "00 : 02".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0002 begin`);
      logInfo("getVideoTime(2000)");
      const actual: string = getVideoTime(2000);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 02");
      expect(actual).assertEqual("00 : 02");
      logInfo(`${BUNDLE}VideoTime_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0003
     * @tc.name      Camera_VideoTime_0003
     * @tc.desc      getVideoTime(30000) renders the recording clock "00 : 30".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0003 begin`);
      logInfo("getVideoTime(30000)");
      const actual: string = getVideoTime(30000);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 30");
      expect(actual).assertEqual("00 : 30");
      logInfo(`${BUNDLE}VideoTime_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0004
     * @tc.name      Camera_VideoTime_0004
     * @tc.desc      getVideoTime(59000) renders the recording clock "00 : 59".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0004 begin`);
      logInfo("getVideoTime(59000)");
      const actual: string = getVideoTime(59000);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 59");
      expect(actual).assertEqual("00 : 59");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0005
     * @tc.name      Camera_VideoTime_0005
     * @tc.desc      getVideoTime(59999) renders the recording clock "00 : 59".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0005 begin`);
      logInfo("getVideoTime(59999)");
      const actual: string = getVideoTime(59999);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 59");
      expect(actual).assertEqual("00 : 59");
      logInfo(`${BUNDLE}VideoTime_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0006
     * @tc.name      Camera_VideoTime_0006
     * @tc.desc      getVideoTime(60000) renders the recording clock "01 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0006 begin`);
      logInfo("getVideoTime(60000)");
      const actual: string = getVideoTime(60000);
      logInfo('actual=' + String(actual) + ', expected=' + "01 : 00");
      expect(actual).assertEqual("01 : 00");
      logInfo(`${BUNDLE}VideoTime_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0007
     * @tc.name      Camera_VideoTime_0007
     * @tc.desc      getVideoTime(60001) renders the recording clock "01 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0007 begin`);
      logInfo("getVideoTime(60001)");
      const actual: string = getVideoTime(60001);
      logInfo('actual=' + String(actual) + ', expected=' + "01 : 00");
      expect(actual).assertEqual("01 : 00");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0008
     * @tc.name      Camera_VideoTime_0008
     * @tc.desc      getVideoTime(61000) renders the recording clock "01 : 01".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0008 begin`);
      logInfo("getVideoTime(61000)");
      const actual: string = getVideoTime(61000);
      logInfo('actual=' + String(actual) + ', expected=' + "01 : 01");
      expect(actual).assertEqual("01 : 01");
      logInfo(`${BUNDLE}VideoTime_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0009
     * @tc.name      Camera_VideoTime_0009
     * @tc.desc      getVideoTime(119000) renders the recording clock "01 : 59".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0009 begin`);
      logInfo("getVideoTime(119000)");
      const actual: string = getVideoTime(119000);
      logInfo('actual=' + String(actual) + ', expected=' + "01 : 59");
      expect(actual).assertEqual("01 : 59");
      logInfo(`${BUNDLE}VideoTime_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0010
     * @tc.name      Camera_VideoTime_0010
     * @tc.desc      getVideoTime(120000) renders the recording clock "02 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0010 begin`);
      logInfo("getVideoTime(120000)");
      const actual: string = getVideoTime(120000);
      logInfo('actual=' + String(actual) + ', expected=' + "02 : 00");
      expect(actual).assertEqual("02 : 00");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0011
     * @tc.name      Camera_VideoTime_0011
     * @tc.desc      getVideoTime(121000) renders the recording clock "02 : 01".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0011 begin`);
      logInfo("getVideoTime(121000)");
      const actual: string = getVideoTime(121000);
      logInfo('actual=' + String(actual) + ', expected=' + "02 : 01");
      expect(actual).assertEqual("02 : 01");
      logInfo(`${BUNDLE}VideoTime_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0012
     * @tc.name      Camera_VideoTime_0012
     * @tc.desc      getVideoTime(3599000) renders the recording clock "59 : 59".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_VideoTime_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VideoTime_0012 begin`);
      logInfo("getVideoTime(3599000)");
      const actual: string = getVideoTime(3599000);
      logInfo('actual=' + String(actual) + ', expected=' + "59 : 59");
      expect(actual).assertEqual("59 : 59");
      logInfo(`${BUNDLE}VideoTime_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0013
     * @tc.name      Camera_VideoTime_0013
     * @tc.desc      getVideoTime(3600000) renders the recording clock "60 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0013 begin`);
      logInfo("getVideoTime(3600000)");
      const actual: string = getVideoTime(3600000);
      logInfo('actual=' + String(actual) + ', expected=' + "60 : 00");
      expect(actual).assertEqual("60 : 00");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0014
     * @tc.name      Camera_VideoTime_0014
     * @tc.desc      getVideoTime(3661000) renders the recording clock "61 : 01".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0014 begin`);
      logInfo("getVideoTime(3661000)");
      const actual: string = getVideoTime(3661000);
      logInfo('actual=' + String(actual) + ', expected=' + "61 : 01");
      expect(actual).assertEqual("61 : 01");
      logInfo(`${BUNDLE}VideoTime_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0015
     * @tc.name      Camera_VideoTime_0015
     * @tc.desc      getVideoTime(600000) renders the recording clock "10 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0015 begin`);
      logInfo("getVideoTime(600000)");
      const actual: string = getVideoTime(600000);
      logInfo('actual=' + String(actual) + ', expected=' + "10 : 00");
      expect(actual).assertEqual("10 : 00");
      logInfo(`${BUNDLE}VideoTime_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0016
     * @tc.name      Camera_VideoTime_0016
     * @tc.desc      getVideoTime(900000) renders the recording clock "15 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0016 begin`);
      logInfo("getVideoTime(900000)");
      const actual: string = getVideoTime(900000);
      logInfo('actual=' + String(actual) + ', expected=' + "15 : 00");
      expect(actual).assertEqual("15 : 00");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0017
     * @tc.name      Camera_VideoTime_0017
     * @tc.desc      getVideoTime(1800000) renders the recording clock "30 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0017 begin`);
      logInfo("getVideoTime(1800000)");
      const actual: string = getVideoTime(1800000);
      logInfo('actual=' + String(actual) + ', expected=' + "30 : 00");
      expect(actual).assertEqual("30 : 00");
      logInfo(`${BUNDLE}VideoTime_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0018
     * @tc.name      Camera_VideoTime_0018
     * @tc.desc      getVideoTime(240000) renders the recording clock "04 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_VideoTime_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VideoTime_0018 begin`);
      logInfo("getVideoTime(240000)");
      const actual: string = getVideoTime(240000);
      logInfo('actual=' + String(actual) + ', expected=' + "04 : 00");
      expect(actual).assertEqual("04 : 00");
      logInfo(`${BUNDLE}VideoTime_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0019
     * @tc.name      Camera_VideoTime_0019
     * @tc.desc      getVideoTime(45000) renders the recording clock "00 : 45".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0019 begin`);
      logInfo("getVideoTime(45000)");
      const actual: string = getVideoTime(45000);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 45");
      expect(actual).assertEqual("00 : 45");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0020
     * @tc.name      Camera_VideoTime_0020
     * @tc.desc      getVideoTime(15000) renders the recording clock "00 : 15".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0020 begin`);
      logInfo("getVideoTime(15000)");
      const actual: string = getVideoTime(15000);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 15");
      expect(actual).assertEqual("00 : 15");
      logInfo(`${BUNDLE}VideoTime_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0021
     * @tc.name      Camera_VideoTime_0021
     * @tc.desc      getVideoTime(5000) renders the recording clock "00 : 05".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0021 begin`);
      logInfo("getVideoTime(5000)");
      const actual: string = getVideoTime(5000);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 05");
      expect(actual).assertEqual("00 : 05");
      logInfo(`${BUNDLE}VideoTime_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0022
     * @tc.name      Camera_VideoTime_0022
     * @tc.desc      getVideoTime(2500) renders the recording clock "00 : 02".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0022 begin`);
      logInfo("getVideoTime(2500)");
      const actual: string = getVideoTime(2500);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 02");
      expect(actual).assertEqual("00 : 02");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0023
     * @tc.name      Camera_VideoTime_0023
     * @tc.desc      getVideoTime(500) renders the recording clock "00 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_VideoTime_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VideoTime_0023 begin`);
      logInfo("getVideoTime(500)");
      const actual: string = getVideoTime(500);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 00");
      expect(actual).assertEqual("00 : 00");
      logInfo(`${BUNDLE}VideoTime_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0024
     * @tc.name      Camera_VideoTime_0024
     * @tc.desc      getVideoTime(100) renders the recording clock "00 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0024 begin`);
      logInfo("getVideoTime(100)");
      const actual: string = getVideoTime(100);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 00");
      expect(actual).assertEqual("00 : 00");
      logInfo(`${BUNDLE}VideoTime_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0025
     * @tc.name      Camera_VideoTime_0025
     * @tc.desc      getVideoTime(250000) renders the recording clock "04 : 10".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0025 begin`);
      logInfo("getVideoTime(250000)");
      const actual: string = getVideoTime(250000);
      logInfo('actual=' + String(actual) + ', expected=' + "04 : 10");
      expect(actual).assertEqual("04 : 10");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0026
     * @tc.name      Camera_VideoTime_0026
     * @tc.desc      getVideoTime(500000) renders the recording clock "08 : 20".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0026 begin`);
      logInfo("getVideoTime(500000)");
      const actual: string = getVideoTime(500000);
      logInfo('actual=' + String(actual) + ', expected=' + "08 : 20");
      expect(actual).assertEqual("08 : 20");
      logInfo(`${BUNDLE}VideoTime_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0027
     * @tc.name      Camera_VideoTime_0027
     * @tc.desc      getVideoTime(750000) renders the recording clock "12 : 30".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0027 begin`);
      logInfo("getVideoTime(750000)");
      const actual: string = getVideoTime(750000);
      logInfo('actual=' + String(actual) + ', expected=' + "12 : 30");
      expect(actual).assertEqual("12 : 30");
      logInfo(`${BUNDLE}VideoTime_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0028
     * @tc.name      Camera_VideoTime_0028
     * @tc.desc      getVideoTime(1000000) renders the recording clock "16 : 40".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0028 begin`);
      logInfo("getVideoTime(1000000)");
      const actual: string = getVideoTime(1000000);
      logInfo('actual=' + String(actual) + ', expected=' + "16 : 40");
      expect(actual).assertEqual("16 : 40");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0029
     * @tc.name      Camera_VideoTime_0029
     * @tc.desc      getVideoTime(1234567) renders the recording clock "20 : 34".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0029 begin`);
      logInfo("getVideoTime(1234567)");
      const actual: string = getVideoTime(1234567);
      logInfo('actual=' + String(actual) + ', expected=' + "20 : 34");
      expect(actual).assertEqual("20 : 34");
      logInfo(`${BUNDLE}VideoTime_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0030
     * @tc.name      Camera_VideoTime_0030
     * @tc.desc      getVideoTime(36000000) renders the recording clock "600 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0030 begin`);
      logInfo("getVideoTime(36000000)");
      const actual: string = getVideoTime(36000000);
      logInfo('actual=' + String(actual) + ', expected=' + "600 : 00");
      expect(actual).assertEqual("600 : 00");
      logInfo(`${BUNDLE}VideoTime_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0031
     * @tc.name      Camera_VideoTime_0031
     * @tc.desc      getVideoTime(86400000) renders the recording clock "1440 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0031 begin`);
      logInfo("getVideoTime(86400000)");
      const actual: string = getVideoTime(86400000);
      logInfo('actual=' + String(actual) + ', expected=' + "1440 : 00");
      expect(actual).assertEqual("1440 : 00");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0032
     * @tc.name      Camera_VideoTime_0032
     * @tc.desc      getVideoTime(-1) renders the recording clock "0-1 : 59".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0032 begin`);
      logInfo("getVideoTime(-1)");
      const actual: string = getVideoTime(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "0-1 : 59");
      expect(actual).assertEqual("0-1 : 59");
      logInfo(`${BUNDLE}VideoTime_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0033
     * @tc.name      Camera_VideoTime_0033
     * @tc.desc      getVideoTime(-999) renders the recording clock "0-1 : 59".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0033 begin`);
      logInfo("getVideoTime(-999)");
      const actual: string = getVideoTime(-999);
      logInfo('actual=' + String(actual) + ', expected=' + "0-1 : 59");
      expect(actual).assertEqual("0-1 : 59");
      logInfo(`${BUNDLE}VideoTime_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0034
     * @tc.name      Camera_VideoTime_0034
     * @tc.desc      getVideoTime(-1000) renders the recording clock "0-1 : 59".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_VideoTime_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VideoTime_0034 begin`);
      logInfo("getVideoTime(-1000)");
      const actual: string = getVideoTime(-1000);
      logInfo('actual=' + String(actual) + ', expected=' + "0-1 : 59");
      expect(actual).assertEqual("0-1 : 59");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0035
     * @tc.name      Camera_VideoTime_0035
     * @tc.desc      getVideoTime(-60000) renders the recording clock "0-1 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_VideoTime_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VideoTime_0035 begin`);
      logInfo("getVideoTime(-60000)");
      const actual: string = getVideoTime(-60000);
      logInfo('actual=' + String(actual) + ', expected=' + "0-1 : 00");
      expect(actual).assertEqual("0-1 : 00");
      logInfo(`${BUNDLE}VideoTime_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0036
     * @tc.name      Camera_VideoTime_0036
     * @tc.desc      getVideoTime(-61000) renders the recording clock "0-2 : 59".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0036 begin`);
      logInfo("getVideoTime(-61000)");
      const actual: string = getVideoTime(-61000);
      logInfo('actual=' + String(actual) + ', expected=' + "0-2 : 59");
      expect(actual).assertEqual("0-2 : 59");
      logInfo(`${BUNDLE}VideoTime_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0037
     * @tc.name      Camera_VideoTime_0037
     * @tc.desc      getVideoTime(45) renders the recording clock "00 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0037 begin`);
      logInfo("getVideoTime(45)");
      const actual: string = getVideoTime(45);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 00");
      expect(actual).assertEqual("00 : 00");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0038
     * @tc.name      Camera_VideoTime_0038
     * @tc.desc      getVideoTime(46) renders the recording clock "00 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0038 begin`);
      logInfo("getVideoTime(46)");
      const actual: string = getVideoTime(46);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 00");
      expect(actual).assertEqual("00 : 00");
      logInfo(`${BUNDLE}VideoTime_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0039
     * @tc.name      Camera_VideoTime_0039
     * @tc.desc      getVideoTime(47) renders the recording clock "00 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0039 begin`);
      logInfo("getVideoTime(47)");
      const actual: string = getVideoTime(47);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 00");
      expect(actual).assertEqual("00 : 00");
      logInfo(`${BUNDLE}VideoTime_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0040
     * @tc.name      Camera_VideoTime_0040
     * @tc.desc      getVideoTime(48) renders the recording clock "00 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0040 begin`);
      logInfo("getVideoTime(48)");
      const actual: string = getVideoTime(48);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 00");
      expect(actual).assertEqual("00 : 00");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0041
     * @tc.name      Camera_VideoTime_0041
     * @tc.desc      getVideoTime(49) renders the recording clock "00 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0041 begin`);
      logInfo("getVideoTime(49)");
      const actual: string = getVideoTime(49);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 00");
      expect(actual).assertEqual("00 : 00");
      logInfo(`${BUNDLE}VideoTime_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0042
     * @tc.name      Camera_VideoTime_0042
     * @tc.desc      getVideoTime(50) renders the recording clock "00 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0042 begin`);
      logInfo("getVideoTime(50)");
      const actual: string = getVideoTime(50);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 00");
      expect(actual).assertEqual("00 : 00");
      logInfo(`${BUNDLE}VideoTime_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0043
     * @tc.name      Camera_VideoTime_0043
     * @tc.desc      getVideoTime(51) renders the recording clock "00 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0043 begin`);
      logInfo("getVideoTime(51)");
      const actual: string = getVideoTime(51);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 00");
      expect(actual).assertEqual("00 : 00");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0044
     * @tc.name      Camera_VideoTime_0044
     * @tc.desc      getVideoTime(0) renders the recording clock "00 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0044 begin`);
      logInfo("getVideoTime(0)");
      const actual: string = getVideoTime(0);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 00");
      expect(actual).assertEqual("00 : 00");
      logInfo(`${BUNDLE}VideoTime_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0045
     * @tc.name      Camera_VideoTime_0045
     * @tc.desc      getVideoTime(1) renders the recording clock "00 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_VideoTime_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VideoTime_0045 begin`);
      logInfo("getVideoTime(1)");
      const actual: string = getVideoTime(1);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 00");
      expect(actual).assertEqual("00 : 00");
      logInfo(`${BUNDLE}VideoTime_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0046
     * @tc.name      Camera_VideoTime_0046
     * @tc.desc      getVideoTime(999) renders the recording clock "00 : 00".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0046 begin`);
      logInfo("getVideoTime(999)");
      const actual: string = getVideoTime(999);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 00");
      expect(actual).assertEqual("00 : 00");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoTime_0046 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0047
     * @tc.name      Camera_VideoTime_0047
     * @tc.desc      getVideoTime(1000) renders the recording clock "00 : 01".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0047 begin`);
      logInfo("getVideoTime(1000)");
      const actual: string = getVideoTime(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 01");
      expect(actual).assertEqual("00 : 01");
      logInfo(`${BUNDLE}VideoTime_0047 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_TIME_0048
     * @tc.name      Camera_VideoTime_0048
     * @tc.desc      getVideoTime(1001) renders the recording clock "00 : 01".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoTime_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoTime_0048 begin`);
      logInfo("getVideoTime(1001)");
      const actual: string = getVideoTime(1001);
      logInfo('actual=' + String(actual) + ', expected=' + "00 : 01");
      expect(actual).assertEqual("00 : 01");
      logInfo(`${BUNDLE}VideoTime_0048 end`);
    });
  });
}
