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
  zoomClamp,
} from '../model/CameraLogic';

/** ZoomClampTest logic checks (48 cases). */
export default function zoomClampTest(): void {
  describe('ZoomClampTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0001
     * @tc.name      Camera_ZoomClamp_0001
     * @tc.desc      zoomClamp(1, 1, 6) clips the zoom to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomClamp_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomClamp_0001 begin`);
      logInfo("zoomClamp(1, 1, 6)");
      const actual: number = zoomClamp(1, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0002
     * @tc.name      Camera_ZoomClamp_0002
     * @tc.desc      zoomClamp(6, 1, 6) clips the zoom to 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0002 begin`);
      logInfo("zoomClamp(6, 1, 6)");
      const actual: number = zoomClamp(6, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ZoomClamp_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0003
     * @tc.name      Camera_ZoomClamp_0003
     * @tc.desc      zoomClamp(0, 1, 6) clips the zoom to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0003 begin`);
      logInfo("zoomClamp(0, 1, 6)");
      const actual: number = zoomClamp(0, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomClamp_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0004
     * @tc.name      Camera_ZoomClamp_0004
     * @tc.desc      zoomClamp(7, 1, 6) clips the zoom to 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0004 begin`);
      logInfo("zoomClamp(7, 1, 6)");
      const actual: number = zoomClamp(7, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0005
     * @tc.name      Camera_ZoomClamp_0005
     * @tc.desc      zoomClamp(3.5, 1, 6) clips the zoom to 3.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0005 begin`);
      logInfo("zoomClamp(3.5, 1, 6)");
      const actual: number = zoomClamp(3.5, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "3.5");
      expect(actual).assertEqual(3.5);
      logInfo(`${BUNDLE}ZoomClamp_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0006
     * @tc.name      Camera_ZoomClamp_0006
     * @tc.desc      zoomClamp(-2, 1, 6) clips the zoom to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0006 begin`);
      logInfo("zoomClamp(-2, 1, 6)");
      const actual: number = zoomClamp(-2, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomClamp_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0007
     * @tc.name      Camera_ZoomClamp_0007
     * @tc.desc      zoomClamp(0.5, 0.25, 2.5) clips the zoom to 0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0007 begin`);
      logInfo("zoomClamp(0.5, 0.25, 2.5)");
      const actual: number = zoomClamp(0.5, 0.25, 2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5");
      expect(actual).assertEqual(0.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0008
     * @tc.name      Camera_ZoomClamp_0008
     * @tc.desc      zoomClamp(2.5, 0.25, 2.5) clips the zoom to 2.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0008 begin`);
      logInfo("zoomClamp(2.5, 0.25, 2.5)");
      const actual: number = zoomClamp(2.5, 0.25, 2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "2.5");
      expect(actual).assertEqual(2.5);
      logInfo(`${BUNDLE}ZoomClamp_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0009
     * @tc.name      Camera_ZoomClamp_0009
     * @tc.desc      zoomClamp(3, 0.25, 2.5) clips the zoom to 2.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0009 begin`);
      logInfo("zoomClamp(3, 0.25, 2.5)");
      const actual: number = zoomClamp(3, 0.25, 2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "2.5");
      expect(actual).assertEqual(2.5);
      logInfo(`${BUNDLE}ZoomClamp_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0010
     * @tc.name      Camera_ZoomClamp_0010
     * @tc.desc      zoomClamp(0.1, 0.1, 0.1) clips the zoom to 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0010 begin`);
      logInfo("zoomClamp(0.1, 0.1, 0.1)");
      const actual: number = zoomClamp(0.1, 0.1, 0.1);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0011
     * @tc.name      Camera_ZoomClamp_0011
     * @tc.desc      zoomClamp(5, 5, 5) clips the zoom to 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0011 begin`);
      logInfo("zoomClamp(5, 5, 5)");
      const actual: number = zoomClamp(5, 5, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ZoomClamp_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0012
     * @tc.name      Camera_ZoomClamp_0012
     * @tc.desc      zoomClamp(100, 1, 6) clips the zoom to 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomClamp_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomClamp_0012 begin`);
      logInfo("zoomClamp(100, 1, 6)");
      const actual: number = zoomClamp(100, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ZoomClamp_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0013
     * @tc.name      Camera_ZoomClamp_0013
     * @tc.desc      zoomClamp(1, 6, 1) clips the zoom to 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0013 begin`);
      logInfo("zoomClamp(1, 6, 1)");
      const actual: number = zoomClamp(1, 6, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0014
     * @tc.name      Camera_ZoomClamp_0014
     * @tc.desc      zoomClamp(2, 6, 1) clips the zoom to 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0014 begin`);
      logInfo("zoomClamp(2, 6, 1)");
      const actual: number = zoomClamp(2, 6, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ZoomClamp_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0015
     * @tc.name      Camera_ZoomClamp_0015
     * @tc.desc      zoomClamp(1.5, 1.5, 1.5) clips the zoom to 1.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0015 begin`);
      logInfo("zoomClamp(1.5, 1.5, 1.5)");
      const actual: number = zoomClamp(1.5, 1.5, 1.5);
      logInfo('actual=' + String(actual) + ', expected=' + "1.5");
      expect(actual).assertEqual(1.5);
      logInfo(`${BUNDLE}ZoomClamp_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0016
     * @tc.name      Camera_ZoomClamp_0016
     * @tc.desc      zoomClamp(1.111, 1, 6) clips the zoom to 1.111.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0016 begin`);
      logInfo("zoomClamp(1.111, 1, 6)");
      const actual: number = zoomClamp(1.111, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1.111");
      expect(actual).assertEqual(1.111);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0017
     * @tc.name      Camera_ZoomClamp_0017
     * @tc.desc      zoomClamp(5.999, 1, 6) clips the zoom to 5.999.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0017 begin`);
      logInfo("zoomClamp(5.999, 1, 6)");
      const actual: number = zoomClamp(5.999, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "5.999");
      expect(actual).assertEqual(5.999);
      logInfo(`${BUNDLE}ZoomClamp_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0018
     * @tc.name      Camera_ZoomClamp_0018
     * @tc.desc      zoomClamp(6.001, 1, 6) clips the zoom to 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ZoomClamp_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ZoomClamp_0018 begin`);
      logInfo("zoomClamp(6.001, 1, 6)");
      const actual: number = zoomClamp(6.001, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ZoomClamp_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0019
     * @tc.name      Camera_ZoomClamp_0019
     * @tc.desc      zoomClamp(4, 2, 3) clips the zoom to 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0019 begin`);
      logInfo("zoomClamp(4, 2, 3)");
      const actual: number = zoomClamp(4, 2, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0020
     * @tc.name      Camera_ZoomClamp_0020
     * @tc.desc      zoomClamp(2, 2, 3) clips the zoom to 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0020 begin`);
      logInfo("zoomClamp(2, 2, 3)");
      const actual: number = zoomClamp(2, 2, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ZoomClamp_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0021
     * @tc.name      Camera_ZoomClamp_0021
     * @tc.desc      zoomClamp(3, 2, 3) clips the zoom to 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0021 begin`);
      logInfo("zoomClamp(3, 2, 3)");
      const actual: number = zoomClamp(3, 2, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ZoomClamp_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0022
     * @tc.name      Camera_ZoomClamp_0022
     * @tc.desc      zoomClamp(1, 2, 3) clips the zoom to 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0022 begin`);
      logInfo("zoomClamp(1, 2, 3)");
      const actual: number = zoomClamp(1, 2, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0023
     * @tc.name      Camera_ZoomClamp_0023
     * @tc.desc      zoomClamp(0, 0, 1) clips the zoom to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomClamp_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomClamp_0023 begin`);
      logInfo("zoomClamp(0, 0, 1)");
      const actual: number = zoomClamp(0, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ZoomClamp_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0024
     * @tc.name      Camera_ZoomClamp_0024
     * @tc.desc      zoomClamp(1, 0, 1) clips the zoom to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0024 begin`);
      logInfo("zoomClamp(1, 0, 1)");
      const actual: number = zoomClamp(1, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomClamp_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0025
     * @tc.name      Camera_ZoomClamp_0025
     * @tc.desc      zoomClamp(1.5, 0, 1) clips the zoom to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0025 begin`);
      logInfo("zoomClamp(1.5, 0, 1)");
      const actual: number = zoomClamp(1.5, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0026
     * @tc.name      Camera_ZoomClamp_0026
     * @tc.desc      zoomClamp(9, 0, 1) clips the zoom to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0026 begin`);
      logInfo("zoomClamp(9, 0, 1)");
      const actual: number = zoomClamp(9, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomClamp_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0027
     * @tc.name      Camera_ZoomClamp_0027
     * @tc.desc      zoomClamp(-1, 0, 1) clips the zoom to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0027 begin`);
      logInfo("zoomClamp(-1, 0, 1)");
      const actual: number = zoomClamp(-1, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ZoomClamp_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0028
     * @tc.name      Camera_ZoomClamp_0028
     * @tc.desc      zoomClamp(2, -1, 1) clips the zoom to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0028 begin`);
      logInfo("zoomClamp(2, -1, 1)");
      const actual: number = zoomClamp(2, -1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0029
     * @tc.name      Camera_ZoomClamp_0029
     * @tc.desc      zoomClamp(0, -1, 1) clips the zoom to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0029 begin`);
      logInfo("zoomClamp(0, -1, 1)");
      const actual: number = zoomClamp(0, -1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ZoomClamp_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0030
     * @tc.name      Camera_ZoomClamp_0030
     * @tc.desc      zoomClamp(-2, -1, 1) clips the zoom to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0030 begin`);
      logInfo("zoomClamp(-2, -1, 1)");
      const actual: number = zoomClamp(-2, -1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ZoomClamp_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0031
     * @tc.name      Camera_ZoomClamp_0031
     * @tc.desc      zoomClamp(10, 1, 10) clips the zoom to 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0031 begin`);
      logInfo("zoomClamp(10, 1, 10)");
      const actual: number = zoomClamp(10, 1, 10);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0032
     * @tc.name      Camera_ZoomClamp_0032
     * @tc.desc      zoomClamp(10, 10, 1) clips the zoom to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0032 begin`);
      logInfo("zoomClamp(10, 10, 1)");
      const actual: number = zoomClamp(10, 10, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomClamp_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0033
     * @tc.name      Camera_ZoomClamp_0033
     * @tc.desc      zoomClamp(5, 10, 1) clips the zoom to 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0033 begin`);
      logInfo("zoomClamp(5, 10, 1)");
      const actual: number = zoomClamp(5, 10, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ZoomClamp_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0034
     * @tc.name      Camera_ZoomClamp_0034
     * @tc.desc      zoomClamp(-5, -10, -1) clips the zoom to -5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomClamp_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomClamp_0034 begin`);
      logInfo("zoomClamp(-5, -10, -1)");
      const actual: number = zoomClamp(-5, -10, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "-5");
      expect(actual).assertEqual(-5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0035
     * @tc.name      Camera_ZoomClamp_0035
     * @tc.desc      zoomClamp(-10, -10, -1) clips the zoom to -10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ZoomClamp_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ZoomClamp_0035 begin`);
      logInfo("zoomClamp(-10, -10, -1)");
      const actual: number = zoomClamp(-10, -10, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "-10");
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ZoomClamp_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0036
     * @tc.name      Camera_ZoomClamp_0036
     * @tc.desc      zoomClamp(-0.5, -10, -1) clips the zoom to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0036 begin`);
      logInfo("zoomClamp(-0.5, -10, -1)");
      const actual: number = zoomClamp(-0.5, -10, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ZoomClamp_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0037
     * @tc.name      Camera_ZoomClamp_0037
     * @tc.desc      zoomClamp(1, 1, 1) clips the zoom to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0037 begin`);
      logInfo("zoomClamp(1, 1, 1)");
      const actual: number = zoomClamp(1, 1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0038
     * @tc.name      Camera_ZoomClamp_0038
     * @tc.desc      zoomClamp(6, 6, 6) clips the zoom to 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0038 begin`);
      logInfo("zoomClamp(6, 6, 6)");
      const actual: number = zoomClamp(6, 6, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ZoomClamp_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0039
     * @tc.name      Camera_ZoomClamp_0039
     * @tc.desc      zoomClamp(0, 0, 0) clips the zoom to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0039 begin`);
      logInfo("zoomClamp(0, 0, 0)");
      const actual: number = zoomClamp(0, 0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ZoomClamp_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0040
     * @tc.name      Camera_ZoomClamp_0040
     * @tc.desc      zoomClamp(100, 100, 100) clips the zoom to 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0040 begin`);
      logInfo("zoomClamp(100, 100, 100)");
      const actual: number = zoomClamp(100, 100, 100);
      logInfo('actual=' + String(actual) + ', expected=' + "100");
      expect(actual).assertEqual(100);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0041
     * @tc.name      Camera_ZoomClamp_0041
     * @tc.desc      zoomClamp(-100, -100, -100) clips the zoom to -100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0041 begin`);
      logInfo("zoomClamp(-100, -100, -100)");
      const actual: number = zoomClamp(-100, -100, -100);
      logInfo('actual=' + String(actual) + ', expected=' + "-100");
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}ZoomClamp_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0042
     * @tc.name      Camera_ZoomClamp_0042
     * @tc.desc      zoomClamp(3.14, 0, 3.14) clips the zoom to 3.14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0042 begin`);
      logInfo("zoomClamp(3.14, 0, 3.14)");
      const actual: number = zoomClamp(3.14, 0, 3.14);
      logInfo('actual=' + String(actual) + ', expected=' + "3.14");
      expect(actual).assertEqual(3.14);
      logInfo(`${BUNDLE}ZoomClamp_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0043
     * @tc.name      Camera_ZoomClamp_0043
     * @tc.desc      zoomClamp(3.14, 3.14, 6) clips the zoom to 3.14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0043 begin`);
      logInfo("zoomClamp(3.14, 3.14, 6)");
      const actual: number = zoomClamp(3.14, 3.14, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "3.14");
      expect(actual).assertEqual(3.14);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0044
     * @tc.name      Camera_ZoomClamp_0044
     * @tc.desc      zoomClamp(2.718, 0, 3.14) clips the zoom to 2.718.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0044 begin`);
      logInfo("zoomClamp(2.718, 0, 3.14)");
      const actual: number = zoomClamp(2.718, 0, 3.14);
      logInfo('actual=' + String(actual) + ', expected=' + "2.718");
      expect(actual).assertEqual(2.718);
      logInfo(`${BUNDLE}ZoomClamp_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0045
     * @tc.name      Camera_ZoomClamp_0045
     * @tc.desc      zoomClamp(-2.718, -3.14, 0) clips the zoom to -2.718.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomClamp_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomClamp_0045 begin`);
      logInfo("zoomClamp(-2.718, -3.14, 0)");
      const actual: number = zoomClamp(-2.718, -3.14, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-2.718");
      expect(actual).assertEqual(-2.718);
      logInfo(`${BUNDLE}ZoomClamp_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0046
     * @tc.name      Camera_ZoomClamp_0046
     * @tc.desc      zoomClamp(999, 1, 6) clips the zoom to 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0046 begin`);
      logInfo("zoomClamp(999, 1, 6)");
      const actual: number = zoomClamp(999, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0046 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0047
     * @tc.name      Camera_ZoomClamp_0047
     * @tc.desc      zoomClamp(-999, 1, 6) clips the zoom to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0047 begin`);
      logInfo("zoomClamp(-999, 1, 6)");
      const actual: number = zoomClamp(-999, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomClamp_0047 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CLAMP_0048
     * @tc.name      Camera_ZoomClamp_0048
     * @tc.desc      zoomClamp(0.000001, 1, 6) clips the zoom to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomClamp_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0048 begin`);
      logInfo("zoomClamp(0.000001, 1, 6)");
      const actual: number = zoomClamp(0.000001, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomClamp_0048 end`);
    });
  });
}
