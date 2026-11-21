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
  videoFrameAllowed,
} from '../model/ResolutionLogic';

/** VideoFrameAllowedTest logic checks (46 cases). */
export default function videoFrameAllowedTest(): void {
  describe('VideoFrameAllowedTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0001
     * @tc.name      Resolution_FrameAllowed_0001
     * @tc.desc      videoFrameAllowed(0, 0) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FrameAllowed_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FrameAllowed_0001 begin`);
      logInfo("videoFrameAllowed(0, 0)");
      const actual: boolean = videoFrameAllowed(0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0002
     * @tc.name      Resolution_FrameAllowed_0002
     * @tc.desc      videoFrameAllowed(0, 25) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0002 begin`);
      logInfo("videoFrameAllowed(0, 25)");
      const actual: boolean = videoFrameAllowed(0, 25);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0003
     * @tc.name      Resolution_FrameAllowed_0003
     * @tc.desc      videoFrameAllowed(0, 30.5) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0003 begin`);
      logInfo("videoFrameAllowed(0, 30.5)");
      const actual: boolean = videoFrameAllowed(0, 30.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0004
     * @tc.name      Resolution_FrameAllowed_0004
     * @tc.desc      videoFrameAllowed(1, 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0004 begin`);
      logInfo("videoFrameAllowed(1, 1)");
      const actual: boolean = videoFrameAllowed(1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0005
     * @tc.name      Resolution_FrameAllowed_0005
     * @tc.desc      videoFrameAllowed(1, 29) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0005 begin`);
      logInfo("videoFrameAllowed(1, 29)");
      const actual: boolean = videoFrameAllowed(1, 29);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0006
     * @tc.name      Resolution_FrameAllowed_0006
     * @tc.desc      videoFrameAllowed(1, 31) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0006 begin`);
      logInfo("videoFrameAllowed(1, 31)");
      const actual: boolean = videoFrameAllowed(1, 31);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0007
     * @tc.name      Resolution_FrameAllowed_0007
     * @tc.desc      videoFrameAllowed(24, 24) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0007 begin`);
      logInfo("videoFrameAllowed(24, 24)");
      const actual: boolean = videoFrameAllowed(24, 24);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0008
     * @tc.name      Resolution_FrameAllowed_0008
     * @tc.desc      videoFrameAllowed(24, 30) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0008 begin`);
      logInfo("videoFrameAllowed(24, 30)");
      const actual: boolean = videoFrameAllowed(24, 30);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0009
     * @tc.name      Resolution_FrameAllowed_0009
     * @tc.desc      videoFrameAllowed(24, 45) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0009 begin`);
      logInfo("videoFrameAllowed(24, 45)");
      const actual: boolean = videoFrameAllowed(24, 45);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0010
     * @tc.name      Resolution_FrameAllowed_0010
     * @tc.desc      videoFrameAllowed(25, 25) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0010 begin`);
      logInfo("videoFrameAllowed(25, 25)");
      const actual: boolean = videoFrameAllowed(25, 25);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0011
     * @tc.name      Resolution_FrameAllowed_0011
     * @tc.desc      videoFrameAllowed(25, 30.5) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0011 begin`);
      logInfo("videoFrameAllowed(25, 30.5)");
      const actual: boolean = videoFrameAllowed(25, 30.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0012
     * @tc.name      Resolution_FrameAllowed_0012
     * @tc.desc      videoFrameAllowed(25, 55) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FrameAllowed_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FrameAllowed_0012 begin`);
      logInfo("videoFrameAllowed(25, 55)");
      const actual: boolean = videoFrameAllowed(25, 55);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0013
     * @tc.name      Resolution_FrameAllowed_0013
     * @tc.desc      videoFrameAllowed(29, 29) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0013 begin`);
      logInfo("videoFrameAllowed(29, 29)");
      const actual: boolean = videoFrameAllowed(29, 29);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0014
     * @tc.name      Resolution_FrameAllowed_0014
     * @tc.desc      videoFrameAllowed(29, 31) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0014 begin`);
      logInfo("videoFrameAllowed(29, 31)");
      const actual: boolean = videoFrameAllowed(29, 31);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0015
     * @tc.name      Resolution_FrameAllowed_0015
     * @tc.desc      videoFrameAllowed(29, 59) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0015 begin`);
      logInfo("videoFrameAllowed(29, 59)");
      const actual: boolean = videoFrameAllowed(29, 59);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0016
     * @tc.name      Resolution_FrameAllowed_0016
     * @tc.desc      videoFrameAllowed(30, 30) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0016 begin`);
      logInfo("videoFrameAllowed(30, 30)");
      const actual: boolean = videoFrameAllowed(30, 30);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0017
     * @tc.name      Resolution_FrameAllowed_0017
     * @tc.desc      videoFrameAllowed(30, 45) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0017 begin`);
      logInfo("videoFrameAllowed(30, 45)");
      const actual: boolean = videoFrameAllowed(30, 45);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0018
     * @tc.name      Resolution_FrameAllowed_0018
     * @tc.desc      videoFrameAllowed(30, 59.9) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_FrameAllowed_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FrameAllowed_0018 begin`);
      logInfo("videoFrameAllowed(30, 59.9)");
      const actual: boolean = videoFrameAllowed(30, 59.9);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0019
     * @tc.name      Resolution_FrameAllowed_0019
     * @tc.desc      videoFrameAllowed(30.5, 30.5) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0019 begin`);
      logInfo("videoFrameAllowed(30.5, 30.5)");
      const actual: boolean = videoFrameAllowed(30.5, 30.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0020
     * @tc.name      Resolution_FrameAllowed_0020
     * @tc.desc      videoFrameAllowed(30.5, 55) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0020 begin`);
      logInfo("videoFrameAllowed(30.5, 55)");
      const actual: boolean = videoFrameAllowed(30.5, 55);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0021
     * @tc.name      Resolution_FrameAllowed_0021
     * @tc.desc      videoFrameAllowed(30.5, 60) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0021 begin`);
      logInfo("videoFrameAllowed(30.5, 60)");
      const actual: boolean = videoFrameAllowed(30.5, 60);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0022
     * @tc.name      Resolution_FrameAllowed_0022
     * @tc.desc      videoFrameAllowed(31, 31) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0022 begin`);
      logInfo("videoFrameAllowed(31, 31)");
      const actual: boolean = videoFrameAllowed(31, 31);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0023
     * @tc.name      Resolution_FrameAllowed_0023
     * @tc.desc      videoFrameAllowed(31, 59) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FrameAllowed_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FrameAllowed_0023 begin`);
      logInfo("videoFrameAllowed(31, 59)");
      const actual: boolean = videoFrameAllowed(31, 59);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0024
     * @tc.name      Resolution_FrameAllowed_0024
     * @tc.desc      videoFrameAllowed(31, 60.1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0024 begin`);
      logInfo("videoFrameAllowed(31, 60.1)");
      const actual: boolean = videoFrameAllowed(31, 60.1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FrameAllowed_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0025
     * @tc.name      Resolution_FrameAllowed_0025
     * @tc.desc      videoFrameAllowed(45, 45) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0025 begin`);
      logInfo("videoFrameAllowed(45, 45)");
      const actual: boolean = videoFrameAllowed(45, 45);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0026
     * @tc.name      Resolution_FrameAllowed_0026
     * @tc.desc      videoFrameAllowed(45, 59.9) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0026 begin`);
      logInfo("videoFrameAllowed(45, 59.9)");
      const actual: boolean = videoFrameAllowed(45, 59.9);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0027
     * @tc.name      Resolution_FrameAllowed_0027
     * @tc.desc      videoFrameAllowed(45, 61) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0027 begin`);
      logInfo("videoFrameAllowed(45, 61)");
      const actual: boolean = videoFrameAllowed(45, 61);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FrameAllowed_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0028
     * @tc.name      Resolution_FrameAllowed_0028
     * @tc.desc      videoFrameAllowed(55, 55) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0028 begin`);
      logInfo("videoFrameAllowed(55, 55)");
      const actual: boolean = videoFrameAllowed(55, 55);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0029
     * @tc.name      Resolution_FrameAllowed_0029
     * @tc.desc      videoFrameAllowed(55, 60) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0029 begin`);
      logInfo("videoFrameAllowed(55, 60)");
      const actual: boolean = videoFrameAllowed(55, 60);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0030
     * @tc.name      Resolution_FrameAllowed_0030
     * @tc.desc      videoFrameAllowed(55, 90) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0030 begin`);
      logInfo("videoFrameAllowed(55, 90)");
      const actual: boolean = videoFrameAllowed(55, 90);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FrameAllowed_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0031
     * @tc.name      Resolution_FrameAllowed_0031
     * @tc.desc      videoFrameAllowed(59, 59) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0031 begin`);
      logInfo("videoFrameAllowed(59, 59)");
      const actual: boolean = videoFrameAllowed(59, 59);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0032
     * @tc.name      Resolution_FrameAllowed_0032
     * @tc.desc      videoFrameAllowed(59, 60.1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0032 begin`);
      logInfo("videoFrameAllowed(59, 60.1)");
      const actual: boolean = videoFrameAllowed(59, 60.1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FrameAllowed_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0033
     * @tc.name      Resolution_FrameAllowed_0033
     * @tc.desc      videoFrameAllowed(59, -1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0033 begin`);
      logInfo("videoFrameAllowed(59, -1)");
      const actual: boolean = videoFrameAllowed(59, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0034
     * @tc.name      Resolution_FrameAllowed_0034
     * @tc.desc      videoFrameAllowed(59.9, 59.9) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FrameAllowed_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FrameAllowed_0034 begin`);
      logInfo("videoFrameAllowed(59.9, 59.9)");
      const actual: boolean = videoFrameAllowed(59.9, 59.9);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0035
     * @tc.name      Resolution_FrameAllowed_0035
     * @tc.desc      videoFrameAllowed(59.9, 61) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_FrameAllowed_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FrameAllowed_0035 begin`);
      logInfo("videoFrameAllowed(59.9, 61)");
      const actual: boolean = videoFrameAllowed(59.9, 61);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FrameAllowed_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0036
     * @tc.name      Resolution_FrameAllowed_0036
     * @tc.desc      videoFrameAllowed(59.9, -30) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0036 begin`);
      logInfo("videoFrameAllowed(59.9, -30)");
      const actual: boolean = videoFrameAllowed(59.9, -30);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0037
     * @tc.name      Resolution_FrameAllowed_0037
     * @tc.desc      videoFrameAllowed(60, 60) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0037 begin`);
      logInfo("videoFrameAllowed(60, 60)");
      const actual: boolean = videoFrameAllowed(60, 60);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0038
     * @tc.name      Resolution_FrameAllowed_0038
     * @tc.desc      videoFrameAllowed(60, 90) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0038 begin`);
      logInfo("videoFrameAllowed(60, 90)");
      const actual: boolean = videoFrameAllowed(60, 90);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FrameAllowed_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0039
     * @tc.name      Resolution_FrameAllowed_0039
     * @tc.desc      videoFrameAllowed(60, 0) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0039 begin`);
      logInfo("videoFrameAllowed(60, 0)");
      const actual: boolean = videoFrameAllowed(60, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FrameAllowed_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0040
     * @tc.name      Resolution_FrameAllowed_0040
     * @tc.desc      videoFrameAllowed(60.1, 60.1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0040 begin`);
      logInfo("videoFrameAllowed(60.1, 60.1)");
      const actual: boolean = videoFrameAllowed(60.1, 60.1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0041
     * @tc.name      Resolution_FrameAllowed_0041
     * @tc.desc      videoFrameAllowed(60.1, -1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0041 begin`);
      logInfo("videoFrameAllowed(60.1, -1)");
      const actual: boolean = videoFrameAllowed(60.1, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FrameAllowed_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0042
     * @tc.name      Resolution_FrameAllowed_0042
     * @tc.desc      videoFrameAllowed(60.1, 1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0042 begin`);
      logInfo("videoFrameAllowed(60.1, 1)");
      const actual: boolean = videoFrameAllowed(60.1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FrameAllowed_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0043
     * @tc.name      Resolution_FrameAllowed_0043
     * @tc.desc      videoFrameAllowed(61, 61) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0043 begin`);
      logInfo("videoFrameAllowed(61, 61)");
      const actual: boolean = videoFrameAllowed(61, 61);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0044
     * @tc.name      Resolution_FrameAllowed_0044
     * @tc.desc      videoFrameAllowed(61, -30) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0044 begin`);
      logInfo("videoFrameAllowed(61, -30)");
      const actual: boolean = videoFrameAllowed(61, -30);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FrameAllowed_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0045
     * @tc.name      Resolution_FrameAllowed_0045
     * @tc.desc      videoFrameAllowed(61, 24) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FrameAllowed_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FrameAllowed_0045 begin`);
      logInfo("videoFrameAllowed(61, 24)");
      const actual: boolean = videoFrameAllowed(61, 24);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FrameAllowed_0045 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FRAME_ALLOWED_0046
     * @tc.name      Resolution_FrameAllowed_0046
     * @tc.desc      videoFrameAllowed(90, 90) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FrameAllowed_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FrameAllowed_0046 begin`);
      logInfo("videoFrameAllowed(90, 90)");
      const actual: boolean = videoFrameAllowed(90, 90);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FrameAllowed_0046 end`);
    });
  });
}
