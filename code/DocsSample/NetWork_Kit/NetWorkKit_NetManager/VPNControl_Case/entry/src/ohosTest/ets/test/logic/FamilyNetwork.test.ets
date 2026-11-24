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
  familyName,
  networkValid,
} from '../model/VPNLogic';

/** FamilyNetworkTest logic checks (44 cases). */
export default function familyNetworkTest(): void {
  describe('FamilyNetworkTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0001
     * @tc.name      VPN_FamilyNetwork_0001
     * @tc.desc      family/network validation for family 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FamilyNetwork_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0001 begin`);
      logInfo("familyName(0) + ':' + networkValid(\"10.0.0.5\", 0, 1400, \"192.168.xxx.xxx\")");
      const actual: string = familyName(0) + ':' + networkValid("10.0.0.5", 0, 1400, "192.168.xxx.xxx");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0002
     * @tc.name      VPN_FamilyNetwork_0002
     * @tc.desc      family/network validation for family 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0002 begin`);
      logInfo("familyName(1) + ':' + networkValid(\"192.168.xxx.xxx\", 24, 68, \"256.1.1.1\")");
      const actual: string = familyName(1) + ':' + networkValid("192.168.xxx.xxx", 24, 68, "256.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv4:false");
      expect(actual).assertEqual("IPv4:false");
      logInfo(`${BUNDLE}FamilyNetwork_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0003
     * @tc.name      VPN_FamilyNetwork_0003
     * @tc.desc      family/network validation for family 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0003 begin`);
      logInfo("familyName(2) + ':' + networkValid(\"1.2.3.4\", 32, 1501, \"1.2.3.4\")");
      const actual: string = familyName(2) + ':' + networkValid("1.2.3.4", 32, 1501, "1.2.3.4");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv6:false");
      expect(actual).assertEqual("IPv6:false");
      logInfo(`${BUNDLE}FamilyNetwork_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0004
     * @tc.name      VPN_FamilyNetwork_0004
     * @tc.desc      family/network validation for family 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0004 begin`);
      logInfo("familyName(3) + ':' + networkValid(\"\", 33, 1400, \"10.0.0.5\")");
      const actual: string = familyName(3) + ':' + networkValid("", 33, 1400, "10.0.0.5");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0005
     * @tc.name      VPN_FamilyNetwork_0005
     * @tc.desc      family/network validation for family -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0005 begin`);
      logInfo("familyName(-1) + ':' + networkValid(\"256.1.1.1\", 0, 68, \"\")");
      const actual: string = familyName(-1) + ':' + networkValid("256.1.1.1", 0, 68, "");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo(`${BUNDLE}FamilyNetwork_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0006
     * @tc.name      VPN_FamilyNetwork_0006
     * @tc.desc      family/network validation for family 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0006 begin`);
      logInfo("familyName(10) + ':' + networkValid(\"10.0.0.5\", 24, 1501, \"192.168.xxx.xxx\")");
      const actual: string = familyName(10) + ':' + networkValid("10.0.0.5", 24, 1501, "192.168.xxx.xxx");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo(`${BUNDLE}FamilyNetwork_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0007
     * @tc.name      VPN_FamilyNetwork_0007
     * @tc.desc      family/network validation for family 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0007 begin`);
      logInfo("familyName(0) + ':' + networkValid(\"192.168.xxx.xxx\", 32, 1400, \"256.1.1.1\")");
      const actual: string = familyName(0) + ':' + networkValid("192.168.xxx.xxx", 32, 1400, "256.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0008
     * @tc.name      VPN_FamilyNetwork_0008
     * @tc.desc      family/network validation for family 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0008 begin`);
      logInfo("familyName(1) + ':' + networkValid(\"1.2.3.4\", 33, 68, \"1.2.3.4\")");
      const actual: string = familyName(1) + ':' + networkValid("1.2.3.4", 33, 68, "1.2.3.4");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv4:false");
      expect(actual).assertEqual("IPv4:false");
      logInfo(`${BUNDLE}FamilyNetwork_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0009
     * @tc.name      VPN_FamilyNetwork_0009
     * @tc.desc      family/network validation for family 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0009 begin`);
      logInfo("familyName(2) + ':' + networkValid(\"\", 0, 1501, \"10.0.0.5\")");
      const actual: string = familyName(2) + ':' + networkValid("", 0, 1501, "10.0.0.5");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv6:false");
      expect(actual).assertEqual("IPv6:false");
      logInfo(`${BUNDLE}FamilyNetwork_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0010
     * @tc.name      VPN_FamilyNetwork_0010
     * @tc.desc      family/network validation for family 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0010 begin`);
      logInfo("familyName(3) + ':' + networkValid(\"256.1.1.1\", 24, 1400, \"\")");
      const actual: string = familyName(3) + ':' + networkValid("256.1.1.1", 24, 1400, "");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0011
     * @tc.name      VPN_FamilyNetwork_0011
     * @tc.desc      family/network validation for family -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0011 begin`);
      logInfo("familyName(-1) + ':' + networkValid(\"10.0.0.5\", 32, 68, \"192.168.xxx.xxx\")");
      const actual: string = familyName(-1) + ':' + networkValid("10.0.0.5", 32, 68, "192.168.xxx.xxx");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo(`${BUNDLE}FamilyNetwork_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0012
     * @tc.name      VPN_FamilyNetwork_0012
     * @tc.desc      family/network validation for family 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FamilyNetwork_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0012 begin`);
      logInfo("familyName(10) + ':' + networkValid(\"192.168.xxx.xxx\", 33, 1501, \"256.1.1.1\")");
      const actual: string = familyName(10) + ':' + networkValid("192.168.xxx.xxx", 33, 1501, "256.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo(`${BUNDLE}FamilyNetwork_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0013
     * @tc.name      VPN_FamilyNetwork_0013
     * @tc.desc      family/network validation for family 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0013 begin`);
      logInfo("familyName(0) + ':' + networkValid(\"1.2.3.4\", 0, 1400, \"1.2.3.4\")");
      const actual: string = familyName(0) + ':' + networkValid("1.2.3.4", 0, 1400, "1.2.3.4");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:true");
      expect(actual).assertEqual("unknown:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0014
     * @tc.name      VPN_FamilyNetwork_0014
     * @tc.desc      family/network validation for family 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0014 begin`);
      logInfo("familyName(1) + ':' + networkValid(\"\", 24, 68, \"10.0.0.5\")");
      const actual: string = familyName(1) + ':' + networkValid("", 24, 68, "10.0.0.5");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv4:false");
      expect(actual).assertEqual("IPv4:false");
      logInfo(`${BUNDLE}FamilyNetwork_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0015
     * @tc.name      VPN_FamilyNetwork_0015
     * @tc.desc      family/network validation for family 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0015 begin`);
      logInfo("familyName(2) + ':' + networkValid(\"256.1.1.1\", 32, 1501, \"\")");
      const actual: string = familyName(2) + ':' + networkValid("256.1.1.1", 32, 1501, "");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv6:false");
      expect(actual).assertEqual("IPv6:false");
      logInfo(`${BUNDLE}FamilyNetwork_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0016
     * @tc.name      VPN_FamilyNetwork_0016
     * @tc.desc      family/network validation for family 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0016 begin`);
      logInfo("familyName(3) + ':' + networkValid(\"10.0.0.5\", 33, 1400, \"192.168.xxx.xxx\")");
      const actual: string = familyName(3) + ':' + networkValid("10.0.0.5", 33, 1400, "192.168.xxx.xxx");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0017
     * @tc.name      VPN_FamilyNetwork_0017
     * @tc.desc      family/network validation for family -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0017 begin`);
      logInfo("familyName(-1) + ':' + networkValid(\"192.168.xxx.xxx\", 0, 68, \"256.1.1.1\")");
      const actual: string = familyName(-1) + ':' + networkValid("192.168.xxx.xxx", 0, 68, "256.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo(`${BUNDLE}FamilyNetwork_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0018
     * @tc.name      VPN_FamilyNetwork_0018
     * @tc.desc      family/network validation for family 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FamilyNetwork_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0018 begin`);
      logInfo("familyName(10) + ':' + networkValid(\"1.2.3.4\", 24, 1501, \"1.2.3.4\")");
      const actual: string = familyName(10) + ':' + networkValid("1.2.3.4", 24, 1501, "1.2.3.4");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo(`${BUNDLE}FamilyNetwork_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0019
     * @tc.name      VPN_FamilyNetwork_0019
     * @tc.desc      family/network validation for family 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0019 begin`);
      logInfo("familyName(0) + ':' + networkValid(\"\", 32, 1400, \"10.0.0.5\")");
      const actual: string = familyName(0) + ':' + networkValid("", 32, 1400, "10.0.0.5");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0020
     * @tc.name      VPN_FamilyNetwork_0020
     * @tc.desc      family/network validation for family 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0020 begin`);
      logInfo("familyName(1) + ':' + networkValid(\"256.1.1.1\", 33, 68, \"\")");
      const actual: string = familyName(1) + ':' + networkValid("256.1.1.1", 33, 68, "");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv4:false");
      expect(actual).assertEqual("IPv4:false");
      logInfo(`${BUNDLE}FamilyNetwork_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0021
     * @tc.name      VPN_FamilyNetwork_0021
     * @tc.desc      family/network validation for family 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0021 begin`);
      logInfo("familyName(2) + ':' + networkValid(\"10.0.0.5\", 0, 1501, \"192.168.xxx.xxx\")");
      const actual: string = familyName(2) + ':' + networkValid("10.0.0.5", 0, 1501, "192.168.xxx.xxx");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv6:false");
      expect(actual).assertEqual("IPv6:false");
      logInfo(`${BUNDLE}FamilyNetwork_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0022
     * @tc.name      VPN_FamilyNetwork_0022
     * @tc.desc      family/network validation for family 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0022 begin`);
      logInfo("familyName(3) + ':' + networkValid(\"192.168.xxx.xxx\", 24, 1400, \"256.1.1.1\")");
      const actual: string = familyName(3) + ':' + networkValid("192.168.xxx.xxx", 24, 1400, "256.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0023
     * @tc.name      VPN_FamilyNetwork_0023
     * @tc.desc      family/network validation for family -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FamilyNetwork_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0023 begin`);
      logInfo("familyName(-1) + ':' + networkValid(\"1.2.3.4\", 32, 68, \"1.2.3.4\")");
      const actual: string = familyName(-1) + ':' + networkValid("1.2.3.4", 32, 68, "1.2.3.4");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:true");
      expect(actual).assertEqual("unknown:true");
      logInfo(`${BUNDLE}FamilyNetwork_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0024
     * @tc.name      VPN_FamilyNetwork_0024
     * @tc.desc      family/network validation for family 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0024 begin`);
      logInfo("familyName(10) + ':' + networkValid(\"\", 33, 1501, \"10.0.0.5\")");
      const actual: string = familyName(10) + ':' + networkValid("", 33, 1501, "10.0.0.5");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo(`${BUNDLE}FamilyNetwork_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0025
     * @tc.name      VPN_FamilyNetwork_0025
     * @tc.desc      family/network validation for family 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0025 begin`);
      logInfo("familyName(0) + ':' + networkValid(\"256.1.1.1\", 0, 1400, \"\")");
      const actual: string = familyName(0) + ':' + networkValid("256.1.1.1", 0, 1400, "");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0026
     * @tc.name      VPN_FamilyNetwork_0026
     * @tc.desc      family/network validation for family 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0026 begin`);
      logInfo("familyName(1) + ':' + networkValid(\"10.0.0.5\", 24, 68, \"192.168.xxx.xxx\")");
      const actual: string = familyName(1) + ':' + networkValid("10.0.0.5", 24, 68, "192.168.xxx.xxx");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv4:false");
      expect(actual).assertEqual("IPv4:false");
      logInfo(`${BUNDLE}FamilyNetwork_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0027
     * @tc.name      VPN_FamilyNetwork_0027
     * @tc.desc      family/network validation for family 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0027 begin`);
      logInfo("familyName(2) + ':' + networkValid(\"192.168.xxx.xxx\", 32, 1501, \"256.1.1.1\")");
      const actual: string = familyName(2) + ':' + networkValid("192.168.xxx.xxx", 32, 1501, "256.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv6:false");
      expect(actual).assertEqual("IPv6:false");
      logInfo(`${BUNDLE}FamilyNetwork_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0028
     * @tc.name      VPN_FamilyNetwork_0028
     * @tc.desc      family/network validation for family 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0028 begin`);
      logInfo("familyName(3) + ':' + networkValid(\"1.2.3.4\", 33, 1400, \"1.2.3.4\")");
      const actual: string = familyName(3) + ':' + networkValid("1.2.3.4", 33, 1400, "1.2.3.4");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0029
     * @tc.name      VPN_FamilyNetwork_0029
     * @tc.desc      family/network validation for family -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0029 begin`);
      logInfo("familyName(-1) + ':' + networkValid(\"\", 0, 68, \"10.0.0.5\")");
      const actual: string = familyName(-1) + ':' + networkValid("", 0, 68, "10.0.0.5");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo(`${BUNDLE}FamilyNetwork_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0030
     * @tc.name      VPN_FamilyNetwork_0030
     * @tc.desc      family/network validation for family 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0030 begin`);
      logInfo("familyName(10) + ':' + networkValid(\"256.1.1.1\", 24, 1501, \"\")");
      const actual: string = familyName(10) + ':' + networkValid("256.1.1.1", 24, 1501, "");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo(`${BUNDLE}FamilyNetwork_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0031
     * @tc.name      VPN_FamilyNetwork_0031
     * @tc.desc      family/network validation for family 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0031 begin`);
      logInfo("familyName(0) + ':' + networkValid(\"10.0.0.5\", 32, 1400, \"192.168.xxx.xxx\")");
      const actual: string = familyName(0) + ':' + networkValid("10.0.0.5", 32, 1400, "192.168.xxx.xxx");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0032
     * @tc.name      VPN_FamilyNetwork_0032
     * @tc.desc      family/network validation for family 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0032 begin`);
      logInfo("familyName(1) + ':' + networkValid(\"192.168.xxx.xxx\", 33, 68, \"256.1.1.1\")");
      const actual: string = familyName(1) + ':' + networkValid("192.168.xxx.xxx", 33, 68, "256.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv4:false");
      expect(actual).assertEqual("IPv4:false");
      logInfo(`${BUNDLE}FamilyNetwork_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0033
     * @tc.name      VPN_FamilyNetwork_0033
     * @tc.desc      family/network validation for family 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0033 begin`);
      logInfo("familyName(2) + ':' + networkValid(\"1.2.3.4\", 0, 1501, \"1.2.3.4\")");
      const actual: string = familyName(2) + ':' + networkValid("1.2.3.4", 0, 1501, "1.2.3.4");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv6:false");
      expect(actual).assertEqual("IPv6:false");
      logInfo(`${BUNDLE}FamilyNetwork_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0034
     * @tc.name      VPN_FamilyNetwork_0034
     * @tc.desc      family/network validation for family 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FamilyNetwork_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0034 begin`);
      logInfo("familyName(3) + ':' + networkValid(\"\", 24, 1400, \"10.0.0.5\")");
      const actual: string = familyName(3) + ':' + networkValid("", 24, 1400, "10.0.0.5");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0035
     * @tc.name      VPN_FamilyNetwork_0035
     * @tc.desc      family/network validation for family -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FamilyNetwork_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0035 begin`);
      logInfo("familyName(-1) + ':' + networkValid(\"256.1.1.1\", 32, 68, \"\")");
      const actual: string = familyName(-1) + ':' + networkValid("256.1.1.1", 32, 68, "");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo(`${BUNDLE}FamilyNetwork_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0036
     * @tc.name      VPN_FamilyNetwork_0036
     * @tc.desc      family/network validation for family 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0036 begin`);
      logInfo("familyName(10) + ':' + networkValid(\"10.0.0.5\", 33, 1501, \"192.168.xxx.xxx\")");
      const actual: string = familyName(10) + ':' + networkValid("10.0.0.5", 33, 1501, "192.168.xxx.xxx");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo(`${BUNDLE}FamilyNetwork_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0037
     * @tc.name      VPN_FamilyNetwork_0037
     * @tc.desc      family/network validation for family 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0037 begin`);
      logInfo("familyName(0) + ':' + networkValid(\"192.168.xxx.xxx\", 0, 1400, \"256.1.1.1\")");
      const actual: string = familyName(0) + ':' + networkValid("192.168.xxx.xxx", 0, 1400, "256.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0038
     * @tc.name      VPN_FamilyNetwork_0038
     * @tc.desc      family/network validation for family 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0038 begin`);
      logInfo("familyName(1) + ':' + networkValid(\"1.2.3.4\", 24, 68, \"1.2.3.4\")");
      const actual: string = familyName(1) + ':' + networkValid("1.2.3.4", 24, 68, "1.2.3.4");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv4:true");
      expect(actual).assertEqual("IPv4:true");
      logInfo(`${BUNDLE}FamilyNetwork_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0039
     * @tc.name      VPN_FamilyNetwork_0039
     * @tc.desc      family/network validation for family 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0039 begin`);
      logInfo("familyName(2) + ':' + networkValid(\"\", 32, 1501, \"10.0.0.5\")");
      const actual: string = familyName(2) + ':' + networkValid("", 32, 1501, "10.0.0.5");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv6:false");
      expect(actual).assertEqual("IPv6:false");
      logInfo(`${BUNDLE}FamilyNetwork_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0040
     * @tc.name      VPN_FamilyNetwork_0040
     * @tc.desc      family/network validation for family 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0040 begin`);
      logInfo("familyName(3) + ':' + networkValid(\"256.1.1.1\", 33, 1400, \"\")");
      const actual: string = familyName(3) + ':' + networkValid("256.1.1.1", 33, 1400, "");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0041
     * @tc.name      VPN_FamilyNetwork_0041
     * @tc.desc      family/network validation for family -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0041 begin`);
      logInfo("familyName(-1) + ':' + networkValid(\"10.0.0.5\", 0, 68, \"192.168.xxx.xxx\")");
      const actual: string = familyName(-1) + ':' + networkValid("10.0.0.5", 0, 68, "192.168.xxx.xxx");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo(`${BUNDLE}FamilyNetwork_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0042
     * @tc.name      VPN_FamilyNetwork_0042
     * @tc.desc      family/network validation for family 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0042 begin`);
      logInfo("familyName(10) + ':' + networkValid(\"192.168.xxx.xxx\", 24, 1501, \"256.1.1.1\")");
      const actual: string = familyName(10) + ':' + networkValid("192.168.xxx.xxx", 24, 1501, "256.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:false");
      expect(actual).assertEqual("unknown:false");
      logInfo(`${BUNDLE}FamilyNetwork_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0043
     * @tc.name      VPN_FamilyNetwork_0043
     * @tc.desc      family/network validation for family 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0043 begin`);
      logInfo("familyName(0) + ':' + networkValid(\"1.2.3.4\", 32, 1400, \"1.2.3.4\")");
      const actual: string = familyName(0) + ':' + networkValid("1.2.3.4", 32, 1400, "1.2.3.4");
      logInfo('actual=' + String(actual) + ', expected=' + "unknown:true");
      expect(actual).assertEqual("unknown:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FamilyNetwork_0043 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FAMILY_NETWORK_0044
     * @tc.name      VPN_FamilyNetwork_0044
     * @tc.desc      family/network validation for family 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FamilyNetwork_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FamilyNetwork_0044 begin`);
      logInfo("familyName(1) + ':' + networkValid(\"\", 33, 68, \"10.0.0.5\")");
      const actual: string = familyName(1) + ':' + networkValid("", 33, 68, "10.0.0.5");
      logInfo('actual=' + String(actual) + ', expected=' + "IPv4:false");
      expect(actual).assertEqual("IPv4:false");
      logInfo(`${BUNDLE}FamilyNetwork_0044 end`);
    });
  });
}
