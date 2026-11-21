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
  whiteBalanceValid,
} from '../model/CameraLogic';

/** WhiteBalanceValidTest logic checks (46 cases). */
export default function whiteBalanceValidTest(): void {
  describe('WhiteBalanceValidTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0001
     * @tc.name      Camera_WhiteBalanceValid_0001
     * @tc.desc      whiteBalanceValid(0) reports true for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_WhiteBalanceValid_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0001 begin`);
      logInfo("whiteBalanceValid(0)");
      const actual: boolean = whiteBalanceValid(0);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0002
     * @tc.name      Camera_WhiteBalanceValid_0002
     * @tc.desc      whiteBalanceValid(1) reports true for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0002 begin`);
      logInfo("whiteBalanceValid(1)");
      const actual: boolean = whiteBalanceValid(1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}WhiteBalanceValid_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0003
     * @tc.name      Camera_WhiteBalanceValid_0003
     * @tc.desc      whiteBalanceValid(2) reports true for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0003 begin`);
      logInfo("whiteBalanceValid(2)");
      const actual: boolean = whiteBalanceValid(2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}WhiteBalanceValid_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0004
     * @tc.name      Camera_WhiteBalanceValid_0004
     * @tc.desc      whiteBalanceValid(3) reports true for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0004 begin`);
      logInfo("whiteBalanceValid(3)");
      const actual: boolean = whiteBalanceValid(3);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0005
     * @tc.name      Camera_WhiteBalanceValid_0005
     * @tc.desc      whiteBalanceValid(4) reports true for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0005 begin`);
      logInfo("whiteBalanceValid(4)");
      const actual: boolean = whiteBalanceValid(4);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}WhiteBalanceValid_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0006
     * @tc.name      Camera_WhiteBalanceValid_0006
     * @tc.desc      whiteBalanceValid(5) reports true for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0006 begin`);
      logInfo("whiteBalanceValid(5)");
      const actual: boolean = whiteBalanceValid(5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}WhiteBalanceValid_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0007
     * @tc.name      Camera_WhiteBalanceValid_0007
     * @tc.desc      whiteBalanceValid(6) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0007 begin`);
      logInfo("whiteBalanceValid(6)");
      const actual: boolean = whiteBalanceValid(6);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0008
     * @tc.name      Camera_WhiteBalanceValid_0008
     * @tc.desc      whiteBalanceValid(7) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0008 begin`);
      logInfo("whiteBalanceValid(7)");
      const actual: boolean = whiteBalanceValid(7);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0009
     * @tc.name      Camera_WhiteBalanceValid_0009
     * @tc.desc      whiteBalanceValid(8) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0009 begin`);
      logInfo("whiteBalanceValid(8)");
      const actual: boolean = whiteBalanceValid(8);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0010
     * @tc.name      Camera_WhiteBalanceValid_0010
     * @tc.desc      whiteBalanceValid(9) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0010 begin`);
      logInfo("whiteBalanceValid(9)");
      const actual: boolean = whiteBalanceValid(9);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0011
     * @tc.name      Camera_WhiteBalanceValid_0011
     * @tc.desc      whiteBalanceValid(10) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0011 begin`);
      logInfo("whiteBalanceValid(10)");
      const actual: boolean = whiteBalanceValid(10);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0012
     * @tc.name      Camera_WhiteBalanceValid_0012
     * @tc.desc      whiteBalanceValid(11) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_WhiteBalanceValid_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0012 begin`);
      logInfo("whiteBalanceValid(11)");
      const actual: boolean = whiteBalanceValid(11);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0013
     * @tc.name      Camera_WhiteBalanceValid_0013
     * @tc.desc      whiteBalanceValid(12) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0013 begin`);
      logInfo("whiteBalanceValid(12)");
      const actual: boolean = whiteBalanceValid(12);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0014
     * @tc.name      Camera_WhiteBalanceValid_0014
     * @tc.desc      whiteBalanceValid(13) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0014 begin`);
      logInfo("whiteBalanceValid(13)");
      const actual: boolean = whiteBalanceValid(13);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0015
     * @tc.name      Camera_WhiteBalanceValid_0015
     * @tc.desc      whiteBalanceValid(14) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0015 begin`);
      logInfo("whiteBalanceValid(14)");
      const actual: boolean = whiteBalanceValid(14);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0016
     * @tc.name      Camera_WhiteBalanceValid_0016
     * @tc.desc      whiteBalanceValid(15) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0016 begin`);
      logInfo("whiteBalanceValid(15)");
      const actual: boolean = whiteBalanceValid(15);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0017
     * @tc.name      Camera_WhiteBalanceValid_0017
     * @tc.desc      whiteBalanceValid(16) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0017 begin`);
      logInfo("whiteBalanceValid(16)");
      const actual: boolean = whiteBalanceValid(16);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0018
     * @tc.name      Camera_WhiteBalanceValid_0018
     * @tc.desc      whiteBalanceValid(17) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_WhiteBalanceValid_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0018 begin`);
      logInfo("whiteBalanceValid(17)");
      const actual: boolean = whiteBalanceValid(17);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0019
     * @tc.name      Camera_WhiteBalanceValid_0019
     * @tc.desc      whiteBalanceValid(18) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0019 begin`);
      logInfo("whiteBalanceValid(18)");
      const actual: boolean = whiteBalanceValid(18);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0020
     * @tc.name      Camera_WhiteBalanceValid_0020
     * @tc.desc      whiteBalanceValid(19) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0020 begin`);
      logInfo("whiteBalanceValid(19)");
      const actual: boolean = whiteBalanceValid(19);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0021
     * @tc.name      Camera_WhiteBalanceValid_0021
     * @tc.desc      whiteBalanceValid(20) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0021 begin`);
      logInfo("whiteBalanceValid(20)");
      const actual: boolean = whiteBalanceValid(20);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0022
     * @tc.name      Camera_WhiteBalanceValid_0022
     * @tc.desc      whiteBalanceValid(21) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0022 begin`);
      logInfo("whiteBalanceValid(21)");
      const actual: boolean = whiteBalanceValid(21);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0023
     * @tc.name      Camera_WhiteBalanceValid_0023
     * @tc.desc      whiteBalanceValid(22) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_WhiteBalanceValid_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0023 begin`);
      logInfo("whiteBalanceValid(22)");
      const actual: boolean = whiteBalanceValid(22);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0024
     * @tc.name      Camera_WhiteBalanceValid_0024
     * @tc.desc      whiteBalanceValid(23) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0024 begin`);
      logInfo("whiteBalanceValid(23)");
      const actual: boolean = whiteBalanceValid(23);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0025
     * @tc.name      Camera_WhiteBalanceValid_0025
     * @tc.desc      whiteBalanceValid(24) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0025 begin`);
      logInfo("whiteBalanceValid(24)");
      const actual: boolean = whiteBalanceValid(24);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0026
     * @tc.name      Camera_WhiteBalanceValid_0026
     * @tc.desc      whiteBalanceValid(25) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0026 begin`);
      logInfo("whiteBalanceValid(25)");
      const actual: boolean = whiteBalanceValid(25);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0027
     * @tc.name      Camera_WhiteBalanceValid_0027
     * @tc.desc      whiteBalanceValid(-1) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0027 begin`);
      logInfo("whiteBalanceValid(-1)");
      const actual: boolean = whiteBalanceValid(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0028
     * @tc.name      Camera_WhiteBalanceValid_0028
     * @tc.desc      whiteBalanceValid(-2) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0028 begin`);
      logInfo("whiteBalanceValid(-2)");
      const actual: boolean = whiteBalanceValid(-2);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0029
     * @tc.name      Camera_WhiteBalanceValid_0029
     * @tc.desc      whiteBalanceValid(-3) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0029 begin`);
      logInfo("whiteBalanceValid(-3)");
      const actual: boolean = whiteBalanceValid(-3);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0030
     * @tc.name      Camera_WhiteBalanceValid_0030
     * @tc.desc      whiteBalanceValid(-4) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0030 begin`);
      logInfo("whiteBalanceValid(-4)");
      const actual: boolean = whiteBalanceValid(-4);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0031
     * @tc.name      Camera_WhiteBalanceValid_0031
     * @tc.desc      whiteBalanceValid(-5) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0031 begin`);
      logInfo("whiteBalanceValid(-5)");
      const actual: boolean = whiteBalanceValid(-5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0032
     * @tc.name      Camera_WhiteBalanceValid_0032
     * @tc.desc      whiteBalanceValid(-6) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0032 begin`);
      logInfo("whiteBalanceValid(-6)");
      const actual: boolean = whiteBalanceValid(-6);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0033
     * @tc.name      Camera_WhiteBalanceValid_0033
     * @tc.desc      whiteBalanceValid(-7) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0033 begin`);
      logInfo("whiteBalanceValid(-7)");
      const actual: boolean = whiteBalanceValid(-7);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0034
     * @tc.name      Camera_WhiteBalanceValid_0034
     * @tc.desc      whiteBalanceValid(-8) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_WhiteBalanceValid_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0034 begin`);
      logInfo("whiteBalanceValid(-8)");
      const actual: boolean = whiteBalanceValid(-8);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0035
     * @tc.name      Camera_WhiteBalanceValid_0035
     * @tc.desc      whiteBalanceValid(-9) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_WhiteBalanceValid_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0035 begin`);
      logInfo("whiteBalanceValid(-9)");
      const actual: boolean = whiteBalanceValid(-9);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0036
     * @tc.name      Camera_WhiteBalanceValid_0036
     * @tc.desc      whiteBalanceValid(-10) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0036 begin`);
      logInfo("whiteBalanceValid(-10)");
      const actual: boolean = whiteBalanceValid(-10);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0037
     * @tc.name      Camera_WhiteBalanceValid_0037
     * @tc.desc      whiteBalanceValid(100) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0037 begin`);
      logInfo("whiteBalanceValid(100)");
      const actual: boolean = whiteBalanceValid(100);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0038
     * @tc.name      Camera_WhiteBalanceValid_0038
     * @tc.desc      whiteBalanceValid(255) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0038 begin`);
      logInfo("whiteBalanceValid(255)");
      const actual: boolean = whiteBalanceValid(255);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0039
     * @tc.name      Camera_WhiteBalanceValid_0039
     * @tc.desc      whiteBalanceValid(360) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0039 begin`);
      logInfo("whiteBalanceValid(360)");
      const actual: boolean = whiteBalanceValid(360);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0040
     * @tc.name      Camera_WhiteBalanceValid_0040
     * @tc.desc      whiteBalanceValid(1000) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0040 begin`);
      logInfo("whiteBalanceValid(1000)");
      const actual: boolean = whiteBalanceValid(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0041
     * @tc.name      Camera_WhiteBalanceValid_0041
     * @tc.desc      whiteBalanceValid(1.5) reports true for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0041 begin`);
      logInfo("whiteBalanceValid(1.5)");
      const actual: boolean = whiteBalanceValid(1.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}WhiteBalanceValid_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0042
     * @tc.name      Camera_WhiteBalanceValid_0042
     * @tc.desc      whiteBalanceValid(2.5) reports true for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0042 begin`);
      logInfo("whiteBalanceValid(2.5)");
      const actual: boolean = whiteBalanceValid(2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}WhiteBalanceValid_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0043
     * @tc.name      Camera_WhiteBalanceValid_0043
     * @tc.desc      whiteBalanceValid(3.5) reports true for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0043 begin`);
      logInfo("whiteBalanceValid(3.5)");
      const actual: boolean = whiteBalanceValid(3.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0044
     * @tc.name      Camera_WhiteBalanceValid_0044
     * @tc.desc      whiteBalanceValid(4.5) reports true for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0044 begin`);
      logInfo("whiteBalanceValid(4.5)");
      const actual: boolean = whiteBalanceValid(4.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}WhiteBalanceValid_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0045
     * @tc.name      Camera_WhiteBalanceValid_0045
     * @tc.desc      whiteBalanceValid(5.5) reports false for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_WhiteBalanceValid_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0045 begin`);
      logInfo("whiteBalanceValid(5.5)");
      const actual: boolean = whiteBalanceValid(5.5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}WhiteBalanceValid_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_VALID_0046
     * @tc.name      Camera_WhiteBalanceValid_0046
     * @tc.desc      whiteBalanceValid(0.5) reports true for the six-option panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceValid_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceValid_0046 begin`);
      logInfo("whiteBalanceValid(0.5)");
      const actual: boolean = whiteBalanceValid(0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}WhiteBalanceValid_0046 end`);
    });
  });
}
