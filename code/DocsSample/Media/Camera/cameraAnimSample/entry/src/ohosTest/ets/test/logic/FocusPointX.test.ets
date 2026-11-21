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
  focusPointX,
} from '../model/CameraLogic';

/** FocusPointXTest logic checks (48 cases). */
export default function focusPointXTest(): void {
  describe('FocusPointXTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0001
     * @tc.name      Camera_FocusPointX_0001
     * @tc.desc      focusPointX(0, 720) normalizes the touch Y to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusPointX_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusPointX_0001 begin`);
      logInfo("focusPointX(0, 720)");
      const actual: number = focusPointX(0, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0002
     * @tc.name      Camera_FocusPointX_0002
     * @tc.desc      focusPointX(1, 1920) normalizes the touch Y to 0.000521.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0002 begin`);
      logInfo("focusPointX(1, 1920)");
      const actual: number = focusPointX(1, 1920);
      logInfo('actual=' + String(actual) + ', expected=' + "0.000521");
      expect(actual).assertEqual(0.000521);
      logInfo(`${BUNDLE}FocusPointX_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0003
     * @tc.name      Camera_FocusPointX_0003
     * @tc.desc      focusPointX(2, 2400) normalizes the touch Y to 0.000833.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0003 begin`);
      logInfo("focusPointX(2, 2400)");
      const actual: number = focusPointX(2, 2400);
      logInfo('actual=' + String(actual) + ', expected=' + "0.000833");
      expect(actual).assertEqual(0.000833);
      logInfo(`${BUNDLE}FocusPointX_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0004
     * @tc.name      Camera_FocusPointX_0004
     * @tc.desc      focusPointX(10, 900) normalizes the touch Y to 0.011111.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0004 begin`);
      logInfo("focusPointX(10, 900)");
      const actual: number = focusPointX(10, 900);
      logInfo('actual=' + String(actual) + ', expected=' + "0.011111");
      expect(actual).assertEqual(0.011111);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0005
     * @tc.name      Camera_FocusPointX_0005
     * @tc.desc      focusPointX(45, 1200) normalizes the touch Y to 0.0375.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0005 begin`);
      logInfo("focusPointX(45, 1200)");
      const actual: number = focusPointX(45, 1200);
      logInfo('actual=' + String(actual) + ', expected=' + "0.0375");
      expect(actual).assertEqual(0.0375);
      logInfo(`${BUNDLE}FocusPointX_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0006
     * @tc.name      Camera_FocusPointX_0006
     * @tc.desc      focusPointX(90, 2000) normalizes the touch Y to 0.045.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0006 begin`);
      logInfo("focusPointX(90, 2000)");
      const actual: number = focusPointX(90, 2000);
      logInfo('actual=' + String(actual) + ', expected=' + "0.045");
      expect(actual).assertEqual(0.045);
      logInfo(`${BUNDLE}FocusPointX_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0007
     * @tc.name      Camera_FocusPointX_0007
     * @tc.desc      focusPointX(100, 480) normalizes the touch Y to 0.208333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0007 begin`);
      logInfo("focusPointX(100, 480)");
      const actual: number = focusPointX(100, 480);
      logInfo('actual=' + String(actual) + ', expected=' + "0.208333");
      expect(actual).assertEqual(0.208333);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0008
     * @tc.name      Camera_FocusPointX_0008
     * @tc.desc      focusPointX(180, 960) normalizes the touch Y to 0.1875.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0008 begin`);
      logInfo("focusPointX(180, 960)");
      const actual: number = focusPointX(180, 960);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1875");
      expect(actual).assertEqual(0.1875);
      logInfo(`${BUNDLE}FocusPointX_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0009
     * @tc.name      Camera_FocusPointX_0009
     * @tc.desc      focusPointX(270, 1080) normalizes the touch Y to 0.25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0009 begin`);
      logInfo("focusPointX(270, 1080)");
      const actual: number = focusPointX(270, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0.25");
      expect(actual).assertEqual(0.25);
      logInfo(`${BUNDLE}FocusPointX_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0010
     * @tc.name      Camera_FocusPointX_0010
     * @tc.desc      focusPointX(360, 360) normalizes the touch Y to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0010 begin`);
      logInfo("focusPointX(360, 360)");
      const actual: number = focusPointX(360, 360);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0011
     * @tc.name      Camera_FocusPointX_0011
     * @tc.desc      focusPointX(540, 2160) normalizes the touch Y to 0.25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0011 begin`);
      logInfo("focusPointX(540, 2160)");
      const actual: number = focusPointX(540, 2160);
      logInfo('actual=' + String(actual) + ', expected=' + "0.25");
      expect(actual).assertEqual(0.25);
      logInfo(`${BUNDLE}FocusPointX_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0012
     * @tc.name      Camera_FocusPointX_0012
     * @tc.desc      focusPointX(720, 1080) normalizes the touch Y to 0.666667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusPointX_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusPointX_0012 begin`);
      logInfo("focusPointX(720, 1080)");
      const actual: number = focusPointX(720, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0.666667");
      expect(actual).assertEqual(0.666667);
      logInfo(`${BUNDLE}FocusPointX_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0013
     * @tc.name      Camera_FocusPointX_0013
     * @tc.desc      focusPointX(900, 540) normalizes the touch Y to 1.666667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0013 begin`);
      logInfo("focusPointX(900, 540)");
      const actual: number = focusPointX(900, 540);
      logInfo('actual=' + String(actual) + ', expected=' + "1.666667");
      expect(actual).assertEqual(1.666667);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0014
     * @tc.name      Camera_FocusPointX_0014
     * @tc.desc      focusPointX(1079, 1800) normalizes the touch Y to 0.599444.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0014 begin`);
      logInfo("focusPointX(1079, 1800)");
      const actual: number = focusPointX(1079, 1800);
      logInfo('actual=' + String(actual) + ', expected=' + "0.599444");
      expect(actual).assertEqual(0.599444);
      logInfo(`${BUNDLE}FocusPointX_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0015
     * @tc.name      Camera_FocusPointX_0015
     * @tc.desc      focusPointX(1080, 3840) normalizes the touch Y to 0.28125.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0015 begin`);
      logInfo("focusPointX(1080, 3840)");
      const actual: number = focusPointX(1080, 3840);
      logInfo('actual=' + String(actual) + ', expected=' + "0.28125");
      expect(actual).assertEqual(0.28125);
      logInfo(`${BUNDLE}FocusPointX_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0016
     * @tc.name      Camera_FocusPointX_0016
     * @tc.desc      focusPointX(1200, 800) normalizes the touch Y to 1.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0016 begin`);
      logInfo("focusPointX(1200, 800)");
      const actual: number = focusPointX(1200, 800);
      logInfo('actual=' + String(actual) + ', expected=' + "1.5");
      expect(actual).assertEqual(1.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0017
     * @tc.name      Camera_FocusPointX_0017
     * @tc.desc      focusPointX(1500, 640) normalizes the touch Y to 2.34375.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0017 begin`);
      logInfo("focusPointX(1500, 640)");
      const actual: number = focusPointX(1500, 640);
      logInfo('actual=' + String(actual) + ', expected=' + "2.34375");
      expect(actual).assertEqual(2.34375);
      logInfo(`${BUNDLE}FocusPointX_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0018
     * @tc.name      Camera_FocusPointX_0018
     * @tc.desc      focusPointX(1920, 480) normalizes the touch Y to 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_FocusPointX_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FocusPointX_0018 begin`);
      logInfo("focusPointX(1920, 480)");
      const actual: number = focusPointX(1920, 480);
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}FocusPointX_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0019
     * @tc.name      Camera_FocusPointX_0019
     * @tc.desc      focusPointX(-1, 1440) normalizes the touch Y to -0.000694.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0019 begin`);
      logInfo("focusPointX(-1, 1440)");
      const actual: number = focusPointX(-1, 1440);
      logInfo('actual=' + String(actual) + ', expected=' + "-0.000694");
      expect(actual).assertEqual(-0.000694);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0020
     * @tc.name      Camera_FocusPointX_0020
     * @tc.desc      focusPointX(-10, 3000) normalizes the touch Y to -0.003333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0020 begin`);
      logInfo("focusPointX(-10, 3000)");
      const actual: number = focusPointX(-10, 3000);
      logInfo('actual=' + String(actual) + ', expected=' + "-0.003333");
      expect(actual).assertEqual(-0.003333);
      logInfo(`${BUNDLE}FocusPointX_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0021
     * @tc.name      Camera_FocusPointX_0021
     * @tc.desc      focusPointX(0.5, 600) normalizes the touch Y to 0.000833.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0021 begin`);
      logInfo("focusPointX(0.5, 600)");
      const actual: number = focusPointX(0.5, 600);
      logInfo('actual=' + String(actual) + ', expected=' + "0.000833");
      expect(actual).assertEqual(0.000833);
      logInfo(`${BUNDLE}FocusPointX_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0022
     * @tc.name      Camera_FocusPointX_0022
     * @tc.desc      focusPointX(1.5, 1500) normalizes the touch Y to 0.001.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0022 begin`);
      logInfo("focusPointX(1.5, 1500)");
      const actual: number = focusPointX(1.5, 1500);
      logInfo('actual=' + String(actual) + ', expected=' + "0.001");
      expect(actual).assertEqual(0.001);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0023
     * @tc.name      Camera_FocusPointX_0023
     * @tc.desc      focusPointX(33.3, 2560) normalizes the touch Y to 0.013008.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusPointX_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusPointX_0023 begin`);
      logInfo("focusPointX(33.3, 2560)");
      const actual: number = focusPointX(33.3, 2560);
      logInfo('actual=' + String(actual) + ', expected=' + "0.013008");
      expect(actual).assertEqual(0.013008);
      logInfo(`${BUNDLE}FocusPointX_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0024
     * @tc.name      Camera_FocusPointX_0024
     * @tc.desc      focusPointX(99.9, 640) normalizes the touch Y to 0.156094.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0024 begin`);
      logInfo("focusPointX(99.9, 640)");
      const actual: number = focusPointX(99.9, 640);
      logInfo('actual=' + String(actual) + ', expected=' + "0.156094");
      expect(actual).assertEqual(0.156094);
      logInfo(`${BUNDLE}FocusPointX_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0025
     * @tc.name      Camera_FocusPointX_0025
     * @tc.desc      focusPointX(640, 1280) normalizes the touch Y to 0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0025 begin`);
      logInfo("focusPointX(640, 1280)");
      const actual: number = focusPointX(640, 1280);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5");
      expect(actual).assertEqual(0.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0026
     * @tc.name      Camera_FocusPointX_0026
     * @tc.desc      focusPointX(800, 720) normalizes the touch Y to 1.111111.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0026 begin`);
      logInfo("focusPointX(800, 720)");
      const actual: number = focusPointX(800, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "1.111111");
      expect(actual).assertEqual(1.111111);
      logInfo(`${BUNDLE}FocusPointX_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0027
     * @tc.name      Camera_FocusPointX_0027
     * @tc.desc      focusPointX(960, 1920) normalizes the touch Y to 0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0027 begin`);
      logInfo("focusPointX(960, 1920)");
      const actual: number = focusPointX(960, 1920);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5");
      expect(actual).assertEqual(0.5);
      logInfo(`${BUNDLE}FocusPointX_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0028
     * @tc.name      Camera_FocusPointX_0028
     * @tc.desc      focusPointX(1280, 2400) normalizes the touch Y to 0.533333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0028 begin`);
      logInfo("focusPointX(1280, 2400)");
      const actual: number = focusPointX(1280, 2400);
      logInfo('actual=' + String(actual) + ', expected=' + "0.533333");
      expect(actual).assertEqual(0.533333);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0029
     * @tc.name      Camera_FocusPointX_0029
     * @tc.desc      focusPointX(3840, 900) normalizes the touch Y to 4.266667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0029 begin`);
      logInfo("focusPointX(3840, 900)");
      const actual: number = focusPointX(3840, 900);
      logInfo('actual=' + String(actual) + ', expected=' + "4.266667");
      expect(actual).assertEqual(4.266667);
      logInfo(`${BUNDLE}FocusPointX_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0030
     * @tc.name      Camera_FocusPointX_0030
     * @tc.desc      focusPointX(2160, 1200) normalizes the touch Y to 1.8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0030 begin`);
      logInfo("focusPointX(2160, 1200)");
      const actual: number = focusPointX(2160, 1200);
      logInfo('actual=' + String(actual) + ', expected=' + "1.8");
      expect(actual).assertEqual(1.8);
      logInfo(`${BUNDLE}FocusPointX_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0031
     * @tc.name      Camera_FocusPointX_0031
     * @tc.desc      focusPointX(240, 2000) normalizes the touch Y to 0.12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0031 begin`);
      logInfo("focusPointX(240, 2000)");
      const actual: number = focusPointX(240, 2000);
      logInfo('actual=' + String(actual) + ', expected=' + "0.12");
      expect(actual).assertEqual(0.12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0032
     * @tc.name      Camera_FocusPointX_0032
     * @tc.desc      focusPointX(480, 480) normalizes the touch Y to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0032 begin`);
      logInfo("focusPointX(480, 480)");
      const actual: number = focusPointX(480, 480);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FocusPointX_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0033
     * @tc.name      Camera_FocusPointX_0033
     * @tc.desc      focusPointX(60, 960) normalizes the touch Y to 0.0625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0033 begin`);
      logInfo("focusPointX(60, 960)");
      const actual: number = focusPointX(60, 960);
      logInfo('actual=' + String(actual) + ', expected=' + "0.0625");
      expect(actual).assertEqual(0.0625);
      logInfo(`${BUNDLE}FocusPointX_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0034
     * @tc.name      Camera_FocusPointX_0034
     * @tc.desc      focusPointX(30, 1080) normalizes the touch Y to 0.027778.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusPointX_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusPointX_0034 begin`);
      logInfo("focusPointX(30, 1080)");
      const actual: number = focusPointX(30, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0.027778");
      expect(actual).assertEqual(0.027778);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0035
     * @tc.name      Camera_FocusPointX_0035
     * @tc.desc      focusPointX(15, 360) normalizes the touch Y to 0.041667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_FocusPointX_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FocusPointX_0035 begin`);
      logInfo("focusPointX(15, 360)");
      const actual: number = focusPointX(15, 360);
      logInfo('actual=' + String(actual) + ', expected=' + "0.041667");
      expect(actual).assertEqual(0.041667);
      logInfo(`${BUNDLE}FocusPointX_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0036
     * @tc.name      Camera_FocusPointX_0036
     * @tc.desc      focusPointX(24, 2160) normalizes the touch Y to 0.011111.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0036 begin`);
      logInfo("focusPointX(24, 2160)");
      const actual: number = focusPointX(24, 2160);
      logInfo('actual=' + String(actual) + ', expected=' + "0.011111");
      expect(actual).assertEqual(0.011111);
      logInfo(`${BUNDLE}FocusPointX_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0037
     * @tc.name      Camera_FocusPointX_0037
     * @tc.desc      focusPointX(25, 1080) normalizes the touch Y to 0.023148.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0037 begin`);
      logInfo("focusPointX(25, 1080)");
      const actual: number = focusPointX(25, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0.023148");
      expect(actual).assertEqual(0.023148);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0038
     * @tc.name      Camera_FocusPointX_0038
     * @tc.desc      focusPointX(28, 540) normalizes the touch Y to 0.051852.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0038 begin`);
      logInfo("focusPointX(28, 540)");
      const actual: number = focusPointX(28, 540);
      logInfo('actual=' + String(actual) + ', expected=' + "0.051852");
      expect(actual).assertEqual(0.051852);
      logInfo(`${BUNDLE}FocusPointX_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0039
     * @tc.name      Camera_FocusPointX_0039
     * @tc.desc      focusPointX(40, 1800) normalizes the touch Y to 0.022222.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0039 begin`);
      logInfo("focusPointX(40, 1800)");
      const actual: number = focusPointX(40, 1800);
      logInfo('actual=' + String(actual) + ', expected=' + "0.022222");
      expect(actual).assertEqual(0.022222);
      logInfo(`${BUNDLE}FocusPointX_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0040
     * @tc.name      Camera_FocusPointX_0040
     * @tc.desc      focusPointX(50, 3840) normalizes the touch Y to 0.013021.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0040 begin`);
      logInfo("focusPointX(50, 3840)");
      const actual: number = focusPointX(50, 3840);
      logInfo('actual=' + String(actual) + ', expected=' + "0.013021");
      expect(actual).assertEqual(0.013021);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0041
     * @tc.name      Camera_FocusPointX_0041
     * @tc.desc      focusPointX(75, 800) normalizes the touch Y to 0.09375.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0041 begin`);
      logInfo("focusPointX(75, 800)");
      const actual: number = focusPointX(75, 800);
      logInfo('actual=' + String(actual) + ', expected=' + "0.09375");
      expect(actual).assertEqual(0.09375);
      logInfo(`${BUNDLE}FocusPointX_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0042
     * @tc.name      Camera_FocusPointX_0042
     * @tc.desc      focusPointX(1000, 640) normalizes the touch Y to 1.5625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0042 begin`);
      logInfo("focusPointX(1000, 640)");
      const actual: number = focusPointX(1000, 640);
      logInfo('actual=' + String(actual) + ', expected=' + "1.5625");
      expect(actual).assertEqual(1.5625);
      logInfo(`${BUNDLE}FocusPointX_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0043
     * @tc.name      Camera_FocusPointX_0043
     * @tc.desc      focusPointX(3500, 480) normalizes the touch Y to 7.291667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0043 begin`);
      logInfo("focusPointX(3500, 480)");
      const actual: number = focusPointX(3500, 480);
      logInfo('actual=' + String(actual) + ', expected=' + "7.291667");
      expect(actual).assertEqual(7.291667);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0044
     * @tc.name      Camera_FocusPointX_0044
     * @tc.desc      focusPointX(60000, 1440) normalizes the touch Y to 41.666667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0044 begin`);
      logInfo("focusPointX(60000, 1440)");
      const actual: number = focusPointX(60000, 1440);
      logInfo('actual=' + String(actual) + ', expected=' + "41.666667");
      expect(actual).assertEqual(41.666667);
      logInfo(`${BUNDLE}FocusPointX_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0045
     * @tc.name      Camera_FocusPointX_0045
     * @tc.desc      focusPointX(12345, 3000) normalizes the touch Y to 4.115.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusPointX_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusPointX_0045 begin`);
      logInfo("focusPointX(12345, 3000)");
      const actual: number = focusPointX(12345, 3000);
      logInfo('actual=' + String(actual) + ', expected=' + "4.115");
      expect(actual).assertEqual(4.115);
      logInfo(`${BUNDLE}FocusPointX_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0046
     * @tc.name      Camera_FocusPointX_0046
     * @tc.desc      focusPointX(99999, 600) normalizes the touch Y to 166.665.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0046 begin`);
      logInfo("focusPointX(99999, 600)");
      const actual: number = focusPointX(99999, 600);
      logInfo('actual=' + String(actual) + ', expected=' + "166.665");
      expect(actual).assertEqual(166.665);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointX_0046 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0047
     * @tc.name      Camera_FocusPointX_0047
     * @tc.desc      focusPointX(0.113, 1080.017) normalizes the touch Y to 0.000105.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0047 begin`);
      logInfo("focusPointX(0.113, 1080.017)");
      const actual: number = focusPointX(0.113, 1080.017);
      logInfo('actual=' + String(actual) + ', expected=' + "0.000105");
      expect(actual).assertEqual(0.000105);
      logInfo(`${BUNDLE}FocusPointX_0047 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_X_0048
     * @tc.name      Camera_FocusPointX_0048
     * @tc.desc      focusPointX(1.113, 2400.017) normalizes the touch Y to 0.000464.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointX_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointX_0048 begin`);
      logInfo("focusPointX(1.113, 2400.017)");
      const actual: number = focusPointX(1.113, 2400.017);
      logInfo('actual=' + String(actual) + ', expected=' + "0.000464");
      expect(actual).assertEqual(0.000464);
      logInfo(`${BUNDLE}FocusPointX_0048 end`);
    });
  });
}
