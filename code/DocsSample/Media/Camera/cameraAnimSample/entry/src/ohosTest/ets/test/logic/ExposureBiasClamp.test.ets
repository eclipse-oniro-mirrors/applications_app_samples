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
  exposureBiasClamped,
} from '../model/CameraLogic';

/** ExposureBiasClampTest logic checks (47 cases). */
export default function exposureBiasClampTest(): void {
  describe('ExposureBiasClampTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0001
     * @tc.name      Camera_ExposureBiasClamp_0001
     * @tc.desc      exposureBiasClamped(0, -4, 4) resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ExposureBiasClamp_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0001 begin`);
      logInfo("exposureBiasClamped(0, -4, 4)");
      const actual: number = exposureBiasClamped(0, -4, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0002
     * @tc.name      Camera_ExposureBiasClamp_0002
     * @tc.desc      exposureBiasClamped(4, -4, 4) resolves to 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0002 begin`);
      logInfo("exposureBiasClamped(4, -4, 4)");
      const actual: number = exposureBiasClamped(4, -4, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}ExposureBiasClamp_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0003
     * @tc.name      Camera_ExposureBiasClamp_0003
     * @tc.desc      exposureBiasClamped(-4, -4, 4) resolves to -4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0003 begin`);
      logInfo("exposureBiasClamped(-4, -4, 4)");
      const actual: number = exposureBiasClamped(-4, -4, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "-4");
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}ExposureBiasClamp_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0004
     * @tc.name      Camera_ExposureBiasClamp_0004
     * @tc.desc      exposureBiasClamped(5, -4, 4) resolves to 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0004 begin`);
      logInfo("exposureBiasClamped(5, -4, 4)");
      const actual: number = exposureBiasClamped(5, -4, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0005
     * @tc.name      Camera_ExposureBiasClamp_0005
     * @tc.desc      exposureBiasClamped(-5, -4, 4) resolves to -4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0005 begin`);
      logInfo("exposureBiasClamped(-5, -4, 4)");
      const actual: number = exposureBiasClamped(-5, -4, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "-4");
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}ExposureBiasClamp_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0006
     * @tc.name      Camera_ExposureBiasClamp_0006
     * @tc.desc      exposureBiasClamped(1.5, -2, 2) resolves to 1.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0006 begin`);
      logInfo("exposureBiasClamped(1.5, -2, 2)");
      const actual: number = exposureBiasClamped(1.5, -2, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "1.5");
      expect(actual).assertEqual(1.5);
      logInfo(`${BUNDLE}ExposureBiasClamp_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0007
     * @tc.name      Camera_ExposureBiasClamp_0007
     * @tc.desc      exposureBiasClamped(2.5, -2, 2) resolves to 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0007 begin`);
      logInfo("exposureBiasClamped(2.5, -2, 2)");
      const actual: number = exposureBiasClamped(2.5, -2, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0008
     * @tc.name      Camera_ExposureBiasClamp_0008
     * @tc.desc      exposureBiasClamped(-2.5, -2, 2) resolves to -2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0008 begin`);
      logInfo("exposureBiasClamped(-2.5, -2, 2)");
      const actual: number = exposureBiasClamped(-2.5, -2, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "-2");
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}ExposureBiasClamp_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0009
     * @tc.name      Camera_ExposureBiasClamp_0009
     * @tc.desc      exposureBiasClamped(0.1, 0, 1) resolves to 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0009 begin`);
      logInfo("exposureBiasClamped(0.1, 0, 1)");
      const actual: number = exposureBiasClamped(0.1, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}ExposureBiasClamp_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0010
     * @tc.name      Camera_ExposureBiasClamp_0010
     * @tc.desc      exposureBiasClamped(0, 0, 1) resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0010 begin`);
      logInfo("exposureBiasClamped(0, 0, 1)");
      const actual: number = exposureBiasClamped(0, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0011
     * @tc.name      Camera_ExposureBiasClamp_0011
     * @tc.desc      exposureBiasClamped(1, 0, 1) resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0011 begin`);
      logInfo("exposureBiasClamped(1, 0, 1)");
      const actual: number = exposureBiasClamped(1, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ExposureBiasClamp_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0012
     * @tc.name      Camera_ExposureBiasClamp_0012
     * @tc.desc      exposureBiasClamped(2, 0, 1) resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ExposureBiasClamp_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0012 begin`);
      logInfo("exposureBiasClamped(2, 0, 1)");
      const actual: number = exposureBiasClamped(2, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ExposureBiasClamp_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0013
     * @tc.name      Camera_ExposureBiasClamp_0013
     * @tc.desc      exposureBiasClamped(-1, 0, 1) resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0013 begin`);
      logInfo("exposureBiasClamped(-1, 0, 1)");
      const actual: number = exposureBiasClamped(-1, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0014
     * @tc.name      Camera_ExposureBiasClamp_0014
     * @tc.desc      exposureBiasClamped(3.14, -3.14, 3.14) resolves to 3.14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0014 begin`);
      logInfo("exposureBiasClamped(3.14, -3.14, 3.14)");
      const actual: number = exposureBiasClamped(3.14, -3.14, 3.14);
      logInfo('actual=' + String(actual) + ', expected=' + "3.14");
      expect(actual).assertEqual(3.14);
      logInfo(`${BUNDLE}ExposureBiasClamp_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0015
     * @tc.name      Camera_ExposureBiasClamp_0015
     * @tc.desc      exposureBiasClamped(-3.14, -3.14, 3.14) resolves to -3.14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0015 begin`);
      logInfo("exposureBiasClamped(-3.14, -3.14, 3.14)");
      const actual: number = exposureBiasClamped(-3.14, -3.14, 3.14);
      logInfo('actual=' + String(actual) + ', expected=' + "-3.14");
      expect(actual).assertEqual(-3.14);
      logInfo(`${BUNDLE}ExposureBiasClamp_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0016
     * @tc.name      Camera_ExposureBiasClamp_0016
     * @tc.desc      exposureBiasClamped(100, -100, 100) resolves to 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0016 begin`);
      logInfo("exposureBiasClamped(100, -100, 100)");
      const actual: number = exposureBiasClamped(100, -100, 100);
      logInfo('actual=' + String(actual) + ', expected=' + "100");
      expect(actual).assertEqual(100);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0017
     * @tc.name      Camera_ExposureBiasClamp_0017
     * @tc.desc      exposureBiasClamped(-100, -100, 100) resolves to -100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0017 begin`);
      logInfo("exposureBiasClamped(-100, -100, 100)");
      const actual: number = exposureBiasClamped(-100, -100, 100);
      logInfo('actual=' + String(actual) + ', expected=' + "-100");
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}ExposureBiasClamp_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0018
     * @tc.name      Camera_ExposureBiasClamp_0018
     * @tc.desc      exposureBiasClamped(101, -100, 100) resolves to 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ExposureBiasClamp_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0018 begin`);
      logInfo("exposureBiasClamped(101, -100, 100)");
      const actual: number = exposureBiasClamped(101, -100, 100);
      logInfo('actual=' + String(actual) + ', expected=' + "100");
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ExposureBiasClamp_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0019
     * @tc.name      Camera_ExposureBiasClamp_0019
     * @tc.desc      exposureBiasClamped(-101, -100, 100) resolves to -100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0019 begin`);
      logInfo("exposureBiasClamped(-101, -100, 100)");
      const actual: number = exposureBiasClamped(-101, -100, 100);
      logInfo('actual=' + String(actual) + ', expected=' + "-100");
      expect(actual).assertEqual(-100);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0020
     * @tc.name      Camera_ExposureBiasClamp_0020
     * @tc.desc      exposureBiasClamped(6, 1, 6) resolves to 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0020 begin`);
      logInfo("exposureBiasClamped(6, 1, 6)");
      const actual: number = exposureBiasClamped(6, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ExposureBiasClamp_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0021
     * @tc.name      Camera_ExposureBiasClamp_0021
     * @tc.desc      exposureBiasClamped(7, 1, 6) resolves to 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0021 begin`);
      logInfo("exposureBiasClamped(7, 1, 6)");
      const actual: number = exposureBiasClamped(7, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ExposureBiasClamp_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0022
     * @tc.name      Camera_ExposureBiasClamp_0022
     * @tc.desc      exposureBiasClamped(0, 1, 6) resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0022 begin`);
      logInfo("exposureBiasClamped(0, 1, 6)");
      const actual: number = exposureBiasClamped(0, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0023
     * @tc.name      Camera_ExposureBiasClamp_0023
     * @tc.desc      exposureBiasClamped(5.5, 1, 6) resolves to 5.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ExposureBiasClamp_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0023 begin`);
      logInfo("exposureBiasClamped(5.5, 1, 6)");
      const actual: number = exposureBiasClamped(5.5, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "5.5");
      expect(actual).assertEqual(5.5);
      logInfo(`${BUNDLE}ExposureBiasClamp_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0024
     * @tc.name      Camera_ExposureBiasClamp_0024
     * @tc.desc      exposureBiasClamped(99, 1, 6) resolves to 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0024 begin`);
      logInfo("exposureBiasClamped(99, 1, 6)");
      const actual: number = exposureBiasClamped(99, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ExposureBiasClamp_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0025
     * @tc.name      Camera_ExposureBiasClamp_0025
     * @tc.desc      exposureBiasClamped(-99, 1, 6) resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0025 begin`);
      logInfo("exposureBiasClamped(-99, 1, 6)");
      const actual: number = exposureBiasClamped(-99, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0026
     * @tc.name      Camera_ExposureBiasClamp_0026
     * @tc.desc      exposureBiasClamped(1, 1, 1) resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0026 begin`);
      logInfo("exposureBiasClamped(1, 1, 1)");
      const actual: number = exposureBiasClamped(1, 1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ExposureBiasClamp_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0027
     * @tc.name      Camera_ExposureBiasClamp_0027
     * @tc.desc      exposureBiasClamped(2, 1, 1) resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0027 begin`);
      logInfo("exposureBiasClamped(2, 1, 1)");
      const actual: number = exposureBiasClamped(2, 1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ExposureBiasClamp_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0028
     * @tc.name      Camera_ExposureBiasClamp_0028
     * @tc.desc      exposureBiasClamped(0, 1, 1) resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0028 begin`);
      logInfo("exposureBiasClamped(0, 1, 1)");
      const actual: number = exposureBiasClamped(0, 1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0029
     * @tc.name      Camera_ExposureBiasClamp_0029
     * @tc.desc      exposureBiasClamped(0.5, 0.25, 0.75) resolves to 0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0029 begin`);
      logInfo("exposureBiasClamped(0.5, 0.25, 0.75)");
      const actual: number = exposureBiasClamped(0.5, 0.25, 0.75);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5");
      expect(actual).assertEqual(0.5);
      logInfo(`${BUNDLE}ExposureBiasClamp_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0030
     * @tc.name      Camera_ExposureBiasClamp_0030
     * @tc.desc      exposureBiasClamped(0.75, 0.25, 0.75) resolves to 0.75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0030 begin`);
      logInfo("exposureBiasClamped(0.75, 0.25, 0.75)");
      const actual: number = exposureBiasClamped(0.75, 0.25, 0.75);
      logInfo('actual=' + String(actual) + ', expected=' + "0.75");
      expect(actual).assertEqual(0.75);
      logInfo(`${BUNDLE}ExposureBiasClamp_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0031
     * @tc.name      Camera_ExposureBiasClamp_0031
     * @tc.desc      exposureBiasClamped(0.25, 0.25, 0.75) resolves to 0.25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0031 begin`);
      logInfo("exposureBiasClamped(0.25, 0.25, 0.75)");
      const actual: number = exposureBiasClamped(0.25, 0.25, 0.75);
      logInfo('actual=' + String(actual) + ', expected=' + "0.25");
      expect(actual).assertEqual(0.25);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0032
     * @tc.name      Camera_ExposureBiasClamp_0032
     * @tc.desc      exposureBiasClamped(0.1, 0.25, 0.75) resolves to 0.25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0032 begin`);
      logInfo("exposureBiasClamped(0.1, 0.25, 0.75)");
      const actual: number = exposureBiasClamped(0.1, 0.25, 0.75);
      logInfo('actual=' + String(actual) + ', expected=' + "0.25");
      expect(actual).assertEqual(0.25);
      logInfo(`${BUNDLE}ExposureBiasClamp_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0033
     * @tc.name      Camera_ExposureBiasClamp_0033
     * @tc.desc      exposureBiasClamped(0.9, 0.25, 0.75) resolves to 0.75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0033 begin`);
      logInfo("exposureBiasClamped(0.9, 0.25, 0.75)");
      const actual: number = exposureBiasClamped(0.9, 0.25, 0.75);
      logInfo('actual=' + String(actual) + ', expected=' + "0.75");
      expect(actual).assertEqual(0.75);
      logInfo(`${BUNDLE}ExposureBiasClamp_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0034
     * @tc.name      Camera_ExposureBiasClamp_0034
     * @tc.desc      exposureBiasClamped(10, 0, 10) resolves to 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ExposureBiasClamp_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0034 begin`);
      logInfo("exposureBiasClamped(10, 0, 10)");
      const actual: number = exposureBiasClamped(10, 0, 10);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0035
     * @tc.name      Camera_ExposureBiasClamp_0035
     * @tc.desc      exposureBiasClamped(11, 0, 10) resolves to 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ExposureBiasClamp_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0035 begin`);
      logInfo("exposureBiasClamped(11, 0, 10)");
      const actual: number = exposureBiasClamped(11, 0, 10);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ExposureBiasClamp_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0036
     * @tc.name      Camera_ExposureBiasClamp_0036
     * @tc.desc      exposureBiasClamped(-1, 0, 10) resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0036 begin`);
      logInfo("exposureBiasClamped(-1, 0, 10)");
      const actual: number = exposureBiasClamped(-1, 0, 10);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ExposureBiasClamp_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0037
     * @tc.name      Camera_ExposureBiasClamp_0037
     * @tc.desc      exposureBiasClamped(3, -1, 1) resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0037 begin`);
      logInfo("exposureBiasClamped(3, -1, 1)");
      const actual: number = exposureBiasClamped(3, -1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0038
     * @tc.name      Camera_ExposureBiasClamp_0038
     * @tc.desc      exposureBiasClamped(-3, -1, 1) resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0038 begin`);
      logInfo("exposureBiasClamped(-3, -1, 1)");
      const actual: number = exposureBiasClamped(-3, -1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExposureBiasClamp_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0039
     * @tc.name      Camera_ExposureBiasClamp_0039
     * @tc.desc      exposureBiasClamped(0, -1, 1) resolves to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0039 begin`);
      logInfo("exposureBiasClamped(0, -1, 1)");
      const actual: number = exposureBiasClamped(0, -1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ExposureBiasClamp_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0040
     * @tc.name      Camera_ExposureBiasClamp_0040
     * @tc.desc      exposureBiasClamped(2, -1, 1) resolves to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0040 begin`);
      logInfo("exposureBiasClamped(2, -1, 1)");
      const actual: number = exposureBiasClamped(2, -1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0041
     * @tc.name      Camera_ExposureBiasClamp_0041
     * @tc.desc      exposureBiasClamped(-2, -1, 1) resolves to -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0041 begin`);
      logInfo("exposureBiasClamped(-2, -1, 1)");
      const actual: number = exposureBiasClamped(-2, -1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ExposureBiasClamp_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0042
     * @tc.name      Camera_ExposureBiasClamp_0042
     * @tc.desc      exposureBiasClamped(1.999, -2, 2) resolves to 1.999.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0042 begin`);
      logInfo("exposureBiasClamped(1.999, -2, 2)");
      const actual: number = exposureBiasClamped(1.999, -2, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "1.999");
      expect(actual).assertEqual(1.999);
      logInfo(`${BUNDLE}ExposureBiasClamp_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0043
     * @tc.name      Camera_ExposureBiasClamp_0043
     * @tc.desc      exposureBiasClamped(2.001, -2, 2) resolves to 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0043 begin`);
      logInfo("exposureBiasClamped(2.001, -2, 2)");
      const actual: number = exposureBiasClamped(2.001, -2, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0044
     * @tc.name      Camera_ExposureBiasClamp_0044
     * @tc.desc      exposureBiasClamped(-1.999, -2, 2) resolves to -1.999.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0044 begin`);
      logInfo("exposureBiasClamped(-1.999, -2, 2)");
      const actual: number = exposureBiasClamped(-1.999, -2, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "-1.999");
      expect(actual).assertEqual(-1.999);
      logInfo(`${BUNDLE}ExposureBiasClamp_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0045
     * @tc.name      Camera_ExposureBiasClamp_0045
     * @tc.desc      exposureBiasClamped(-2.001, -2, 2) resolves to -2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ExposureBiasClamp_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0045 begin`);
      logInfo("exposureBiasClamped(-2.001, -2, 2)");
      const actual: number = exposureBiasClamped(-2.001, -2, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "-2");
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}ExposureBiasClamp_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0046
     * @tc.name      Camera_ExposureBiasClamp_0046
     * @tc.desc      exposureBiasClamped(12345, -1000, 1000) resolves to 1000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0046 begin`);
      logInfo("exposureBiasClamped(12345, -1000, 1000)");
      const actual: number = exposureBiasClamped(12345, -1000, 1000);
      logInfo('actual=' + String(actual) + ', expected=' + "1000");
      expect(actual).assertEqual(1000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ExposureBiasClamp_0046 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EXPOSURE_CLAMP_0047
     * @tc.name      Camera_ExposureBiasClamp_0047
     * @tc.desc      exposureBiasClamped(-12345, -1000, 1000) resolves to -1000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ExposureBiasClamp_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExposureBiasClamp_0047 begin`);
      logInfo("exposureBiasClamped(-12345, -1000, 1000)");
      const actual: number = exposureBiasClamped(-12345, -1000, 1000);
      logInfo('actual=' + String(actual) + ', expected=' + "-1000");
      expect(actual).assertEqual(-1000);
      logInfo(`${BUNDLE}ExposureBiasClamp_0047 end`);
    });
  });
}
