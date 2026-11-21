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
