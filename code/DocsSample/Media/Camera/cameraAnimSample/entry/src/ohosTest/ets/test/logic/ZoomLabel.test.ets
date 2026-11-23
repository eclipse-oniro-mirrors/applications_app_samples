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
  zoomLabel,
} from '../model/CameraLogic';

/** ZoomLabelTest logic checks (46 cases). */
export default function zoomLabelTest(): void {
  describe('ZoomLabelTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0001
     * @tc.name      Camera_ZoomLabel_0001
     * @tc.desc      zoomLabel(0.75) appends the x suffix -> "0.75x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomLabel_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomLabel_0001 begin`);
      logInfo("zoomLabel(0.75)");
      const actual: string = zoomLabel(0.75);
      logInfo('actual=' + String(actual) + ', expected=' + "0.75x");
      expect(actual).assertEqual("0.75x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0002
     * @tc.name      Camera_ZoomLabel_0002
     * @tc.desc      zoomLabel(0.99) appends the x suffix -> "0.99x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0002 begin`);
      logInfo("zoomLabel(0.99)");
      const actual: string = zoomLabel(0.99);
      logInfo('actual=' + String(actual) + ', expected=' + "0.99x");
      expect(actual).assertEqual("0.99x");
      logInfo(`${BUNDLE}ZoomLabel_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0003
     * @tc.name      Camera_ZoomLabel_0003
     * @tc.desc      zoomLabel(1.01) appends the x suffix -> "1.01x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0003 begin`);
      logInfo("zoomLabel(1.01)");
      const actual: string = zoomLabel(1.01);
      logInfo('actual=' + String(actual) + ', expected=' + "1.01x");
      expect(actual).assertEqual("1.01x");
      logInfo(`${BUNDLE}ZoomLabel_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0004
     * @tc.name      Camera_ZoomLabel_0004
     * @tc.desc      zoomLabel(1.1) appends the x suffix -> "1.1x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0004 begin`);
      logInfo("zoomLabel(1.1)");
      const actual: string = zoomLabel(1.1);
      logInfo('actual=' + String(actual) + ', expected=' + "1.1x");
      expect(actual).assertEqual("1.1x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0005
     * @tc.name      Camera_ZoomLabel_0005
     * @tc.desc      zoomLabel(1.25) appends the x suffix -> "1.25x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0005 begin`);
      logInfo("zoomLabel(1.25)");
      const actual: string = zoomLabel(1.25);
      logInfo('actual=' + String(actual) + ', expected=' + "1.25x");
      expect(actual).assertEqual("1.25x");
      logInfo(`${BUNDLE}ZoomLabel_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0006
     * @tc.name      Camera_ZoomLabel_0006
     * @tc.desc      zoomLabel(1.5) appends the x suffix -> "1.5x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0006 begin`);
      logInfo("zoomLabel(1.5)");
      const actual: string = zoomLabel(1.5);
      logInfo('actual=' + String(actual) + ', expected=' + "1.5x");
      expect(actual).assertEqual("1.5x");
      logInfo(`${BUNDLE}ZoomLabel_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0007
     * @tc.name      Camera_ZoomLabel_0007
     * @tc.desc      zoomLabel(1.75) appends the x suffix -> "1.75x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0007 begin`);
      logInfo("zoomLabel(1.75)");
      const actual: string = zoomLabel(1.75);
      logInfo('actual=' + String(actual) + ', expected=' + "1.75x");
      expect(actual).assertEqual("1.75x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0008
     * @tc.name      Camera_ZoomLabel_0008
     * @tc.desc      zoomLabel(2.25) appends the x suffix -> "2.25x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0008 begin`);
      logInfo("zoomLabel(2.25)");
      const actual: string = zoomLabel(2.25);
      logInfo('actual=' + String(actual) + ', expected=' + "2.25x");
      expect(actual).assertEqual("2.25x");
      logInfo(`${BUNDLE}ZoomLabel_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0009
     * @tc.name      Camera_ZoomLabel_0009
     * @tc.desc      zoomLabel(2.5) appends the x suffix -> "2.5x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0009 begin`);
      logInfo("zoomLabel(2.5)");
      const actual: string = zoomLabel(2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "2.5x");
      expect(actual).assertEqual("2.5x");
      logInfo(`${BUNDLE}ZoomLabel_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0010
     * @tc.name      Camera_ZoomLabel_0010
     * @tc.desc      zoomLabel(2.75) appends the x suffix -> "2.75x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0010 begin`);
      logInfo("zoomLabel(2.75)");
      const actual: string = zoomLabel(2.75);
      logInfo('actual=' + String(actual) + ', expected=' + "2.75x");
      expect(actual).assertEqual("2.75x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0011
     * @tc.name      Camera_ZoomLabel_0011
     * @tc.desc      zoomLabel(3.5) appends the x suffix -> "3.5x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0011 begin`);
      logInfo("zoomLabel(3.5)");
      const actual: string = zoomLabel(3.5);
      logInfo('actual=' + String(actual) + ', expected=' + "3.5x");
      expect(actual).assertEqual("3.5x");
      logInfo(`${BUNDLE}ZoomLabel_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0012
     * @tc.name      Camera_ZoomLabel_0012
     * @tc.desc      zoomLabel(4.5) appends the x suffix -> "4.5x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomLabel_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomLabel_0012 begin`);
      logInfo("zoomLabel(4.5)");
      const actual: string = zoomLabel(4.5);
      logInfo('actual=' + String(actual) + ', expected=' + "4.5x");
      expect(actual).assertEqual("4.5x");
      logInfo(`${BUNDLE}ZoomLabel_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0013
     * @tc.name      Camera_ZoomLabel_0013
     * @tc.desc      zoomLabel(5.5) appends the x suffix -> "5.5x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0013 begin`);
      logInfo("zoomLabel(5.5)");
      const actual: string = zoomLabel(5.5);
      logInfo('actual=' + String(actual) + ', expected=' + "5.5x");
      expect(actual).assertEqual("5.5x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0014
     * @tc.name      Camera_ZoomLabel_0014
     * @tc.desc      zoomLabel(6.5) appends the x suffix -> "6.5x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0014 begin`);
      logInfo("zoomLabel(6.5)");
      const actual: string = zoomLabel(6.5);
      logInfo('actual=' + String(actual) + ', expected=' + "6.5x");
      expect(actual).assertEqual("6.5x");
      logInfo(`${BUNDLE}ZoomLabel_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0015
     * @tc.name      Camera_ZoomLabel_0015
     * @tc.desc      zoomLabel(10.5) appends the x suffix -> "10.5x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0015 begin`);
      logInfo("zoomLabel(10.5)");
      const actual: string = zoomLabel(10.5);
      logInfo('actual=' + String(actual) + ', expected=' + "10.5x");
      expect(actual).assertEqual("10.5x");
      logInfo(`${BUNDLE}ZoomLabel_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0016
     * @tc.name      Camera_ZoomLabel_0016
     * @tc.desc      zoomLabel(45.45) appends the x suffix -> "45.45x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0016 begin`);
      logInfo("zoomLabel(45.45)");
      const actual: string = zoomLabel(45.45);
      logInfo('actual=' + String(actual) + ', expected=' + "45.45x");
      expect(actual).assertEqual("45.45x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0017
     * @tc.name      Camera_ZoomLabel_0017
     * @tc.desc      zoomLabel(-1) appends the x suffix -> "-1x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0017 begin`);
      logInfo("zoomLabel(-1)");
      const actual: string = zoomLabel(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1x");
      expect(actual).assertEqual("-1x");
      logInfo(`${BUNDLE}ZoomLabel_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0018
     * @tc.name      Camera_ZoomLabel_0018
     * @tc.desc      zoomLabel(-0.5) appends the x suffix -> "-0.5x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ZoomLabel_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ZoomLabel_0018 begin`);
      logInfo("zoomLabel(-0.5)");
      const actual: string = zoomLabel(-0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "-0.5x");
      expect(actual).assertEqual("-0.5x");
      logInfo(`${BUNDLE}ZoomLabel_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0019
     * @tc.name      Camera_ZoomLabel_0019
     * @tc.desc      zoomLabel(-1.5) appends the x suffix -> "-1.5x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0019 begin`);
      logInfo("zoomLabel(-1.5)");
      const actual: string = zoomLabel(-1.5);
      logInfo('actual=' + String(actual) + ', expected=' + "-1.5x");
      expect(actual).assertEqual("-1.5x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0020
     * @tc.name      Camera_ZoomLabel_0020
     * @tc.desc      zoomLabel(100) appends the x suffix -> "100x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0020 begin`);
      logInfo("zoomLabel(100)");
      const actual: string = zoomLabel(100);
      logInfo('actual=' + String(actual) + ', expected=' + "100x");
      expect(actual).assertEqual("100x");
      logInfo(`${BUNDLE}ZoomLabel_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0021
     * @tc.name      Camera_ZoomLabel_0021
     * @tc.desc      zoomLabel(255) appends the x suffix -> "255x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0021 begin`);
      logInfo("zoomLabel(255)");
      const actual: string = zoomLabel(255);
      logInfo('actual=' + String(actual) + ', expected=' + "255x");
      expect(actual).assertEqual("255x");
      logInfo(`${BUNDLE}ZoomLabel_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0022
     * @tc.name      Camera_ZoomLabel_0022
     * @tc.desc      zoomLabel(360) appends the x suffix -> "360x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0022 begin`);
      logInfo("zoomLabel(360)");
      const actual: string = zoomLabel(360);
      logInfo('actual=' + String(actual) + ', expected=' + "360x");
      expect(actual).assertEqual("360x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0023
     * @tc.name      Camera_ZoomLabel_0023
     * @tc.desc      zoomLabel(1000) appends the x suffix -> "1000x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomLabel_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomLabel_0023 begin`);
      logInfo("zoomLabel(1000)");
      const actual: string = zoomLabel(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "1000x");
      expect(actual).assertEqual("1000x");
      logInfo(`${BUNDLE}ZoomLabel_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0024
     * @tc.name      Camera_ZoomLabel_0024
     * @tc.desc      zoomLabel(1920) appends the x suffix -> "1920x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0024 begin`);
      logInfo("zoomLabel(1920)");
      const actual: string = zoomLabel(1920);
      logInfo('actual=' + String(actual) + ', expected=' + "1920x");
      expect(actual).assertEqual("1920x");
      logInfo(`${BUNDLE}ZoomLabel_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0025
     * @tc.name      Camera_ZoomLabel_0025
     * @tc.desc      zoomLabel(0.01) appends the x suffix -> "0.01x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0025 begin`);
      logInfo("zoomLabel(0.01)");
      const actual: string = zoomLabel(0.01);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01x");
      expect(actual).assertEqual("0.01x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0026
     * @tc.name      Camera_ZoomLabel_0026
     * @tc.desc      zoomLabel(0.02) appends the x suffix -> "0.02x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0026 begin`);
      logInfo("zoomLabel(0.02)");
      const actual: string = zoomLabel(0.02);
      logInfo('actual=' + String(actual) + ', expected=' + "0.02x");
      expect(actual).assertEqual("0.02x");
      logInfo(`${BUNDLE}ZoomLabel_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0027
     * @tc.name      Camera_ZoomLabel_0027
     * @tc.desc      zoomLabel(0.03) appends the x suffix -> "0.03x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0027 begin`);
      logInfo("zoomLabel(0.03)");
      const actual: string = zoomLabel(0.03);
      logInfo('actual=' + String(actual) + ', expected=' + "0.03x");
      expect(actual).assertEqual("0.03x");
      logInfo(`${BUNDLE}ZoomLabel_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0028
     * @tc.name      Camera_ZoomLabel_0028
     * @tc.desc      zoomLabel(0.04) appends the x suffix -> "0.04x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0028 begin`);
      logInfo("zoomLabel(0.04)");
      const actual: string = zoomLabel(0.04);
      logInfo('actual=' + String(actual) + ', expected=' + "0.04x");
      expect(actual).assertEqual("0.04x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0029
     * @tc.name      Camera_ZoomLabel_0029
     * @tc.desc      zoomLabel(0.05) appends the x suffix -> "0.05x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0029 begin`);
      logInfo("zoomLabel(0.05)");
      const actual: string = zoomLabel(0.05);
      logInfo('actual=' + String(actual) + ', expected=' + "0.05x");
      expect(actual).assertEqual("0.05x");
      logInfo(`${BUNDLE}ZoomLabel_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0030
     * @tc.name      Camera_ZoomLabel_0030
     * @tc.desc      zoomLabel(0.06) appends the x suffix -> "0.06x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0030 begin`);
      logInfo("zoomLabel(0.06)");
      const actual: string = zoomLabel(0.06);
      logInfo('actual=' + String(actual) + ', expected=' + "0.06x");
      expect(actual).assertEqual("0.06x");
      logInfo(`${BUNDLE}ZoomLabel_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0031
     * @tc.name      Camera_ZoomLabel_0031
     * @tc.desc      zoomLabel(0.07) appends the x suffix -> "0.07x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0031 begin`);
      logInfo("zoomLabel(0.07)");
      const actual: string = zoomLabel(0.07);
      logInfo('actual=' + String(actual) + ', expected=' + "0.07x");
      expect(actual).assertEqual("0.07x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0032
     * @tc.name      Camera_ZoomLabel_0032
     * @tc.desc      zoomLabel(0.08) appends the x suffix -> "0.08x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0032 begin`);
      logInfo("zoomLabel(0.08)");
      const actual: string = zoomLabel(0.08);
      logInfo('actual=' + String(actual) + ', expected=' + "0.08x");
      expect(actual).assertEqual("0.08x");
      logInfo(`${BUNDLE}ZoomLabel_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0033
     * @tc.name      Camera_ZoomLabel_0033
     * @tc.desc      zoomLabel(0.09) appends the x suffix -> "0.09x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0033 begin`);
      logInfo("zoomLabel(0.09)");
      const actual: string = zoomLabel(0.09);
      logInfo('actual=' + String(actual) + ', expected=' + "0.09x");
      expect(actual).assertEqual("0.09x");
      logInfo(`${BUNDLE}ZoomLabel_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0034
     * @tc.name      Camera_ZoomLabel_0034
     * @tc.desc      zoomLabel(7) appends the x suffix -> "7x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomLabel_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomLabel_0034 begin`);
      logInfo("zoomLabel(7)");
      const actual: string = zoomLabel(7);
      logInfo('actual=' + String(actual) + ', expected=' + "7x");
      expect(actual).assertEqual("7x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0035
     * @tc.name      Camera_ZoomLabel_0035
     * @tc.desc      zoomLabel(8) appends the x suffix -> "8x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ZoomLabel_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ZoomLabel_0035 begin`);
      logInfo("zoomLabel(8)");
      const actual: string = zoomLabel(8);
      logInfo('actual=' + String(actual) + ', expected=' + "8x");
      expect(actual).assertEqual("8x");
      logInfo(`${BUNDLE}ZoomLabel_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0036
     * @tc.name      Camera_ZoomLabel_0036
     * @tc.desc      zoomLabel(9) appends the x suffix -> "9x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0036 begin`);
      logInfo("zoomLabel(9)");
      const actual: string = zoomLabel(9);
      logInfo('actual=' + String(actual) + ', expected=' + "9x");
      expect(actual).assertEqual("9x");
      logInfo(`${BUNDLE}ZoomLabel_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0037
     * @tc.name      Camera_ZoomLabel_0037
     * @tc.desc      zoomLabel(10) appends the x suffix -> "10x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0037 begin`);
      logInfo("zoomLabel(10)");
      const actual: string = zoomLabel(10);
      logInfo('actual=' + String(actual) + ', expected=' + "10x");
      expect(actual).assertEqual("10x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0038
     * @tc.name      Camera_ZoomLabel_0038
     * @tc.desc      zoomLabel(0) appends the x suffix -> "0x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0038 begin`);
      logInfo("zoomLabel(0)");
      const actual: string = zoomLabel(0);
      logInfo('actual=' + String(actual) + ', expected=' + "0x");
      expect(actual).assertEqual("0x");
      logInfo(`${BUNDLE}ZoomLabel_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0039
     * @tc.name      Camera_ZoomLabel_0039
     * @tc.desc      zoomLabel(1) appends the x suffix -> "1x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0039 begin`);
      logInfo("zoomLabel(1)");
      const actual: string = zoomLabel(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1x");
      expect(actual).assertEqual("1x");
      logInfo(`${BUNDLE}ZoomLabel_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0040
     * @tc.name      Camera_ZoomLabel_0040
     * @tc.desc      zoomLabel(2) appends the x suffix -> "2x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0040 begin`);
      logInfo("zoomLabel(2)");
      const actual: string = zoomLabel(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2x");
      expect(actual).assertEqual("2x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0041
     * @tc.name      Camera_ZoomLabel_0041
     * @tc.desc      zoomLabel(3) appends the x suffix -> "3x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0041 begin`);
      logInfo("zoomLabel(3)");
      const actual: string = zoomLabel(3);
      logInfo('actual=' + String(actual) + ', expected=' + "3x");
      expect(actual).assertEqual("3x");
      logInfo(`${BUNDLE}ZoomLabel_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0042
     * @tc.name      Camera_ZoomLabel_0042
     * @tc.desc      zoomLabel(4) appends the x suffix -> "4x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0042 begin`);
      logInfo("zoomLabel(4)");
      const actual: string = zoomLabel(4);
      logInfo('actual=' + String(actual) + ', expected=' + "4x");
      expect(actual).assertEqual("4x");
      logInfo(`${BUNDLE}ZoomLabel_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0043
     * @tc.name      Camera_ZoomLabel_0043
     * @tc.desc      zoomLabel(5) appends the x suffix -> "5x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0043 begin`);
      logInfo("zoomLabel(5)");
      const actual: string = zoomLabel(5);
      logInfo('actual=' + String(actual) + ', expected=' + "5x");
      expect(actual).assertEqual("5x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0044
     * @tc.name      Camera_ZoomLabel_0044
     * @tc.desc      zoomLabel(6) appends the x suffix -> "6x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0044 begin`);
      logInfo("zoomLabel(6)");
      const actual: string = zoomLabel(6);
      logInfo('actual=' + String(actual) + ', expected=' + "6x");
      expect(actual).assertEqual("6x");
      logInfo(`${BUNDLE}ZoomLabel_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0045
     * @tc.name      Camera_ZoomLabel_0045
     * @tc.desc      zoomLabel(0.1) appends the x suffix -> "0.1x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomLabel_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomLabel_0045 begin`);
      logInfo("zoomLabel(0.1)");
      const actual: string = zoomLabel(0.1);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1x");
      expect(actual).assertEqual("0.1x");
      logInfo(`${BUNDLE}ZoomLabel_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_LABEL_0046
     * @tc.name      Camera_ZoomLabel_0046
     * @tc.desc      zoomLabel(0.5) appends the x suffix -> "0.5x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomLabel_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomLabel_0046 begin`);
      logInfo("zoomLabel(0.5)");
      const actual: string = zoomLabel(0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5x");
      expect(actual).assertEqual("0.5x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomLabel_0046 end`);
    });
  });
}
