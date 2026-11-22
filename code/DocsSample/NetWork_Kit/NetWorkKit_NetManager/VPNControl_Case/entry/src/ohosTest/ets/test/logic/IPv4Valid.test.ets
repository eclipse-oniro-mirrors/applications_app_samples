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
