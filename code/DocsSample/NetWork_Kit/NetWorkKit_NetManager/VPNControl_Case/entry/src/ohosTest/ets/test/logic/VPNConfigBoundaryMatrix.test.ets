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

/** VPNConfigBoundaryMatrixTest logic checks (450 cases). */
export default function vpnConfigBoundaryMatrixTest(): void {
  describe('VPNConfigBoundaryMatrixTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0001
     * @tc.name      VPN_ConfigBoundary_0001
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app0,iface0,10.0.0.0,24,10.0.0.0,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0001 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app0,iface0,10.0.0.0,24,10.0.0.0,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app0", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.0.0", 24, "10.0.0.0", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app0");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app0|iface0:10.0.0.0/24:10.0.0.0:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app0|iface0:10.0.0.0/24:10.0.0.0:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0002
     * @tc.name      VPN_ConfigBoundary_0002
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app1,iface1,10.0.1.3,0,10.0.0.1,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0002 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app1,iface1,10.0.1.3,0,10.0.0.1,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app1", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.1.3", 0, "10.0.0.1", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app1");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app1|iface1:10.0.1.3/0:10.0.0.1:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app1|iface1:10.0.1.3/0:10.0.0.1:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0003
     * @tc.name      VPN_ConfigBoundary_0003
     * @tc.desc      vpn config boundary ,32,1500,,app2,iface2,10.0.2.6,32,10.0.0.2,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0003 begin`);
      logInfo("config boundary ,32,1500,,app2,iface2,10.0.2.6,32,10.0.0.2,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app2", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.2.6", 32, "10.0.0.2", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app2");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app2|iface2:10.0.2.6/32:10.0.0.2:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app2|iface2:10.0.2.6/32:10.0.0.2:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0004
     * @tc.name      VPN_ConfigBoundary_0004
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app3,iface0,10.0.3.9,33,10.0.0.3,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0004 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app3,iface0,10.0.3.9,33,10.0.0.3,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app3", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.3.9", 33, "10.0.0.3", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app3");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app3|iface0:10.0.3.9/33:10.0.0.3:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app3|iface0:10.0.3.9/33:10.0.0.3:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0005
     * @tc.name      VPN_ConfigBoundary_0005
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app4,iface1,10.0.4.12,24,10.0.0.4,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0005 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app4,iface1,10.0.4.12,24,10.0.0.4,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app4", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.4.12", 24, "10.0.0.4", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app4");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app4|iface1:10.0.4.12/24:10.0.0.4:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app4|iface1:10.0.4.12/24:10.0.0.4:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0006
     * @tc.name      VPN_ConfigBoundary_0006
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app5,iface2,10.0.5.15,0,10.0.0.5,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0006 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app5,iface2,10.0.5.15,0,10.0.0.5,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app5", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.5.15", 0, "10.0.0.5", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app5");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app5|iface2:10.0.5.15/0:10.0.0.5:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app5|iface2:10.0.5.15/0:10.0.0.5:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0007
     * @tc.name      VPN_ConfigBoundary_0007
     * @tc.desc      vpn config boundary ,32,1500,,app6,iface0,10.0.6.18,32,10.0.0.6,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0007 begin`);
      logInfo("config boundary ,32,1500,,app6,iface0,10.0.6.18,32,10.0.0.6,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app6", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.6.18", 32, "10.0.0.6", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app6");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app6|iface0:10.0.6.18/32:10.0.0.6:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app6|iface0:10.0.6.18/32:10.0.0.6:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0008
     * @tc.name      VPN_ConfigBoundary_0008
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app7,iface1,10.0.7.21,33,10.0.0.7,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0008 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app7,iface1,10.0.7.21,33,10.0.0.7,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app7", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.7.21", 33, "10.0.0.7", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app7");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app7|iface1:10.0.7.21/33:10.0.0.7:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app7|iface1:10.0.7.21/33:10.0.0.7:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0009
     * @tc.name      VPN_ConfigBoundary_0009
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app8,iface2,10.0.8.24,24,10.0.0.8,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0009 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app8,iface2,10.0.8.24,24,10.0.0.8,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app8", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.8.24", 24, "10.0.0.8", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app8");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app8|iface2:10.0.8.24/24:10.0.0.8:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app8|iface2:10.0.8.24/24:10.0.0.8:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0010
     * @tc.name      VPN_ConfigBoundary_0010
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app9,iface0,10.0.9.27,0,10.0.0.9,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0010 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app9,iface0,10.0.9.27,0,10.0.0.9,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app9", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.9.27", 0, "10.0.0.9", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app9");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app9|iface0:10.0.9.27/0:10.0.0.9:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app9|iface0:10.0.9.27/0:10.0.0.9:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0011
     * @tc.name      VPN_ConfigBoundary_0011
     * @tc.desc      vpn config boundary ,32,1500,,app10,iface1,10.0.10.30,32,10.0.0.10,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0011 begin`);
      logInfo("config boundary ,32,1500,,app10,iface1,10.0.10.30,32,10.0.0.10,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app10", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.10.30", 32, "10.0.0.10", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app10");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app10|iface1:10.0.10.30/32:10.0.0.10:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app10|iface1:10.0.10.30/32:10.0.0.10:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0012
     * @tc.name      VPN_ConfigBoundary_0012
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app11,iface2,10.0.11.33,33,10.0.0.11,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0012 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app11,iface2,10.0.11.33,33,10.0.0.11,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app11", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.11.33", 33, "10.0.0.11", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app11");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app11|iface2:10.0.11.33/33:10.0.0.11:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app11|iface2:10.0.11.33/33:10.0.0.11:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0013
     * @tc.name      VPN_ConfigBoundary_0013
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app12,iface0,10.0.12.36,24,10.0.0.12,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0013 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app12,iface0,10.0.12.36,24,10.0.0.12,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app12", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.12.36", 24, "10.0.0.12", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app12");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app12|iface0:10.0.12.36/24:10.0.0.12:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app12|iface0:10.0.12.36/24:10.0.0.12:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0014
     * @tc.name      VPN_ConfigBoundary_0014
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app13,iface1,10.0.13.39,0,10.0.0.13,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0014 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app13,iface1,10.0.13.39,0,10.0.0.13,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app13", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.13.39", 0, "10.0.0.13", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app13");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app13|iface1:10.0.13.39/0:10.0.0.13:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app13|iface1:10.0.13.39/0:10.0.0.13:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0015
     * @tc.name      VPN_ConfigBoundary_0015
     * @tc.desc      vpn config boundary ,32,1500,,app14,iface2,10.0.14.42,32,10.0.0.14,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0015 begin`);
      logInfo("config boundary ,32,1500,,app14,iface2,10.0.14.42,32,10.0.0.14,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app14", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.14.42", 32, "10.0.0.14", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app14");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app14|iface2:10.0.14.42/32:10.0.0.14:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app14|iface2:10.0.14.42/32:10.0.0.14:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0016
     * @tc.name      VPN_ConfigBoundary_0016
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app15,iface0,10.0.15.45,33,10.0.0.15,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0016 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app15,iface0,10.0.15.45,33,10.0.0.15,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app15", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.15.45", 33, "10.0.0.15", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app15");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app15|iface0:10.0.15.45/33:10.0.0.15:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app15|iface0:10.0.15.45/33:10.0.0.15:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0017
     * @tc.name      VPN_ConfigBoundary_0017
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app16,iface1,10.0.16.48,24,10.0.0.16,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0017 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app16,iface1,10.0.16.48,24,10.0.0.16,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app16", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.16.48", 24, "10.0.0.16", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app16");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app16|iface1:10.0.16.48/24:10.0.0.16:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app16|iface1:10.0.16.48/24:10.0.0.16:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0018
     * @tc.name      VPN_ConfigBoundary_0018
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app17,iface2,10.0.17.51,0,10.0.0.17,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0018 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app17,iface2,10.0.17.51,0,10.0.0.17,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app17", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.17.51", 0, "10.0.0.17", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app17");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app17|iface2:10.0.17.51/0:10.0.0.17:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app17|iface2:10.0.17.51/0:10.0.0.17:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0019
     * @tc.name      VPN_ConfigBoundary_0019
     * @tc.desc      vpn config boundary ,32,1500,,app18,iface0,10.0.18.54,32,10.0.0.18,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0019 begin`);
      logInfo("config boundary ,32,1500,,app18,iface0,10.0.18.54,32,10.0.0.18,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app18", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.18.54", 32, "10.0.0.18", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app18");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app18|iface0:10.0.18.54/32:10.0.0.18:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app18|iface0:10.0.18.54/32:10.0.0.18:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0020
     * @tc.name      VPN_ConfigBoundary_0020
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app19,iface1,10.0.19.57,33,10.0.0.19,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0020 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app19,iface1,10.0.19.57,33,10.0.0.19,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app19", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.19.57", 33, "10.0.0.19", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app19");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app19|iface1:10.0.19.57/33:10.0.0.19:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app19|iface1:10.0.19.57/33:10.0.0.19:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0021
     * @tc.name      VPN_ConfigBoundary_0021
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app20,iface2,10.0.20.60,24,10.0.0.20,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0021 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app20,iface2,10.0.20.60,24,10.0.0.20,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app20", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.20.60", 24, "10.0.0.20", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app20");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app20|iface2:10.0.20.60/24:10.0.0.20:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app20|iface2:10.0.20.60/24:10.0.0.20:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0022
     * @tc.name      VPN_ConfigBoundary_0022
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app21,iface0,10.0.21.63,0,10.0.0.21,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0022 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app21,iface0,10.0.21.63,0,10.0.0.21,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app21", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.21.63", 0, "10.0.0.21", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app21");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app21|iface0:10.0.21.63/0:10.0.0.21:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app21|iface0:10.0.21.63/0:10.0.0.21:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0023
     * @tc.name      VPN_ConfigBoundary_0023
     * @tc.desc      vpn config boundary ,32,1500,,app22,iface1,10.0.22.66,32,10.0.0.22,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0023 begin`);
      logInfo("config boundary ,32,1500,,app22,iface1,10.0.22.66,32,10.0.0.22,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app22", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.22.66", 32, "10.0.0.22", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app22");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app22|iface1:10.0.22.66/32:10.0.0.22:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app22|iface1:10.0.22.66/32:10.0.0.22:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0024
     * @tc.name      VPN_ConfigBoundary_0024
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app23,iface2,10.0.23.69,33,10.0.0.23,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0024 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app23,iface2,10.0.23.69,33,10.0.0.23,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app23", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.23.69", 33, "10.0.0.23", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app23");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app23|iface2:10.0.23.69/33:10.0.0.23:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app23|iface2:10.0.23.69/33:10.0.0.23:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0025
     * @tc.name      VPN_ConfigBoundary_0025
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app24,iface0,10.0.24.72,24,10.0.0.24,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0025 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app24,iface0,10.0.24.72,24,10.0.0.24,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app24", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.24.72", 24, "10.0.0.24", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app24");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app24|iface0:10.0.24.72/24:10.0.0.24:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app24|iface0:10.0.24.72/24:10.0.0.24:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0026
     * @tc.name      VPN_ConfigBoundary_0026
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app25,iface1,10.0.25.75,0,10.0.0.25,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0026 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app25,iface1,10.0.25.75,0,10.0.0.25,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app25", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.25.75", 0, "10.0.0.25", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app25");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app25|iface1:10.0.25.75/0:10.0.0.25:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app25|iface1:10.0.25.75/0:10.0.0.25:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0027
     * @tc.name      VPN_ConfigBoundary_0027
     * @tc.desc      vpn config boundary ,32,1500,,app26,iface2,10.0.26.78,32,10.0.0.26,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0027 begin`);
      logInfo("config boundary ,32,1500,,app26,iface2,10.0.26.78,32,10.0.0.26,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app26", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.26.78", 32, "10.0.0.26", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app26");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app26|iface2:10.0.26.78/32:10.0.0.26:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app26|iface2:10.0.26.78/32:10.0.0.26:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0028
     * @tc.name      VPN_ConfigBoundary_0028
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app27,iface0,10.0.27.81,33,10.0.0.27,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0028 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app27,iface0,10.0.27.81,33,10.0.0.27,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app27", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.27.81", 33, "10.0.0.27", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app27");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app27|iface0:10.0.27.81/33:10.0.0.27:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app27|iface0:10.0.27.81/33:10.0.0.27:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0029
     * @tc.name      VPN_ConfigBoundary_0029
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app28,iface1,10.0.28.84,24,10.0.0.28,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0029 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app28,iface1,10.0.28.84,24,10.0.0.28,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app28", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.28.84", 24, "10.0.0.28", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app28");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app28|iface1:10.0.28.84/24:10.0.0.28:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app28|iface1:10.0.28.84/24:10.0.0.28:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0030
     * @tc.name      VPN_ConfigBoundary_0030
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app29,iface2,10.0.29.87,0,10.0.0.29,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0030 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app29,iface2,10.0.29.87,0,10.0.0.29,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app29", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.29.87", 0, "10.0.0.29", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app29");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app29|iface2:10.0.29.87/0:10.0.0.29:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app29|iface2:10.0.29.87/0:10.0.0.29:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0031
     * @tc.name      VPN_ConfigBoundary_0031
     * @tc.desc      vpn config boundary ,32,1500,,app30,iface0,10.0.30.90,32,10.0.0.30,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0031 begin`);
      logInfo("config boundary ,32,1500,,app30,iface0,10.0.30.90,32,10.0.0.30,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app30", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.30.90", 32, "10.0.0.30", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app30");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app30|iface0:10.0.30.90/32:10.0.0.30:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app30|iface0:10.0.30.90/32:10.0.0.30:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0032
     * @tc.name      VPN_ConfigBoundary_0032
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app31,iface1,10.0.31.93,33,10.0.0.31,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0032 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app31,iface1,10.0.31.93,33,10.0.0.31,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app31", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.31.93", 33, "10.0.0.31", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app31");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app31|iface1:10.0.31.93/33:10.0.0.31:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app31|iface1:10.0.31.93/33:10.0.0.31:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0033
     * @tc.name      VPN_ConfigBoundary_0033
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app32,iface2,10.0.32.96,24,10.0.0.32,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0033 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app32,iface2,10.0.32.96,24,10.0.0.32,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app32", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.32.96", 24, "10.0.0.32", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app32");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app32|iface2:10.0.32.96/24:10.0.0.32:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app32|iface2:10.0.32.96/24:10.0.0.32:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0034
     * @tc.name      VPN_ConfigBoundary_0034
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app33,iface0,10.0.33.99,0,10.0.0.33,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0034 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app33,iface0,10.0.33.99,0,10.0.0.33,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app33", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.33.99", 0, "10.0.0.33", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app33");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app33|iface0:10.0.33.99/0:10.0.0.33:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app33|iface0:10.0.33.99/0:10.0.0.33:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0035
     * @tc.name      VPN_ConfigBoundary_0035
     * @tc.desc      vpn config boundary ,32,1500,,app34,iface1,10.0.34.102,32,10.0.0.34,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0035 begin`);
      logInfo("config boundary ,32,1500,,app34,iface1,10.0.34.102,32,10.0.0.34,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app34", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.34.102", 32, "10.0.0.34", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app34");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app34|iface1:10.0.34.102/32:10.0.0.34:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app34|iface1:10.0.34.102/32:10.0.0.34:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0036
     * @tc.name      VPN_ConfigBoundary_0036
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app35,iface2,10.0.35.105,33,10.0.0.35,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0036 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app35,iface2,10.0.35.105,33,10.0.0.35,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app35", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.35.105", 33, "10.0.0.35", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app35");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app35|iface2:10.0.35.105/33:10.0.0.35:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app35|iface2:10.0.35.105/33:10.0.0.35:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0037
     * @tc.name      VPN_ConfigBoundary_0037
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app36,iface0,10.0.36.108,24,10.0.0.36,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0037 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app36,iface0,10.0.36.108,24,10.0.0.36,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app36", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.36.108", 24, "10.0.0.36", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app36");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app36|iface0:10.0.36.108/24:10.0.0.36:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app36|iface0:10.0.36.108/24:10.0.0.36:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0038
     * @tc.name      VPN_ConfigBoundary_0038
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app37,iface1,10.0.37.111,0,10.0.0.37,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0038 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app37,iface1,10.0.37.111,0,10.0.0.37,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app37", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.37.111", 0, "10.0.0.37", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app37");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app37|iface1:10.0.37.111/0:10.0.0.37:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app37|iface1:10.0.37.111/0:10.0.0.37:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0039
     * @tc.name      VPN_ConfigBoundary_0039
     * @tc.desc      vpn config boundary ,32,1500,,app38,iface2,10.0.38.114,32,10.0.0.38,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0039 begin`);
      logInfo("config boundary ,32,1500,,app38,iface2,10.0.38.114,32,10.0.0.38,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app38", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.38.114", 32, "10.0.0.38", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app38");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app38|iface2:10.0.38.114/32:10.0.0.38:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app38|iface2:10.0.38.114/32:10.0.0.38:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0040
     * @tc.name      VPN_ConfigBoundary_0040
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app39,iface0,10.0.39.117,33,10.0.0.39,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0040 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app39,iface0,10.0.39.117,33,10.0.0.39,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app39", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.39.117", 33, "10.0.0.39", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app39");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app39|iface0:10.0.39.117/33:10.0.0.39:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app39|iface0:10.0.39.117/33:10.0.0.39:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0041
     * @tc.name      VPN_ConfigBoundary_0041
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app40,iface1,10.0.40.120,24,10.0.0.40,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0041 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app40,iface1,10.0.40.120,24,10.0.0.40,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app40", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.40.120", 24, "10.0.0.40", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app40");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app40|iface1:10.0.40.120/24:10.0.0.40:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app40|iface1:10.0.40.120/24:10.0.0.40:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0042
     * @tc.name      VPN_ConfigBoundary_0042
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app41,iface2,10.0.41.123,0,10.0.0.41,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0042 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app41,iface2,10.0.41.123,0,10.0.0.41,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app41", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.41.123", 0, "10.0.0.41", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app41");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app41|iface2:10.0.41.123/0:10.0.0.41:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app41|iface2:10.0.41.123/0:10.0.0.41:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0043
     * @tc.name      VPN_ConfigBoundary_0043
     * @tc.desc      vpn config boundary ,32,1500,,app42,iface0,10.0.42.126,32,10.0.0.42,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0043 begin`);
      logInfo("config boundary ,32,1500,,app42,iface0,10.0.42.126,32,10.0.0.42,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app42", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.42.126", 32, "10.0.0.42", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app42");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app42|iface0:10.0.42.126/32:10.0.0.42:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app42|iface0:10.0.42.126/32:10.0.0.42:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0043 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0044
     * @tc.name      VPN_ConfigBoundary_0044
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app43,iface1,10.0.43.129,33,10.0.0.43,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0044 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app43,iface1,10.0.43.129,33,10.0.0.43,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app43", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.43.129", 33, "10.0.0.43", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app43");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app43|iface1:10.0.43.129/33:10.0.0.43:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app43|iface1:10.0.43.129/33:10.0.0.43:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0044 end`);
    });

    /**
