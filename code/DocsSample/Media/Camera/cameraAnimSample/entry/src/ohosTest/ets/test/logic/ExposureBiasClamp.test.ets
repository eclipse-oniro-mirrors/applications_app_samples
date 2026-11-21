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
