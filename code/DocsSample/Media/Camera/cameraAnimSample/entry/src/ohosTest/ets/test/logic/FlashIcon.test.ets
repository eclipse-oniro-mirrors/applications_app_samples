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
  flashIconName,
} from '../model/CameraLogic';

/** FlashIconTest logic checks (46 cases). */
export default function flashIconTest(): void {
  describe('FlashIconTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0001
     * @tc.name      Camera_FlashIcon_0001
     * @tc.desc      flashIconName(0) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FlashIcon_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlashIcon_0001 begin`);
      logInfo("flashIconName(0)");
      const actual: string = flashIconName(0);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0002
     * @tc.name      Camera_FlashIcon_0002
     * @tc.desc      flashIconName(1) selects "ic_camera_public_flash_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0002 begin`);
      logInfo("flashIconName(1)");
      const actual: string = flashIconName(1);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_on");
      expect(actual).assertEqual("ic_camera_public_flash_on");
      logInfo(`${BUNDLE}FlashIcon_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0003
     * @tc.name      Camera_FlashIcon_0003
     * @tc.desc      flashIconName(2) selects "ic_camera_public_flash_auto".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0003 begin`);
      logInfo("flashIconName(2)");
      const actual: string = flashIconName(2);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_auto");
      expect(actual).assertEqual("ic_camera_public_flash_auto");
      logInfo(`${BUNDLE}FlashIcon_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0004
     * @tc.name      Camera_FlashIcon_0004
     * @tc.desc      flashIconName(3) selects "flash_always_on".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0004 begin`);
      logInfo("flashIconName(3)");
      const actual: string = flashIconName(3);
      logInfo('actual=' + String(actual) + ', expected=' + "flash_always_on");
      expect(actual).assertEqual("flash_always_on");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0005
     * @tc.name      Camera_FlashIcon_0005
     * @tc.desc      flashIconName(4) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0005 begin`);
      logInfo("flashIconName(4)");
      const actual: string = flashIconName(4);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0006
     * @tc.name      Camera_FlashIcon_0006
     * @tc.desc      flashIconName(5) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0006 begin`);
      logInfo("flashIconName(5)");
      const actual: string = flashIconName(5);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0007
     * @tc.name      Camera_FlashIcon_0007
     * @tc.desc      flashIconName(6) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0007 begin`);
      logInfo("flashIconName(6)");
      const actual: string = flashIconName(6);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0008
     * @tc.name      Camera_FlashIcon_0008
     * @tc.desc      flashIconName(7) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0008 begin`);
      logInfo("flashIconName(7)");
      const actual: string = flashIconName(7);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0009
     * @tc.name      Camera_FlashIcon_0009
     * @tc.desc      flashIconName(8) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0009 begin`);
      logInfo("flashIconName(8)");
      const actual: string = flashIconName(8);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0010
     * @tc.name      Camera_FlashIcon_0010
     * @tc.desc      flashIconName(9) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0010 begin`);
      logInfo("flashIconName(9)");
      const actual: string = flashIconName(9);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0011
     * @tc.name      Camera_FlashIcon_0011
     * @tc.desc      flashIconName(10) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0011 begin`);
      logInfo("flashIconName(10)");
      const actual: string = flashIconName(10);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0012
     * @tc.name      Camera_FlashIcon_0012
     * @tc.desc      flashIconName(11) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FlashIcon_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlashIcon_0012 begin`);
      logInfo("flashIconName(11)");
      const actual: string = flashIconName(11);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0013
     * @tc.name      Camera_FlashIcon_0013
     * @tc.desc      flashIconName(12) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0013 begin`);
      logInfo("flashIconName(12)");
      const actual: string = flashIconName(12);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0014
     * @tc.name      Camera_FlashIcon_0014
     * @tc.desc      flashIconName(13) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0014 begin`);
      logInfo("flashIconName(13)");
      const actual: string = flashIconName(13);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0015
     * @tc.name      Camera_FlashIcon_0015
     * @tc.desc      flashIconName(14) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0015 begin`);
      logInfo("flashIconName(14)");
      const actual: string = flashIconName(14);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0016
     * @tc.name      Camera_FlashIcon_0016
     * @tc.desc      flashIconName(15) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0016 begin`);
      logInfo("flashIconName(15)");
      const actual: string = flashIconName(15);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0017
     * @tc.name      Camera_FlashIcon_0017
     * @tc.desc      flashIconName(16) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0017 begin`);
      logInfo("flashIconName(16)");
      const actual: string = flashIconName(16);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0018
     * @tc.name      Camera_FlashIcon_0018
     * @tc.desc      flashIconName(17) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_FlashIcon_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlashIcon_0018 begin`);
      logInfo("flashIconName(17)");
      const actual: string = flashIconName(17);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0019
     * @tc.name      Camera_FlashIcon_0019
     * @tc.desc      flashIconName(18) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0019 begin`);
      logInfo("flashIconName(18)");
      const actual: string = flashIconName(18);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0020
     * @tc.name      Camera_FlashIcon_0020
     * @tc.desc      flashIconName(19) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0020 begin`);
      logInfo("flashIconName(19)");
      const actual: string = flashIconName(19);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0021
     * @tc.name      Camera_FlashIcon_0021
     * @tc.desc      flashIconName(20) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0021 begin`);
      logInfo("flashIconName(20)");
      const actual: string = flashIconName(20);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0022
     * @tc.name      Camera_FlashIcon_0022
     * @tc.desc      flashIconName(21) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0022 begin`);
      logInfo("flashIconName(21)");
      const actual: string = flashIconName(21);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0023
     * @tc.name      Camera_FlashIcon_0023
     * @tc.desc      flashIconName(22) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FlashIcon_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlashIcon_0023 begin`);
      logInfo("flashIconName(22)");
      const actual: string = flashIconName(22);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0024
     * @tc.name      Camera_FlashIcon_0024
     * @tc.desc      flashIconName(23) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0024 begin`);
      logInfo("flashIconName(23)");
      const actual: string = flashIconName(23);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0025
     * @tc.name      Camera_FlashIcon_0025
     * @tc.desc      flashIconName(24) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0025 begin`);
      logInfo("flashIconName(24)");
      const actual: string = flashIconName(24);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0026
     * @tc.name      Camera_FlashIcon_0026
     * @tc.desc      flashIconName(25) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0026 begin`);
      logInfo("flashIconName(25)");
      const actual: string = flashIconName(25);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0027
     * @tc.name      Camera_FlashIcon_0027
     * @tc.desc      flashIconName(26) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0027 begin`);
      logInfo("flashIconName(26)");
      const actual: string = flashIconName(26);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0028
     * @tc.name      Camera_FlashIcon_0028
     * @tc.desc      flashIconName(27) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0028 begin`);
      logInfo("flashIconName(27)");
      const actual: string = flashIconName(27);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0029
     * @tc.name      Camera_FlashIcon_0029
     * @tc.desc      flashIconName(28) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0029 begin`);
      logInfo("flashIconName(28)");
      const actual: string = flashIconName(28);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0030
     * @tc.name      Camera_FlashIcon_0030
     * @tc.desc      flashIconName(29) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0030 begin`);
      logInfo("flashIconName(29)");
      const actual: string = flashIconName(29);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0031
     * @tc.name      Camera_FlashIcon_0031
     * @tc.desc      flashIconName(30) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0031 begin`);
      logInfo("flashIconName(30)");
      const actual: string = flashIconName(30);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0032
     * @tc.name      Camera_FlashIcon_0032
     * @tc.desc      flashIconName(-1) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0032 begin`);
      logInfo("flashIconName(-1)");
      const actual: string = flashIconName(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0033
     * @tc.name      Camera_FlashIcon_0033
     * @tc.desc      flashIconName(-2) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0033 begin`);
      logInfo("flashIconName(-2)");
      const actual: string = flashIconName(-2);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0034
     * @tc.name      Camera_FlashIcon_0034
     * @tc.desc      flashIconName(-3) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FlashIcon_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlashIcon_0034 begin`);
      logInfo("flashIconName(-3)");
      const actual: string = flashIconName(-3);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0035
     * @tc.name      Camera_FlashIcon_0035
     * @tc.desc      flashIconName(-4) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_FlashIcon_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlashIcon_0035 begin`);
      logInfo("flashIconName(-4)");
      const actual: string = flashIconName(-4);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0036
     * @tc.name      Camera_FlashIcon_0036
     * @tc.desc      flashIconName(100) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0036 begin`);
      logInfo("flashIconName(100)");
      const actual: string = flashIconName(100);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0037
     * @tc.name      Camera_FlashIcon_0037
     * @tc.desc      flashIconName(255) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0037 begin`);
      logInfo("flashIconName(255)");
      const actual: string = flashIconName(255);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0038
     * @tc.name      Camera_FlashIcon_0038
     * @tc.desc      flashIconName(360) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0038 begin`);
      logInfo("flashIconName(360)");
      const actual: string = flashIconName(360);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0039
     * @tc.name      Camera_FlashIcon_0039
     * @tc.desc      flashIconName(1000) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0039 begin`);
      logInfo("flashIconName(1000)");
      const actual: string = flashIconName(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0040
     * @tc.name      Camera_FlashIcon_0040
     * @tc.desc      flashIconName(-90) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0040 begin`);
      logInfo("flashIconName(-90)");
      const actual: string = flashIconName(-90);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0041
     * @tc.name      Camera_FlashIcon_0041
     * @tc.desc      flashIconName(1.5) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0041 begin`);
      logInfo("flashIconName(1.5)");
      const actual: string = flashIconName(1.5);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0042
     * @tc.name      Camera_FlashIcon_0042
     * @tc.desc      flashIconName(2.5) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0042 begin`);
      logInfo("flashIconName(2.5)");
      const actual: string = flashIconName(2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0043
     * @tc.name      Camera_FlashIcon_0043
     * @tc.desc      flashIconName(3.5) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0043 begin`);
      logInfo("flashIconName(3.5)");
      const actual: string = flashIconName(3.5);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0044
     * @tc.name      Camera_FlashIcon_0044
     * @tc.desc      flashIconName(0.5) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0044 begin`);
      logInfo("flashIconName(0.5)");
      const actual: string = flashIconName(0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0045
     * @tc.name      Camera_FlashIcon_0045
     * @tc.desc      flashIconName(-0.5) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FlashIcon_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlashIcon_0045 begin`);
      logInfo("flashIconName(-0.5)");
      const actual: string = flashIconName(-0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo(`${BUNDLE}FlashIcon_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FLASH_ICON_0046
     * @tc.name      Camera_FlashIcon_0046
     * @tc.desc      flashIconName(99) selects "ic_camera_public_flash_off".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FlashIcon_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlashIcon_0046 begin`);
      logInfo("flashIconName(99)");
      const actual: string = flashIconName(99);
      logInfo('actual=' + String(actual) + ', expected=' + "ic_camera_public_flash_off");
      expect(actual).assertEqual("ic_camera_public_flash_off");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlashIcon_0046 end`);
    });
  });
}
