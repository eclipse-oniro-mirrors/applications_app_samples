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
  vpnConfigSummary,
} from '../model/VPNLogic';

/** ConfigSummaryTest logic checks (12 cases). */
export default function configSummaryTest(): void {
  describe('ConfigSummaryTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_SUMMARY_0001
     * @tc.name      VPN_ConfigSummary_0001
     * @tc.desc      vpnConfigSummary for tun "10.0.0.5".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigSummary_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigSummary_0001 begin`);
      logInfo("vpnConfigSummary(\"10.0.0.5\", \"com.example.baidumyapplication\", 24, 1400, \"114.114.114.114\")");
      const actual: string = vpnConfigSummary("10.0.0.5", "com.example.baidumyapplication", 24, 1400, "114.114.114.114");
      logInfo('actual=' + String(actual) + ', expected=' + "10.0.0.5/24|1400|114.114.114.114|com.example.baidumyapplication");
      expect(actual).assertEqual("10.0.0.5/24|1400|114.114.114.114|com.example.baidumyapplication");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigSummary_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_SUMMARY_0002
     * @tc.name      VPN_ConfigSummary_0002
     * @tc.desc      vpnConfigSummary for tun "1.2.3.4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigSummary_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigSummary_0002 begin`);
      logInfo("vpnConfigSummary(\"1.2.3.4\", \"\", 0, 68, \"8.8.8.8\")");
      const actual: string = vpnConfigSummary("1.2.3.4", "", 0, 68, "8.8.8.8");
      logInfo('actual=' + String(actual) + ', expected=' + "1.2.3.4/0|68|8.8.8.8|");
      expect(actual).assertEqual("1.2.3.4/0|68|8.8.8.8|");
      logInfo(`${BUNDLE}ConfigSummary_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_SUMMARY_0003
     * @tc.name      VPN_ConfigSummary_0003
     * @tc.desc      vpnConfigSummary for tun "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigSummary_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigSummary_0003 begin`);
      logInfo("vpnConfigSummary(\"\", \"com.example.testvpn\", 32, 1500, \"1.1.1.1\")");
      const actual: string = vpnConfigSummary("", "com.example.testvpn", 32, 1500, "1.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "/32|1500|1.1.1.1|com.example.testvpn");
      expect(actual).assertEqual("/32|1500|1.1.1.1|com.example.testvpn");
      logInfo(`${BUNDLE}ConfigSummary_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_SUMMARY_0004
     * @tc.name      VPN_ConfigSummary_0004
     * @tc.desc      vpnConfigSummary for tun "192.168.1.1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigSummary_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigSummary_0004 begin`);
      logInfo("vpnConfigSummary(\"192.168.1.1\", \"com.example.baidumyapplication\", 33, 1501, \"\")");
      const actual: string = vpnConfigSummary("192.168.1.1", "com.example.baidumyapplication", 33, 1501, "");
      logInfo('actual=' + String(actual) + ', expected=' + "192.168.1.1/33|1501||com.example.baidumyapplication");
      expect(actual).assertEqual("192.168.1.1/33|1501||com.example.baidumyapplication");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigSummary_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_SUMMARY_0005
     * @tc.name      VPN_ConfigSummary_0005
     * @tc.desc      vpnConfigSummary for tun "10.0.0.5".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigSummary_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigSummary_0005 begin`);
      logInfo("vpnConfigSummary(\"10.0.0.5\", \"\", 24, 1400, \"114.114.114.114\")");
      const actual: string = vpnConfigSummary("10.0.0.5", "", 24, 1400, "114.114.114.114");
      logInfo('actual=' + String(actual) + ', expected=' + "10.0.0.5/24|1400|114.114.114.114|");
      expect(actual).assertEqual("10.0.0.5/24|1400|114.114.114.114|");
      logInfo(`${BUNDLE}ConfigSummary_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_SUMMARY_0006
     * @tc.name      VPN_ConfigSummary_0006
     * @tc.desc      vpnConfigSummary for tun "1.2.3.4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigSummary_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigSummary_0006 begin`);
      logInfo("vpnConfigSummary(\"1.2.3.4\", \"com.example.testvpn\", 0, 68, \"8.8.8.8\")");
      const actual: string = vpnConfigSummary("1.2.3.4", "com.example.testvpn", 0, 68, "8.8.8.8");
      logInfo('actual=' + String(actual) + ', expected=' + "1.2.3.4/0|68|8.8.8.8|com.example.testvpn");
      expect(actual).assertEqual("1.2.3.4/0|68|8.8.8.8|com.example.testvpn");
      logInfo(`${BUNDLE}ConfigSummary_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_SUMMARY_0007
     * @tc.name      VPN_ConfigSummary_0007
     * @tc.desc      vpnConfigSummary for tun "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigSummary_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigSummary_0007 begin`);
      logInfo("vpnConfigSummary(\"\", \"com.example.baidumyapplication\", 32, 1500, \"1.1.1.1\")");
      const actual: string = vpnConfigSummary("", "com.example.baidumyapplication", 32, 1500, "1.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "/32|1500|1.1.1.1|com.example.baidumyapplication");
      expect(actual).assertEqual("/32|1500|1.1.1.1|com.example.baidumyapplication");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigSummary_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_SUMMARY_0008
     * @tc.name      VPN_ConfigSummary_0008
     * @tc.desc      vpnConfigSummary for tun "192.168.1.1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigSummary_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigSummary_0008 begin`);
      logInfo("vpnConfigSummary(\"192.168.1.1\", \"\", 33, 1501, \"\")");
      const actual: string = vpnConfigSummary("192.168.1.1", "", 33, 1501, "");
      logInfo('actual=' + String(actual) + ', expected=' + "192.168.1.1/33|1501||");
      expect(actual).assertEqual("192.168.1.1/33|1501||");
      logInfo(`${BUNDLE}ConfigSummary_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_SUMMARY_0009
     * @tc.name      VPN_ConfigSummary_0009
     * @tc.desc      vpnConfigSummary for tun "10.0.0.5".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigSummary_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigSummary_0009 begin`);
      logInfo("vpnConfigSummary(\"10.0.0.5\", \"com.example.testvpn\", 24, 1400, \"114.114.114.114\")");
      const actual: string = vpnConfigSummary("10.0.0.5", "com.example.testvpn", 24, 1400, "114.114.114.114");
      logInfo('actual=' + String(actual) + ', expected=' + "10.0.0.5/24|1400|114.114.114.114|com.example.testvpn");
      expect(actual).assertEqual("10.0.0.5/24|1400|114.114.114.114|com.example.testvpn");
      logInfo(`${BUNDLE}ConfigSummary_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_SUMMARY_0010
     * @tc.name      VPN_ConfigSummary_0010
     * @tc.desc      vpnConfigSummary for tun "1.2.3.4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigSummary_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigSummary_0010 begin`);
      logInfo("vpnConfigSummary(\"1.2.3.4\", \"com.example.baidumyapplication\", 0, 68, \"8.8.8.8\")");
      const actual: string = vpnConfigSummary("1.2.3.4", "com.example.baidumyapplication", 0, 68, "8.8.8.8");
      logInfo('actual=' + String(actual) + ', expected=' + "1.2.3.4/0|68|8.8.8.8|com.example.baidumyapplication");
      expect(actual).assertEqual("1.2.3.4/0|68|8.8.8.8|com.example.baidumyapplication");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigSummary_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_SUMMARY_0011
     * @tc.name      VPN_ConfigSummary_0011
     * @tc.desc      vpnConfigSummary for tun "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigSummary_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigSummary_0011 begin`);
      logInfo("vpnConfigSummary(\"\", \"\", 32, 1500, \"1.1.1.1\")");
      const actual: string = vpnConfigSummary("", "", 32, 1500, "1.1.1.1");
      logInfo('actual=' + String(actual) + ', expected=' + "/32|1500|1.1.1.1|");
      expect(actual).assertEqual("/32|1500|1.1.1.1|");
      logInfo(`${BUNDLE}ConfigSummary_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_SUMMARY_0012
     * @tc.name      VPN_ConfigSummary_0012
     * @tc.desc      vpnConfigSummary for tun "192.168.1.1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigSummary_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigSummary_0012 begin`);
      logInfo("vpnConfigSummary(\"192.168.1.1\", \"com.example.testvpn\", 33, 1501, \"\")");
      const actual: string = vpnConfigSummary("192.168.1.1", "com.example.testvpn", 33, 1501, "");
      logInfo('actual=' + String(actual) + ', expected=' + "192.168.1.1/33|1501||com.example.testvpn");
      expect(actual).assertEqual("192.168.1.1/33|1501||com.example.testvpn");
      logInfo(`${BUNDLE}ConfigSummary_0012 end`);
    });
  });
}
