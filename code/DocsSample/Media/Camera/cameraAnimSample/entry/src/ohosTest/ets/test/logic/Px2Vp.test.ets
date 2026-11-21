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
  px2vp,
} from '../model/CameraLogic';

/** Px2VpTest logic checks (46 cases). */
export default function px2vpTest(): void {
  describe('Px2VpTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_PX2VP_0001
     * @tc.name      Camera_Px2Vp_0001
     * @tc.desc      px2vp(0, 1) converts to 0 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_Px2Vp_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2Vp_0001 begin`);
      logInfo("px2vp(0, 1)");
      const actual: number = px2vp(0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0002
     * @tc.name      Camera_Px2Vp_0002
     * @tc.desc      px2vp(1, 1.5) converts to 0.666667 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0002 begin`);
      logInfo("px2vp(1, 1.5)");
      const actual: number = px2vp(1, 1.5);
      logInfo('actual=' + String(actual) + ', expected=' + "0.666667");
      expect(actual).assertEqual(0.666667);
      logInfo(`${BUNDLE}Px2Vp_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0003
     * @tc.name      Camera_Px2Vp_0003
     * @tc.desc      px2vp(2, 2) converts to 1 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0003 begin`);
      logInfo("px2vp(2, 2)");
      const actual: number = px2vp(2, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}Px2Vp_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0004
     * @tc.name      Camera_Px2Vp_0004
     * @tc.desc      px2vp(3, 2.5) converts to 1.2 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0004 begin`);
      logInfo("px2vp(3, 2.5)");
      const actual: number = px2vp(3, 2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "1.2");
      expect(actual).assertEqual(1.2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0005
     * @tc.name      Camera_Px2Vp_0005
     * @tc.desc      px2vp(4, 3) converts to 1.333333 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0005 begin`);
      logInfo("px2vp(4, 3)");
      const actual: number = px2vp(4, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "1.333333");
      expect(actual).assertEqual(1.333333);
      logInfo(`${BUNDLE}Px2Vp_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0006
     * @tc.name      Camera_Px2Vp_0006
     * @tc.desc      px2vp(5, 3.5) converts to 1.428571 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0006 begin`);
      logInfo("px2vp(5, 3.5)");
      const actual: number = px2vp(5, 3.5);
      logInfo('actual=' + String(actual) + ', expected=' + "1.428571");
      expect(actual).assertEqual(1.428571);
      logInfo(`${BUNDLE}Px2Vp_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0007
     * @tc.name      Camera_Px2Vp_0007
     * @tc.desc      px2vp(6, 4) converts to 1.5 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0007 begin`);
      logInfo("px2vp(6, 4)");
      const actual: number = px2vp(6, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "1.5");
      expect(actual).assertEqual(1.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0008
     * @tc.name      Camera_Px2Vp_0008
     * @tc.desc      px2vp(8, 4.5) converts to 1.777778 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0008 begin`);
      logInfo("px2vp(8, 4.5)");
      const actual: number = px2vp(8, 4.5);
      logInfo('actual=' + String(actual) + ', expected=' + "1.777778");
      expect(actual).assertEqual(1.777778);
      logInfo(`${BUNDLE}Px2Vp_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0009
     * @tc.name      Camera_Px2Vp_0009
     * @tc.desc      px2vp(10, 5) converts to 2 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0009 begin`);
      logInfo("px2vp(10, 5)");
      const actual: number = px2vp(10, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}Px2Vp_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0010
     * @tc.name      Camera_Px2Vp_0010
     * @tc.desc      px2vp(12, 6) converts to 2 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0010 begin`);
      logInfo("px2vp(12, 6)");
      const actual: number = px2vp(12, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0011
     * @tc.name      Camera_Px2Vp_0011
     * @tc.desc      px2vp(14, 1.25) converts to 11.2 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0011 begin`);
      logInfo("px2vp(14, 1.25)");
      const actual: number = px2vp(14, 1.25);
      logInfo('actual=' + String(actual) + ', expected=' + "11.2");
      expect(actual).assertEqual(11.2);
      logInfo(`${BUNDLE}Px2Vp_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0012
     * @tc.name      Camera_Px2Vp_0012
     * @tc.desc      px2vp(16, 1.75) converts to 9.142857 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_Px2Vp_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2Vp_0012 begin`);
      logInfo("px2vp(16, 1.75)");
      const actual: number = px2vp(16, 1.75);
      logInfo('actual=' + String(actual) + ', expected=' + "9.142857");
      expect(actual).assertEqual(9.142857);
      logInfo(`${BUNDLE}Px2Vp_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0013
     * @tc.name      Camera_Px2Vp_0013
     * @tc.desc      px2vp(18, 2.25) converts to 8 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0013 begin`);
      logInfo("px2vp(18, 2.25)");
      const actual: number = px2vp(18, 2.25);
      logInfo('actual=' + String(actual) + ', expected=' + "8");
      expect(actual).assertEqual(8);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0014
     * @tc.name      Camera_Px2Vp_0014
     * @tc.desc      px2vp(20, 2.75) converts to 7.272727 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0014 begin`);
      logInfo("px2vp(20, 2.75)");
      const actual: number = px2vp(20, 2.75);
      logInfo('actual=' + String(actual) + ', expected=' + "7.272727");
      expect(actual).assertEqual(7.272727);
      logInfo(`${BUNDLE}Px2Vp_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0015
     * @tc.name      Camera_Px2Vp_0015
     * @tc.desc      px2vp(24, 3.25) converts to 7.384615 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0015 begin`);
      logInfo("px2vp(24, 3.25)");
      const actual: number = px2vp(24, 3.25);
      logInfo('actual=' + String(actual) + ', expected=' + "7.384615");
      expect(actual).assertEqual(7.384615);
      logInfo(`${BUNDLE}Px2Vp_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0016
     * @tc.name      Camera_Px2Vp_0016
     * @tc.desc      px2vp(28, 0.5) converts to 56 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0016 begin`);
      logInfo("px2vp(28, 0.5)");
      const actual: number = px2vp(28, 0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "56");
      expect(actual).assertEqual(56);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0017
     * @tc.name      Camera_Px2Vp_0017
     * @tc.desc      px2vp(30, 1) converts to 30 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0017 begin`);
      logInfo("px2vp(30, 1)");
      const actual: number = px2vp(30, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "30");
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}Px2Vp_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0018
     * @tc.name      Camera_Px2Vp_0018
     * @tc.desc      px2vp(32, 1.5) converts to 21.333333 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_Px2Vp_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Px2Vp_0018 begin`);
      logInfo("px2vp(32, 1.5)");
      const actual: number = px2vp(32, 1.5);
      logInfo('actual=' + String(actual) + ', expected=' + "21.333333");
      expect(actual).assertEqual(21.333333);
      logInfo(`${BUNDLE}Px2Vp_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0019
     * @tc.name      Camera_Px2Vp_0019
     * @tc.desc      px2vp(36, 2) converts to 18 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0019 begin`);
      logInfo("px2vp(36, 2)");
      const actual: number = px2vp(36, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "18");
      expect(actual).assertEqual(18);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0020
     * @tc.name      Camera_Px2Vp_0020
     * @tc.desc      px2vp(40, 2.5) converts to 16 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0020 begin`);
      logInfo("px2vp(40, 2.5)");
      const actual: number = px2vp(40, 2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "16");
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}Px2Vp_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0021
     * @tc.name      Camera_Px2Vp_0021
     * @tc.desc      px2vp(48, 3) converts to 16 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0021 begin`);
      logInfo("px2vp(48, 3)");
      const actual: number = px2vp(48, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "16");
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}Px2Vp_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0022
     * @tc.name      Camera_Px2Vp_0022
     * @tc.desc      px2vp(50, 3.5) converts to 14.285714 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0022 begin`);
      logInfo("px2vp(50, 3.5)");
      const actual: number = px2vp(50, 3.5);
      logInfo('actual=' + String(actual) + ', expected=' + "14.285714");
      expect(actual).assertEqual(14.285714);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0023
     * @tc.name      Camera_Px2Vp_0023
     * @tc.desc      px2vp(60, 4) converts to 15 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_Px2Vp_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2Vp_0023 begin`);
      logInfo("px2vp(60, 4)");
      const actual: number = px2vp(60, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}Px2Vp_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0024
     * @tc.name      Camera_Px2Vp_0024
     * @tc.desc      px2vp(64, 4.5) converts to 14.222222 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0024 begin`);
      logInfo("px2vp(64, 4.5)");
      const actual: number = px2vp(64, 4.5);
      logInfo('actual=' + String(actual) + ', expected=' + "14.222222");
      expect(actual).assertEqual(14.222222);
      logInfo(`${BUNDLE}Px2Vp_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0025
     * @tc.name      Camera_Px2Vp_0025
     * @tc.desc      px2vp(72, 5) converts to 14.4 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0025 begin`);
      logInfo("px2vp(72, 5)");
      const actual: number = px2vp(72, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "14.4");
      expect(actual).assertEqual(14.4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0026
     * @tc.name      Camera_Px2Vp_0026
     * @tc.desc      px2vp(80, 6) converts to 13.333333 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0026 begin`);
      logInfo("px2vp(80, 6)");
      const actual: number = px2vp(80, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "13.333333");
      expect(actual).assertEqual(13.333333);
      logInfo(`${BUNDLE}Px2Vp_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0027
     * @tc.name      Camera_Px2Vp_0027
     * @tc.desc      px2vp(90, 1.25) converts to 72 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0027 begin`);
      logInfo("px2vp(90, 1.25)");
      const actual: number = px2vp(90, 1.25);
      logInfo('actual=' + String(actual) + ', expected=' + "72");
      expect(actual).assertEqual(72);
      logInfo(`${BUNDLE}Px2Vp_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0028
     * @tc.name      Camera_Px2Vp_0028
     * @tc.desc      px2vp(100, 1.75) converts to 57.142857 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0028 begin`);
      logInfo("px2vp(100, 1.75)");
      const actual: number = px2vp(100, 1.75);
      logInfo('actual=' + String(actual) + ', expected=' + "57.142857");
      expect(actual).assertEqual(57.142857);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0029
     * @tc.name      Camera_Px2Vp_0029
     * @tc.desc      px2vp(108, 2.25) converts to 48 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0029 begin`);
      logInfo("px2vp(108, 2.25)");
      const actual: number = px2vp(108, 2.25);
      logInfo('actual=' + String(actual) + ', expected=' + "48");
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}Px2Vp_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0030
     * @tc.name      Camera_Px2Vp_0030
     * @tc.desc      px2vp(120, 2.75) converts to 43.636364 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0030 begin`);
      logInfo("px2vp(120, 2.75)");
      const actual: number = px2vp(120, 2.75);
      logInfo('actual=' + String(actual) + ', expected=' + "43.636364");
      expect(actual).assertEqual(43.636364);
      logInfo(`${BUNDLE}Px2Vp_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0031
     * @tc.name      Camera_Px2Vp_0031
     * @tc.desc      px2vp(128, 3.25) converts to 39.384615 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0031 begin`);
      logInfo("px2vp(128, 3.25)");
      const actual: number = px2vp(128, 3.25);
      logInfo('actual=' + String(actual) + ', expected=' + "39.384615");
      expect(actual).assertEqual(39.384615);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0032
     * @tc.name      Camera_Px2Vp_0032
     * @tc.desc      px2vp(150, 0.5) converts to 300 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0032 begin`);
      logInfo("px2vp(150, 0.5)");
      const actual: number = px2vp(150, 0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "300");
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}Px2Vp_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0033
     * @tc.name      Camera_Px2Vp_0033
     * @tc.desc      px2vp(160, 1) converts to 160 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0033 begin`);
      logInfo("px2vp(160, 1)");
      const actual: number = px2vp(160, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "160");
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}Px2Vp_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0034
     * @tc.name      Camera_Px2Vp_0034
     * @tc.desc      px2vp(180, 1.5) converts to 120 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_Px2Vp_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2Vp_0034 begin`);
      logInfo("px2vp(180, 1.5)");
      const actual: number = px2vp(180, 1.5);
      logInfo('actual=' + String(actual) + ', expected=' + "120");
      expect(actual).assertEqual(120);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0035
     * @tc.name      Camera_Px2Vp_0035
     * @tc.desc      px2vp(192, 2) converts to 96 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_Px2Vp_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Px2Vp_0035 begin`);
      logInfo("px2vp(192, 2)");
      const actual: number = px2vp(192, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "96");
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}Px2Vp_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0036
     * @tc.name      Camera_Px2Vp_0036
     * @tc.desc      px2vp(200, 2.5) converts to 80 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0036 begin`);
      logInfo("px2vp(200, 2.5)");
      const actual: number = px2vp(200, 2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "80");
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}Px2Vp_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0037
     * @tc.name      Camera_Px2Vp_0037
     * @tc.desc      px2vp(240, 3) converts to 80 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0037 begin`);
      logInfo("px2vp(240, 3)");
      const actual: number = px2vp(240, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "80");
      expect(actual).assertEqual(80);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0038
     * @tc.name      Camera_Px2Vp_0038
     * @tc.desc      px2vp(270, 3.5) converts to 77.142857 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0038 begin`);
      logInfo("px2vp(270, 3.5)");
      const actual: number = px2vp(270, 3.5);
      logInfo('actual=' + String(actual) + ', expected=' + "77.142857");
      expect(actual).assertEqual(77.142857);
      logInfo(`${BUNDLE}Px2Vp_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0039
     * @tc.name      Camera_Px2Vp_0039
     * @tc.desc      px2vp(300, 4) converts to 75 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0039 begin`);
      logInfo("px2vp(300, 4)");
      const actual: number = px2vp(300, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "75");
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}Px2Vp_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0040
     * @tc.name      Camera_Px2Vp_0040
     * @tc.desc      px2vp(360, 4.5) converts to 80 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0040 begin`);
      logInfo("px2vp(360, 4.5)");
      const actual: number = px2vp(360, 4.5);
      logInfo('actual=' + String(actual) + ', expected=' + "80");
      expect(actual).assertEqual(80);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0041
     * @tc.name      Camera_Px2Vp_0041
     * @tc.desc      px2vp(480, 5) converts to 96 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0041 begin`);
      logInfo("px2vp(480, 5)");
      const actual: number = px2vp(480, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "96");
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}Px2Vp_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0042
     * @tc.name      Camera_Px2Vp_0042
     * @tc.desc      px2vp(540, 6) converts to 90 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0042 begin`);
      logInfo("px2vp(540, 6)");
      const actual: number = px2vp(540, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}Px2Vp_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0043
     * @tc.name      Camera_Px2Vp_0043
     * @tc.desc      px2vp(720, 1.25) converts to 576 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0043 begin`);
      logInfo("px2vp(720, 1.25)");
      const actual: number = px2vp(720, 1.25);
      logInfo('actual=' + String(actual) + ', expected=' + "576");
      expect(actual).assertEqual(576);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0044
     * @tc.name      Camera_Px2Vp_0044
     * @tc.desc      px2vp(750, 1.75) converts to 428.571429 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0044 begin`);
      logInfo("px2vp(750, 1.75)");
      const actual: number = px2vp(750, 1.75);
      logInfo('actual=' + String(actual) + ', expected=' + "428.571429");
      expect(actual).assertEqual(428.571429);
      logInfo(`${BUNDLE}Px2Vp_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0045
     * @tc.name      Camera_Px2Vp_0045
     * @tc.desc      px2vp(900, 2.25) converts to 400 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_Px2Vp_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2Vp_0045 begin`);
      logInfo("px2vp(900, 2.25)");
      const actual: number = px2vp(900, 2.25);
      logInfo('actual=' + String(actual) + ', expected=' + "400");
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}Px2Vp_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_PX2VP_0046
     * @tc.name      Camera_Px2Vp_0046
     * @tc.desc      px2vp(960, 2.75) converts to 349.090909 vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Px2Vp_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2Vp_0046 begin`);
      logInfo("px2vp(960, 2.75)");
      const actual: number = px2vp(960, 2.75);
      logInfo('actual=' + String(actual) + ', expected=' + "349.090909");
      expect(actual).assertEqual(349.090909);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Px2Vp_0046 end`);
    });
  });
}
