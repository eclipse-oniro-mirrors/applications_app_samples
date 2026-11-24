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
  whiteBalanceText,
} from '../model/CameraLogic';

/** WhiteBalanceTextTest logic checks (46 cases). */
export default function whiteBalanceTextTest(): void {
  describe('WhiteBalanceTextTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0001
     * @tc.name      Camera_WhiteBalanceText_0001
     * @tc.desc      whiteBalanceText(0) resolves the panel label "自动".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_WhiteBalanceText_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0001 begin`);
      logInfo("whiteBalanceText(0)");
      const actual: string = whiteBalanceText(0);
      logInfo('actual=' + String(actual) + ', expected=' + "自动");
      expect(actual).assertEqual("自动");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0002
     * @tc.name      Camera_WhiteBalanceText_0002
     * @tc.desc      whiteBalanceText(1) resolves the panel label "阴天".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0002 begin`);
      logInfo("whiteBalanceText(1)");
      const actual: string = whiteBalanceText(1);
      logInfo('actual=' + String(actual) + ', expected=' + "阴天");
      expect(actual).assertEqual("阴天");
      logInfo(`${BUNDLE}WhiteBalanceText_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0003
     * @tc.name      Camera_WhiteBalanceText_0003
     * @tc.desc      whiteBalanceText(2) resolves the panel label "白炽光".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0003 begin`);
      logInfo("whiteBalanceText(2)");
      const actual: string = whiteBalanceText(2);
      logInfo('actual=' + String(actual) + ', expected=' + "白炽光");
      expect(actual).assertEqual("白炽光");
      logInfo(`${BUNDLE}WhiteBalanceText_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0004
     * @tc.name      Camera_WhiteBalanceText_0004
     * @tc.desc      whiteBalanceText(3) resolves the panel label "荧光".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0004 begin`);
      logInfo("whiteBalanceText(3)");
      const actual: string = whiteBalanceText(3);
      logInfo('actual=' + String(actual) + ', expected=' + "荧光");
      expect(actual).assertEqual("荧光");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0005
     * @tc.name      Camera_WhiteBalanceText_0005
     * @tc.desc      whiteBalanceText(4) resolves the panel label "日光".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0005 begin`);
      logInfo("whiteBalanceText(4)");
      const actual: string = whiteBalanceText(4);
      logInfo('actual=' + String(actual) + ', expected=' + "日光");
      expect(actual).assertEqual("日光");
      logInfo(`${BUNDLE}WhiteBalanceText_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0006
     * @tc.name      Camera_WhiteBalanceText_0006
     * @tc.desc      whiteBalanceText(5) resolves the panel label "手动".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0006 begin`);
      logInfo("whiteBalanceText(5)");
      const actual: string = whiteBalanceText(5);
      logInfo('actual=' + String(actual) + ', expected=' + "手动");
      expect(actual).assertEqual("手动");
      logInfo(`${BUNDLE}WhiteBalanceText_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0007
     * @tc.name      Camera_WhiteBalanceText_0007
     * @tc.desc      whiteBalanceText(6) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0007 begin`);
      logInfo("whiteBalanceText(6)");
      const actual: string = whiteBalanceText(6);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0008
     * @tc.name      Camera_WhiteBalanceText_0008
     * @tc.desc      whiteBalanceText(7) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0008 begin`);
      logInfo("whiteBalanceText(7)");
      const actual: string = whiteBalanceText(7);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0009
     * @tc.name      Camera_WhiteBalanceText_0009
     * @tc.desc      whiteBalanceText(8) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0009 begin`);
      logInfo("whiteBalanceText(8)");
      const actual: string = whiteBalanceText(8);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0010
     * @tc.name      Camera_WhiteBalanceText_0010
     * @tc.desc      whiteBalanceText(9) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0010 begin`);
      logInfo("whiteBalanceText(9)");
      const actual: string = whiteBalanceText(9);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0011
     * @tc.name      Camera_WhiteBalanceText_0011
     * @tc.desc      whiteBalanceText(10) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0011 begin`);
      logInfo("whiteBalanceText(10)");
      const actual: string = whiteBalanceText(10);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0012
     * @tc.name      Camera_WhiteBalanceText_0012
     * @tc.desc      whiteBalanceText(11) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_WhiteBalanceText_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0012 begin`);
      logInfo("whiteBalanceText(11)");
      const actual: string = whiteBalanceText(11);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0013
     * @tc.name      Camera_WhiteBalanceText_0013
     * @tc.desc      whiteBalanceText(12) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0013 begin`);
      logInfo("whiteBalanceText(12)");
      const actual: string = whiteBalanceText(12);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0014
     * @tc.name      Camera_WhiteBalanceText_0014
     * @tc.desc      whiteBalanceText(13) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0014 begin`);
      logInfo("whiteBalanceText(13)");
      const actual: string = whiteBalanceText(13);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0015
     * @tc.name      Camera_WhiteBalanceText_0015
     * @tc.desc      whiteBalanceText(14) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0015 begin`);
      logInfo("whiteBalanceText(14)");
      const actual: string = whiteBalanceText(14);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0016
     * @tc.name      Camera_WhiteBalanceText_0016
     * @tc.desc      whiteBalanceText(15) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0016 begin`);
      logInfo("whiteBalanceText(15)");
      const actual: string = whiteBalanceText(15);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0017
     * @tc.name      Camera_WhiteBalanceText_0017
     * @tc.desc      whiteBalanceText(16) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0017 begin`);
      logInfo("whiteBalanceText(16)");
      const actual: string = whiteBalanceText(16);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0018
     * @tc.name      Camera_WhiteBalanceText_0018
     * @tc.desc      whiteBalanceText(17) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_WhiteBalanceText_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0018 begin`);
      logInfo("whiteBalanceText(17)");
      const actual: string = whiteBalanceText(17);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0019
     * @tc.name      Camera_WhiteBalanceText_0019
     * @tc.desc      whiteBalanceText(18) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0019 begin`);
      logInfo("whiteBalanceText(18)");
      const actual: string = whiteBalanceText(18);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0020
     * @tc.name      Camera_WhiteBalanceText_0020
     * @tc.desc      whiteBalanceText(19) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0020 begin`);
      logInfo("whiteBalanceText(19)");
      const actual: string = whiteBalanceText(19);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0021
     * @tc.name      Camera_WhiteBalanceText_0021
     * @tc.desc      whiteBalanceText(20) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0021 begin`);
      logInfo("whiteBalanceText(20)");
      const actual: string = whiteBalanceText(20);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0022
     * @tc.name      Camera_WhiteBalanceText_0022
     * @tc.desc      whiteBalanceText(21) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0022 begin`);
      logInfo("whiteBalanceText(21)");
      const actual: string = whiteBalanceText(21);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0023
     * @tc.name      Camera_WhiteBalanceText_0023
     * @tc.desc      whiteBalanceText(22) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_WhiteBalanceText_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0023 begin`);
      logInfo("whiteBalanceText(22)");
      const actual: string = whiteBalanceText(22);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0024
     * @tc.name      Camera_WhiteBalanceText_0024
     * @tc.desc      whiteBalanceText(23) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0024 begin`);
      logInfo("whiteBalanceText(23)");
      const actual: string = whiteBalanceText(23);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0025
     * @tc.name      Camera_WhiteBalanceText_0025
     * @tc.desc      whiteBalanceText(24) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0025 begin`);
      logInfo("whiteBalanceText(24)");
      const actual: string = whiteBalanceText(24);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0026
     * @tc.name      Camera_WhiteBalanceText_0026
     * @tc.desc      whiteBalanceText(25) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0026 begin`);
      logInfo("whiteBalanceText(25)");
      const actual: string = whiteBalanceText(25);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0027
     * @tc.name      Camera_WhiteBalanceText_0027
     * @tc.desc      whiteBalanceText(26) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0027 begin`);
      logInfo("whiteBalanceText(26)");
      const actual: string = whiteBalanceText(26);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0028
     * @tc.name      Camera_WhiteBalanceText_0028
     * @tc.desc      whiteBalanceText(27) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0028 begin`);
      logInfo("whiteBalanceText(27)");
      const actual: string = whiteBalanceText(27);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0029
     * @tc.name      Camera_WhiteBalanceText_0029
     * @tc.desc      whiteBalanceText(28) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0029 begin`);
      logInfo("whiteBalanceText(28)");
      const actual: string = whiteBalanceText(28);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0030
     * @tc.name      Camera_WhiteBalanceText_0030
     * @tc.desc      whiteBalanceText(29) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0030 begin`);
      logInfo("whiteBalanceText(29)");
      const actual: string = whiteBalanceText(29);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0031
     * @tc.name      Camera_WhiteBalanceText_0031
     * @tc.desc      whiteBalanceText(30) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0031 begin`);
      logInfo("whiteBalanceText(30)");
      const actual: string = whiteBalanceText(30);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0032
     * @tc.name      Camera_WhiteBalanceText_0032
     * @tc.desc      whiteBalanceText(-1) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0032 begin`);
      logInfo("whiteBalanceText(-1)");
      const actual: string = whiteBalanceText(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0033
     * @tc.name      Camera_WhiteBalanceText_0033
     * @tc.desc      whiteBalanceText(-2) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0033 begin`);
      logInfo("whiteBalanceText(-2)");
      const actual: string = whiteBalanceText(-2);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0034
     * @tc.name      Camera_WhiteBalanceText_0034
     * @tc.desc      whiteBalanceText(-3) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_WhiteBalanceText_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0034 begin`);
      logInfo("whiteBalanceText(-3)");
      const actual: string = whiteBalanceText(-3);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0035
     * @tc.name      Camera_WhiteBalanceText_0035
     * @tc.desc      whiteBalanceText(-4) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_WhiteBalanceText_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0035 begin`);
      logInfo("whiteBalanceText(-4)");
      const actual: string = whiteBalanceText(-4);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0036
     * @tc.name      Camera_WhiteBalanceText_0036
     * @tc.desc      whiteBalanceText(-5) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0036 begin`);
      logInfo("whiteBalanceText(-5)");
      const actual: string = whiteBalanceText(-5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0037
     * @tc.name      Camera_WhiteBalanceText_0037
     * @tc.desc      whiteBalanceText(100) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0037 begin`);
      logInfo("whiteBalanceText(100)");
      const actual: string = whiteBalanceText(100);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0038
     * @tc.name      Camera_WhiteBalanceText_0038
     * @tc.desc      whiteBalanceText(255) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0038 begin`);
      logInfo("whiteBalanceText(255)");
      const actual: string = whiteBalanceText(255);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0039
     * @tc.name      Camera_WhiteBalanceText_0039
     * @tc.desc      whiteBalanceText(360) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0039 begin`);
      logInfo("whiteBalanceText(360)");
      const actual: string = whiteBalanceText(360);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0040
     * @tc.name      Camera_WhiteBalanceText_0040
     * @tc.desc      whiteBalanceText(1000) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0040 begin`);
      logInfo("whiteBalanceText(1000)");
      const actual: string = whiteBalanceText(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0041
     * @tc.name      Camera_WhiteBalanceText_0041
     * @tc.desc      whiteBalanceText(1.5) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0041 begin`);
      logInfo("whiteBalanceText(1.5)");
      const actual: string = whiteBalanceText(1.5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0042
     * @tc.name      Camera_WhiteBalanceText_0042
     * @tc.desc      whiteBalanceText(2.5) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0042 begin`);
      logInfo("whiteBalanceText(2.5)");
      const actual: string = whiteBalanceText(2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0043
     * @tc.name      Camera_WhiteBalanceText_0043
     * @tc.desc      whiteBalanceText(3.5) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0043 begin`);
      logInfo("whiteBalanceText(3.5)");
      const actual: string = whiteBalanceText(3.5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0044
     * @tc.name      Camera_WhiteBalanceText_0044
     * @tc.desc      whiteBalanceText(4.5) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0044 begin`);
      logInfo("whiteBalanceText(4.5)");
      const actual: string = whiteBalanceText(4.5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0045
     * @tc.name      Camera_WhiteBalanceText_0045
     * @tc.desc      whiteBalanceText(5.5) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_WhiteBalanceText_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0045 begin`);
      logInfo("whiteBalanceText(5.5)");
      const actual: string = whiteBalanceText(5.5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}WhiteBalanceText_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WHITE_BALANCE_TEXT_0046
     * @tc.name      Camera_WhiteBalanceText_0046
     * @tc.desc      whiteBalanceText(0.5) resolves the panel label "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceText_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceText_0046 begin`);
      logInfo("whiteBalanceText(0.5)");
      const actual: string = whiteBalanceText(0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceText_0046 end`);
    });
  });
}
