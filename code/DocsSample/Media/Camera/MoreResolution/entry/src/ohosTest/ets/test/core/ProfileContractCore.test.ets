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
  PREVIEW_FORMAT,
  PHOTO_FORMAT,
  VIDEO_FORMAT,
  DEFAULT_PHOTO_WIDTH,
  DEFAULT_PHOTO_HEIGHT,
  DEFAULT_PREVIEW_WIDTH,
  DEFAULT_PREVIEW_HEIGHT,
  DEFAULT_VIDEO_WIDTH,
  DEFAULT_VIDEO_HEIGHT,
  VIDEO_FRAME_MIN,
  VIDEO_FRAME_MAX,
  FALLBACK_RECONFIG_HEIGHT,
  RATIO_TOLERANCE,
} from '../model/ResolutionLogic';

/** ProfileContractCoreTest logic checks (13 cases). */
export default function profileContractCoreTest(): void {
  describe('ProfileContractCoreTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_CORE_0001
     * @tc.name      Resolution_ProfileCore_0001
     * @tc.desc      PREVIEW_FORMAT keeps the profile contract 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ProfileCore_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileCore_0001 begin`);
      logInfo("profile PREVIEW_FORMAT");
      const actual: number = PREVIEW_FORMAT;
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileCore_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_CORE_0002
     * @tc.name      Resolution_ProfileCore_0002
     * @tc.desc      PHOTO_FORMAT keeps the profile contract 2000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileCore_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileCore_0002 begin`);
      logInfo("profile PHOTO_FORMAT");
      const actual: number = PHOTO_FORMAT;
      logInfo('actual=' + String(actual) + ', expected=' + "2000");
      expect(actual).assertEqual(2000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileCore_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_CORE_0003
     * @tc.name      Resolution_ProfileCore_0003
     * @tc.desc      VIDEO_FORMAT keeps the profile contract 1003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileCore_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileCore_0003 begin`);
      logInfo("profile VIDEO_FORMAT");
      const actual: number = VIDEO_FORMAT;
      logInfo('actual=' + String(actual) + ', expected=' + "1003");
      expect(actual).assertEqual(1003);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileCore_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_CORE_0004
     * @tc.name      Resolution_ProfileCore_0004
     * @tc.desc      DEFAULT_PHOTO_WIDTH keeps the profile contract 1920.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileCore_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileCore_0004 begin`);
      logInfo("profile DEFAULT_PHOTO_WIDTH");
      const actual: number = DEFAULT_PHOTO_WIDTH;
      logInfo('actual=' + String(actual) + ', expected=' + "1920");
      expect(actual).assertEqual(1920);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileCore_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_CORE_0005
     * @tc.name      Resolution_ProfileCore_0005
     * @tc.desc      DEFAULT_PHOTO_HEIGHT keeps the profile contract 1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileCore_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileCore_0005 begin`);
      logInfo("profile DEFAULT_PHOTO_HEIGHT");
      const actual: number = DEFAULT_PHOTO_HEIGHT;
      logInfo('actual=' + String(actual) + ', expected=' + "1080");
      expect(actual).assertEqual(1080);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileCore_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_CORE_0006
     * @tc.name      Resolution_ProfileCore_0006
     * @tc.desc      DEFAULT_PREVIEW_WIDTH keeps the profile contract 1280.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileCore_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileCore_0006 begin`);
      logInfo("profile DEFAULT_PREVIEW_WIDTH");
      const actual: number = DEFAULT_PREVIEW_WIDTH;
      logInfo('actual=' + String(actual) + ', expected=' + "1280");
      expect(actual).assertEqual(1280);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileCore_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_CORE_0007
     * @tc.name      Resolution_ProfileCore_0007
     * @tc.desc      DEFAULT_PREVIEW_HEIGHT keeps the profile contract 720.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileCore_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileCore_0007 begin`);
      logInfo("profile DEFAULT_PREVIEW_HEIGHT");
      const actual: number = DEFAULT_PREVIEW_HEIGHT;
      logInfo('actual=' + String(actual) + ', expected=' + "720");
      expect(actual).assertEqual(720);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileCore_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_CORE_0008
     * @tc.name      Resolution_ProfileCore_0008
     * @tc.desc      DEFAULT_VIDEO_WIDTH keeps the profile contract 1280.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileCore_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileCore_0008 begin`);
      logInfo("profile DEFAULT_VIDEO_WIDTH");
      const actual: number = DEFAULT_VIDEO_WIDTH;
      logInfo('actual=' + String(actual) + ', expected=' + "1280");
      expect(actual).assertEqual(1280);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileCore_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_CORE_0009
     * @tc.name      Resolution_ProfileCore_0009
     * @tc.desc      DEFAULT_VIDEO_HEIGHT keeps the profile contract 720.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileCore_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileCore_0009 begin`);
      logInfo("profile DEFAULT_VIDEO_HEIGHT");
      const actual: number = DEFAULT_VIDEO_HEIGHT;
      logInfo('actual=' + String(actual) + ', expected=' + "720");
      expect(actual).assertEqual(720);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileCore_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_CORE_0010
     * @tc.name      Resolution_ProfileCore_0010
     * @tc.desc      VIDEO_FRAME_MIN keeps the profile contract 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileCore_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileCore_0010 begin`);
      logInfo("profile VIDEO_FRAME_MIN");
      const actual: number = VIDEO_FRAME_MIN;
      logInfo('actual=' + String(actual) + ', expected=' + "30");
      expect(actual).assertEqual(30);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileCore_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_CORE_0011
     * @tc.name      Resolution_ProfileCore_0011
     * @tc.desc      VIDEO_FRAME_MAX keeps the profile contract 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileCore_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileCore_0011 begin`);
      logInfo("profile VIDEO_FRAME_MAX");
      const actual: number = VIDEO_FRAME_MAX;
      logInfo('actual=' + String(actual) + ', expected=' + "60");
      expect(actual).assertEqual(60);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileCore_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_CORE_0012
     * @tc.name      Resolution_ProfileCore_0012
     * @tc.desc      FALLBACK_RECONFIG_HEIGHT keeps the profile contract 720.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ProfileCore_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileCore_0012 begin`);
      logInfo("profile FALLBACK_RECONFIG_HEIGHT");
      const actual: number = FALLBACK_RECONFIG_HEIGHT;
      logInfo('actual=' + String(actual) + ', expected=' + "720");
      expect(actual).assertEqual(720);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileCore_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_CORE_0013
     * @tc.name      Resolution_ProfileCore_0013
     * @tc.desc      RATIO_TOLERANCE keeps the profile contract 0.2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileCore_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileCore_0013 begin`);
      logInfo("profile RATIO_TOLERANCE");
      const actual: number = RATIO_TOLERANCE;
      logInfo('actual=' + String(actual) + ', expected=' + "0.2");
      expect(actual).assertEqual(0.2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ProfileCore_0013 end`);
    });
  });
}
