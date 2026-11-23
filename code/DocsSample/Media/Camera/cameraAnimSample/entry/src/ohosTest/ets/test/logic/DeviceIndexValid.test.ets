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
  deviceIndexValid,
} from '../model/CameraLogic';

/** DeviceIndexValidTest logic checks (46 cases). */
export default function deviceIndexValidTest(): void {
  describe('DeviceIndexValidTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0001
     * @tc.name      Camera_DeviceIndexValid_0001
     * @tc.desc      deviceIndexValid(0, -1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_DeviceIndexValid_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0001 begin`);
      logInfo("deviceIndexValid(0, -1)");
      const actual: boolean = deviceIndexValid(0, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0002
     * @tc.name      Camera_DeviceIndexValid_0002
     * @tc.desc      deviceIndexValid(0, 0) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0002 begin`);
      logInfo("deviceIndexValid(0, 0)");
      const actual: boolean = deviceIndexValid(0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0003
     * @tc.name      Camera_DeviceIndexValid_0003
     * @tc.desc      deviceIndexValid(0, 1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0003 begin`);
      logInfo("deviceIndexValid(0, 1)");
      const actual: boolean = deviceIndexValid(0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0004
     * @tc.name      Camera_DeviceIndexValid_0004
     * @tc.desc      deviceIndexValid(0, 2) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0004 begin`);
      logInfo("deviceIndexValid(0, 2)");
      const actual: boolean = deviceIndexValid(0, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0005
     * @tc.name      Camera_DeviceIndexValid_0005
     * @tc.desc      deviceIndexValid(0, 4) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0005 begin`);
      logInfo("deviceIndexValid(0, 4)");
      const actual: boolean = deviceIndexValid(0, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0006
     * @tc.name      Camera_DeviceIndexValid_0006
     * @tc.desc      deviceIndexValid(0, 5) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0006 begin`);
      logInfo("deviceIndexValid(0, 5)");
      const actual: boolean = deviceIndexValid(0, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0007
     * @tc.name      Camera_DeviceIndexValid_0007
     * @tc.desc      deviceIndexValid(0, 6) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0007 begin`);
      logInfo("deviceIndexValid(0, 6)");
      const actual: boolean = deviceIndexValid(0, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0008
     * @tc.name      Camera_DeviceIndexValid_0008
     * @tc.desc      deviceIndexValid(0, 8) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0008 begin`);
      logInfo("deviceIndexValid(0, 8)");
      const actual: boolean = deviceIndexValid(0, 8);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0009
     * @tc.name      Camera_DeviceIndexValid_0009
     * @tc.desc      deviceIndexValid(1, -1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0009 begin`);
      logInfo("deviceIndexValid(1, -1)");
      const actual: boolean = deviceIndexValid(1, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}DeviceIndexValid_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0010
     * @tc.name      Camera_DeviceIndexValid_0010
     * @tc.desc      deviceIndexValid(1, 0) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0010 begin`);
      logInfo("deviceIndexValid(1, 0)");
      const actual: boolean = deviceIndexValid(1, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0011
     * @tc.name      Camera_DeviceIndexValid_0011
     * @tc.desc      deviceIndexValid(1, 2) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0011 begin`);
      logInfo("deviceIndexValid(1, 2)");
      const actual: boolean = deviceIndexValid(1, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0012
     * @tc.name      Camera_DeviceIndexValid_0012
     * @tc.desc      deviceIndexValid(1, 3) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_DeviceIndexValid_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0012 begin`);
      logInfo("deviceIndexValid(1, 3)");
      const actual: boolean = deviceIndexValid(1, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0013
     * @tc.name      Camera_DeviceIndexValid_0013
     * @tc.desc      deviceIndexValid(1, 4) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0013 begin`);
      logInfo("deviceIndexValid(1, 4)");
      const actual: boolean = deviceIndexValid(1, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0014
     * @tc.name      Camera_DeviceIndexValid_0014
     * @tc.desc      deviceIndexValid(1, 5) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0014 begin`);
      logInfo("deviceIndexValid(1, 5)");
      const actual: boolean = deviceIndexValid(1, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0015
     * @tc.name      Camera_DeviceIndexValid_0015
     * @tc.desc      deviceIndexValid(1, 7) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0015 begin`);
      logInfo("deviceIndexValid(1, 7)");
      const actual: boolean = deviceIndexValid(1, 7);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0016
     * @tc.name      Camera_DeviceIndexValid_0016
     * @tc.desc      deviceIndexValid(1, 8) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0016 begin`);
      logInfo("deviceIndexValid(1, 8)");
      const actual: boolean = deviceIndexValid(1, 8);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0017
     * @tc.name      Camera_DeviceIndexValid_0017
     * @tc.desc      deviceIndexValid(2, -1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0017 begin`);
      logInfo("deviceIndexValid(2, -1)");
      const actual: boolean = deviceIndexValid(2, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}DeviceIndexValid_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0018
     * @tc.name      Camera_DeviceIndexValid_0018
     * @tc.desc      deviceIndexValid(2, 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_DeviceIndexValid_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0018 begin`);
      logInfo("deviceIndexValid(2, 1)");
      const actual: boolean = deviceIndexValid(2, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}DeviceIndexValid_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0019
     * @tc.name      Camera_DeviceIndexValid_0019
     * @tc.desc      deviceIndexValid(2, 2) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0019 begin`);
      logInfo("deviceIndexValid(2, 2)");
      const actual: boolean = deviceIndexValid(2, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0020
     * @tc.name      Camera_DeviceIndexValid_0020
     * @tc.desc      deviceIndexValid(2, 3) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0020 begin`);
      logInfo("deviceIndexValid(2, 3)");
      const actual: boolean = deviceIndexValid(2, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0021
     * @tc.name      Camera_DeviceIndexValid_0021
     * @tc.desc      deviceIndexValid(2, 5) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0021 begin`);
      logInfo("deviceIndexValid(2, 5)");
      const actual: boolean = deviceIndexValid(2, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0022
     * @tc.name      Camera_DeviceIndexValid_0022
     * @tc.desc      deviceIndexValid(2, 6) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0022 begin`);
      logInfo("deviceIndexValid(2, 6)");
      const actual: boolean = deviceIndexValid(2, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0023
     * @tc.name      Camera_DeviceIndexValid_0023
     * @tc.desc      deviceIndexValid(2, 7) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_DeviceIndexValid_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0023 begin`);
      logInfo("deviceIndexValid(2, 7)");
      const actual: boolean = deviceIndexValid(2, 7);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0024
     * @tc.name      Camera_DeviceIndexValid_0024
     * @tc.desc      deviceIndexValid(3, -1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0024 begin`);
      logInfo("deviceIndexValid(3, -1)");
      const actual: boolean = deviceIndexValid(3, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}DeviceIndexValid_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0025
     * @tc.name      Camera_DeviceIndexValid_0025
     * @tc.desc      deviceIndexValid(3, 0) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0025 begin`);
      logInfo("deviceIndexValid(3, 0)");
      const actual: boolean = deviceIndexValid(3, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0026
     * @tc.name      Camera_DeviceIndexValid_0026
     * @tc.desc      deviceIndexValid(3, 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0026 begin`);
      logInfo("deviceIndexValid(3, 1)");
      const actual: boolean = deviceIndexValid(3, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}DeviceIndexValid_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0027
     * @tc.name      Camera_DeviceIndexValid_0027
     * @tc.desc      deviceIndexValid(3, 2) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0027 begin`);
      logInfo("deviceIndexValid(3, 2)");
      const actual: boolean = deviceIndexValid(3, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}DeviceIndexValid_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0028
     * @tc.name      Camera_DeviceIndexValid_0028
     * @tc.desc      deviceIndexValid(3, 4) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0028 begin`);
      logInfo("deviceIndexValid(3, 4)");
      const actual: boolean = deviceIndexValid(3, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0029
     * @tc.name      Camera_DeviceIndexValid_0029
     * @tc.desc      deviceIndexValid(3, 5) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0029 begin`);
      logInfo("deviceIndexValid(3, 5)");
      const actual: boolean = deviceIndexValid(3, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0030
     * @tc.name      Camera_DeviceIndexValid_0030
     * @tc.desc      deviceIndexValid(3, 6) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0030 begin`);
      logInfo("deviceIndexValid(3, 6)");
      const actual: boolean = deviceIndexValid(3, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0031
     * @tc.name      Camera_DeviceIndexValid_0031
     * @tc.desc      deviceIndexValid(3, 8) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0031 begin`);
      logInfo("deviceIndexValid(3, 8)");
      const actual: boolean = deviceIndexValid(3, 8);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0032
     * @tc.name      Camera_DeviceIndexValid_0032
     * @tc.desc      deviceIndexValid(4, -1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0032 begin`);
      logInfo("deviceIndexValid(4, -1)");
      const actual: boolean = deviceIndexValid(4, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}DeviceIndexValid_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0033
     * @tc.name      Camera_DeviceIndexValid_0033
     * @tc.desc      deviceIndexValid(4, 0) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0033 begin`);
      logInfo("deviceIndexValid(4, 0)");
      const actual: boolean = deviceIndexValid(4, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}DeviceIndexValid_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0034
     * @tc.name      Camera_DeviceIndexValid_0034
     * @tc.desc      deviceIndexValid(4, 2) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_DeviceIndexValid_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0034 begin`);
      logInfo("deviceIndexValid(4, 2)");
      const actual: boolean = deviceIndexValid(4, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0035
     * @tc.name      Camera_DeviceIndexValid_0035
     * @tc.desc      deviceIndexValid(4, 3) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_DeviceIndexValid_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0035 begin`);
      logInfo("deviceIndexValid(4, 3)");
      const actual: boolean = deviceIndexValid(4, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}DeviceIndexValid_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0036
     * @tc.name      Camera_DeviceIndexValid_0036
     * @tc.desc      deviceIndexValid(4, 4) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0036 begin`);
      logInfo("deviceIndexValid(4, 4)");
      const actual: boolean = deviceIndexValid(4, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0037
     * @tc.name      Camera_DeviceIndexValid_0037
     * @tc.desc      deviceIndexValid(4, 5) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0037 begin`);
      logInfo("deviceIndexValid(4, 5)");
      const actual: boolean = deviceIndexValid(4, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0038
     * @tc.name      Camera_DeviceIndexValid_0038
     * @tc.desc      deviceIndexValid(4, 7) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0038 begin`);
      logInfo("deviceIndexValid(4, 7)");
      const actual: boolean = deviceIndexValid(4, 7);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0039
     * @tc.name      Camera_DeviceIndexValid_0039
     * @tc.desc      deviceIndexValid(4, 8) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0039 begin`);
      logInfo("deviceIndexValid(4, 8)");
      const actual: boolean = deviceIndexValid(4, 8);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0040
     * @tc.name      Camera_DeviceIndexValid_0040
     * @tc.desc      deviceIndexValid(5, -1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0040 begin`);
      logInfo("deviceIndexValid(5, -1)");
      const actual: boolean = deviceIndexValid(5, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0041
     * @tc.name      Camera_DeviceIndexValid_0041
     * @tc.desc      deviceIndexValid(5, 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0041 begin`);
      logInfo("deviceIndexValid(5, 1)");
      const actual: boolean = deviceIndexValid(5, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}DeviceIndexValid_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0042
     * @tc.name      Camera_DeviceIndexValid_0042
     * @tc.desc      deviceIndexValid(5, 2) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0042 begin`);
      logInfo("deviceIndexValid(5, 2)");
      const actual: boolean = deviceIndexValid(5, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}DeviceIndexValid_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0043
     * @tc.name      Camera_DeviceIndexValid_0043
     * @tc.desc      deviceIndexValid(5, 3) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0043 begin`);
      logInfo("deviceIndexValid(5, 3)");
      const actual: boolean = deviceIndexValid(5, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0044
     * @tc.name      Camera_DeviceIndexValid_0044
     * @tc.desc      deviceIndexValid(5, 5) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0044 begin`);
      logInfo("deviceIndexValid(5, 5)");
      const actual: boolean = deviceIndexValid(5, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0045
     * @tc.name      Camera_DeviceIndexValid_0045
     * @tc.desc      deviceIndexValid(5, 6) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_DeviceIndexValid_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0045 begin`);
      logInfo("deviceIndexValid(5, 6)");
      const actual: boolean = deviceIndexValid(5, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}DeviceIndexValid_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_DEVICE_INDEX_VALID_0046
     * @tc.name      Camera_DeviceIndexValid_0046
     * @tc.desc      deviceIndexValid(5, 7) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_DeviceIndexValid_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceIndexValid_0046 begin`);
      logInfo("deviceIndexValid(5, 7)");
      const actual: boolean = deviceIndexValid(5, 7);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}DeviceIndexValid_0046 end`);
    });
  });
}
