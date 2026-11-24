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
  focusPointY,
} from '../model/CameraLogic';

/** FocusPointYTest logic checks (48 cases). */
export default function focusPointYTest(): void {
  describe('FocusPointYTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0001
     * @tc.name      Camera_FocusPointY_0001
     * @tc.desc      focusPointY(0, 720) mirrors the touch X to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusPointY_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusPointY_0001 begin`);
      logInfo("focusPointY(0, 720)");
      const actual: number = focusPointY(0, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0002
     * @tc.name      Camera_FocusPointY_0002
     * @tc.desc      focusPointY(1, 1920) mirrors the touch X to 0.999479.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0002 begin`);
      logInfo("focusPointY(1, 1920)");
      const actual: number = focusPointY(1, 1920);
      logInfo('actual=' + String(actual) + ', expected=' + "0.999479");
      expect(actual).assertEqual(0.999479);
      logInfo(`${BUNDLE}FocusPointY_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0003
     * @tc.name      Camera_FocusPointY_0003
     * @tc.desc      focusPointY(2, 2400) mirrors the touch X to 0.999167.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0003 begin`);
      logInfo("focusPointY(2, 2400)");
      const actual: number = focusPointY(2, 2400);
      logInfo('actual=' + String(actual) + ', expected=' + "0.999167");
      expect(actual).assertEqual(0.999167);
      logInfo(`${BUNDLE}FocusPointY_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0004
     * @tc.name      Camera_FocusPointY_0004
     * @tc.desc      focusPointY(10, 900) mirrors the touch X to 0.988889.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0004 begin`);
      logInfo("focusPointY(10, 900)");
      const actual: number = focusPointY(10, 900);
      logInfo('actual=' + String(actual) + ', expected=' + "0.988889");
      expect(actual).assertEqual(0.988889);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0005
     * @tc.name      Camera_FocusPointY_0005
     * @tc.desc      focusPointY(45, 1200) mirrors the touch X to 0.9625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0005 begin`);
      logInfo("focusPointY(45, 1200)");
      const actual: number = focusPointY(45, 1200);
      logInfo('actual=' + String(actual) + ', expected=' + "0.9625");
      expect(actual).assertEqual(0.9625);
      logInfo(`${BUNDLE}FocusPointY_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0006
     * @tc.name      Camera_FocusPointY_0006
     * @tc.desc      focusPointY(90, 2000) mirrors the touch X to 0.955.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0006 begin`);
      logInfo("focusPointY(90, 2000)");
      const actual: number = focusPointY(90, 2000);
      logInfo('actual=' + String(actual) + ', expected=' + "0.955");
      expect(actual).assertEqual(0.955);
      logInfo(`${BUNDLE}FocusPointY_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0007
     * @tc.name      Camera_FocusPointY_0007
     * @tc.desc      focusPointY(100, 480) mirrors the touch X to 0.791667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0007 begin`);
      logInfo("focusPointY(100, 480)");
      const actual: number = focusPointY(100, 480);
      logInfo('actual=' + String(actual) + ', expected=' + "0.791667");
      expect(actual).assertEqual(0.791667);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0008
     * @tc.name      Camera_FocusPointY_0008
     * @tc.desc      focusPointY(180, 960) mirrors the touch X to 0.8125.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0008 begin`);
      logInfo("focusPointY(180, 960)");
      const actual: number = focusPointY(180, 960);
      logInfo('actual=' + String(actual) + ', expected=' + "0.8125");
      expect(actual).assertEqual(0.8125);
      logInfo(`${BUNDLE}FocusPointY_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0009
     * @tc.name      Camera_FocusPointY_0009
     * @tc.desc      focusPointY(270, 1080) mirrors the touch X to 0.75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0009 begin`);
      logInfo("focusPointY(270, 1080)");
      const actual: number = focusPointY(270, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0.75");
      expect(actual).assertEqual(0.75);
      logInfo(`${BUNDLE}FocusPointY_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0010
     * @tc.name      Camera_FocusPointY_0010
     * @tc.desc      focusPointY(360, 360) mirrors the touch X to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0010 begin`);
      logInfo("focusPointY(360, 360)");
      const actual: number = focusPointY(360, 360);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0011
     * @tc.name      Camera_FocusPointY_0011
     * @tc.desc      focusPointY(540, 2160) mirrors the touch X to 0.75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0011 begin`);
      logInfo("focusPointY(540, 2160)");
      const actual: number = focusPointY(540, 2160);
      logInfo('actual=' + String(actual) + ', expected=' + "0.75");
      expect(actual).assertEqual(0.75);
      logInfo(`${BUNDLE}FocusPointY_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0012
     * @tc.name      Camera_FocusPointY_0012
     * @tc.desc      focusPointY(720, 1080) mirrors the touch X to 0.333333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusPointY_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusPointY_0012 begin`);
      logInfo("focusPointY(720, 1080)");
      const actual: number = focusPointY(720, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0.333333");
      expect(actual).assertEqual(0.333333);
      logInfo(`${BUNDLE}FocusPointY_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0013
     * @tc.name      Camera_FocusPointY_0013
     * @tc.desc      focusPointY(900, 540) mirrors the touch X to -0.666667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0013 begin`);
      logInfo("focusPointY(900, 540)");
      const actual: number = focusPointY(900, 540);
      logInfo('actual=' + String(actual) + ', expected=' + "-0.666667");
      expect(actual).assertEqual(-0.666667);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0014
     * @tc.name      Camera_FocusPointY_0014
     * @tc.desc      focusPointY(1079, 1800) mirrors the touch X to 0.400556.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0014 begin`);
      logInfo("focusPointY(1079, 1800)");
      const actual: number = focusPointY(1079, 1800);
      logInfo('actual=' + String(actual) + ', expected=' + "0.400556");
      expect(actual).assertEqual(0.400556);
      logInfo(`${BUNDLE}FocusPointY_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0015
     * @tc.name      Camera_FocusPointY_0015
     * @tc.desc      focusPointY(1080, 3840) mirrors the touch X to 0.71875.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0015 begin`);
      logInfo("focusPointY(1080, 3840)");
      const actual: number = focusPointY(1080, 3840);
      logInfo('actual=' + String(actual) + ', expected=' + "0.71875");
      expect(actual).assertEqual(0.71875);
      logInfo(`${BUNDLE}FocusPointY_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0016
     * @tc.name      Camera_FocusPointY_0016
     * @tc.desc      focusPointY(1200, 800) mirrors the touch X to -0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0016 begin`);
      logInfo("focusPointY(1200, 800)");
      const actual: number = focusPointY(1200, 800);
      logInfo('actual=' + String(actual) + ', expected=' + "-0.5");
      expect(actual).assertEqual(-0.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0017
     * @tc.name      Camera_FocusPointY_0017
     * @tc.desc      focusPointY(1500, 640) mirrors the touch X to -1.34375.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0017 begin`);
      logInfo("focusPointY(1500, 640)");
      const actual: number = focusPointY(1500, 640);
      logInfo('actual=' + String(actual) + ', expected=' + "-1.34375");
      expect(actual).assertEqual(-1.34375);
      logInfo(`${BUNDLE}FocusPointY_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0018
     * @tc.name      Camera_FocusPointY_0018
     * @tc.desc      focusPointY(1920, 480) mirrors the touch X to -3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_FocusPointY_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FocusPointY_0018 begin`);
      logInfo("focusPointY(1920, 480)");
      const actual: number = focusPointY(1920, 480);
      logInfo('actual=' + String(actual) + ', expected=' + "-3");
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}FocusPointY_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0019
     * @tc.name      Camera_FocusPointY_0019
     * @tc.desc      focusPointY(-1, 1440) mirrors the touch X to 1.000694.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0019 begin`);
      logInfo("focusPointY(-1, 1440)");
      const actual: number = focusPointY(-1, 1440);
      logInfo('actual=' + String(actual) + ', expected=' + "1.000694");
      expect(actual).assertEqual(1.000694);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0020
     * @tc.name      Camera_FocusPointY_0020
     * @tc.desc      focusPointY(-10, 3000) mirrors the touch X to 1.003333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0020 begin`);
      logInfo("focusPointY(-10, 3000)");
      const actual: number = focusPointY(-10, 3000);
      logInfo('actual=' + String(actual) + ', expected=' + "1.003333");
      expect(actual).assertEqual(1.003333);
      logInfo(`${BUNDLE}FocusPointY_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0021
     * @tc.name      Camera_FocusPointY_0021
     * @tc.desc      focusPointY(0.5, 600) mirrors the touch X to 0.999167.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0021 begin`);
      logInfo("focusPointY(0.5, 600)");
      const actual: number = focusPointY(0.5, 600);
      logInfo('actual=' + String(actual) + ', expected=' + "0.999167");
      expect(actual).assertEqual(0.999167);
      logInfo(`${BUNDLE}FocusPointY_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0022
     * @tc.name      Camera_FocusPointY_0022
     * @tc.desc      focusPointY(1.5, 1500) mirrors the touch X to 0.999.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0022 begin`);
      logInfo("focusPointY(1.5, 1500)");
      const actual: number = focusPointY(1.5, 1500);
      logInfo('actual=' + String(actual) + ', expected=' + "0.999");
      expect(actual).assertEqual(0.999);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0023
     * @tc.name      Camera_FocusPointY_0023
     * @tc.desc      focusPointY(33.3, 2560) mirrors the touch X to 0.986992.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusPointY_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusPointY_0023 begin`);
      logInfo("focusPointY(33.3, 2560)");
      const actual: number = focusPointY(33.3, 2560);
      logInfo('actual=' + String(actual) + ', expected=' + "0.986992");
      expect(actual).assertEqual(0.986992);
      logInfo(`${BUNDLE}FocusPointY_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0024
     * @tc.name      Camera_FocusPointY_0024
     * @tc.desc      focusPointY(99.9, 640) mirrors the touch X to 0.843906.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0024 begin`);
      logInfo("focusPointY(99.9, 640)");
      const actual: number = focusPointY(99.9, 640);
      logInfo('actual=' + String(actual) + ', expected=' + "0.843906");
      expect(actual).assertEqual(0.843906);
      logInfo(`${BUNDLE}FocusPointY_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0025
     * @tc.name      Camera_FocusPointY_0025
     * @tc.desc      focusPointY(640, 1280) mirrors the touch X to 0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0025 begin`);
      logInfo("focusPointY(640, 1280)");
      const actual: number = focusPointY(640, 1280);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5");
      expect(actual).assertEqual(0.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0026
     * @tc.name      Camera_FocusPointY_0026
     * @tc.desc      focusPointY(800, 720) mirrors the touch X to -0.111111.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0026 begin`);
      logInfo("focusPointY(800, 720)");
      const actual: number = focusPointY(800, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "-0.111111");
      expect(actual).assertEqual(-0.111111);
      logInfo(`${BUNDLE}FocusPointY_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0027
     * @tc.name      Camera_FocusPointY_0027
     * @tc.desc      focusPointY(960, 1920) mirrors the touch X to 0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0027 begin`);
      logInfo("focusPointY(960, 1920)");
      const actual: number = focusPointY(960, 1920);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5");
      expect(actual).assertEqual(0.5);
      logInfo(`${BUNDLE}FocusPointY_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0028
     * @tc.name      Camera_FocusPointY_0028
     * @tc.desc      focusPointY(1280, 2400) mirrors the touch X to 0.466667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0028 begin`);
      logInfo("focusPointY(1280, 2400)");
      const actual: number = focusPointY(1280, 2400);
      logInfo('actual=' + String(actual) + ', expected=' + "0.466667");
      expect(actual).assertEqual(0.466667);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0029
     * @tc.name      Camera_FocusPointY_0029
     * @tc.desc      focusPointY(3840, 900) mirrors the touch X to -3.266667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0029 begin`);
      logInfo("focusPointY(3840, 900)");
      const actual: number = focusPointY(3840, 900);
      logInfo('actual=' + String(actual) + ', expected=' + "-3.266667");
      expect(actual).assertEqual(-3.266667);
      logInfo(`${BUNDLE}FocusPointY_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0030
     * @tc.name      Camera_FocusPointY_0030
     * @tc.desc      focusPointY(2160, 1200) mirrors the touch X to -0.8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0030 begin`);
      logInfo("focusPointY(2160, 1200)");
      const actual: number = focusPointY(2160, 1200);
      logInfo('actual=' + String(actual) + ', expected=' + "-0.8");
      expect(actual).assertEqual(-0.8);
      logInfo(`${BUNDLE}FocusPointY_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0031
     * @tc.name      Camera_FocusPointY_0031
     * @tc.desc      focusPointY(240, 2000) mirrors the touch X to 0.88.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0031 begin`);
      logInfo("focusPointY(240, 2000)");
      const actual: number = focusPointY(240, 2000);
      logInfo('actual=' + String(actual) + ', expected=' + "0.88");
      expect(actual).assertEqual(0.88);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0032
     * @tc.name      Camera_FocusPointY_0032
     * @tc.desc      focusPointY(480, 480) mirrors the touch X to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0032 begin`);
      logInfo("focusPointY(480, 480)");
      const actual: number = focusPointY(480, 480);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FocusPointY_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0033
     * @tc.name      Camera_FocusPointY_0033
     * @tc.desc      focusPointY(60, 960) mirrors the touch X to 0.9375.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0033 begin`);
      logInfo("focusPointY(60, 960)");
      const actual: number = focusPointY(60, 960);
      logInfo('actual=' + String(actual) + ', expected=' + "0.9375");
      expect(actual).assertEqual(0.9375);
      logInfo(`${BUNDLE}FocusPointY_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0034
     * @tc.name      Camera_FocusPointY_0034
     * @tc.desc      focusPointY(30, 1080) mirrors the touch X to 0.972222.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusPointY_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusPointY_0034 begin`);
      logInfo("focusPointY(30, 1080)");
      const actual: number = focusPointY(30, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0.972222");
      expect(actual).assertEqual(0.972222);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0035
     * @tc.name      Camera_FocusPointY_0035
     * @tc.desc      focusPointY(15, 360) mirrors the touch X to 0.958333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_FocusPointY_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FocusPointY_0035 begin`);
      logInfo("focusPointY(15, 360)");
      const actual: number = focusPointY(15, 360);
      logInfo('actual=' + String(actual) + ', expected=' + "0.958333");
      expect(actual).assertEqual(0.958333);
      logInfo(`${BUNDLE}FocusPointY_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0036
     * @tc.name      Camera_FocusPointY_0036
     * @tc.desc      focusPointY(24, 2160) mirrors the touch X to 0.988889.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0036 begin`);
      logInfo("focusPointY(24, 2160)");
      const actual: number = focusPointY(24, 2160);
      logInfo('actual=' + String(actual) + ', expected=' + "0.988889");
      expect(actual).assertEqual(0.988889);
      logInfo(`${BUNDLE}FocusPointY_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0037
     * @tc.name      Camera_FocusPointY_0037
     * @tc.desc      focusPointY(25, 1080) mirrors the touch X to 0.976852.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0037 begin`);
      logInfo("focusPointY(25, 1080)");
      const actual: number = focusPointY(25, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0.976852");
      expect(actual).assertEqual(0.976852);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0038
     * @tc.name      Camera_FocusPointY_0038
     * @tc.desc      focusPointY(28, 540) mirrors the touch X to 0.948148.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0038 begin`);
      logInfo("focusPointY(28, 540)");
      const actual: number = focusPointY(28, 540);
      logInfo('actual=' + String(actual) + ', expected=' + "0.948148");
      expect(actual).assertEqual(0.948148);
      logInfo(`${BUNDLE}FocusPointY_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0039
     * @tc.name      Camera_FocusPointY_0039
     * @tc.desc      focusPointY(40, 1800) mirrors the touch X to 0.977778.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0039 begin`);
      logInfo("focusPointY(40, 1800)");
      const actual: number = focusPointY(40, 1800);
      logInfo('actual=' + String(actual) + ', expected=' + "0.977778");
      expect(actual).assertEqual(0.977778);
      logInfo(`${BUNDLE}FocusPointY_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0040
     * @tc.name      Camera_FocusPointY_0040
     * @tc.desc      focusPointY(50, 3840) mirrors the touch X to 0.986979.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0040 begin`);
      logInfo("focusPointY(50, 3840)");
      const actual: number = focusPointY(50, 3840);
      logInfo('actual=' + String(actual) + ', expected=' + "0.986979");
      expect(actual).assertEqual(0.986979);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0041
     * @tc.name      Camera_FocusPointY_0041
     * @tc.desc      focusPointY(75, 800) mirrors the touch X to 0.90625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0041 begin`);
      logInfo("focusPointY(75, 800)");
      const actual: number = focusPointY(75, 800);
      logInfo('actual=' + String(actual) + ', expected=' + "0.90625");
      expect(actual).assertEqual(0.90625);
      logInfo(`${BUNDLE}FocusPointY_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0042
     * @tc.name      Camera_FocusPointY_0042
     * @tc.desc      focusPointY(1000, 640) mirrors the touch X to -0.5625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0042 begin`);
      logInfo("focusPointY(1000, 640)");
      const actual: number = focusPointY(1000, 640);
      logInfo('actual=' + String(actual) + ', expected=' + "-0.5625");
      expect(actual).assertEqual(-0.5625);
      logInfo(`${BUNDLE}FocusPointY_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0043
     * @tc.name      Camera_FocusPointY_0043
     * @tc.desc      focusPointY(3500, 480) mirrors the touch X to -6.291667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0043 begin`);
      logInfo("focusPointY(3500, 480)");
      const actual: number = focusPointY(3500, 480);
      logInfo('actual=' + String(actual) + ', expected=' + "-6.291667");
      expect(actual).assertEqual(-6.291667);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0044
     * @tc.name      Camera_FocusPointY_0044
     * @tc.desc      focusPointY(60000, 1440) mirrors the touch X to -40.666667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0044 begin`);
      logInfo("focusPointY(60000, 1440)");
      const actual: number = focusPointY(60000, 1440);
      logInfo('actual=' + String(actual) + ', expected=' + "-40.666667");
      expect(actual).assertEqual(-40.666667);
      logInfo(`${BUNDLE}FocusPointY_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0045
     * @tc.name      Camera_FocusPointY_0045
     * @tc.desc      focusPointY(12345, 3000) mirrors the touch X to -3.115.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusPointY_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusPointY_0045 begin`);
      logInfo("focusPointY(12345, 3000)");
      const actual: number = focusPointY(12345, 3000);
      logInfo('actual=' + String(actual) + ', expected=' + "-3.115");
      expect(actual).assertEqual(-3.115);
      logInfo(`${BUNDLE}FocusPointY_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0046
     * @tc.name      Camera_FocusPointY_0046
     * @tc.desc      focusPointY(99999, 600) mirrors the touch X to -165.665.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0046 begin`);
      logInfo("focusPointY(99999, 600)");
      const actual: number = focusPointY(99999, 600);
      logInfo('actual=' + String(actual) + ', expected=' + "-165.665");
      expect(actual).assertEqual(-165.665);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0046 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0047
     * @tc.name      Camera_FocusPointY_0047
     * @tc.desc      focusPointY(0.113, 1080.017) mirrors the touch X to 0.999895.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0047 begin`);
      logInfo("focusPointY(0.113, 1080.017)");
      const actual: number = focusPointY(0.113, 1080.017);
      logInfo('actual=' + String(actual) + ', expected=' + "0.999895");
      expect(actual).assertEqual(0.999895);
      logInfo(`${BUNDLE}FocusPointY_0047 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0048
     * @tc.name      Camera_FocusPointY_0048
     * @tc.desc      focusPointY(1.113, 2400.017) mirrors the touch X to 0.999536.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0048 begin`);
      logInfo("focusPointY(1.113, 2400.017)");
      const actual: number = focusPointY(1.113, 2400.017);
      logInfo('actual=' + String(actual) + ', expected=' + "0.999536");
      expect(actual).assertEqual(0.999536);
      logInfo(`${BUNDLE}FocusPointY_0048 end`);
    });
  });
}
