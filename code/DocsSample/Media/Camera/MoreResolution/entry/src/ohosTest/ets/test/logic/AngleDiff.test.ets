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
  angleDiff,
} from '../model/ResolutionLogic';

/** AngleDiffTest logic checks (46 cases). */
export default function angleDiffTest(): void {
  describe('AngleDiffTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0001
     * @tc.name      Resolution_AngleDiff_0001
     * @tc.desc      angleDiff(0, 0) normalizes to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_AngleDiff_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AngleDiff_0001 begin`);
      logInfo("angleDiff(0, 0)");
      const actual: number = angleDiff(0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0002
     * @tc.name      Resolution_AngleDiff_0002
     * @tc.desc      angleDiff(0, 270) normalizes to 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0002 begin`);
      logInfo("angleDiff(0, 270)");
      const actual: number = angleDiff(0, 270);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}AngleDiff_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0003
     * @tc.name      Resolution_AngleDiff_0003
     * @tc.desc      angleDiff(0, -180) normalizes to 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0003 begin`);
      logInfo("angleDiff(0, -180)");
      const actual: number = angleDiff(0, -180);
      logInfo('actual=' + String(actual) + ', expected=' + "180");
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}AngleDiff_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0004
     * @tc.name      Resolution_AngleDiff_0004
     * @tc.desc      angleDiff(0, 225) normalizes to 225.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0004 begin`);
      logInfo("angleDiff(0, 225)");
      const actual: number = angleDiff(0, 225);
      logInfo('actual=' + String(actual) + ', expected=' + "225");
      expect(actual).assertEqual(225);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0005
     * @tc.name      Resolution_AngleDiff_0005
     * @tc.desc      angleDiff(90, 90) normalizes to 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0005 begin`);
      logInfo("angleDiff(90, 90)");
      const actual: number = angleDiff(90, 90);
      logInfo('actual=' + String(actual) + ', expected=' + "180");
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}AngleDiff_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0006
     * @tc.name      Resolution_AngleDiff_0006
     * @tc.desc      angleDiff(90, 360) normalizes to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0006 begin`);
      logInfo("angleDiff(90, 360)");
      const actual: number = angleDiff(90, 360);
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}AngleDiff_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0007
     * @tc.name      Resolution_AngleDiff_0007
     * @tc.desc      angleDiff(90, 45) normalizes to 135.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0007 begin`);
      logInfo("angleDiff(90, 45)");
      const actual: number = angleDiff(90, 45);
      logInfo('actual=' + String(actual) + ', expected=' + "135");
      expect(actual).assertEqual(135);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0008
     * @tc.name      Resolution_AngleDiff_0008
     * @tc.desc      angleDiff(90, 315) normalizes to 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0008 begin`);
      logInfo("angleDiff(90, 315)");
      const actual: number = angleDiff(90, 315);
      logInfo('actual=' + String(actual) + ', expected=' + "45");
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}AngleDiff_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0009
     * @tc.name      Resolution_AngleDiff_0009
     * @tc.desc      angleDiff(180, 180) normalizes to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0009 begin`);
      logInfo("angleDiff(180, 180)");
      const actual: number = angleDiff(180, 180);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AngleDiff_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0010
     * @tc.name      Resolution_AngleDiff_0010
     * @tc.desc      angleDiff(180, -90) normalizes to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0010 begin`);
      logInfo("angleDiff(180, -90)");
      const actual: number = angleDiff(180, -90);
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0011
     * @tc.name      Resolution_AngleDiff_0011
     * @tc.desc      angleDiff(180, 135) normalizes to 315.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0011 begin`);
      logInfo("angleDiff(180, 135)");
      const actual: number = angleDiff(180, 135);
      logInfo('actual=' + String(actual) + ', expected=' + "315");
      expect(actual).assertEqual(315);
      logInfo(`${BUNDLE}AngleDiff_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0012
     * @tc.name      Resolution_AngleDiff_0012
     * @tc.desc      angleDiff(180, 720) normalizes to 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_AngleDiff_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AngleDiff_0012 begin`);
      logInfo("angleDiff(180, 720)");
      const actual: number = angleDiff(180, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "180");
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}AngleDiff_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0013
     * @tc.name      Resolution_AngleDiff_0013
     * @tc.desc      angleDiff(270, 270) normalizes to 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0013 begin`);
      logInfo("angleDiff(270, 270)");
      const actual: number = angleDiff(270, 270);
      logInfo('actual=' + String(actual) + ', expected=' + "180");
      expect(actual).assertEqual(180);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0014
     * @tc.name      Resolution_AngleDiff_0014
     * @tc.desc      angleDiff(270, -180) normalizes to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0014 begin`);
      logInfo("angleDiff(270, -180)");
      const actual: number = angleDiff(270, -180);
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}AngleDiff_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0015
     * @tc.name      Resolution_AngleDiff_0015
     * @tc.desc      angleDiff(270, 225) normalizes to 135.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0015 begin`);
      logInfo("angleDiff(270, 225)");
      const actual: number = angleDiff(270, 225);
      logInfo('actual=' + String(actual) + ', expected=' + "135");
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}AngleDiff_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0016
     * @tc.name      Resolution_AngleDiff_0016
     * @tc.desc      angleDiff(270, 0) normalizes to 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0016 begin`);
      logInfo("angleDiff(270, 0)");
      const actual: number = angleDiff(270, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0017
     * @tc.name      Resolution_AngleDiff_0017
     * @tc.desc      angleDiff(360, 360) normalizes to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0017 begin`);
      logInfo("angleDiff(360, 360)");
      const actual: number = angleDiff(360, 360);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AngleDiff_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0018
     * @tc.name      Resolution_AngleDiff_0018
     * @tc.desc      angleDiff(360, 45) normalizes to 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_AngleDiff_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AngleDiff_0018 begin`);
      logInfo("angleDiff(360, 45)");
      const actual: number = angleDiff(360, 45);
      logInfo('actual=' + String(actual) + ', expected=' + "45");
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}AngleDiff_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0019
     * @tc.name      Resolution_AngleDiff_0019
     * @tc.desc      angleDiff(360, 315) normalizes to 315.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0019 begin`);
      logInfo("angleDiff(360, 315)");
      const actual: number = angleDiff(360, 315);
      logInfo('actual=' + String(actual) + ', expected=' + "315");
      expect(actual).assertEqual(315);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0020
     * @tc.name      Resolution_AngleDiff_0020
     * @tc.desc      angleDiff(360, 90) normalizes to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0020 begin`);
      logInfo("angleDiff(360, 90)");
      const actual: number = angleDiff(360, 90);
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}AngleDiff_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0021
     * @tc.name      Resolution_AngleDiff_0021
     * @tc.desc      angleDiff(-90, -90) normalizes to 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0021 begin`);
      logInfo("angleDiff(-90, -90)");
      const actual: number = angleDiff(-90, -90);
      logInfo('actual=' + String(actual) + ', expected=' + "180");
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}AngleDiff_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0022
     * @tc.name      Resolution_AngleDiff_0022
     * @tc.desc      angleDiff(-90, 135) normalizes to 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0022 begin`);
      logInfo("angleDiff(-90, 135)");
      const actual: number = angleDiff(-90, 135);
      logInfo('actual=' + String(actual) + ', expected=' + "45");
      expect(actual).assertEqual(45);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0023
     * @tc.name      Resolution_AngleDiff_0023
     * @tc.desc      angleDiff(-90, 720) normalizes to 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_AngleDiff_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AngleDiff_0023 begin`);
      logInfo("angleDiff(-90, 720)");
      const actual: number = angleDiff(-90, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}AngleDiff_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0024
     * @tc.name      Resolution_AngleDiff_0024
     * @tc.desc      angleDiff(-90, 180) normalizes to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0024 begin`);
      logInfo("angleDiff(-90, 180)");
      const actual: number = angleDiff(-90, 180);
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}AngleDiff_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0025
     * @tc.name      Resolution_AngleDiff_0025
     * @tc.desc      angleDiff(-180, -180) normalizes to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0025 begin`);
      logInfo("angleDiff(-180, -180)");
      const actual: number = angleDiff(-180, -180);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0026
     * @tc.name      Resolution_AngleDiff_0026
     * @tc.desc      angleDiff(-180, 225) normalizes to 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0026 begin`);
      logInfo("angleDiff(-180, 225)");
      const actual: number = angleDiff(-180, 225);
      logInfo('actual=' + String(actual) + ', expected=' + "45");
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}AngleDiff_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0027
     * @tc.name      Resolution_AngleDiff_0027
     * @tc.desc      angleDiff(-180, 0) normalizes to 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0027 begin`);
      logInfo("angleDiff(-180, 0)");
      const actual: number = angleDiff(-180, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "180");
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}AngleDiff_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0028
     * @tc.name      Resolution_AngleDiff_0028
     * @tc.desc      angleDiff(-180, 270) normalizes to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0028 begin`);
      logInfo("angleDiff(-180, 270)");
      const actual: number = angleDiff(-180, 270);
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0029
     * @tc.name      Resolution_AngleDiff_0029
     * @tc.desc      angleDiff(45, 45) normalizes to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0029 begin`);
      logInfo("angleDiff(45, 45)");
      const actual: number = angleDiff(45, 45);
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}AngleDiff_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0030
     * @tc.name      Resolution_AngleDiff_0030
     * @tc.desc      angleDiff(45, 315) normalizes to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0030 begin`);
      logInfo("angleDiff(45, 315)");
      const actual: number = angleDiff(45, 315);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AngleDiff_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0031
     * @tc.name      Resolution_AngleDiff_0031
     * @tc.desc      angleDiff(45, 90) normalizes to 135.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0031 begin`);
      logInfo("angleDiff(45, 90)");
      const actual: number = angleDiff(45, 90);
      logInfo('actual=' + String(actual) + ', expected=' + "135");
      expect(actual).assertEqual(135);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0032
     * @tc.name      Resolution_AngleDiff_0032
     * @tc.desc      angleDiff(45, 360) normalizes to 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0032 begin`);
      logInfo("angleDiff(45, 360)");
      const actual: number = angleDiff(45, 360);
      logInfo('actual=' + String(actual) + ', expected=' + "45");
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}AngleDiff_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0033
     * @tc.name      Resolution_AngleDiff_0033
     * @tc.desc      angleDiff(135, 135) normalizes to 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0033 begin`);
      logInfo("angleDiff(135, 135)");
      const actual: number = angleDiff(135, 135);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}AngleDiff_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0034
     * @tc.name      Resolution_AngleDiff_0034
     * @tc.desc      angleDiff(135, 720) normalizes to 135.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_AngleDiff_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AngleDiff_0034 begin`);
      logInfo("angleDiff(135, 720)");
      const actual: number = angleDiff(135, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "135");
      expect(actual).assertEqual(135);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0035
     * @tc.name      Resolution_AngleDiff_0035
     * @tc.desc      angleDiff(135, 180) normalizes to 315.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_AngleDiff_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AngleDiff_0035 begin`);
      logInfo("angleDiff(135, 180)");
      const actual: number = angleDiff(135, 180);
      logInfo('actual=' + String(actual) + ', expected=' + "315");
      expect(actual).assertEqual(315);
      logInfo(`${BUNDLE}AngleDiff_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0036
     * @tc.name      Resolution_AngleDiff_0036
     * @tc.desc      angleDiff(135, -90) normalizes to 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0036 begin`);
      logInfo("angleDiff(135, -90)");
      const actual: number = angleDiff(135, -90);
      logInfo('actual=' + String(actual) + ', expected=' + "45");
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}AngleDiff_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0037
     * @tc.name      Resolution_AngleDiff_0037
     * @tc.desc      angleDiff(225, 225) normalizes to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0037 begin`);
      logInfo("angleDiff(225, 225)");
      const actual: number = angleDiff(225, 225);
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0038
     * @tc.name      Resolution_AngleDiff_0038
     * @tc.desc      angleDiff(225, 0) normalizes to 225.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0038 begin`);
      logInfo("angleDiff(225, 0)");
      const actual: number = angleDiff(225, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "225");
      expect(actual).assertEqual(225);
      logInfo(`${BUNDLE}AngleDiff_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0039
     * @tc.name      Resolution_AngleDiff_0039
     * @tc.desc      angleDiff(225, 270) normalizes to 135.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0039 begin`);
      logInfo("angleDiff(225, 270)");
      const actual: number = angleDiff(225, 270);
      logInfo('actual=' + String(actual) + ', expected=' + "135");
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}AngleDiff_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0040
     * @tc.name      Resolution_AngleDiff_0040
     * @tc.desc      angleDiff(225, -180) normalizes to 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0040 begin`);
      logInfo("angleDiff(225, -180)");
      const actual: number = angleDiff(225, -180);
      logInfo('actual=' + String(actual) + ', expected=' + "45");
      expect(actual).assertEqual(45);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0041
     * @tc.name      Resolution_AngleDiff_0041
     * @tc.desc      angleDiff(315, 315) normalizes to 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0041 begin`);
      logInfo("angleDiff(315, 315)");
      const actual: number = angleDiff(315, 315);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}AngleDiff_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0042
     * @tc.name      Resolution_AngleDiff_0042
     * @tc.desc      angleDiff(315, 90) normalizes to 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0042 begin`);
      logInfo("angleDiff(315, 90)");
      const actual: number = angleDiff(315, 90);
      logInfo('actual=' + String(actual) + ', expected=' + "45");
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}AngleDiff_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0043
     * @tc.name      Resolution_AngleDiff_0043
     * @tc.desc      angleDiff(315, 360) normalizes to 315.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0043 begin`);
      logInfo("angleDiff(315, 360)");
      const actual: number = angleDiff(315, 360);
      logInfo('actual=' + String(actual) + ', expected=' + "315");
      expect(actual).assertEqual(315);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0044
     * @tc.name      Resolution_AngleDiff_0044
     * @tc.desc      angleDiff(315, 45) normalizes to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0044 begin`);
      logInfo("angleDiff(315, 45)");
      const actual: number = angleDiff(315, 45);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AngleDiff_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0045
     * @tc.name      Resolution_AngleDiff_0045
     * @tc.desc      angleDiff(720, 720) normalizes to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_AngleDiff_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AngleDiff_0045 begin`);
      logInfo("angleDiff(720, 720)");
      const actual: number = angleDiff(720, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AngleDiff_0045 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ANGLE_DIFF_0046
     * @tc.name      Resolution_AngleDiff_0046
     * @tc.desc      angleDiff(720, 180) normalizes to 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_AngleDiff_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AngleDiff_0046 begin`);
      logInfo("angleDiff(720, 180)");
      const actual: number = angleDiff(720, 180);
      logInfo('actual=' + String(actual) + ', expected=' + "180");
      expect(actual).assertEqual(180);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AngleDiff_0046 end`);
    });
  });
}
