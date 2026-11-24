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
import { logInfo, BUNDLE } from '../common/VPNTestSupport';
import {
  prefixValid,
} from '../model/VPNLogic';

/** PrefixValidTest logic checks (38 cases). */
export default function prefixValidTest(): void {
  describe('PrefixValidTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0001
     * @tc.name      VPN_PrefixValid_0001
     * @tc.desc      prefixValid(8) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_PrefixValid_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PrefixValid_0001 begin`);
      logInfo("prefixValid(8)");
      const actual: boolean = prefixValid(8);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}PrefixValid_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0002
     * @tc.name      VPN_PrefixValid_0002
     * @tc.desc      prefixValid(16) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0002 begin`);
      logInfo("prefixValid(16)");
      const actual: boolean = prefixValid(16);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}PrefixValid_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0003
     * @tc.name      VPN_PrefixValid_0003
     * @tc.desc      prefixValid(24) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0003 begin`);
      logInfo("prefixValid(24)");
      const actual: boolean = prefixValid(24);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}PrefixValid_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0004
     * @tc.name      VPN_PrefixValid_0004
     * @tc.desc      prefixValid(31) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0004 begin`);
      logInfo("prefixValid(31)");
      const actual: boolean = prefixValid(31);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}PrefixValid_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0005
     * @tc.name      VPN_PrefixValid_0005
     * @tc.desc      prefixValid(32) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0005 begin`);
      logInfo("prefixValid(32)");
      const actual: boolean = prefixValid(32);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}PrefixValid_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0006
     * @tc.name      VPN_PrefixValid_0006
     * @tc.desc      prefixValid(33) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0006 begin`);
      logInfo("prefixValid(33)");
      const actual: boolean = prefixValid(33);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0007
     * @tc.name      VPN_PrefixValid_0007
     * @tc.desc      prefixValid(-1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0007 begin`);
      logInfo("prefixValid(-1)");
      const actual: boolean = prefixValid(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}PrefixValid_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0008
     * @tc.name      VPN_PrefixValid_0008
     * @tc.desc      prefixValid(2) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0008 begin`);
      logInfo("prefixValid(2)");
      const actual: boolean = prefixValid(2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}PrefixValid_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0009
     * @tc.name      VPN_PrefixValid_0009
     * @tc.desc      prefixValid(4) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0009 begin`);
      logInfo("prefixValid(4)");
      const actual: boolean = prefixValid(4);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}PrefixValid_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0010
     * @tc.name      VPN_PrefixValid_0010
     * @tc.desc      prefixValid(12) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0010 begin`);
      logInfo("prefixValid(12)");
      const actual: boolean = prefixValid(12);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}PrefixValid_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0011
     * @tc.name      VPN_PrefixValid_0011
     * @tc.desc      prefixValid(20) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0011 begin`);
      logInfo("prefixValid(20)");
      const actual: boolean = prefixValid(20);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}PrefixValid_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0012
     * @tc.name      VPN_PrefixValid_0012
     * @tc.desc      prefixValid(28) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_PrefixValid_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PrefixValid_0012 begin`);
      logInfo("prefixValid(28)");
      const actual: boolean = prefixValid(28);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}PrefixValid_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0013
     * @tc.name      VPN_PrefixValid_0013
     * @tc.desc      prefixValid(30) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0013 begin`);
      logInfo("prefixValid(30)");
      const actual: boolean = prefixValid(30);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}PrefixValid_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0014
     * @tc.name      VPN_PrefixValid_0014
     * @tc.desc      prefixValid(34) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0014 begin`);
      logInfo("prefixValid(34)");
      const actual: boolean = prefixValid(34);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0015
     * @tc.name      VPN_PrefixValid_0015
     * @tc.desc      prefixValid(64) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0015 begin`);
      logInfo("prefixValid(64)");
      const actual: boolean = prefixValid(64);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0016
     * @tc.name      VPN_PrefixValid_0016
     * @tc.desc      prefixValid(100) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0016 begin`);
      logInfo("prefixValid(100)");
      const actual: boolean = prefixValid(100);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}PrefixValid_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0017
     * @tc.name      VPN_PrefixValid_0017
     * @tc.desc      prefixValid(255) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0017 begin`);
      logInfo("prefixValid(255)");
      const actual: boolean = prefixValid(255);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0018
     * @tc.name      VPN_PrefixValid_0018
     * @tc.desc      prefixValid(256) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_PrefixValid_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PrefixValid_0018 begin`);
      logInfo("prefixValid(256)");
      const actual: boolean = prefixValid(256);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0019
     * @tc.name      VPN_PrefixValid_0019
     * @tc.desc      prefixValid(0) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0019 begin`);
      logInfo("prefixValid(0)");
      const actual: boolean = prefixValid(0);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}PrefixValid_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0020
     * @tc.name      VPN_PrefixValid_0020
     * @tc.desc      prefixValid(23) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0020 begin`);
      logInfo("prefixValid(23)");
      const actual: boolean = prefixValid(23);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}PrefixValid_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0021
     * @tc.name      VPN_PrefixValid_0021
     * @tc.desc      prefixValid(1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0021 begin`);
      logInfo("prefixValid(1)");
      const actual: boolean = prefixValid(1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}PrefixValid_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0022
     * @tc.name      VPN_PrefixValid_0022
     * @tc.desc      prefixValid(999) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0022 begin`);
      logInfo("prefixValid(999)");
      const actual: boolean = prefixValid(999);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}PrefixValid_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0023
     * @tc.name      VPN_PrefixValid_0023
     * @tc.desc      prefixValid(1000) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_PrefixValid_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PrefixValid_0023 begin`);
      logInfo("prefixValid(1000)");
      const actual: boolean = prefixValid(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0024
     * @tc.name      VPN_PrefixValid_0024
     * @tc.desc      prefixValid(360) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0024 begin`);
      logInfo("prefixValid(360)");
      const actual: boolean = prefixValid(360);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0025
     * @tc.name      VPN_PrefixValid_0025
     * @tc.desc      prefixValid(720) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0025 begin`);
      logInfo("prefixValid(720)");
      const actual: boolean = prefixValid(720);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}PrefixValid_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0026
     * @tc.name      VPN_PrefixValid_0026
     * @tc.desc      prefixValid(1280) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0026 begin`);
      logInfo("prefixValid(1280)");
      const actual: boolean = prefixValid(1280);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0027
     * @tc.name      VPN_PrefixValid_0027
     * @tc.desc      prefixValid(1920) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0027 begin`);
      logInfo("prefixValid(1920)");
      const actual: boolean = prefixValid(1920);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0028
     * @tc.name      VPN_PrefixValid_0028
     * @tc.desc      prefixValid(68) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0028 begin`);
      logInfo("prefixValid(68)");
      const actual: boolean = prefixValid(68);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}PrefixValid_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0029
     * @tc.name      VPN_PrefixValid_0029
     * @tc.desc      prefixValid(1500) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0029 begin`);
      logInfo("prefixValid(1500)");
      const actual: boolean = prefixValid(1500);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0030
     * @tc.name      VPN_PrefixValid_0030
     * @tc.desc      prefixValid(1501) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0030 begin`);
      logInfo("prefixValid(1501)");
      const actual: boolean = prefixValid(1501);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0031
     * @tc.name      VPN_PrefixValid_0031
     * @tc.desc      prefixValid(65535) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0031 begin`);
      logInfo("prefixValid(65535)");
      const actual: boolean = prefixValid(65535);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}PrefixValid_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0032
     * @tc.name      VPN_PrefixValid_0032
     * @tc.desc      prefixValid(65536) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0032 begin`);
      logInfo("prefixValid(65536)");
      const actual: boolean = prefixValid(65536);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0033
     * @tc.name      VPN_PrefixValid_0033
     * @tc.desc      prefixValid(40) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0033 begin`);
      logInfo("prefixValid(40)");
      const actual: boolean = prefixValid(40);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0034
     * @tc.name      VPN_PrefixValid_0034
     * @tc.desc      prefixValid(50) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_PrefixValid_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PrefixValid_0034 begin`);
      logInfo("prefixValid(50)");
      const actual: boolean = prefixValid(50);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}PrefixValid_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0035
     * @tc.name      VPN_PrefixValid_0035
     * @tc.desc      prefixValid(60) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_PrefixValid_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PrefixValid_0035 begin`);
      logInfo("prefixValid(60)");
      const actual: boolean = prefixValid(60);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0036
     * @tc.name      VPN_PrefixValid_0036
     * @tc.desc      prefixValid(70) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0036 begin`);
      logInfo("prefixValid(70)");
      const actual: boolean = prefixValid(70);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0037
     * @tc.name      VPN_PrefixValid_0037
     * @tc.desc      prefixValid(80) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0037 begin`);
      logInfo("prefixValid(80)");
      const actual: boolean = prefixValid(80);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}PrefixValid_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_PREFIX_VALID_0038
     * @tc.name      VPN_PrefixValid_0038
     * @tc.desc      prefixValid(90) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_PrefixValid_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrefixValid_0038 begin`);
      logInfo("prefixValid(90)");
      const actual: boolean = prefixValid(90);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}PrefixValid_0038 end`);
    });
  });
}
