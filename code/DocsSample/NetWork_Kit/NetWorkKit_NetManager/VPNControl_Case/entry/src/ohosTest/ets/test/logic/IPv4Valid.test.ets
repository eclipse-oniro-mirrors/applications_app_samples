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
  isValidIPv4,
} from '../model/VPNLogic';

/** IPv4ValidTest logic checks (43 cases). */
export default function ipv4ValidTest(): void {
  describe('IPv4ValidTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0001
     * @tc.name      VPN_IPv4Valid_0001
     * @tc.desc      isValidIPv4("") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_IPv4Valid_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IPv4Valid_0001 begin`);
      logInfo("isValidIPv4(\"\")");
      const actual: boolean = isValidIPv4("");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0002
     * @tc.name      VPN_IPv4Valid_0002
     * @tc.desc      isValidIPv4(".") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0002 begin`);
      logInfo("isValidIPv4(\".\")");
      const actual: boolean = isValidIPv4(".");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0003
     * @tc.name      VPN_IPv4Valid_0003
     * @tc.desc      isValidIPv4("1") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0003 begin`);
      logInfo("isValidIPv4(\"1\")");
      const actual: boolean = isValidIPv4("1");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0004
     * @tc.name      VPN_IPv4Valid_0004
     * @tc.desc      isValidIPv4("1.2") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0004 begin`);
      logInfo("isValidIPv4(\"1.2\")");
      const actual: boolean = isValidIPv4("1.2");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0005
     * @tc.name      VPN_IPv4Valid_0005
     * @tc.desc      isValidIPv4("1.2.3") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0005 begin`);
      logInfo("isValidIPv4(\"1.2.3\")");
      const actual: boolean = isValidIPv4("1.2.3");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0006
     * @tc.name      VPN_IPv4Valid_0006
     * @tc.desc      isValidIPv4("1.2.3.4") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0006 begin`);
      logInfo("isValidIPv4(\"1.2.3.4\")");
      const actual: boolean = isValidIPv4("1.2.3.4");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}IPv4Valid_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0007
     * @tc.name      VPN_IPv4Valid_0007
     * @tc.desc      isValidIPv4("0.0.0.0") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0007 begin`);
      logInfo("isValidIPv4(\"0.0.0.0\")");
      const actual: boolean = isValidIPv4("0.0.0.0");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0008
     * @tc.name      VPN_IPv4Valid_0008
     * @tc.desc      isValidIPv4("255.255.255.255") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0008 begin`);
      logInfo("isValidIPv4(\"255.255.255.255\")");
      const actual: boolean = isValidIPv4("255.255.255.255");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}IPv4Valid_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0009
     * @tc.name      VPN_IPv4Valid_0009
     * @tc.desc      isValidIPv4("256.1.1.1") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0009 begin`);
      logInfo("isValidIPv4(\"256.1.1.1\")");
      const actual: boolean = isValidIPv4("256.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0010
     * @tc.name      VPN_IPv4Valid_0010
     * @tc.desc      isValidIPv4("1.256.1.1") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0010 begin`);
      logInfo("isValidIPv4(\"1.256.1.1\")");
      const actual: boolean = isValidIPv4("1.256.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0011
     * @tc.name      VPN_IPv4Valid_0011
     * @tc.desc      isValidIPv4("1.1.256.1") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0011 begin`);
      logInfo("isValidIPv4(\"1.1.256.1\")");
      const actual: boolean = isValidIPv4("1.1.256.1");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0012
     * @tc.name      VPN_IPv4Valid_0012
     * @tc.desc      isValidIPv4("1.1.1.256") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_IPv4Valid_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IPv4Valid_0012 begin`);
      logInfo("isValidIPv4(\"1.1.1.256\")");
      const actual: boolean = isValidIPv4("1.1.1.256");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0013
     * @tc.name      VPN_IPv4Valid_0013
     * @tc.desc      isValidIPv4("-1.1.1.1") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0013 begin`);
      logInfo("isValidIPv4(\"-1.1.1.1\")");
      const actual: boolean = isValidIPv4("-1.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0014
     * @tc.name      VPN_IPv4Valid_0014
     * @tc.desc      isValidIPv4("1.-1.1.1") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0014 begin`);
      logInfo("isValidIPv4(\"1.-1.1.1\")");
      const actual: boolean = isValidIPv4("1.-1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0015
     * @tc.name      VPN_IPv4Valid_0015
     * @tc.desc      isValidIPv4("1.1.1") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0015 begin`);
      logInfo("isValidIPv4(\"1.1.1\")");
      const actual: boolean = isValidIPv4("1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0016
     * @tc.name      VPN_IPv4Valid_0016
     * @tc.desc      isValidIPv4("1.1.1.1.1") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0016 begin`);
      logInfo("isValidIPv4(\"1.1.1.1.1\")");
      const actual: boolean = isValidIPv4("1.1.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0017
     * @tc.name      VPN_IPv4Valid_0017
     * @tc.desc      isValidIPv4("a.b.c.d") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0017 begin`);
      logInfo("isValidIPv4(\"a.b.c.d\")");
      const actual: boolean = isValidIPv4("a.b.c.d");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0018
     * @tc.name      VPN_IPv4Valid_0018
     * @tc.desc      isValidIPv4("1.2.3.a") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_IPv4Valid_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IPv4Valid_0018 begin`);
      logInfo("isValidIPv4(\"1.2.3.a\")");
      const actual: boolean = isValidIPv4("1.2.3.a");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0019
     * @tc.name      VPN_IPv4Valid_0019
     * @tc.desc      isValidIPv4("01.2.3.4") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0019 begin`);
      logInfo("isValidIPv4(\"01.2.3.4\")");
      const actual: boolean = isValidIPv4("01.2.3.4");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0020
     * @tc.name      VPN_IPv4Valid_0020
     * @tc.desc      isValidIPv4("1.02.3.4") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0020 begin`);
      logInfo("isValidIPv4(\"1.02.3.4\")");
      const actual: boolean = isValidIPv4("1.02.3.4");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0021
     * @tc.name      VPN_IPv4Valid_0021
     * @tc.desc      isValidIPv4("1.2.03.4") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0021 begin`);
      logInfo("isValidIPv4(\"1.2.03.4\")");
      const actual: boolean = isValidIPv4("1.2.03.4");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0022
     * @tc.name      VPN_IPv4Valid_0022
     * @tc.desc      isValidIPv4("1.2.3.04") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0022 begin`);
      logInfo("isValidIPv4(\"1.2.3.04\")");
      const actual: boolean = isValidIPv4("1.2.3.04");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0023
     * @tc.name      VPN_IPv4Valid_0023
     * @tc.desc      isValidIPv4("00.0.0.0") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_IPv4Valid_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IPv4Valid_0023 begin`);
      logInfo("isValidIPv4(\"00.0.0.0\")");
      const actual: boolean = isValidIPv4("00.0.0.0");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0024
     * @tc.name      VPN_IPv4Valid_0024
     * @tc.desc      isValidIPv4(" 1.2.3.4") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0024 begin`);
      logInfo("isValidIPv4(\" 1.2.3.4\")");
      const actual: boolean = isValidIPv4(" 1.2.3.4");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}IPv4Valid_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0025
     * @tc.name      VPN_IPv4Valid_0025
     * @tc.desc      isValidIPv4("1.2.3.4 ") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0025 begin`);
      logInfo("isValidIPv4(\"1.2.3.4 \")");
      const actual: boolean = isValidIPv4("1.2.3.4 ");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0026
     * @tc.name      VPN_IPv4Valid_0026
     * @tc.desc      isValidIPv4("1..2.3") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0026 begin`);
      logInfo("isValidIPv4(\"1..2.3\")");
      const actual: boolean = isValidIPv4("1..2.3");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0027
     * @tc.name      VPN_IPv4Valid_0027
     * @tc.desc      isValidIPv4("1.2..3") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0027 begin`);
      logInfo("isValidIPv4(\"1.2..3\")");
      const actual: boolean = isValidIPv4("1.2..3");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0028
     * @tc.name      VPN_IPv4Valid_0028
     * @tc.desc      isValidIPv4("1.2.3.") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0028 begin`);
      logInfo("isValidIPv4(\"1.2.3.\")");
      const actual: boolean = isValidIPv4("1.2.3.");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0029
     * @tc.name      VPN_IPv4Valid_0029
     * @tc.desc      isValidIPv4(".1.2.3") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0029 begin`);
      logInfo("isValidIPv4(\".1.2.3\")");
      const actual: boolean = isValidIPv4(".1.2.3");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0030
     * @tc.name      VPN_IPv4Valid_0030
     * @tc.desc      isValidIPv4("10.0.0.5") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0030 begin`);
      logInfo("isValidIPv4(\"10.0.0.5\")");
      const actual: boolean = isValidIPv4("10.0.0.5");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}IPv4Valid_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0031
     * @tc.name      VPN_IPv4Valid_0031
     * @tc.desc      isValidIPv4("192.168.xxx.xxx") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0031 begin`);
      logInfo("isValidIPv4(\"192.168.xxx.xxx\")");
      const actual: boolean = isValidIPv4("192.168.xxx.xxx");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0032
     * @tc.name      VPN_IPv4Valid_0032
     * @tc.desc      isValidIPv4("114.114.114.114") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0032 begin`);
      logInfo("isValidIPv4(\"114.114.114.114\")");
      const actual: boolean = isValidIPv4("114.114.114.114");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}IPv4Valid_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0033
     * @tc.name      VPN_IPv4Valid_0033
     * @tc.desc      isValidIPv4("127.0.0.1") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0033 begin`);
      logInfo("isValidIPv4(\"127.0.0.1\")");
      const actual: boolean = isValidIPv4("127.0.0.1");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}IPv4Valid_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0034
     * @tc.name      VPN_IPv4Valid_0034
     * @tc.desc      isValidIPv4("8.8.8.8") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_IPv4Valid_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IPv4Valid_0034 begin`);
      logInfo("isValidIPv4(\"8.8.8.8\")");
      const actual: boolean = isValidIPv4("8.8.8.8");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0035
     * @tc.name      VPN_IPv4Valid_0035
     * @tc.desc      isValidIPv4("999.1.1.1") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_IPv4Valid_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IPv4Valid_0035 begin`);
      logInfo("isValidIPv4(\"999.1.1.1\")");
      const actual: boolean = isValidIPv4("999.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0036
     * @tc.name      VPN_IPv4Valid_0036
     * @tc.desc      isValidIPv4("1.1.1.999") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0036 begin`);
      logInfo("isValidIPv4(\"1.1.1.999\")");
      const actual: boolean = isValidIPv4("1.1.1.999");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0037
     * @tc.name      VPN_IPv4Valid_0037
     * @tc.desc      isValidIPv4("1.1.1.-1") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0037 begin`);
      logInfo("isValidIPv4(\"1.1.1.-1\")");
      const actual: boolean = isValidIPv4("1.1.1.-1");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0038
     * @tc.name      VPN_IPv4Valid_0038
     * @tc.desc      isValidIPv4("1.1.1.+1") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0038 begin`);
      logInfo("isValidIPv4(\"1.1.1.+1\")");
      const actual: boolean = isValidIPv4("1.1.1.+1");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}IPv4Valid_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0039
     * @tc.name      VPN_IPv4Valid_0039
     * @tc.desc      isValidIPv4("0x1.2.3.4") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0039 begin`);
      logInfo("isValidIPv4(\"0x1.2.3.4\")");
      const actual: boolean = isValidIPv4("0x1.2.3.4");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0040
     * @tc.name      VPN_IPv4Valid_0040
     * @tc.desc      isValidIPv4("1.2.3.4\n") reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0040 begin`);
      logInfo("isValidIPv4(\"1.2.3.4\\n\")");
      const actual: boolean = isValidIPv4("1.2.3.4\n");
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0041
     * @tc.name      VPN_IPv4Valid_0041
     * @tc.desc      isValidIPv4("１０.0.0.5") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0041 begin`);
      logInfo("isValidIPv4(\"１０.0.0.5\")");
      const actual: boolean = isValidIPv4("１０.0.0.5");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0042
     * @tc.name      VPN_IPv4Valid_0042
     * @tc.desc      isValidIPv4("1.2.3.4.5") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0042 begin`);
      logInfo("isValidIPv4(\"1.2.3.4.5\")");
      const actual: boolean = isValidIPv4("1.2.3.4.5");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}IPv4Valid_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_IPV4_VALID_0043
     * @tc.name      VPN_IPv4Valid_0043
     * @tc.desc      isValidIPv4("1.2.3.4a") reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_IPv4Valid_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IPv4Valid_0043 begin`);
      logInfo("isValidIPv4(\"1.2.3.4a\")");
      const actual: boolean = isValidIPv4("1.2.3.4a");
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}IPv4Valid_0043 end`);
    });
  });
}
