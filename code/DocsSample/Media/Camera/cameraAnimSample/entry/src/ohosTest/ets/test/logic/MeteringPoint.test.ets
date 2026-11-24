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
  meteringX,
  meteringY,
} from '../model/CameraLogic';

/** MeteringPointTest logic checks (46 cases). */
export default function meteringPointTest(): void {
  describe('MeteringPointTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0001
     * @tc.name      Camera_MeteringPoint_0001
     * @tc.desc      metering point for (0, 720) -> 0,1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_MeteringPoint_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MeteringPoint_0001 begin`);
      logInfo("meteringX(0, 720) + ',' + meteringY(0, 720)");
      const actual: string = meteringX(0, 720) + ',' + meteringY(0, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "0,1");
      expect(actual).assertEqual("0,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0002
     * @tc.name      Camera_MeteringPoint_0002
     * @tc.desc      metering point for (1, 1920) -> 0.000521,0.999479.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0002 begin`);
      logInfo("meteringX(1, 1920) + ',' + meteringY(1, 1920)");
      const actual: string = meteringX(1, 1920) + ',' + meteringY(1, 1920);
      logInfo('actual=' + String(actual) + ', expected=' + "0.000521,0.999479");
      expect(actual).assertEqual("0.000521,0.999479");
      logInfo(`${BUNDLE}MeteringPoint_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0003
     * @tc.name      Camera_MeteringPoint_0003
     * @tc.desc      metering point for (2, 2400) -> 0.000833,0.999167.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0003 begin`);
      logInfo("meteringX(2, 2400) + ',' + meteringY(2, 2400)");
      const actual: string = meteringX(2, 2400) + ',' + meteringY(2, 2400);
      logInfo('actual=' + String(actual) + ', expected=' + "0.000833,0.999167");
      expect(actual).assertEqual("0.000833,0.999167");
      logInfo(`${BUNDLE}MeteringPoint_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0004
     * @tc.name      Camera_MeteringPoint_0004
     * @tc.desc      metering point for (10, 900) -> 0.011111,0.988889.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0004 begin`);
      logInfo("meteringX(10, 900) + ',' + meteringY(10, 900)");
      const actual: string = meteringX(10, 900) + ',' + meteringY(10, 900);
      logInfo('actual=' + String(actual) + ', expected=' + "0.011111,0.988889");
      expect(actual).assertEqual("0.011111,0.988889");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0005
     * @tc.name      Camera_MeteringPoint_0005
     * @tc.desc      metering point for (45, 1200) -> 0.0375,0.9625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0005 begin`);
      logInfo("meteringX(45, 1200) + ',' + meteringY(45, 1200)");
      const actual: string = meteringX(45, 1200) + ',' + meteringY(45, 1200);
      logInfo('actual=' + String(actual) + ', expected=' + "0.0375,0.9625");
      expect(actual).assertEqual("0.0375,0.9625");
      logInfo(`${BUNDLE}MeteringPoint_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0006
     * @tc.name      Camera_MeteringPoint_0006
     * @tc.desc      metering point for (90, 2000) -> 0.045,0.955.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0006 begin`);
      logInfo("meteringX(90, 2000) + ',' + meteringY(90, 2000)");
      const actual: string = meteringX(90, 2000) + ',' + meteringY(90, 2000);
      logInfo('actual=' + String(actual) + ', expected=' + "0.045,0.955");
      expect(actual).assertEqual("0.045,0.955");
      logInfo(`${BUNDLE}MeteringPoint_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0007
     * @tc.name      Camera_MeteringPoint_0007
     * @tc.desc      metering point for (100, 480) -> 0.208333,0.791667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0007 begin`);
      logInfo("meteringX(100, 480) + ',' + meteringY(100, 480)");
      const actual: string = meteringX(100, 480) + ',' + meteringY(100, 480);
      logInfo('actual=' + String(actual) + ', expected=' + "0.208333,0.791667");
      expect(actual).assertEqual("0.208333,0.791667");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0008
     * @tc.name      Camera_MeteringPoint_0008
     * @tc.desc      metering point for (180, 960) -> 0.1875,0.8125.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0008 begin`);
      logInfo("meteringX(180, 960) + ',' + meteringY(180, 960)");
      const actual: string = meteringX(180, 960) + ',' + meteringY(180, 960);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1875,0.8125");
      expect(actual).assertEqual("0.1875,0.8125");
      logInfo(`${BUNDLE}MeteringPoint_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0009
     * @tc.name      Camera_MeteringPoint_0009
     * @tc.desc      metering point for (270, 1080) -> 0.25,0.75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0009 begin`);
      logInfo("meteringX(270, 1080) + ',' + meteringY(270, 1080)");
      const actual: string = meteringX(270, 1080) + ',' + meteringY(270, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0.25,0.75");
      expect(actual).assertEqual("0.25,0.75");
      logInfo(`${BUNDLE}MeteringPoint_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0010
     * @tc.name      Camera_MeteringPoint_0010
     * @tc.desc      metering point for (360, 360) -> 1,0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0010 begin`);
      logInfo("meteringX(360, 360) + ',' + meteringY(360, 360)");
      const actual: string = meteringX(360, 360) + ',' + meteringY(360, 360);
      logInfo('actual=' + String(actual) + ', expected=' + "1,0");
      expect(actual).assertEqual("1,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0011
     * @tc.name      Camera_MeteringPoint_0011
     * @tc.desc      metering point for (540, 2160) -> 0.25,0.75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0011 begin`);
      logInfo("meteringX(540, 2160) + ',' + meteringY(540, 2160)");
      const actual: string = meteringX(540, 2160) + ',' + meteringY(540, 2160);
      logInfo('actual=' + String(actual) + ', expected=' + "0.25,0.75");
      expect(actual).assertEqual("0.25,0.75");
      logInfo(`${BUNDLE}MeteringPoint_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0012
     * @tc.name      Camera_MeteringPoint_0012
     * @tc.desc      metering point for (720, 1080) -> 0.666667,0.333333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_MeteringPoint_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MeteringPoint_0012 begin`);
      logInfo("meteringX(720, 1080) + ',' + meteringY(720, 1080)");
      const actual: string = meteringX(720, 1080) + ',' + meteringY(720, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0.666667,0.333333");
      expect(actual).assertEqual("0.666667,0.333333");
      logInfo(`${BUNDLE}MeteringPoint_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0013
     * @tc.name      Camera_MeteringPoint_0013
     * @tc.desc      metering point for (900, 540) -> 1.666667,-0.666667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0013 begin`);
      logInfo("meteringX(900, 540) + ',' + meteringY(900, 540)");
      const actual: string = meteringX(900, 540) + ',' + meteringY(900, 540);
      logInfo('actual=' + String(actual) + ', expected=' + "1.666667,-0.666667");
      expect(actual).assertEqual("1.666667,-0.666667");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0014
     * @tc.name      Camera_MeteringPoint_0014
     * @tc.desc      metering point for (1079, 1800) -> 0.599444,0.400556.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0014 begin`);
      logInfo("meteringX(1079, 1800) + ',' + meteringY(1079, 1800)");
      const actual: string = meteringX(1079, 1800) + ',' + meteringY(1079, 1800);
      logInfo('actual=' + String(actual) + ', expected=' + "0.599444,0.400556");
      expect(actual).assertEqual("0.599444,0.400556");
      logInfo(`${BUNDLE}MeteringPoint_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0015
     * @tc.name      Camera_MeteringPoint_0015
     * @tc.desc      metering point for (1080, 3840) -> 0.28125,0.71875.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0015 begin`);
      logInfo("meteringX(1080, 3840) + ',' + meteringY(1080, 3840)");
      const actual: string = meteringX(1080, 3840) + ',' + meteringY(1080, 3840);
      logInfo('actual=' + String(actual) + ', expected=' + "0.28125,0.71875");
      expect(actual).assertEqual("0.28125,0.71875");
      logInfo(`${BUNDLE}MeteringPoint_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0016
     * @tc.name      Camera_MeteringPoint_0016
     * @tc.desc      metering point for (1200, 800) -> 1.5,-0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0016 begin`);
      logInfo("meteringX(1200, 800) + ',' + meteringY(1200, 800)");
      const actual: string = meteringX(1200, 800) + ',' + meteringY(1200, 800);
      logInfo('actual=' + String(actual) + ', expected=' + "1.5,-0.5");
      expect(actual).assertEqual("1.5,-0.5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0017
     * @tc.name      Camera_MeteringPoint_0017
     * @tc.desc      metering point for (1500, 640) -> 2.34375,-1.34375.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0017 begin`);
      logInfo("meteringX(1500, 640) + ',' + meteringY(1500, 640)");
      const actual: string = meteringX(1500, 640) + ',' + meteringY(1500, 640);
      logInfo('actual=' + String(actual) + ', expected=' + "2.34375,-1.34375");
      expect(actual).assertEqual("2.34375,-1.34375");
      logInfo(`${BUNDLE}MeteringPoint_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0018
     * @tc.name      Camera_MeteringPoint_0018
     * @tc.desc      metering point for (1920, 480) -> 4,-3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_MeteringPoint_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MeteringPoint_0018 begin`);
      logInfo("meteringX(1920, 480) + ',' + meteringY(1920, 480)");
      const actual: string = meteringX(1920, 480) + ',' + meteringY(1920, 480);
      logInfo('actual=' + String(actual) + ', expected=' + "4,-3");
      expect(actual).assertEqual("4,-3");
      logInfo(`${BUNDLE}MeteringPoint_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0019
     * @tc.name      Camera_MeteringPoint_0019
     * @tc.desc      metering point for (-1, 1440) -> -0.000694,1.000694.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0019 begin`);
      logInfo("meteringX(-1, 1440) + ',' + meteringY(-1, 1440)");
      const actual: string = meteringX(-1, 1440) + ',' + meteringY(-1, 1440);
      logInfo('actual=' + String(actual) + ', expected=' + "-0.000694,1.000694");
      expect(actual).assertEqual("-0.000694,1.000694");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0020
     * @tc.name      Camera_MeteringPoint_0020
     * @tc.desc      metering point for (-10, 3000) -> -0.003333,1.003333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0020 begin`);
      logInfo("meteringX(-10, 3000) + ',' + meteringY(-10, 3000)");
      const actual: string = meteringX(-10, 3000) + ',' + meteringY(-10, 3000);
      logInfo('actual=' + String(actual) + ', expected=' + "-0.003333,1.003333");
      expect(actual).assertEqual("-0.003333,1.003333");
      logInfo(`${BUNDLE}MeteringPoint_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0021
     * @tc.name      Camera_MeteringPoint_0021
     * @tc.desc      metering point for (0.5, 600) -> 0.000833,0.999167.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0021 begin`);
      logInfo("meteringX(0.5, 600) + ',' + meteringY(0.5, 600)");
      const actual: string = meteringX(0.5, 600) + ',' + meteringY(0.5, 600);
      logInfo('actual=' + String(actual) + ', expected=' + "0.000833,0.999167");
      expect(actual).assertEqual("0.000833,0.999167");
      logInfo(`${BUNDLE}MeteringPoint_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0022
     * @tc.name      Camera_MeteringPoint_0022
     * @tc.desc      metering point for (1.5, 1500) -> 0.001,0.999.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0022 begin`);
      logInfo("meteringX(1.5, 1500) + ',' + meteringY(1.5, 1500)");
      const actual: string = meteringX(1.5, 1500) + ',' + meteringY(1.5, 1500);
      logInfo('actual=' + String(actual) + ', expected=' + "0.001,0.999");
      expect(actual).assertEqual("0.001,0.999");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0023
     * @tc.name      Camera_MeteringPoint_0023
     * @tc.desc      metering point for (33.3, 2560) -> 0.013008,0.986992.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_MeteringPoint_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MeteringPoint_0023 begin`);
      logInfo("meteringX(33.3, 2560) + ',' + meteringY(33.3, 2560)");
      const actual: string = meteringX(33.3, 2560) + ',' + meteringY(33.3, 2560);
      logInfo('actual=' + String(actual) + ', expected=' + "0.013008,0.986992");
      expect(actual).assertEqual("0.013008,0.986992");
      logInfo(`${BUNDLE}MeteringPoint_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0024
     * @tc.name      Camera_MeteringPoint_0024
     * @tc.desc      metering point for (99.9, 640) -> 0.156094,0.843906.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0024 begin`);
      logInfo("meteringX(99.9, 640) + ',' + meteringY(99.9, 640)");
      const actual: string = meteringX(99.9, 640) + ',' + meteringY(99.9, 640);
      logInfo('actual=' + String(actual) + ', expected=' + "0.156094,0.843906");
      expect(actual).assertEqual("0.156094,0.843906");
      logInfo(`${BUNDLE}MeteringPoint_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0025
     * @tc.name      Camera_MeteringPoint_0025
     * @tc.desc      metering point for (640, 1280) -> 0.5,0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0025 begin`);
      logInfo("meteringX(640, 1280) + ',' + meteringY(640, 1280)");
      const actual: string = meteringX(640, 1280) + ',' + meteringY(640, 1280);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5,0.5");
      expect(actual).assertEqual("0.5,0.5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0026
     * @tc.name      Camera_MeteringPoint_0026
     * @tc.desc      metering point for (800, 720) -> 1.111111,-0.111111.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0026 begin`);
      logInfo("meteringX(800, 720) + ',' + meteringY(800, 720)");
      const actual: string = meteringX(800, 720) + ',' + meteringY(800, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "1.111111,-0.111111");
      expect(actual).assertEqual("1.111111,-0.111111");
      logInfo(`${BUNDLE}MeteringPoint_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0027
     * @tc.name      Camera_MeteringPoint_0027
     * @tc.desc      metering point for (960, 1920) -> 0.5,0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0027 begin`);
      logInfo("meteringX(960, 1920) + ',' + meteringY(960, 1920)");
      const actual: string = meteringX(960, 1920) + ',' + meteringY(960, 1920);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5,0.5");
      expect(actual).assertEqual("0.5,0.5");
      logInfo(`${BUNDLE}MeteringPoint_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0028
     * @tc.name      Camera_MeteringPoint_0028
     * @tc.desc      metering point for (1280, 2400) -> 0.533333,0.466667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0028 begin`);
      logInfo("meteringX(1280, 2400) + ',' + meteringY(1280, 2400)");
      const actual: string = meteringX(1280, 2400) + ',' + meteringY(1280, 2400);
      logInfo('actual=' + String(actual) + ', expected=' + "0.533333,0.466667");
      expect(actual).assertEqual("0.533333,0.466667");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0029
     * @tc.name      Camera_MeteringPoint_0029
     * @tc.desc      metering point for (3840, 900) -> 4.266667,-3.266667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0029 begin`);
      logInfo("meteringX(3840, 900) + ',' + meteringY(3840, 900)");
      const actual: string = meteringX(3840, 900) + ',' + meteringY(3840, 900);
      logInfo('actual=' + String(actual) + ', expected=' + "4.266667,-3.266667");
      expect(actual).assertEqual("4.266667,-3.266667");
      logInfo(`${BUNDLE}MeteringPoint_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0030
     * @tc.name      Camera_MeteringPoint_0030
     * @tc.desc      metering point for (2160, 1200) -> 1.8,-0.8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0030 begin`);
      logInfo("meteringX(2160, 1200) + ',' + meteringY(2160, 1200)");
      const actual: string = meteringX(2160, 1200) + ',' + meteringY(2160, 1200);
      logInfo('actual=' + String(actual) + ', expected=' + "1.8,-0.8");
      expect(actual).assertEqual("1.8,-0.8");
      logInfo(`${BUNDLE}MeteringPoint_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0031
     * @tc.name      Camera_MeteringPoint_0031
     * @tc.desc      metering point for (240, 2000) -> 0.12,0.88.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0031 begin`);
      logInfo("meteringX(240, 2000) + ',' + meteringY(240, 2000)");
      const actual: string = meteringX(240, 2000) + ',' + meteringY(240, 2000);
      logInfo('actual=' + String(actual) + ', expected=' + "0.12,0.88");
      expect(actual).assertEqual("0.12,0.88");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0032
     * @tc.name      Camera_MeteringPoint_0032
     * @tc.desc      metering point for (480, 480) -> 1,0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0032 begin`);
      logInfo("meteringX(480, 480) + ',' + meteringY(480, 480)");
      const actual: string = meteringX(480, 480) + ',' + meteringY(480, 480);
      logInfo('actual=' + String(actual) + ', expected=' + "1,0");
      expect(actual).assertEqual("1,0");
      logInfo(`${BUNDLE}MeteringPoint_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0033
     * @tc.name      Camera_MeteringPoint_0033
     * @tc.desc      metering point for (60, 960) -> 0.0625,0.9375.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0033 begin`);
      logInfo("meteringX(60, 960) + ',' + meteringY(60, 960)");
      const actual: string = meteringX(60, 960) + ',' + meteringY(60, 960);
      logInfo('actual=' + String(actual) + ', expected=' + "0.0625,0.9375");
      expect(actual).assertEqual("0.0625,0.9375");
      logInfo(`${BUNDLE}MeteringPoint_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0034
     * @tc.name      Camera_MeteringPoint_0034
     * @tc.desc      metering point for (30, 1080) -> 0.027778,0.972222.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_MeteringPoint_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MeteringPoint_0034 begin`);
      logInfo("meteringX(30, 1080) + ',' + meteringY(30, 1080)");
      const actual: string = meteringX(30, 1080) + ',' + meteringY(30, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0.027778,0.972222");
      expect(actual).assertEqual("0.027778,0.972222");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0035
     * @tc.name      Camera_MeteringPoint_0035
     * @tc.desc      metering point for (15, 360) -> 0.041667,0.958333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_MeteringPoint_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MeteringPoint_0035 begin`);
      logInfo("meteringX(15, 360) + ',' + meteringY(15, 360)");
      const actual: string = meteringX(15, 360) + ',' + meteringY(15, 360);
      logInfo('actual=' + String(actual) + ', expected=' + "0.041667,0.958333");
      expect(actual).assertEqual("0.041667,0.958333");
      logInfo(`${BUNDLE}MeteringPoint_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0036
     * @tc.name      Camera_MeteringPoint_0036
     * @tc.desc      metering point for (24, 2160) -> 0.011111,0.988889.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0036 begin`);
      logInfo("meteringX(24, 2160) + ',' + meteringY(24, 2160)");
      const actual: string = meteringX(24, 2160) + ',' + meteringY(24, 2160);
      logInfo('actual=' + String(actual) + ', expected=' + "0.011111,0.988889");
      expect(actual).assertEqual("0.011111,0.988889");
      logInfo(`${BUNDLE}MeteringPoint_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0037
     * @tc.name      Camera_MeteringPoint_0037
     * @tc.desc      metering point for (25, 1080) -> 0.023148,0.976852.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0037 begin`);
      logInfo("meteringX(25, 1080) + ',' + meteringY(25, 1080)");
      const actual: string = meteringX(25, 1080) + ',' + meteringY(25, 1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0.023148,0.976852");
      expect(actual).assertEqual("0.023148,0.976852");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0038
     * @tc.name      Camera_MeteringPoint_0038
     * @tc.desc      metering point for (28, 540) -> 0.051852,0.948148.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0038 begin`);
      logInfo("meteringX(28, 540) + ',' + meteringY(28, 540)");
      const actual: string = meteringX(28, 540) + ',' + meteringY(28, 540);
      logInfo('actual=' + String(actual) + ', expected=' + "0.051852,0.948148");
      expect(actual).assertEqual("0.051852,0.948148");
      logInfo(`${BUNDLE}MeteringPoint_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0039
     * @tc.name      Camera_MeteringPoint_0039
     * @tc.desc      metering point for (40, 1800) -> 0.022222,0.977778.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0039 begin`);
      logInfo("meteringX(40, 1800) + ',' + meteringY(40, 1800)");
      const actual: string = meteringX(40, 1800) + ',' + meteringY(40, 1800);
      logInfo('actual=' + String(actual) + ', expected=' + "0.022222,0.977778");
      expect(actual).assertEqual("0.022222,0.977778");
      logInfo(`${BUNDLE}MeteringPoint_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0040
     * @tc.name      Camera_MeteringPoint_0040
     * @tc.desc      metering point for (50, 3840) -> 0.013021,0.986979.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0040 begin`);
      logInfo("meteringX(50, 3840) + ',' + meteringY(50, 3840)");
      const actual: string = meteringX(50, 3840) + ',' + meteringY(50, 3840);
      logInfo('actual=' + String(actual) + ', expected=' + "0.013021,0.986979");
      expect(actual).assertEqual("0.013021,0.986979");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0041
     * @tc.name      Camera_MeteringPoint_0041
     * @tc.desc      metering point for (75, 800) -> 0.09375,0.90625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0041 begin`);
      logInfo("meteringX(75, 800) + ',' + meteringY(75, 800)");
      const actual: string = meteringX(75, 800) + ',' + meteringY(75, 800);
      logInfo('actual=' + String(actual) + ', expected=' + "0.09375,0.90625");
      expect(actual).assertEqual("0.09375,0.90625");
      logInfo(`${BUNDLE}MeteringPoint_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0042
     * @tc.name      Camera_MeteringPoint_0042
     * @tc.desc      metering point for (1000, 640) -> 1.5625,-0.5625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0042 begin`);
      logInfo("meteringX(1000, 640) + ',' + meteringY(1000, 640)");
      const actual: string = meteringX(1000, 640) + ',' + meteringY(1000, 640);
      logInfo('actual=' + String(actual) + ', expected=' + "1.5625,-0.5625");
      expect(actual).assertEqual("1.5625,-0.5625");
      logInfo(`${BUNDLE}MeteringPoint_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0043
     * @tc.name      Camera_MeteringPoint_0043
     * @tc.desc      metering point for (3500, 480) -> 7.291667,-6.291667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0043 begin`);
      logInfo("meteringX(3500, 480) + ',' + meteringY(3500, 480)");
      const actual: string = meteringX(3500, 480) + ',' + meteringY(3500, 480);
      logInfo('actual=' + String(actual) + ', expected=' + "7.291667,-6.291667");
      expect(actual).assertEqual("7.291667,-6.291667");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0044
     * @tc.name      Camera_MeteringPoint_0044
     * @tc.desc      metering point for (60000, 1440) -> 41.666667,-40.666667.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0044 begin`);
      logInfo("meteringX(60000, 1440) + ',' + meteringY(60000, 1440)");
      const actual: string = meteringX(60000, 1440) + ',' + meteringY(60000, 1440);
      logInfo('actual=' + String(actual) + ', expected=' + "41.666667,-40.666667");
      expect(actual).assertEqual("41.666667,-40.666667");
      logInfo(`${BUNDLE}MeteringPoint_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0045
     * @tc.name      Camera_MeteringPoint_0045
     * @tc.desc      metering point for (12345, 3000) -> 4.115,-3.115.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_MeteringPoint_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MeteringPoint_0045 begin`);
      logInfo("meteringX(12345, 3000) + ',' + meteringY(12345, 3000)");
      const actual: string = meteringX(12345, 3000) + ',' + meteringY(12345, 3000);
      logInfo('actual=' + String(actual) + ', expected=' + "4.115,-3.115");
      expect(actual).assertEqual("4.115,-3.115");
      logInfo(`${BUNDLE}MeteringPoint_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_METERING_POINT_0046
     * @tc.name      Camera_MeteringPoint_0046
     * @tc.desc      metering point for (99999, 600) -> 166.665,-165.665.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_MeteringPoint_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MeteringPoint_0046 begin`);
      logInfo("meteringX(99999, 600) + ',' + meteringY(99999, 600)");
      const actual: string = meteringX(99999, 600) + ',' + meteringY(99999, 600);
      logInfo('actual=' + String(actual) + ', expected=' + "166.665,-165.665");
      expect(actual).assertEqual("166.665,-165.665");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MeteringPoint_0046 end`);
    });
  });
}
