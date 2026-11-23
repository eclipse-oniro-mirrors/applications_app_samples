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
  networkValid,
  vpnConfigSummary,
  routeSummary,
  addressCount,
  blockedAppCount,
} from '../model/VPNLogic';

/** VpnConfigMatrixTest logic checks (12 cases). */
export default function vpnConfigMatrixTest(): void {
  describe('VpnConfigMatrixTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_MATRIX_0001
     * @tc.name      VPN_ConfigMatrix_0001
     * @tc.desc      vpn config matrix 10.0.0.5,app0,0,68,114.114.114.114,vpn-tun,10.0.0.8,24,10.0.0.5,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigMatrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigMatrix_0001 begin`);
      logInfo("config matrix 10.0.0.5,app0,0,68,114.114.114.114,vpn-tun,10.0.0.8,24,10.0.0.5,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app0", 0, 68, "114.114.114.114") + '|' + routeSummary("vpn-tun", "10.0.0.8", 24, "10.0.0.5", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app0");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app0|vpn-tun:10.0.0.8/24:10.0.0.5:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app0|vpn-tun:10.0.0.8/24:10.0.0.5:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigMatrix_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_MATRIX_0002
     * @tc.name      VPN_ConfigMatrix_0002
     * @tc.desc      vpn config matrix 1.2.3.4,app1,24,1400,8.8.8.8,,8.8.8.8,0,1.1.1.1,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigMatrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigMatrix_0002 begin`);
      logInfo("config matrix 1.2.3.4,app1,24,1400,8.8.8.8,,8.8.8.8,0,1.1.1.1,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app1", 24, 1400, "8.8.8.8") + '|' + routeSummary("", "8.8.8.8", 0, "1.1.1.1", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app1");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app1|:8.8.8.8/0:1.1.1.1:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app1|:8.8.8.8/0:1.1.1.1:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigMatrix_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_MATRIX_0003
     * @tc.name      VPN_ConfigMatrix_0003
     * @tc.desc      vpn config matrix ,app2,32,1500,,tun0,10.0.0.8,32,10.0.0.5,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigMatrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigMatrix_0003 begin`);
      logInfo("config matrix ,app2,32,1500,,tun0,10.0.0.8,32,10.0.0.5,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app2", 32, 1500, "") + '|' + routeSummary("tun0", "10.0.0.8", 32, "10.0.0.5", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app2");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app2|tun0:10.0.0.8/32:10.0.0.5:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app2|tun0:10.0.0.8/32:10.0.0.5:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigMatrix_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_MATRIX_0004
     * @tc.name      VPN_ConfigMatrix_0004
     * @tc.desc      vpn config matrix 256.1.1.1,app0,33,1501,1.1.1.1,vpn-tun,8.8.8.8,33,1.1.1.1,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigMatrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigMatrix_0004 begin`);
      logInfo("config matrix 256.1.1.1,app0,33,1501,1.1.1.1,vpn-tun,8.8.8.8,33,1.1.1.1,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app0", 33, 1501, "1.1.1.1") + '|' + routeSummary("vpn-tun", "8.8.8.8", 33, "1.1.1.1", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app0");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app0|vpn-tun:8.8.8.8/33:1.1.1.1:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app0|vpn-tun:8.8.8.8/33:1.1.1.1:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigMatrix_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_MATRIX_0005
     * @tc.name      VPN_ConfigMatrix_0005
     * @tc.desc      vpn config matrix 10.0.0.5,app1,0,68,114.114.114.114,,10.0.0.8,24,10.0.0.5,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigMatrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigMatrix_0005 begin`);
      logInfo("config matrix 10.0.0.5,app1,0,68,114.114.114.114,,10.0.0.8,24,10.0.0.5,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app1", 0, 68, "114.114.114.114") + '|' + routeSummary("", "10.0.0.8", 24, "10.0.0.5", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app1");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app1|:10.0.0.8/24:10.0.0.5:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app1|:10.0.0.8/24:10.0.0.5:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigMatrix_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_MATRIX_0006
     * @tc.name      VPN_ConfigMatrix_0006
     * @tc.desc      vpn config matrix 1.2.3.4,app2,24,1400,8.8.8.8,tun0,8.8.8.8,0,1.1.1.1,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigMatrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigMatrix_0006 begin`);
      logInfo("config matrix 1.2.3.4,app2,24,1400,8.8.8.8,tun0,8.8.8.8,0,1.1.1.1,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app2", 24, 1400, "8.8.8.8") + '|' + routeSummary("tun0", "8.8.8.8", 0, "1.1.1.1", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app2");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app2|tun0:8.8.8.8/0:1.1.1.1:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app2|tun0:8.8.8.8/0:1.1.1.1:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigMatrix_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_MATRIX_0007
     * @tc.name      VPN_ConfigMatrix_0007
     * @tc.desc      vpn config matrix ,app0,32,1500,,vpn-tun,10.0.0.8,32,10.0.0.5,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigMatrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigMatrix_0007 begin`);
      logInfo("config matrix ,app0,32,1500,,vpn-tun,10.0.0.8,32,10.0.0.5,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app0", 32, 1500, "") + '|' + routeSummary("vpn-tun", "10.0.0.8", 32, "10.0.0.5", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app0");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app0|vpn-tun:10.0.0.8/32:10.0.0.5:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app0|vpn-tun:10.0.0.8/32:10.0.0.5:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigMatrix_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_MATRIX_0008
     * @tc.name      VPN_ConfigMatrix_0008
     * @tc.desc      vpn config matrix 256.1.1.1,app1,33,1501,1.1.1.1,,8.8.8.8,33,1.1.1.1,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigMatrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigMatrix_0008 begin`);
      logInfo("config matrix 256.1.1.1,app1,33,1501,1.1.1.1,,8.8.8.8,33,1.1.1.1,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app1", 33, 1501, "1.1.1.1") + '|' + routeSummary("", "8.8.8.8", 33, "1.1.1.1", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app1");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app1|:8.8.8.8/33:1.1.1.1:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app1|:8.8.8.8/33:1.1.1.1:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigMatrix_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_MATRIX_0009
     * @tc.name      VPN_ConfigMatrix_0009
     * @tc.desc      vpn config matrix 10.0.0.5,app2,0,68,114.114.114.114,tun0,10.0.0.8,24,10.0.0.5,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigMatrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigMatrix_0009 begin`);
      logInfo("config matrix 10.0.0.5,app2,0,68,114.114.114.114,tun0,10.0.0.8,24,10.0.0.5,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app2", 0, 68, "114.114.114.114") + '|' + routeSummary("tun0", "10.0.0.8", 24, "10.0.0.5", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app2");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app2|tun0:10.0.0.8/24:10.0.0.5:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app2|tun0:10.0.0.8/24:10.0.0.5:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigMatrix_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_MATRIX_0010
     * @tc.name      VPN_ConfigMatrix_0010
     * @tc.desc      vpn config matrix 1.2.3.4,app0,24,1400,8.8.8.8,vpn-tun,8.8.8.8,0,1.1.1.1,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigMatrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigMatrix_0010 begin`);
      logInfo("config matrix 1.2.3.4,app0,24,1400,8.8.8.8,vpn-tun,8.8.8.8,0,1.1.1.1,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app0", 24, 1400, "8.8.8.8") + '|' + routeSummary("vpn-tun", "8.8.8.8", 0, "1.1.1.1", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app0");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app0|vpn-tun:8.8.8.8/0:1.1.1.1:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app0|vpn-tun:8.8.8.8/0:1.1.1.1:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigMatrix_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_MATRIX_0011
     * @tc.name      VPN_ConfigMatrix_0011
     * @tc.desc      vpn config matrix ,app1,32,1500,,,10.0.0.8,32,10.0.0.5,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigMatrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigMatrix_0011 begin`);
      logInfo("config matrix ,app1,32,1500,,,10.0.0.8,32,10.0.0.5,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app1", 32, 1500, "") + '|' + routeSummary("", "10.0.0.8", 32, "10.0.0.5", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app1");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app1|:10.0.0.8/32:10.0.0.5:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app1|:10.0.0.8/32:10.0.0.5:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigMatrix_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_MATRIX_0012
     * @tc.name      VPN_ConfigMatrix_0012
     * @tc.desc      vpn config matrix 256.1.1.1,app2,33,1501,1.1.1.1,tun0,8.8.8.8,33,1.1.1.1,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigMatrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigMatrix_0012 begin`);
      logInfo("config matrix 256.1.1.1,app2,33,1501,1.1.1.1,tun0,8.8.8.8,33,1.1.1.1,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app2", 33, 1501, "1.1.1.1") + '|' + routeSummary("tun0", "8.8.8.8", 33, "1.1.1.1", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app2");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app2|tun0:8.8.8.8/33:1.1.1.1:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app2|tun0:8.8.8.8/33:1.1.1.1:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigMatrix_0012 end`);
    });
  });
}
