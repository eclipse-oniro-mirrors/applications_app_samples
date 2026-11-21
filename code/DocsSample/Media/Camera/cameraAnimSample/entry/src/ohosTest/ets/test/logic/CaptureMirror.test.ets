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
  mirrorForCapture,
} from '../model/CameraLogic';

/** CaptureMirrorTest logic checks (45 cases). */
export default function captureMirrorTest(): void {
  describe('CaptureMirrorTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0001
     * @tc.name      Camera_CaptureMirror_0001
     * @tc.desc      mirrorForCapture(0) reports false for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CaptureMirror_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CaptureMirror_0001 begin`);
      logInfo("mirrorForCapture(0)");
      const actual: boolean = mirrorForCapture(0);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0002
     * @tc.name      Camera_CaptureMirror_0002
     * @tc.desc      mirrorForCapture(1) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0002 begin`);
      logInfo("mirrorForCapture(1)");
      const actual: boolean = mirrorForCapture(1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0003
     * @tc.name      Camera_CaptureMirror_0003
     * @tc.desc      mirrorForCapture(2) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0003 begin`);
      logInfo("mirrorForCapture(2)");
      const actual: boolean = mirrorForCapture(2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0004
     * @tc.name      Camera_CaptureMirror_0004
     * @tc.desc      mirrorForCapture(3) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0004 begin`);
      logInfo("mirrorForCapture(3)");
      const actual: boolean = mirrorForCapture(3);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0005
     * @tc.name      Camera_CaptureMirror_0005
     * @tc.desc      mirrorForCapture(4) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0005 begin`);
      logInfo("mirrorForCapture(4)");
      const actual: boolean = mirrorForCapture(4);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0006
     * @tc.name      Camera_CaptureMirror_0006
     * @tc.desc      mirrorForCapture(5) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0006 begin`);
      logInfo("mirrorForCapture(5)");
      const actual: boolean = mirrorForCapture(5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0007
     * @tc.name      Camera_CaptureMirror_0007
     * @tc.desc      mirrorForCapture(6) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0007 begin`);
      logInfo("mirrorForCapture(6)");
      const actual: boolean = mirrorForCapture(6);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0008
     * @tc.name      Camera_CaptureMirror_0008
     * @tc.desc      mirrorForCapture(7) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0008 begin`);
      logInfo("mirrorForCapture(7)");
      const actual: boolean = mirrorForCapture(7);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0009
     * @tc.name      Camera_CaptureMirror_0009
     * @tc.desc      mirrorForCapture(8) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0009 begin`);
      logInfo("mirrorForCapture(8)");
      const actual: boolean = mirrorForCapture(8);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0010
     * @tc.name      Camera_CaptureMirror_0010
     * @tc.desc      mirrorForCapture(9) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0010 begin`);
      logInfo("mirrorForCapture(9)");
      const actual: boolean = mirrorForCapture(9);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0011
     * @tc.name      Camera_CaptureMirror_0011
     * @tc.desc      mirrorForCapture(10) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0011 begin`);
      logInfo("mirrorForCapture(10)");
      const actual: boolean = mirrorForCapture(10);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0012
     * @tc.name      Camera_CaptureMirror_0012
     * @tc.desc      mirrorForCapture(11) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CaptureMirror_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CaptureMirror_0012 begin`);
      logInfo("mirrorForCapture(11)");
      const actual: boolean = mirrorForCapture(11);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0013
     * @tc.name      Camera_CaptureMirror_0013
     * @tc.desc      mirrorForCapture(12) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0013 begin`);
      logInfo("mirrorForCapture(12)");
      const actual: boolean = mirrorForCapture(12);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0014
     * @tc.name      Camera_CaptureMirror_0014
     * @tc.desc      mirrorForCapture(13) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0014 begin`);
      logInfo("mirrorForCapture(13)");
      const actual: boolean = mirrorForCapture(13);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0015
     * @tc.name      Camera_CaptureMirror_0015
     * @tc.desc      mirrorForCapture(14) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0015 begin`);
      logInfo("mirrorForCapture(14)");
      const actual: boolean = mirrorForCapture(14);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0016
     * @tc.name      Camera_CaptureMirror_0016
     * @tc.desc      mirrorForCapture(15) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0016 begin`);
      logInfo("mirrorForCapture(15)");
      const actual: boolean = mirrorForCapture(15);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0017
     * @tc.name      Camera_CaptureMirror_0017
     * @tc.desc      mirrorForCapture(16) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0017 begin`);
      logInfo("mirrorForCapture(16)");
      const actual: boolean = mirrorForCapture(16);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0018
     * @tc.name      Camera_CaptureMirror_0018
     * @tc.desc      mirrorForCapture(17) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_CaptureMirror_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CaptureMirror_0018 begin`);
      logInfo("mirrorForCapture(17)");
      const actual: boolean = mirrorForCapture(17);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0019
     * @tc.name      Camera_CaptureMirror_0019
     * @tc.desc      mirrorForCapture(18) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0019 begin`);
      logInfo("mirrorForCapture(18)");
      const actual: boolean = mirrorForCapture(18);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0020
     * @tc.name      Camera_CaptureMirror_0020
     * @tc.desc      mirrorForCapture(19) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0020 begin`);
      logInfo("mirrorForCapture(19)");
      const actual: boolean = mirrorForCapture(19);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0021
     * @tc.name      Camera_CaptureMirror_0021
     * @tc.desc      mirrorForCapture(20) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0021 begin`);
      logInfo("mirrorForCapture(20)");
      const actual: boolean = mirrorForCapture(20);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0022
     * @tc.name      Camera_CaptureMirror_0022
     * @tc.desc      mirrorForCapture(21) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0022 begin`);
      logInfo("mirrorForCapture(21)");
      const actual: boolean = mirrorForCapture(21);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0023
     * @tc.name      Camera_CaptureMirror_0023
     * @tc.desc      mirrorForCapture(22) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CaptureMirror_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CaptureMirror_0023 begin`);
      logInfo("mirrorForCapture(22)");
      const actual: boolean = mirrorForCapture(22);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0024
     * @tc.name      Camera_CaptureMirror_0024
     * @tc.desc      mirrorForCapture(23) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0024 begin`);
      logInfo("mirrorForCapture(23)");
      const actual: boolean = mirrorForCapture(23);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0025
     * @tc.name      Camera_CaptureMirror_0025
     * @tc.desc      mirrorForCapture(24) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0025 begin`);
      logInfo("mirrorForCapture(24)");
      const actual: boolean = mirrorForCapture(24);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0026
     * @tc.name      Camera_CaptureMirror_0026
     * @tc.desc      mirrorForCapture(25) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0026 begin`);
      logInfo("mirrorForCapture(25)");
      const actual: boolean = mirrorForCapture(25);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0027
     * @tc.name      Camera_CaptureMirror_0027
     * @tc.desc      mirrorForCapture(26) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0027 begin`);
      logInfo("mirrorForCapture(26)");
      const actual: boolean = mirrorForCapture(26);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0028
     * @tc.name      Camera_CaptureMirror_0028
     * @tc.desc      mirrorForCapture(27) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0028 begin`);
      logInfo("mirrorForCapture(27)");
      const actual: boolean = mirrorForCapture(27);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0029
     * @tc.name      Camera_CaptureMirror_0029
     * @tc.desc      mirrorForCapture(28) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0029 begin`);
      logInfo("mirrorForCapture(28)");
      const actual: boolean = mirrorForCapture(28);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0030
     * @tc.name      Camera_CaptureMirror_0030
     * @tc.desc      mirrorForCapture(29) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0030 begin`);
      logInfo("mirrorForCapture(29)");
      const actual: boolean = mirrorForCapture(29);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0031
     * @tc.name      Camera_CaptureMirror_0031
     * @tc.desc      mirrorForCapture(30) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0031 begin`);
      logInfo("mirrorForCapture(30)");
      const actual: boolean = mirrorForCapture(30);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0032
     * @tc.name      Camera_CaptureMirror_0032
     * @tc.desc      mirrorForCapture(-1) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0032 begin`);
      logInfo("mirrorForCapture(-1)");
      const actual: boolean = mirrorForCapture(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0033
     * @tc.name      Camera_CaptureMirror_0033
     * @tc.desc      mirrorForCapture(-2) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0033 begin`);
      logInfo("mirrorForCapture(-2)");
      const actual: boolean = mirrorForCapture(-2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0034
     * @tc.name      Camera_CaptureMirror_0034
     * @tc.desc      mirrorForCapture(-3) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CaptureMirror_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CaptureMirror_0034 begin`);
      logInfo("mirrorForCapture(-3)");
      const actual: boolean = mirrorForCapture(-3);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0035
     * @tc.name      Camera_CaptureMirror_0035
     * @tc.desc      mirrorForCapture(-4) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_CaptureMirror_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CaptureMirror_0035 begin`);
      logInfo("mirrorForCapture(-4)");
      const actual: boolean = mirrorForCapture(-4);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0036
     * @tc.name      Camera_CaptureMirror_0036
     * @tc.desc      mirrorForCapture(-5) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0036 begin`);
      logInfo("mirrorForCapture(-5)");
      const actual: boolean = mirrorForCapture(-5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0037
     * @tc.name      Camera_CaptureMirror_0037
     * @tc.desc      mirrorForCapture(100) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0037 begin`);
      logInfo("mirrorForCapture(100)");
      const actual: boolean = mirrorForCapture(100);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0038
     * @tc.name      Camera_CaptureMirror_0038
     * @tc.desc      mirrorForCapture(255) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0038 begin`);
      logInfo("mirrorForCapture(255)");
      const actual: boolean = mirrorForCapture(255);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0039
     * @tc.name      Camera_CaptureMirror_0039
     * @tc.desc      mirrorForCapture(360) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0039 begin`);
      logInfo("mirrorForCapture(360)");
      const actual: boolean = mirrorForCapture(360);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0040
     * @tc.name      Camera_CaptureMirror_0040
     * @tc.desc      mirrorForCapture(1000) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0040 begin`);
      logInfo("mirrorForCapture(1000)");
      const actual: boolean = mirrorForCapture(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0041
     * @tc.name      Camera_CaptureMirror_0041
     * @tc.desc      mirrorForCapture(1.5) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0041 begin`);
      logInfo("mirrorForCapture(1.5)");
      const actual: boolean = mirrorForCapture(1.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0042
     * @tc.name      Camera_CaptureMirror_0042
     * @tc.desc      mirrorForCapture(2.5) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0042 begin`);
      logInfo("mirrorForCapture(2.5)");
      const actual: boolean = mirrorForCapture(2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0043
     * @tc.name      Camera_CaptureMirror_0043
     * @tc.desc      mirrorForCapture(3.5) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0043 begin`);
      logInfo("mirrorForCapture(3.5)");
      const actual: boolean = mirrorForCapture(3.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}CaptureMirror_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0044
     * @tc.name      Camera_CaptureMirror_0044
     * @tc.desc      mirrorForCapture(4.5) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CaptureMirror_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CaptureMirror_0044 begin`);
      logInfo("mirrorForCapture(4.5)");
      const actual: boolean = mirrorForCapture(4.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAPTURE_MIRROR_0045
     * @tc.name      Camera_CaptureMirror_0045
     * @tc.desc      mirrorForCapture(5.5) reports true for the capture mirror setting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CaptureMirror_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CaptureMirror_0045 begin`);
      logInfo("mirrorForCapture(5.5)");
      const actual: boolean = mirrorForCapture(5.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}CaptureMirror_0045 end`);
    });
  });
}
