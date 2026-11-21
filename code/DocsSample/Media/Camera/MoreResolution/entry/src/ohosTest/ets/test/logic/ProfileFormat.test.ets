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
  profileFormat,
} from '../model/ResolutionLogic';

/** ProfileFormatTest logic checks (46 cases). */
export default function profileFormatTest(): void {
  describe('ProfileFormatTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0001
     * @tc.name      Resolution_ProfileFormat_0001
     * @tc.desc      profileFormat(2) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ProfileFormat_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileFormat_0001 begin`);
      logInfo("profileFormat(2)");
      const actual: number = profileFormat(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0002
     * @tc.name      Resolution_ProfileFormat_0002
     * @tc.desc      profileFormat(3) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0002 begin`);
      logInfo("profileFormat(3)");
      const actual: number = profileFormat(3);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0003
     * @tc.name      Resolution_ProfileFormat_0003
     * @tc.desc      profileFormat(4) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0003 begin`);
      logInfo("profileFormat(4)");
      const actual: number = profileFormat(4);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0004
     * @tc.name      Resolution_ProfileFormat_0004
     * @tc.desc      profileFormat(5) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0004 begin`);
      logInfo("profileFormat(5)");
      const actual: number = profileFormat(5);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0005
     * @tc.name      Resolution_ProfileFormat_0005
     * @tc.desc      profileFormat(6) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0005 begin`);
      logInfo("profileFormat(6)");
      const actual: number = profileFormat(6);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0006
     * @tc.name      Resolution_ProfileFormat_0006
     * @tc.desc      profileFormat(7) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0006 begin`);
      logInfo("profileFormat(7)");
      const actual: number = profileFormat(7);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0007
     * @tc.name      Resolution_ProfileFormat_0007
     * @tc.desc      profileFormat(8) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0007 begin`);
      logInfo("profileFormat(8)");
      const actual: number = profileFormat(8);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0008
     * @tc.name      Resolution_ProfileFormat_0008
     * @tc.desc      profileFormat(9) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0008 begin`);
      logInfo("profileFormat(9)");
      const actual: number = profileFormat(9);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0009
     * @tc.name      Resolution_ProfileFormat_0009
     * @tc.desc      profileFormat(10) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0009 begin`);
      logInfo("profileFormat(10)");
      const actual: number = profileFormat(10);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0010
     * @tc.name      Resolution_ProfileFormat_0010
     * @tc.desc      profileFormat(11) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0010 begin`);
      logInfo("profileFormat(11)");
      const actual: number = profileFormat(11);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0011
     * @tc.name      Resolution_ProfileFormat_0011
     * @tc.desc      profileFormat(12) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0011 begin`);
      logInfo("profileFormat(12)");
      const actual: number = profileFormat(12);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0012
     * @tc.name      Resolution_ProfileFormat_0012
     * @tc.desc      profileFormat(13) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ProfileFormat_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileFormat_0012 begin`);
      logInfo("profileFormat(13)");
      const actual: number = profileFormat(13);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0013
     * @tc.name      Resolution_ProfileFormat_0013
     * @tc.desc      profileFormat(14) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0013 begin`);
      logInfo("profileFormat(14)");
      const actual: number = profileFormat(14);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0014
     * @tc.name      Resolution_ProfileFormat_0014
     * @tc.desc      profileFormat(15) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0014 begin`);
      logInfo("profileFormat(15)");
      const actual: number = profileFormat(15);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0015
     * @tc.name      Resolution_ProfileFormat_0015
     * @tc.desc      profileFormat(16) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0015 begin`);
      logInfo("profileFormat(16)");
      const actual: number = profileFormat(16);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0016
     * @tc.name      Resolution_ProfileFormat_0016
     * @tc.desc      profileFormat(17) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0016 begin`);
      logInfo("profileFormat(17)");
      const actual: number = profileFormat(17);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0017
     * @tc.name      Resolution_ProfileFormat_0017
     * @tc.desc      profileFormat(20) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0017 begin`);
      logInfo("profileFormat(20)");
      const actual: number = profileFormat(20);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0018
     * @tc.name      Resolution_ProfileFormat_0018
     * @tc.desc      profileFormat(24) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ProfileFormat_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProfileFormat_0018 begin`);
      logInfo("profileFormat(24)");
      const actual: number = profileFormat(24);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0019
     * @tc.name      Resolution_ProfileFormat_0019
     * @tc.desc      profileFormat(25) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0019 begin`);
      logInfo("profileFormat(25)");
      const actual: number = profileFormat(25);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0020
     * @tc.name      Resolution_ProfileFormat_0020
     * @tc.desc      profileFormat(28) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0020 begin`);
      logInfo("profileFormat(28)");
      const actual: number = profileFormat(28);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0021
     * @tc.name      Resolution_ProfileFormat_0021
     * @tc.desc      profileFormat(30) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0021 begin`);
      logInfo("profileFormat(30)");
      const actual: number = profileFormat(30);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0022
     * @tc.name      Resolution_ProfileFormat_0022
     * @tc.desc      profileFormat(36) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0022 begin`);
      logInfo("profileFormat(36)");
      const actual: number = profileFormat(36);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0023
     * @tc.name      Resolution_ProfileFormat_0023
     * @tc.desc      profileFormat(40) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ProfileFormat_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileFormat_0023 begin`);
      logInfo("profileFormat(40)");
      const actual: number = profileFormat(40);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0024
     * @tc.name      Resolution_ProfileFormat_0024
     * @tc.desc      profileFormat(42) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0024 begin`);
      logInfo("profileFormat(42)");
      const actual: number = profileFormat(42);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0025
     * @tc.name      Resolution_ProfileFormat_0025
     * @tc.desc      profileFormat(45) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0025 begin`);
      logInfo("profileFormat(45)");
      const actual: number = profileFormat(45);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0026
     * @tc.name      Resolution_ProfileFormat_0026
     * @tc.desc      profileFormat(48) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0026 begin`);
      logInfo("profileFormat(48)");
      const actual: number = profileFormat(48);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0027
     * @tc.name      Resolution_ProfileFormat_0027
     * @tc.desc      profileFormat(50) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0027 begin`);
      logInfo("profileFormat(50)");
      const actual: number = profileFormat(50);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0028
     * @tc.name      Resolution_ProfileFormat_0028
     * @tc.desc      profileFormat(60) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0028 begin`);
      logInfo("profileFormat(60)");
      const actual: number = profileFormat(60);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0029
     * @tc.name      Resolution_ProfileFormat_0029
     * @tc.desc      profileFormat(64) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0029 begin`);
      logInfo("profileFormat(64)");
      const actual: number = profileFormat(64);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0030
     * @tc.name      Resolution_ProfileFormat_0030
     * @tc.desc      profileFormat(70) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0030 begin`);
      logInfo("profileFormat(70)");
      const actual: number = profileFormat(70);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0031
     * @tc.name      Resolution_ProfileFormat_0031
     * @tc.desc      profileFormat(72) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0031 begin`);
      logInfo("profileFormat(72)");
      const actual: number = profileFormat(72);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0032
     * @tc.name      Resolution_ProfileFormat_0032
     * @tc.desc      profileFormat(75) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0032 begin`);
      logInfo("profileFormat(75)");
      const actual: number = profileFormat(75);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0033
     * @tc.name      Resolution_ProfileFormat_0033
     * @tc.desc      profileFormat(80) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0033 begin`);
      logInfo("profileFormat(80)");
      const actual: number = profileFormat(80);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0034
     * @tc.name      Resolution_ProfileFormat_0034
     * @tc.desc      profileFormat(90) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ProfileFormat_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileFormat_0034 begin`);
      logInfo("profileFormat(90)");
      const actual: number = profileFormat(90);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0035
     * @tc.name      Resolution_ProfileFormat_0035
     * @tc.desc      profileFormat(100) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ProfileFormat_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProfileFormat_0035 begin`);
      logInfo("profileFormat(100)");
      const actual: number = profileFormat(100);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0036
     * @tc.name      Resolution_ProfileFormat_0036
     * @tc.desc      profileFormat(108) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0036 begin`);
      logInfo("profileFormat(108)");
      const actual: number = profileFormat(108);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0037
     * @tc.name      Resolution_ProfileFormat_0037
     * @tc.desc      profileFormat(120) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0037 begin`);
      logInfo("profileFormat(120)");
      const actual: number = profileFormat(120);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0038
     * @tc.name      Resolution_ProfileFormat_0038
     * @tc.desc      profileFormat(128) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0038 begin`);
      logInfo("profileFormat(128)");
      const actual: number = profileFormat(128);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0039
     * @tc.name      Resolution_ProfileFormat_0039
     * @tc.desc      profileFormat(144) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0039 begin`);
      logInfo("profileFormat(144)");
      const actual: number = profileFormat(144);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0040
     * @tc.name      Resolution_ProfileFormat_0040
     * @tc.desc      profileFormat(160) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0040 begin`);
      logInfo("profileFormat(160)");
      const actual: number = profileFormat(160);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0041
     * @tc.name      Resolution_ProfileFormat_0041
     * @tc.desc      profileFormat(180) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0041 begin`);
      logInfo("profileFormat(180)");
      const actual: number = profileFormat(180);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0042
     * @tc.name      Resolution_ProfileFormat_0042
     * @tc.desc      profileFormat(200) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0042 begin`);
      logInfo("profileFormat(200)");
      const actual: number = profileFormat(200);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0043
     * @tc.name      Resolution_ProfileFormat_0043
     * @tc.desc      profileFormat(240) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0043 begin`);
      logInfo("profileFormat(240)");
      const actual: number = profileFormat(240);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0044
     * @tc.name      Resolution_ProfileFormat_0044
     * @tc.desc      profileFormat(255) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0044 begin`);
      logInfo("profileFormat(255)");
      const actual: number = profileFormat(255);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0045
     * @tc.name      Resolution_ProfileFormat_0045
     * @tc.desc      profileFormat(270) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ProfileFormat_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileFormat_0045 begin`);
      logInfo("profileFormat(270)");
      const actual: number = profileFormat(270);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}ProfileFormat_0045 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FORMAT_0046
     * @tc.name      Resolution_ProfileFormat_0046
     * @tc.desc      profileFormat(300) returns 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFormat_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFormat_0046 begin`);
      logInfo("profileFormat(300)");
      const actual: number = profileFormat(300);
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileFormat_0046 end`);
    });
  });
}
