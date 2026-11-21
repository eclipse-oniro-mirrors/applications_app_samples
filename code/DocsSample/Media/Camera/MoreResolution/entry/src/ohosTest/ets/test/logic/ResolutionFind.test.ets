/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/ResolutionTestSupport';
import {
  findResolutionIndex,
} from '../model/ResolutionLogic';

/** ResolutionFindTest logic checks (45 cases). */
export default function resolutionFindTest(): void {
  describe('ResolutionFindTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0001
     * @tc.name      Resolution_ResFind_0001
     * @tc.desc      findResolutionIndex(4096, 3072) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResFind_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResFind_0001 begin`);
      logInfo("findResolutionIndex(4096, 3072)");
      const actual: number = findResolutionIndex(4096, 3072);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0002
     * @tc.name      Resolution_ResFind_0002
     * @tc.desc      findResolutionIndex(4096, 2304) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0002 begin`);
      logInfo("findResolutionIndex(4096, 2304)");
      const actual: number = findResolutionIndex(4096, 2304);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ResFind_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0003
     * @tc.name      Resolution_ResFind_0003
     * @tc.desc      findResolutionIndex(3840, 2160) returns 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0003 begin`);
      logInfo("findResolutionIndex(3840, 2160)");
      const actual: number = findResolutionIndex(3840, 2160);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ResFind_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0004
     * @tc.name      Resolution_ResFind_0004
     * @tc.desc      findResolutionIndex(2880, 2160) returns 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0004 begin`);
      logInfo("findResolutionIndex(2880, 2160)");
      const actual: number = findResolutionIndex(2880, 2160);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0005
     * @tc.name      Resolution_ResFind_0005
     * @tc.desc      findResolutionIndex(2560, 1440) returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0005 begin`);
      logInfo("findResolutionIndex(2560, 1440)");
      const actual: number = findResolutionIndex(2560, 1440);
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}ResFind_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0006
     * @tc.name      Resolution_ResFind_0006
     * @tc.desc      findResolutionIndex(2408, 1080) returns 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0006 begin`);
      logInfo("findResolutionIndex(2408, 1080)");
      const actual: number = findResolutionIndex(2408, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ResFind_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0007
     * @tc.name      Resolution_ResFind_0007
     * @tc.desc      findResolutionIndex(2384, 1080) returns 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0007 begin`);
      logInfo("findResolutionIndex(2384, 1080)");
      const actual: number = findResolutionIndex(2384, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0008
     * @tc.name      Resolution_ResFind_0008
     * @tc.desc      findResolutionIndex(1920, 1440) returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0008 begin`);
      logInfo("findResolutionIndex(1920, 1440)");
      const actual: number = findResolutionIndex(1920, 1440);
      logInfo('actual=' + String(actual) + ', expected=' + "7");
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}ResFind_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0009
     * @tc.name      Resolution_ResFind_0009
     * @tc.desc      findResolutionIndex(1920, 1080) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0009 begin`);
      logInfo("findResolutionIndex(1920, 1080)");
      const actual: number = findResolutionIndex(1920, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "8");
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}ResFind_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0010
     * @tc.name      Resolution_ResFind_0010
     * @tc.desc      findResolutionIndex(1440, 1080) returns 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0010 begin`);
      logInfo("findResolutionIndex(1440, 1080)");
      const actual: number = findResolutionIndex(1440, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "9");
      expect(actual).assertEqual(9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0011
     * @tc.name      Resolution_ResFind_0011
     * @tc.desc      findResolutionIndex(1280, 720) returns 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0011 begin`);
      logInfo("findResolutionIndex(1280, 720)");
      const actual: number = findResolutionIndex(1280, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ResFind_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0012
     * @tc.name      Resolution_ResFind_0012
     * @tc.desc      findResolutionIndex(1088, 1088) returns 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResFind_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResFind_0012 begin`);
      logInfo("findResolutionIndex(1088, 1088)");
      const actual: number = findResolutionIndex(1088, 1088);
      logInfo('actual=' + String(actual) + ', expected=' + "11");
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}ResFind_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0013
     * @tc.name      Resolution_ResFind_0013
     * @tc.desc      findResolutionIndex(1080, 1080) returns 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0013 begin`);
      logInfo("findResolutionIndex(1080, 1080)");
      const actual: number = findResolutionIndex(1080, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0014
     * @tc.name      Resolution_ResFind_0014
     * @tc.desc      findResolutionIndex(720, 720) returns 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0014 begin`);
      logInfo("findResolutionIndex(720, 720)");
      const actual: number = findResolutionIndex(720, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "13");
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}ResFind_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0015
     * @tc.name      Resolution_ResFind_0015
     * @tc.desc      findResolutionIndex(640, 480) returns 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0015 begin`);
      logInfo("findResolutionIndex(640, 480)");
      const actual: number = findResolutionIndex(640, 480);
      logInfo('actual=' + String(actual) + ', expected=' + "14");
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}ResFind_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0016
     * @tc.name      Resolution_ResFind_0016
     * @tc.desc      findResolutionIndex(480, 480) returns 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0016 begin`);
      logInfo("findResolutionIndex(480, 480)");
      const actual: number = findResolutionIndex(480, 480);
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0017
     * @tc.name      Resolution_ResFind_0017
     * @tc.desc      findResolutionIndex(0, 0) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0017 begin`);
      logInfo("findResolutionIndex(0, 0)");
      const actual: number = findResolutionIndex(0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0018
     * @tc.name      Resolution_ResFind_0018
     * @tc.desc      findResolutionIndex(-1, -1) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ResFind_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResFind_0018 begin`);
      logInfo("findResolutionIndex(-1, -1)");
      const actual: number = findResolutionIndex(-1, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0019
     * @tc.name      Resolution_ResFind_0019
     * @tc.desc      findResolutionIndex(1920, 720) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0019 begin`);
      logInfo("findResolutionIndex(1920, 720)");
      const actual: number = findResolutionIndex(1920, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0020
     * @tc.name      Resolution_ResFind_0020
     * @tc.desc      findResolutionIndex(1280, 1080) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0020 begin`);
      logInfo("findResolutionIndex(1280, 1080)");
      const actual: number = findResolutionIndex(1280, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0021
     * @tc.name      Resolution_ResFind_0021
     * @tc.desc      findResolutionIndex(4096, 2160) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0021 begin`);
      logInfo("findResolutionIndex(4096, 2160)");
      const actual: number = findResolutionIndex(4096, 2160);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0022
     * @tc.name      Resolution_ResFind_0022
     * @tc.desc      findResolutionIndex(3840, 3072) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0022 begin`);
      logInfo("findResolutionIndex(3840, 3072)");
      const actual: number = findResolutionIndex(3840, 3072);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0023
     * @tc.name      Resolution_ResFind_0023
     * @tc.desc      findResolutionIndex(100, 100) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResFind_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResFind_0023 begin`);
      logInfo("findResolutionIndex(100, 100)");
      const actual: number = findResolutionIndex(100, 100);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0024
     * @tc.name      Resolution_ResFind_0024
     * @tc.desc      findResolutionIndex(720, 1280) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0024 begin`);
      logInfo("findResolutionIndex(720, 1280)");
      const actual: number = findResolutionIndex(720, 1280);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0025
     * @tc.name      Resolution_ResFind_0025
     * @tc.desc      findResolutionIndex(1080, 1920) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0025 begin`);
      logInfo("findResolutionIndex(1080, 1920)");
      const actual: number = findResolutionIndex(1080, 1920);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0026
     * @tc.name      Resolution_ResFind_0026
     * @tc.desc      findResolutionIndex(1, 1) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0026 begin`);
      logInfo("findResolutionIndex(1, 1)");
      const actual: number = findResolutionIndex(1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0027
     * @tc.name      Resolution_ResFind_0027
     * @tc.desc      findResolutionIndex(999, 999) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0027 begin`);
      logInfo("findResolutionIndex(999, 999)");
      const actual: number = findResolutionIndex(999, 999);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0028
     * @tc.name      Resolution_ResFind_0028
     * @tc.desc      findResolutionIndex(1920, 1081) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0028 begin`);
      logInfo("findResolutionIndex(1920, 1081)");
      const actual: number = findResolutionIndex(1920, 1081);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0029
     * @tc.name      Resolution_ResFind_0029
     * @tc.desc      findResolutionIndex(1919, 1080) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0029 begin`);
      logInfo("findResolutionIndex(1919, 1080)");
      const actual: number = findResolutionIndex(1919, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0030
     * @tc.name      Resolution_ResFind_0030
     * @tc.desc      findResolutionIndex(4097, 3072) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0030 begin`);
      logInfo("findResolutionIndex(4097, 3072)");
      const actual: number = findResolutionIndex(4097, 3072);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0031
     * @tc.name      Resolution_ResFind_0031
     * @tc.desc      findResolutionIndex(4096, 3073) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0031 begin`);
      logInfo("findResolutionIndex(4096, 3073)");
      const actual: number = findResolutionIndex(4096, 3073);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0032
     * @tc.name      Resolution_ResFind_0032
     * @tc.desc      findResolutionIndex(720, 719) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0032 begin`);
      logInfo("findResolutionIndex(720, 719)");
      const actual: number = findResolutionIndex(720, 719);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0033
     * @tc.name      Resolution_ResFind_0033
     * @tc.desc      findResolutionIndex(1280, 721) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0033 begin`);
      logInfo("findResolutionIndex(1280, 721)");
      const actual: number = findResolutionIndex(1280, 721);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0034
     * @tc.name      Resolution_ResFind_0034
     * @tc.desc      findResolutionIndex(640, 481) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResFind_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResFind_0034 begin`);
      logInfo("findResolutionIndex(640, 481)");
      const actual: number = findResolutionIndex(640, 481);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0035
     * @tc.name      Resolution_ResFind_0035
     * @tc.desc      findResolutionIndex(480, 479) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ResFind_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResFind_0035 begin`);
      logInfo("findResolutionIndex(480, 479)");
      const actual: number = findResolutionIndex(480, 479);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0036
     * @tc.name      Resolution_ResFind_0036
     * @tc.desc      findResolutionIndex(1088, 1087) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0036 begin`);
      logInfo("findResolutionIndex(1088, 1087)");
      const actual: number = findResolutionIndex(1088, 1087);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0037
     * @tc.name      Resolution_ResFind_0037
     * @tc.desc      findResolutionIndex(1440, 1439) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0037 begin`);
      logInfo("findResolutionIndex(1440, 1439)");
      const actual: number = findResolutionIndex(1440, 1439);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0038
     * @tc.name      Resolution_ResFind_0038
     * @tc.desc      findResolutionIndex(2384, 1079) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0038 begin`);
      logInfo("findResolutionIndex(2384, 1079)");
      const actual: number = findResolutionIndex(2384, 1079);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0039
     * @tc.name      Resolution_ResFind_0039
     * @tc.desc      findResolutionIndex(2408, 1079) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0039 begin`);
      logInfo("findResolutionIndex(2408, 1079)");
      const actual: number = findResolutionIndex(2408, 1079);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0040
     * @tc.name      Resolution_ResFind_0040
     * @tc.desc      findResolutionIndex(2880, 2159) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0040 begin`);
      logInfo("findResolutionIndex(2880, 2159)");
      const actual: number = findResolutionIndex(2880, 2159);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0041
     * @tc.name      Resolution_ResFind_0041
     * @tc.desc      findResolutionIndex(3840, 2159) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0041 begin`);
      logInfo("findResolutionIndex(3840, 2159)");
      const actual: number = findResolutionIndex(3840, 2159);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0042
     * @tc.name      Resolution_ResFind_0042
     * @tc.desc      findResolutionIndex(2560, 1439) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0042 begin`);
      logInfo("findResolutionIndex(2560, 1439)");
      const actual: number = findResolutionIndex(2560, 1439);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0043
     * @tc.name      Resolution_ResFind_0043
     * @tc.desc      findResolutionIndex(4096, 2303) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0043 begin`);
      logInfo("findResolutionIndex(4096, 2303)");
      const actual: number = findResolutionIndex(4096, 2303);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResFind_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0044
     * @tc.name      Resolution_ResFind_0044
     * @tc.desc      findResolutionIndex(1, 0) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResFind_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResFind_0044 begin`);
      logInfo("findResolutionIndex(1, 0)");
      const actual: number = findResolutionIndex(1, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_FIND_0045
     * @tc.name      Resolution_ResFind_0045
     * @tc.desc      findResolutionIndex(0, 1) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResFind_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResFind_0045 begin`);
      logInfo("findResolutionIndex(0, 1)");
      const actual: number = findResolutionIndex(0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResFind_0045 end`);
    });
  });
}
