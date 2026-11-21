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
