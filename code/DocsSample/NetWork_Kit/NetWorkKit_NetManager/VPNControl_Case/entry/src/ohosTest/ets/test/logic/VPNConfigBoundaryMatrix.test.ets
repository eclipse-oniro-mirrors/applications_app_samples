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
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0045
     * @tc.name      VPN_ConfigBoundary_0045
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app44,iface2,10.0.44.132,24,10.0.0.44,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0045 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app44,iface2,10.0.44.132,24,10.0.0.44,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app44", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.44.132", 24, "10.0.0.44", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app44");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app44|iface2:10.0.44.132/24:10.0.0.44:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app44|iface2:10.0.44.132/24:10.0.0.44:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0045 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0046
     * @tc.name      VPN_ConfigBoundary_0046
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app45,iface0,10.0.45.135,0,10.0.0.45,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0046 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app45,iface0,10.0.45.135,0,10.0.0.45,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app45", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.45.135", 0, "10.0.0.45", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app45");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app45|iface0:10.0.45.135/0:10.0.0.45:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app45|iface0:10.0.45.135/0:10.0.0.45:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0046 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0047
     * @tc.name      VPN_ConfigBoundary_0047
     * @tc.desc      vpn config boundary ,32,1500,,app46,iface1,10.0.46.138,32,10.0.0.46,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0047 begin`);
      logInfo("config boundary ,32,1500,,app46,iface1,10.0.46.138,32,10.0.0.46,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app46", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.46.138", 32, "10.0.0.46", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app46");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app46|iface1:10.0.46.138/32:10.0.0.46:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app46|iface1:10.0.46.138/32:10.0.0.46:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0047 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0048
     * @tc.name      VPN_ConfigBoundary_0048
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app47,iface2,10.0.47.141,33,10.0.0.47,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0048 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app47,iface2,10.0.47.141,33,10.0.0.47,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app47", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.47.141", 33, "10.0.0.47", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app47");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app47|iface2:10.0.47.141/33:10.0.0.47:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app47|iface2:10.0.47.141/33:10.0.0.47:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0048 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0049
     * @tc.name      VPN_ConfigBoundary_0049
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app48,iface0,10.0.48.144,24,10.0.0.48,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0049 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app48,iface0,10.0.48.144,24,10.0.0.48,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app48", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.48.144", 24, "10.0.0.48", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app48");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app48|iface0:10.0.48.144/24:10.0.0.48:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app48|iface0:10.0.48.144/24:10.0.0.48:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0049 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0050
     * @tc.name      VPN_ConfigBoundary_0050
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app49,iface1,10.0.49.147,0,10.0.0.49,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0050 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app49,iface1,10.0.49.147,0,10.0.0.49,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app49", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.49.147", 0, "10.0.0.49", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app49");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app49|iface1:10.0.49.147/0:10.0.0.49:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app49|iface1:10.0.49.147/0:10.0.0.49:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0050 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0051
     * @tc.name      VPN_ConfigBoundary_0051
     * @tc.desc      vpn config boundary ,32,1500,,app50,iface2,10.0.50.150,32,10.0.0.50,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0051 begin`);
      logInfo("config boundary ,32,1500,,app50,iface2,10.0.50.150,32,10.0.0.50,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app50", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.50.150", 32, "10.0.0.50", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app50");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app50|iface2:10.0.50.150/32:10.0.0.50:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app50|iface2:10.0.50.150/32:10.0.0.50:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0051 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0052
     * @tc.name      VPN_ConfigBoundary_0052
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app51,iface0,10.0.51.153,33,10.0.0.51,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0052 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app51,iface0,10.0.51.153,33,10.0.0.51,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app51", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.51.153", 33, "10.0.0.51", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app51");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app51|iface0:10.0.51.153/33:10.0.0.51:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app51|iface0:10.0.51.153/33:10.0.0.51:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0052 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0053
     * @tc.name      VPN_ConfigBoundary_0053
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app52,iface1,10.0.52.156,24,10.0.0.52,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0053 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app52,iface1,10.0.52.156,24,10.0.0.52,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app52", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.52.156", 24, "10.0.0.52", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app52");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app52|iface1:10.0.52.156/24:10.0.0.52:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app52|iface1:10.0.52.156/24:10.0.0.52:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0053 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0054
     * @tc.name      VPN_ConfigBoundary_0054
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app53,iface2,10.0.53.159,0,10.0.0.53,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0054 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app53,iface2,10.0.53.159,0,10.0.0.53,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app53", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.53.159", 0, "10.0.0.53", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app53");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app53|iface2:10.0.53.159/0:10.0.0.53:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app53|iface2:10.0.53.159/0:10.0.0.53:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0054 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0055
     * @tc.name      VPN_ConfigBoundary_0055
     * @tc.desc      vpn config boundary ,32,1500,,app54,iface0,10.0.54.162,32,10.0.0.54,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0055 begin`);
      logInfo("config boundary ,32,1500,,app54,iface0,10.0.54.162,32,10.0.0.54,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app54", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.54.162", 32, "10.0.0.54", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app54");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app54|iface0:10.0.54.162/32:10.0.0.54:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app54|iface0:10.0.54.162/32:10.0.0.54:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0055 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0056
     * @tc.name      VPN_ConfigBoundary_0056
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app55,iface1,10.0.55.165,33,10.0.0.55,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0056 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app55,iface1,10.0.55.165,33,10.0.0.55,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app55", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.55.165", 33, "10.0.0.55", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app55");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app55|iface1:10.0.55.165/33:10.0.0.55:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app55|iface1:10.0.55.165/33:10.0.0.55:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0056 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0057
     * @tc.name      VPN_ConfigBoundary_0057
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app56,iface2,10.0.56.168,24,10.0.0.56,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0057 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app56,iface2,10.0.56.168,24,10.0.0.56,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app56", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.56.168", 24, "10.0.0.56", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app56");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app56|iface2:10.0.56.168/24:10.0.0.56:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app56|iface2:10.0.56.168/24:10.0.0.56:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0057 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0058
     * @tc.name      VPN_ConfigBoundary_0058
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app57,iface0,10.0.57.171,0,10.0.0.57,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0058 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app57,iface0,10.0.57.171,0,10.0.0.57,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app57", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.57.171", 0, "10.0.0.57", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app57");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app57|iface0:10.0.57.171/0:10.0.0.57:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app57|iface0:10.0.57.171/0:10.0.0.57:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0058 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0059
     * @tc.name      VPN_ConfigBoundary_0059
     * @tc.desc      vpn config boundary ,32,1500,,app58,iface1,10.0.58.174,32,10.0.0.58,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0059 begin`);
      logInfo("config boundary ,32,1500,,app58,iface1,10.0.58.174,32,10.0.0.58,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app58", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.58.174", 32, "10.0.0.58", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app58");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app58|iface1:10.0.58.174/32:10.0.0.58:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app58|iface1:10.0.58.174/32:10.0.0.58:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0059 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0060
     * @tc.name      VPN_ConfigBoundary_0060
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app59,iface2,10.0.59.177,33,10.0.0.59,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0060 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app59,iface2,10.0.59.177,33,10.0.0.59,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app59", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.59.177", 33, "10.0.0.59", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app59");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app59|iface2:10.0.59.177/33:10.0.0.59:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app59|iface2:10.0.59.177/33:10.0.0.59:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0060 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0061
     * @tc.name      VPN_ConfigBoundary_0061
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app60,iface0,10.0.60.180,24,10.0.0.60,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0061 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app60,iface0,10.0.60.180,24,10.0.0.60,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app60", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.60.180", 24, "10.0.0.60", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app60");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app60|iface0:10.0.60.180/24:10.0.0.60:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app60|iface0:10.0.60.180/24:10.0.0.60:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0061 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0062
     * @tc.name      VPN_ConfigBoundary_0062
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app61,iface1,10.0.61.183,0,10.0.0.61,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0062 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app61,iface1,10.0.61.183,0,10.0.0.61,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app61", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.61.183", 0, "10.0.0.61", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app61");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app61|iface1:10.0.61.183/0:10.0.0.61:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app61|iface1:10.0.61.183/0:10.0.0.61:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0062 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0063
     * @tc.name      VPN_ConfigBoundary_0063
     * @tc.desc      vpn config boundary ,32,1500,,app62,iface2,10.0.62.186,32,10.0.0.62,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0063 begin`);
      logInfo("config boundary ,32,1500,,app62,iface2,10.0.62.186,32,10.0.0.62,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app62", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.62.186", 32, "10.0.0.62", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app62");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app62|iface2:10.0.62.186/32:10.0.0.62:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app62|iface2:10.0.62.186/32:10.0.0.62:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0063 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0064
     * @tc.name      VPN_ConfigBoundary_0064
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app63,iface0,10.0.63.189,33,10.0.0.63,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0064 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app63,iface0,10.0.63.189,33,10.0.0.63,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app63", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.63.189", 33, "10.0.0.63", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app63");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app63|iface0:10.0.63.189/33:10.0.0.63:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app63|iface0:10.0.63.189/33:10.0.0.63:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0064 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0065
     * @tc.name      VPN_ConfigBoundary_0065
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app64,iface1,10.0.64.192,24,10.0.0.64,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0065 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app64,iface1,10.0.64.192,24,10.0.0.64,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app64", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.64.192", 24, "10.0.0.64", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app64");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app64|iface1:10.0.64.192/24:10.0.0.64:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app64|iface1:10.0.64.192/24:10.0.0.64:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0065 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0066
     * @tc.name      VPN_ConfigBoundary_0066
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app65,iface2,10.0.65.195,0,10.0.0.65,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0066 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app65,iface2,10.0.65.195,0,10.0.0.65,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app65", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.65.195", 0, "10.0.0.65", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app65");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app65|iface2:10.0.65.195/0:10.0.0.65:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app65|iface2:10.0.65.195/0:10.0.0.65:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0066 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0067
     * @tc.name      VPN_ConfigBoundary_0067
     * @tc.desc      vpn config boundary ,32,1500,,app66,iface0,10.0.66.198,32,10.0.0.66,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0067 begin`);
      logInfo("config boundary ,32,1500,,app66,iface0,10.0.66.198,32,10.0.0.66,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app66", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.66.198", 32, "10.0.0.66", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app66");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app66|iface0:10.0.66.198/32:10.0.0.66:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app66|iface0:10.0.66.198/32:10.0.0.66:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0067 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0068
     * @tc.name      VPN_ConfigBoundary_0068
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app67,iface1,10.0.67.201,33,10.0.0.67,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0068 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app67,iface1,10.0.67.201,33,10.0.0.67,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app67", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.67.201", 33, "10.0.0.67", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app67");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app67|iface1:10.0.67.201/33:10.0.0.67:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app67|iface1:10.0.67.201/33:10.0.0.67:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0068 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0069
     * @tc.name      VPN_ConfigBoundary_0069
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app68,iface2,10.0.68.204,24,10.0.0.68,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0069 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app68,iface2,10.0.68.204,24,10.0.0.68,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app68", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.68.204", 24, "10.0.0.68", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app68");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app68|iface2:10.0.68.204/24:10.0.0.68:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app68|iface2:10.0.68.204/24:10.0.0.68:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0069 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0070
     * @tc.name      VPN_ConfigBoundary_0070
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app69,iface0,10.0.69.207,0,10.0.0.69,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0070 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app69,iface0,10.0.69.207,0,10.0.0.69,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app69", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.69.207", 0, "10.0.0.69", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app69");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app69|iface0:10.0.69.207/0:10.0.0.69:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app69|iface0:10.0.69.207/0:10.0.0.69:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0070 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0071
     * @tc.name      VPN_ConfigBoundary_0071
     * @tc.desc      vpn config boundary ,32,1500,,app70,iface1,10.0.70.210,32,10.0.0.70,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0071 begin`);
      logInfo("config boundary ,32,1500,,app70,iface1,10.0.70.210,32,10.0.0.70,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app70", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.70.210", 32, "10.0.0.70", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app70");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app70|iface1:10.0.70.210/32:10.0.0.70:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app70|iface1:10.0.70.210/32:10.0.0.70:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0071 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0072
     * @tc.name      VPN_ConfigBoundary_0072
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app71,iface2,10.0.71.213,33,10.0.0.71,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0072 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app71,iface2,10.0.71.213,33,10.0.0.71,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app71", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.71.213", 33, "10.0.0.71", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app71");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app71|iface2:10.0.71.213/33:10.0.0.71:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app71|iface2:10.0.71.213/33:10.0.0.71:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0072 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0073
     * @tc.name      VPN_ConfigBoundary_0073
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app72,iface0,10.0.72.216,24,10.0.0.72,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0073 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app72,iface0,10.0.72.216,24,10.0.0.72,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app72", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.72.216", 24, "10.0.0.72", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app72");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app72|iface0:10.0.72.216/24:10.0.0.72:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app72|iface0:10.0.72.216/24:10.0.0.72:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0073 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0074
     * @tc.name      VPN_ConfigBoundary_0074
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app73,iface1,10.0.73.219,0,10.0.0.73,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0074 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app73,iface1,10.0.73.219,0,10.0.0.73,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app73", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.73.219", 0, "10.0.0.73", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app73");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app73|iface1:10.0.73.219/0:10.0.0.73:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app73|iface1:10.0.73.219/0:10.0.0.73:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0074 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0075
     * @tc.name      VPN_ConfigBoundary_0075
     * @tc.desc      vpn config boundary ,32,1500,,app74,iface2,10.0.74.222,32,10.0.0.74,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0075 begin`);
      logInfo("config boundary ,32,1500,,app74,iface2,10.0.74.222,32,10.0.0.74,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app74", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.74.222", 32, "10.0.0.74", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app74");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app74|iface2:10.0.74.222/32:10.0.0.74:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app74|iface2:10.0.74.222/32:10.0.0.74:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0075 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0076
     * @tc.name      VPN_ConfigBoundary_0076
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app75,iface0,10.0.75.225,33,10.0.0.75,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0076 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app75,iface0,10.0.75.225,33,10.0.0.75,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app75", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.75.225", 33, "10.0.0.75", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app75");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app75|iface0:10.0.75.225/33:10.0.0.75:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app75|iface0:10.0.75.225/33:10.0.0.75:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0076 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0077
     * @tc.name      VPN_ConfigBoundary_0077
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app76,iface1,10.0.76.228,24,10.0.0.76,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0077 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app76,iface1,10.0.76.228,24,10.0.0.76,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app76", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.76.228", 24, "10.0.0.76", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app76");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app76|iface1:10.0.76.228/24:10.0.0.76:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app76|iface1:10.0.76.228/24:10.0.0.76:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0077 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0078
     * @tc.name      VPN_ConfigBoundary_0078
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app77,iface2,10.0.77.231,0,10.0.0.77,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0078 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app77,iface2,10.0.77.231,0,10.0.0.77,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app77", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.77.231", 0, "10.0.0.77", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app77");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app77|iface2:10.0.77.231/0:10.0.0.77:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app77|iface2:10.0.77.231/0:10.0.0.77:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0078 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0079
     * @tc.name      VPN_ConfigBoundary_0079
     * @tc.desc      vpn config boundary ,32,1500,,app78,iface0,10.0.78.234,32,10.0.0.78,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0079 begin`);
      logInfo("config boundary ,32,1500,,app78,iface0,10.0.78.234,32,10.0.0.78,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app78", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.78.234", 32, "10.0.0.78", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app78");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app78|iface0:10.0.78.234/32:10.0.0.78:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app78|iface0:10.0.78.234/32:10.0.0.78:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0079 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0080
     * @tc.name      VPN_ConfigBoundary_0080
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app79,iface1,10.0.79.237,33,10.0.0.79,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0080 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app79,iface1,10.0.79.237,33,10.0.0.79,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app79", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.79.237", 33, "10.0.0.79", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app79");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app79|iface1:10.0.79.237/33:10.0.0.79:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app79|iface1:10.0.79.237/33:10.0.0.79:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0080 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0081
     * @tc.name      VPN_ConfigBoundary_0081
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app80,iface2,10.0.80.240,24,10.0.0.80,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0081 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app80,iface2,10.0.80.240,24,10.0.0.80,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app80", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.80.240", 24, "10.0.0.80", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app80");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app80|iface2:10.0.80.240/24:10.0.0.80:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app80|iface2:10.0.80.240/24:10.0.0.80:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0081 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0082
     * @tc.name      VPN_ConfigBoundary_0082
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app81,iface0,10.0.81.243,0,10.0.0.81,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0082 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app81,iface0,10.0.81.243,0,10.0.0.81,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app81", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.81.243", 0, "10.0.0.81", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app81");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app81|iface0:10.0.81.243/0:10.0.0.81:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app81|iface0:10.0.81.243/0:10.0.0.81:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0082 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0083
     * @tc.name      VPN_ConfigBoundary_0083
     * @tc.desc      vpn config boundary ,32,1500,,app82,iface1,10.0.82.246,32,10.0.0.82,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0083 begin`);
      logInfo("config boundary ,32,1500,,app82,iface1,10.0.82.246,32,10.0.0.82,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app82", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.82.246", 32, "10.0.0.82", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app82");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app82|iface1:10.0.82.246/32:10.0.0.82:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app82|iface1:10.0.82.246/32:10.0.0.82:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0083 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0084
     * @tc.name      VPN_ConfigBoundary_0084
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app83,iface2,10.0.83.249,33,10.0.0.83,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0084 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app83,iface2,10.0.83.249,33,10.0.0.83,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app83", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.83.249", 33, "10.0.0.83", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app83");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app83|iface2:10.0.83.249/33:10.0.0.83:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app83|iface2:10.0.83.249/33:10.0.0.83:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0084 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0085
     * @tc.name      VPN_ConfigBoundary_0085
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app84,iface0,10.0.84.252,24,10.0.0.84,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0085 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app84,iface0,10.0.84.252,24,10.0.0.84,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app84", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.84.252", 24, "10.0.0.84", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app84");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app84|iface0:10.0.84.252/24:10.0.0.84:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app84|iface0:10.0.84.252/24:10.0.0.84:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0085 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0086
     * @tc.name      VPN_ConfigBoundary_0086
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app85,iface1,10.0.85.255,0,10.0.0.85,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0086 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app85,iface1,10.0.85.255,0,10.0.0.85,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app85", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.85.255", 0, "10.0.0.85", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app85");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app85|iface1:10.0.85.255/0:10.0.0.85:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app85|iface1:10.0.85.255/0:10.0.0.85:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0086 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0087
     * @tc.name      VPN_ConfigBoundary_0087
     * @tc.desc      vpn config boundary ,32,1500,,app86,iface2,10.0.86.2,32,10.0.0.86,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0087 begin`);
      logInfo("config boundary ,32,1500,,app86,iface2,10.0.86.2,32,10.0.0.86,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app86", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.86.2", 32, "10.0.0.86", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app86");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app86|iface2:10.0.86.2/32:10.0.0.86:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app86|iface2:10.0.86.2/32:10.0.0.86:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0087 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0088
     * @tc.name      VPN_ConfigBoundary_0088
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app87,iface0,10.0.87.5,33,10.0.0.87,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0088 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app87,iface0,10.0.87.5,33,10.0.0.87,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app87", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.87.5", 33, "10.0.0.87", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app87");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app87|iface0:10.0.87.5/33:10.0.0.87:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app87|iface0:10.0.87.5/33:10.0.0.87:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0088 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0089
     * @tc.name      VPN_ConfigBoundary_0089
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app88,iface1,10.0.88.8,24,10.0.0.88,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0089 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app88,iface1,10.0.88.8,24,10.0.0.88,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app88", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.88.8", 24, "10.0.0.88", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app88");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app88|iface1:10.0.88.8/24:10.0.0.88:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app88|iface1:10.0.88.8/24:10.0.0.88:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0089 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0090
     * @tc.name      VPN_ConfigBoundary_0090
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app89,iface2,10.0.89.11,0,10.0.0.89,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0090 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app89,iface2,10.0.89.11,0,10.0.0.89,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app89", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.89.11", 0, "10.0.0.89", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app89");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app89|iface2:10.0.89.11/0:10.0.0.89:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app89|iface2:10.0.89.11/0:10.0.0.89:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0090 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0091
     * @tc.name      VPN_ConfigBoundary_0091
     * @tc.desc      vpn config boundary ,32,1500,,app90,iface0,10.0.90.14,32,10.0.0.90,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0091 begin`);
      logInfo("config boundary ,32,1500,,app90,iface0,10.0.90.14,32,10.0.0.90,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app90", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.90.14", 32, "10.0.0.90", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app90");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app90|iface0:10.0.90.14/32:10.0.0.90:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app90|iface0:10.0.90.14/32:10.0.0.90:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0091 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0092
     * @tc.name      VPN_ConfigBoundary_0092
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app91,iface1,10.0.91.17,33,10.0.0.91,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0092 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app91,iface1,10.0.91.17,33,10.0.0.91,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app91", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.91.17", 33, "10.0.0.91", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app91");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app91|iface1:10.0.91.17/33:10.0.0.91:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app91|iface1:10.0.91.17/33:10.0.0.91:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0092 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0093
     * @tc.name      VPN_ConfigBoundary_0093
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app92,iface2,10.0.92.20,24,10.0.0.92,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0093 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app92,iface2,10.0.92.20,24,10.0.0.92,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app92", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.92.20", 24, "10.0.0.92", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app92");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app92|iface2:10.0.92.20/24:10.0.0.92:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app92|iface2:10.0.92.20/24:10.0.0.92:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0093 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0094
     * @tc.name      VPN_ConfigBoundary_0094
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app93,iface0,10.0.93.23,0,10.0.0.93,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0094 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app93,iface0,10.0.93.23,0,10.0.0.93,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app93", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.93.23", 0, "10.0.0.93", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app93");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app93|iface0:10.0.93.23/0:10.0.0.93:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app93|iface0:10.0.93.23/0:10.0.0.93:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0094 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0095
     * @tc.name      VPN_ConfigBoundary_0095
     * @tc.desc      vpn config boundary ,32,1500,,app94,iface1,10.0.94.26,32,10.0.0.94,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0095 begin`);
      logInfo("config boundary ,32,1500,,app94,iface1,10.0.94.26,32,10.0.0.94,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app94", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.94.26", 32, "10.0.0.94", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app94");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app94|iface1:10.0.94.26/32:10.0.0.94:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app94|iface1:10.0.94.26/32:10.0.0.94:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0095 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0096
     * @tc.name      VPN_ConfigBoundary_0096
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app95,iface2,10.0.95.29,33,10.0.0.95,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0096 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app95,iface2,10.0.95.29,33,10.0.0.95,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app95", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.95.29", 33, "10.0.0.95", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app95");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app95|iface2:10.0.95.29/33:10.0.0.95:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app95|iface2:10.0.95.29/33:10.0.0.95:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0096 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0097
     * @tc.name      VPN_ConfigBoundary_0097
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app96,iface0,10.0.96.32,24,10.0.0.96,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0097 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app96,iface0,10.0.96.32,24,10.0.0.96,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app96", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.96.32", 24, "10.0.0.96", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app96");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app96|iface0:10.0.96.32/24:10.0.0.96:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app96|iface0:10.0.96.32/24:10.0.0.96:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0097 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0098
     * @tc.name      VPN_ConfigBoundary_0098
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app97,iface1,10.0.97.35,0,10.0.0.97,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0098 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app97,iface1,10.0.97.35,0,10.0.0.97,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app97", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.97.35", 0, "10.0.0.97", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app97");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app97|iface1:10.0.97.35/0:10.0.0.97:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app97|iface1:10.0.97.35/0:10.0.0.97:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0098 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0099
     * @tc.name      VPN_ConfigBoundary_0099
     * @tc.desc      vpn config boundary ,32,1500,,app98,iface2,10.0.98.38,32,10.0.0.98,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0099 begin`);
      logInfo("config boundary ,32,1500,,app98,iface2,10.0.98.38,32,10.0.0.98,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app98", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.98.38", 32, "10.0.0.98", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app98");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app98|iface2:10.0.98.38/32:10.0.0.98:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app98|iface2:10.0.98.38/32:10.0.0.98:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0099 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0100
     * @tc.name      VPN_ConfigBoundary_0100
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app99,iface0,10.0.99.41,33,10.0.0.99,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0100 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app99,iface0,10.0.99.41,33,10.0.0.99,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app99", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.99.41", 33, "10.0.0.99", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app99");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app99|iface0:10.0.99.41/33:10.0.0.99:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app99|iface0:10.0.99.41/33:10.0.0.99:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0100 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0101
     * @tc.name      VPN_ConfigBoundary_0101
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app100,iface1,10.0.100.44,24,10.0.0.100,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0101 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app100,iface1,10.0.100.44,24,10.0.0.100,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app100", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.100.44", 24, "10.0.0.100", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app100");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app100|iface1:10.0.100.44/24:10.0.0.100:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app100|iface1:10.0.100.44/24:10.0.0.100:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0101 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0102
     * @tc.name      VPN_ConfigBoundary_0102
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app101,iface2,10.0.101.47,0,10.0.0.101,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0102 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app101,iface2,10.0.101.47,0,10.0.0.101,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app101", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.101.47", 0, "10.0.0.101", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app101");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app101|iface2:10.0.101.47/0:10.0.0.101:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app101|iface2:10.0.101.47/0:10.0.0.101:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0102 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0103
     * @tc.name      VPN_ConfigBoundary_0103
     * @tc.desc      vpn config boundary ,32,1500,,app102,iface0,10.0.102.50,32,10.0.0.102,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0103 begin`);
      logInfo("config boundary ,32,1500,,app102,iface0,10.0.102.50,32,10.0.0.102,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app102", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.102.50", 32, "10.0.0.102", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app102");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app102|iface0:10.0.102.50/32:10.0.0.102:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app102|iface0:10.0.102.50/32:10.0.0.102:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0103 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0104
     * @tc.name      VPN_ConfigBoundary_0104
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app103,iface1,10.0.103.53,33,10.0.0.103,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0104 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app103,iface1,10.0.103.53,33,10.0.0.103,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app103", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.103.53", 33, "10.0.0.103", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app103");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app103|iface1:10.0.103.53/33:10.0.0.103:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app103|iface1:10.0.103.53/33:10.0.0.103:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0104 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0105
     * @tc.name      VPN_ConfigBoundary_0105
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app104,iface2,10.0.104.56,24,10.0.0.104,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0105 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app104,iface2,10.0.104.56,24,10.0.0.104,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app104", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.104.56", 24, "10.0.0.104", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app104");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app104|iface2:10.0.104.56/24:10.0.0.104:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app104|iface2:10.0.104.56/24:10.0.0.104:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0105 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0106
     * @tc.name      VPN_ConfigBoundary_0106
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app105,iface0,10.0.105.59,0,10.0.0.105,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0106 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app105,iface0,10.0.105.59,0,10.0.0.105,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app105", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.105.59", 0, "10.0.0.105", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app105");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app105|iface0:10.0.105.59/0:10.0.0.105:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app105|iface0:10.0.105.59/0:10.0.0.105:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0106 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0107
     * @tc.name      VPN_ConfigBoundary_0107
     * @tc.desc      vpn config boundary ,32,1500,,app106,iface1,10.0.106.62,32,10.0.0.106,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0107 begin`);
      logInfo("config boundary ,32,1500,,app106,iface1,10.0.106.62,32,10.0.0.106,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app106", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.106.62", 32, "10.0.0.106", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app106");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app106|iface1:10.0.106.62/32:10.0.0.106:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app106|iface1:10.0.106.62/32:10.0.0.106:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0107 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0108
     * @tc.name      VPN_ConfigBoundary_0108
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app107,iface2,10.0.107.65,33,10.0.0.107,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0108 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app107,iface2,10.0.107.65,33,10.0.0.107,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app107", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.107.65", 33, "10.0.0.107", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app107");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app107|iface2:10.0.107.65/33:10.0.0.107:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app107|iface2:10.0.107.65/33:10.0.0.107:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0108 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0109
     * @tc.name      VPN_ConfigBoundary_0109
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app108,iface0,10.0.108.68,24,10.0.0.108,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0109 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app108,iface0,10.0.108.68,24,10.0.0.108,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app108", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.108.68", 24, "10.0.0.108", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app108");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app108|iface0:10.0.108.68/24:10.0.0.108:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app108|iface0:10.0.108.68/24:10.0.0.108:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0109 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0110
     * @tc.name      VPN_ConfigBoundary_0110
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app109,iface1,10.0.109.71,0,10.0.0.109,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0110 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app109,iface1,10.0.109.71,0,10.0.0.109,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app109", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.109.71", 0, "10.0.0.109", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app109");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app109|iface1:10.0.109.71/0:10.0.0.109:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app109|iface1:10.0.109.71/0:10.0.0.109:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0110 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0111
     * @tc.name      VPN_ConfigBoundary_0111
     * @tc.desc      vpn config boundary ,32,1500,,app110,iface2,10.0.110.74,32,10.0.0.110,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0111 begin`);
      logInfo("config boundary ,32,1500,,app110,iface2,10.0.110.74,32,10.0.0.110,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app110", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.110.74", 32, "10.0.0.110", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app110");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app110|iface2:10.0.110.74/32:10.0.0.110:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app110|iface2:10.0.110.74/32:10.0.0.110:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0111 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0112
     * @tc.name      VPN_ConfigBoundary_0112
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app111,iface0,10.0.111.77,33,10.0.0.111,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0112 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app111,iface0,10.0.111.77,33,10.0.0.111,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app111", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.111.77", 33, "10.0.0.111", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app111");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app111|iface0:10.0.111.77/33:10.0.0.111:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app111|iface0:10.0.111.77/33:10.0.0.111:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0112 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0113
     * @tc.name      VPN_ConfigBoundary_0113
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app112,iface1,10.0.112.80,24,10.0.0.112,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0113 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app112,iface1,10.0.112.80,24,10.0.0.112,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app112", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.112.80", 24, "10.0.0.112", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app112");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app112|iface1:10.0.112.80/24:10.0.0.112:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app112|iface1:10.0.112.80/24:10.0.0.112:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0113 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0114
     * @tc.name      VPN_ConfigBoundary_0114
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app113,iface2,10.0.113.83,0,10.0.0.113,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0114 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app113,iface2,10.0.113.83,0,10.0.0.113,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app113", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.113.83", 0, "10.0.0.113", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app113");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app113|iface2:10.0.113.83/0:10.0.0.113:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app113|iface2:10.0.113.83/0:10.0.0.113:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0114 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0115
     * @tc.name      VPN_ConfigBoundary_0115
     * @tc.desc      vpn config boundary ,32,1500,,app114,iface0,10.0.114.86,32,10.0.0.114,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0115 begin`);
      logInfo("config boundary ,32,1500,,app114,iface0,10.0.114.86,32,10.0.0.114,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app114", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.114.86", 32, "10.0.0.114", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app114");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app114|iface0:10.0.114.86/32:10.0.0.114:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app114|iface0:10.0.114.86/32:10.0.0.114:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0115 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0116
     * @tc.name      VPN_ConfigBoundary_0116
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app115,iface1,10.0.115.89,33,10.0.0.115,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0116 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app115,iface1,10.0.115.89,33,10.0.0.115,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app115", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.115.89", 33, "10.0.0.115", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app115");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app115|iface1:10.0.115.89/33:10.0.0.115:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app115|iface1:10.0.115.89/33:10.0.0.115:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0116 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0117
     * @tc.name      VPN_ConfigBoundary_0117
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app116,iface2,10.0.116.92,24,10.0.0.116,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0117 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app116,iface2,10.0.116.92,24,10.0.0.116,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app116", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.116.92", 24, "10.0.0.116", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app116");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app116|iface2:10.0.116.92/24:10.0.0.116:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app116|iface2:10.0.116.92/24:10.0.0.116:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0117 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0118
     * @tc.name      VPN_ConfigBoundary_0118
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app117,iface0,10.0.117.95,0,10.0.0.117,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0118 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app117,iface0,10.0.117.95,0,10.0.0.117,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app117", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.117.95", 0, "10.0.0.117", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app117");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app117|iface0:10.0.117.95/0:10.0.0.117:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app117|iface0:10.0.117.95/0:10.0.0.117:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0118 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0119
     * @tc.name      VPN_ConfigBoundary_0119
     * @tc.desc      vpn config boundary ,32,1500,,app118,iface1,10.0.118.98,32,10.0.0.118,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0119 begin`);
      logInfo("config boundary ,32,1500,,app118,iface1,10.0.118.98,32,10.0.0.118,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app118", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.118.98", 32, "10.0.0.118", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app118");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app118|iface1:10.0.118.98/32:10.0.0.118:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app118|iface1:10.0.118.98/32:10.0.0.118:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0119 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0120
     * @tc.name      VPN_ConfigBoundary_0120
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app119,iface2,10.0.119.101,33,10.0.0.119,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0120 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app119,iface2,10.0.119.101,33,10.0.0.119,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app119", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.119.101", 33, "10.0.0.119", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app119");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app119|iface2:10.0.119.101/33:10.0.0.119:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app119|iface2:10.0.119.101/33:10.0.0.119:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0120 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0121
     * @tc.name      VPN_ConfigBoundary_0121
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app120,iface0,10.0.120.104,24,10.0.0.120,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0121 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app120,iface0,10.0.120.104,24,10.0.0.120,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app120", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.120.104", 24, "10.0.0.120", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app120");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app120|iface0:10.0.120.104/24:10.0.0.120:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app120|iface0:10.0.120.104/24:10.0.0.120:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0121 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0122
     * @tc.name      VPN_ConfigBoundary_0122
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app121,iface1,10.0.121.107,0,10.0.0.121,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0122 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app121,iface1,10.0.121.107,0,10.0.0.121,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app121", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.121.107", 0, "10.0.0.121", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app121");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app121|iface1:10.0.121.107/0:10.0.0.121:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app121|iface1:10.0.121.107/0:10.0.0.121:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0122 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0123
     * @tc.name      VPN_ConfigBoundary_0123
     * @tc.desc      vpn config boundary ,32,1500,,app122,iface2,10.0.122.110,32,10.0.0.122,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0123 begin`);
      logInfo("config boundary ,32,1500,,app122,iface2,10.0.122.110,32,10.0.0.122,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app122", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.122.110", 32, "10.0.0.122", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app122");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app122|iface2:10.0.122.110/32:10.0.0.122:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app122|iface2:10.0.122.110/32:10.0.0.122:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0123 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0124
     * @tc.name      VPN_ConfigBoundary_0124
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app123,iface0,10.0.123.113,33,10.0.0.123,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0124 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app123,iface0,10.0.123.113,33,10.0.0.123,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app123", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.123.113", 33, "10.0.0.123", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app123");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app123|iface0:10.0.123.113/33:10.0.0.123:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app123|iface0:10.0.123.113/33:10.0.0.123:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0124 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0125
     * @tc.name      VPN_ConfigBoundary_0125
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app124,iface1,10.0.124.116,24,10.0.0.124,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0125 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app124,iface1,10.0.124.116,24,10.0.0.124,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app124", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.124.116", 24, "10.0.0.124", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app124");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app124|iface1:10.0.124.116/24:10.0.0.124:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app124|iface1:10.0.124.116/24:10.0.0.124:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0125 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0126
     * @tc.name      VPN_ConfigBoundary_0126
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app125,iface2,10.0.125.119,0,10.0.0.125,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0126 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app125,iface2,10.0.125.119,0,10.0.0.125,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app125", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.125.119", 0, "10.0.0.125", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app125");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app125|iface2:10.0.125.119/0:10.0.0.125:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app125|iface2:10.0.125.119/0:10.0.0.125:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0126 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0127
     * @tc.name      VPN_ConfigBoundary_0127
     * @tc.desc      vpn config boundary ,32,1500,,app126,iface0,10.0.126.122,32,10.0.0.126,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0127 begin`);
      logInfo("config boundary ,32,1500,,app126,iface0,10.0.126.122,32,10.0.0.126,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app126", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.126.122", 32, "10.0.0.126", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app126");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app126|iface0:10.0.126.122/32:10.0.0.126:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app126|iface0:10.0.126.122/32:10.0.0.126:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0127 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0128
     * @tc.name      VPN_ConfigBoundary_0128
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app127,iface1,10.0.127.125,33,10.0.0.127,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0128 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app127,iface1,10.0.127.125,33,10.0.0.127,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app127", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.127.125", 33, "10.0.0.127", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app127");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app127|iface1:10.0.127.125/33:10.0.0.127:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app127|iface1:10.0.127.125/33:10.0.0.127:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0128 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0129
     * @tc.name      VPN_ConfigBoundary_0129
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app128,iface2,10.0.128.128,24,10.0.0.128,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0129 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app128,iface2,10.0.128.128,24,10.0.0.128,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app128", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.128.128", 24, "10.0.0.128", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app128");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app128|iface2:10.0.128.128/24:10.0.0.128:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app128|iface2:10.0.128.128/24:10.0.0.128:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0129 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0130
     * @tc.name      VPN_ConfigBoundary_0130
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app129,iface0,10.0.129.131,0,10.0.0.129,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0130 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app129,iface0,10.0.129.131,0,10.0.0.129,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app129", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.129.131", 0, "10.0.0.129", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app129");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app129|iface0:10.0.129.131/0:10.0.0.129:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app129|iface0:10.0.129.131/0:10.0.0.129:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0130 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0131
     * @tc.name      VPN_ConfigBoundary_0131
     * @tc.desc      vpn config boundary ,32,1500,,app130,iface1,10.0.130.134,32,10.0.0.130,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0131 begin`);
      logInfo("config boundary ,32,1500,,app130,iface1,10.0.130.134,32,10.0.0.130,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app130", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.130.134", 32, "10.0.0.130", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app130");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app130|iface1:10.0.130.134/32:10.0.0.130:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app130|iface1:10.0.130.134/32:10.0.0.130:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0131 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0132
     * @tc.name      VPN_ConfigBoundary_0132
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app131,iface2,10.0.131.137,33,10.0.0.131,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0132 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app131,iface2,10.0.131.137,33,10.0.0.131,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app131", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.131.137", 33, "10.0.0.131", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app131");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app131|iface2:10.0.131.137/33:10.0.0.131:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app131|iface2:10.0.131.137/33:10.0.0.131:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0132 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0133
     * @tc.name      VPN_ConfigBoundary_0133
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app132,iface0,10.0.132.140,24,10.0.0.132,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0133 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app132,iface0,10.0.132.140,24,10.0.0.132,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app132", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.132.140", 24, "10.0.0.132", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app132");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app132|iface0:10.0.132.140/24:10.0.0.132:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app132|iface0:10.0.132.140/24:10.0.0.132:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0133 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0134
     * @tc.name      VPN_ConfigBoundary_0134
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app133,iface1,10.0.133.143,0,10.0.0.133,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0134 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app133,iface1,10.0.133.143,0,10.0.0.133,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app133", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.133.143", 0, "10.0.0.133", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app133");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app133|iface1:10.0.133.143/0:10.0.0.133:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app133|iface1:10.0.133.143/0:10.0.0.133:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0134 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0135
     * @tc.name      VPN_ConfigBoundary_0135
     * @tc.desc      vpn config boundary ,32,1500,,app134,iface2,10.0.134.146,32,10.0.0.134,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0135 begin`);
      logInfo("config boundary ,32,1500,,app134,iface2,10.0.134.146,32,10.0.0.134,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app134", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.134.146", 32, "10.0.0.134", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app134");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app134|iface2:10.0.134.146/32:10.0.0.134:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app134|iface2:10.0.134.146/32:10.0.0.134:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0135 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0136
     * @tc.name      VPN_ConfigBoundary_0136
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app135,iface0,10.0.135.149,33,10.0.0.135,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0136 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app135,iface0,10.0.135.149,33,10.0.0.135,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app135", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.135.149", 33, "10.0.0.135", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app135");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app135|iface0:10.0.135.149/33:10.0.0.135:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app135|iface0:10.0.135.149/33:10.0.0.135:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0136 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0137
     * @tc.name      VPN_ConfigBoundary_0137
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app136,iface1,10.0.136.152,24,10.0.0.136,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0137 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app136,iface1,10.0.136.152,24,10.0.0.136,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app136", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.136.152", 24, "10.0.0.136", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app136");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app136|iface1:10.0.136.152/24:10.0.0.136:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app136|iface1:10.0.136.152/24:10.0.0.136:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0137 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0138
     * @tc.name      VPN_ConfigBoundary_0138
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app137,iface2,10.0.137.155,0,10.0.0.137,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0138 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app137,iface2,10.0.137.155,0,10.0.0.137,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app137", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.137.155", 0, "10.0.0.137", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app137");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app137|iface2:10.0.137.155/0:10.0.0.137:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app137|iface2:10.0.137.155/0:10.0.0.137:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0138 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0139
     * @tc.name      VPN_ConfigBoundary_0139
     * @tc.desc      vpn config boundary ,32,1500,,app138,iface0,10.0.138.158,32,10.0.0.138,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0139 begin`);
      logInfo("config boundary ,32,1500,,app138,iface0,10.0.138.158,32,10.0.0.138,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app138", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.138.158", 32, "10.0.0.138", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app138");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app138|iface0:10.0.138.158/32:10.0.0.138:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app138|iface0:10.0.138.158/32:10.0.0.138:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0139 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0140
     * @tc.name      VPN_ConfigBoundary_0140
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app139,iface1,10.0.139.161,33,10.0.0.139,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0140 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app139,iface1,10.0.139.161,33,10.0.0.139,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app139", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.139.161", 33, "10.0.0.139", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app139");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app139|iface1:10.0.139.161/33:10.0.0.139:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app139|iface1:10.0.139.161/33:10.0.0.139:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0140 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0141
     * @tc.name      VPN_ConfigBoundary_0141
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app140,iface2,10.0.140.164,24,10.0.0.140,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0141 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app140,iface2,10.0.140.164,24,10.0.0.140,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app140", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.140.164", 24, "10.0.0.140", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app140");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app140|iface2:10.0.140.164/24:10.0.0.140:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app140|iface2:10.0.140.164/24:10.0.0.140:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0141 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0142
     * @tc.name      VPN_ConfigBoundary_0142
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app141,iface0,10.0.141.167,0,10.0.0.141,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0142 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app141,iface0,10.0.141.167,0,10.0.0.141,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app141", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.141.167", 0, "10.0.0.141", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app141");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app141|iface0:10.0.141.167/0:10.0.0.141:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app141|iface0:10.0.141.167/0:10.0.0.141:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0142 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0143
     * @tc.name      VPN_ConfigBoundary_0143
     * @tc.desc      vpn config boundary ,32,1500,,app142,iface1,10.0.142.170,32,10.0.0.142,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0143 begin`);
      logInfo("config boundary ,32,1500,,app142,iface1,10.0.142.170,32,10.0.0.142,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app142", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.142.170", 32, "10.0.0.142", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app142");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app142|iface1:10.0.142.170/32:10.0.0.142:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app142|iface1:10.0.142.170/32:10.0.0.142:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0143 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0144
     * @tc.name      VPN_ConfigBoundary_0144
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app143,iface2,10.0.143.173,33,10.0.0.143,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0144 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app143,iface2,10.0.143.173,33,10.0.0.143,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app143", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.143.173", 33, "10.0.0.143", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app143");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app143|iface2:10.0.143.173/33:10.0.0.143:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app143|iface2:10.0.143.173/33:10.0.0.143:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0144 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0145
     * @tc.name      VPN_ConfigBoundary_0145
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app144,iface0,10.0.144.176,24,10.0.0.144,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0145 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app144,iface0,10.0.144.176,24,10.0.0.144,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app144", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.144.176", 24, "10.0.0.144", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app144");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app144|iface0:10.0.144.176/24:10.0.0.144:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app144|iface0:10.0.144.176/24:10.0.0.144:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0145 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0146
     * @tc.name      VPN_ConfigBoundary_0146
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app145,iface1,10.0.145.179,0,10.0.0.145,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0146 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app145,iface1,10.0.145.179,0,10.0.0.145,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app145", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.145.179", 0, "10.0.0.145", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app145");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app145|iface1:10.0.145.179/0:10.0.0.145:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app145|iface1:10.0.145.179/0:10.0.0.145:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0146 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0147
     * @tc.name      VPN_ConfigBoundary_0147
     * @tc.desc      vpn config boundary ,32,1500,,app146,iface2,10.0.146.182,32,10.0.0.146,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0147 begin`);
      logInfo("config boundary ,32,1500,,app146,iface2,10.0.146.182,32,10.0.0.146,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app146", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.146.182", 32, "10.0.0.146", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app146");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app146|iface2:10.0.146.182/32:10.0.0.146:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app146|iface2:10.0.146.182/32:10.0.0.146:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0147 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0148
     * @tc.name      VPN_ConfigBoundary_0148
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app147,iface0,10.0.147.185,33,10.0.0.147,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0148 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app147,iface0,10.0.147.185,33,10.0.0.147,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app147", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.147.185", 33, "10.0.0.147", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app147");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app147|iface0:10.0.147.185/33:10.0.0.147:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app147|iface0:10.0.147.185/33:10.0.0.147:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0148 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0149
     * @tc.name      VPN_ConfigBoundary_0149
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app148,iface1,10.0.148.188,24,10.0.0.148,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0149 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app148,iface1,10.0.148.188,24,10.0.0.148,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app148", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.148.188", 24, "10.0.0.148", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app148");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app148|iface1:10.0.148.188/24:10.0.0.148:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app148|iface1:10.0.148.188/24:10.0.0.148:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0149 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0150
     * @tc.name      VPN_ConfigBoundary_0150
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app149,iface2,10.0.149.191,0,10.0.0.149,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0150 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app149,iface2,10.0.149.191,0,10.0.0.149,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app149", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.149.191", 0, "10.0.0.149", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app149");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app149|iface2:10.0.149.191/0:10.0.0.149:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app149|iface2:10.0.149.191/0:10.0.0.149:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0150 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0151
     * @tc.name      VPN_ConfigBoundary_0151
     * @tc.desc      vpn config boundary ,32,1500,,app150,iface0,10.0.150.194,32,10.0.0.150,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0151 begin`);
      logInfo("config boundary ,32,1500,,app150,iface0,10.0.150.194,32,10.0.0.150,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app150", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.150.194", 32, "10.0.0.150", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app150");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app150|iface0:10.0.150.194/32:10.0.0.150:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app150|iface0:10.0.150.194/32:10.0.0.150:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0151 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0152
     * @tc.name      VPN_ConfigBoundary_0152
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app151,iface1,10.0.151.197,33,10.0.0.151,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0152 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app151,iface1,10.0.151.197,33,10.0.0.151,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app151", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.151.197", 33, "10.0.0.151", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app151");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app151|iface1:10.0.151.197/33:10.0.0.151:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app151|iface1:10.0.151.197/33:10.0.0.151:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0152 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0153
     * @tc.name      VPN_ConfigBoundary_0153
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app152,iface2,10.0.152.200,24,10.0.0.152,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0153 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app152,iface2,10.0.152.200,24,10.0.0.152,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app152", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.152.200", 24, "10.0.0.152", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app152");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app152|iface2:10.0.152.200/24:10.0.0.152:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app152|iface2:10.0.152.200/24:10.0.0.152:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0153 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0154
     * @tc.name      VPN_ConfigBoundary_0154
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app153,iface0,10.0.153.203,0,10.0.0.153,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0154 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app153,iface0,10.0.153.203,0,10.0.0.153,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app153", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.153.203", 0, "10.0.0.153", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app153");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app153|iface0:10.0.153.203/0:10.0.0.153:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app153|iface0:10.0.153.203/0:10.0.0.153:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0154 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0155
     * @tc.name      VPN_ConfigBoundary_0155
     * @tc.desc      vpn config boundary ,32,1500,,app154,iface1,10.0.154.206,32,10.0.0.154,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0155 begin`);
      logInfo("config boundary ,32,1500,,app154,iface1,10.0.154.206,32,10.0.0.154,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app154", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.154.206", 32, "10.0.0.154", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app154");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app154|iface1:10.0.154.206/32:10.0.0.154:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app154|iface1:10.0.154.206/32:10.0.0.154:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0155 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0156
     * @tc.name      VPN_ConfigBoundary_0156
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app155,iface2,10.0.155.209,33,10.0.0.155,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0156 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app155,iface2,10.0.155.209,33,10.0.0.155,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app155", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.155.209", 33, "10.0.0.155", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app155");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app155|iface2:10.0.155.209/33:10.0.0.155:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app155|iface2:10.0.155.209/33:10.0.0.155:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0156 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0157
     * @tc.name      VPN_ConfigBoundary_0157
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app156,iface0,10.0.156.212,24,10.0.0.156,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0157 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app156,iface0,10.0.156.212,24,10.0.0.156,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app156", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.156.212", 24, "10.0.0.156", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app156");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app156|iface0:10.0.156.212/24:10.0.0.156:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app156|iface0:10.0.156.212/24:10.0.0.156:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0157 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0158
     * @tc.name      VPN_ConfigBoundary_0158
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app157,iface1,10.0.157.215,0,10.0.0.157,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0158 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app157,iface1,10.0.157.215,0,10.0.0.157,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app157", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.157.215", 0, "10.0.0.157", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app157");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app157|iface1:10.0.157.215/0:10.0.0.157:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app157|iface1:10.0.157.215/0:10.0.0.157:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0158 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0159
     * @tc.name      VPN_ConfigBoundary_0159
     * @tc.desc      vpn config boundary ,32,1500,,app158,iface2,10.0.158.218,32,10.0.0.158,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0159 begin`);
      logInfo("config boundary ,32,1500,,app158,iface2,10.0.158.218,32,10.0.0.158,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app158", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.158.218", 32, "10.0.0.158", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app158");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app158|iface2:10.0.158.218/32:10.0.0.158:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app158|iface2:10.0.158.218/32:10.0.0.158:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0159 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0160
     * @tc.name      VPN_ConfigBoundary_0160
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app159,iface0,10.0.159.221,33,10.0.0.159,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0160 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app159,iface0,10.0.159.221,33,10.0.0.159,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app159", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.159.221", 33, "10.0.0.159", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app159");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app159|iface0:10.0.159.221/33:10.0.0.159:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app159|iface0:10.0.159.221/33:10.0.0.159:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0160 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0161
     * @tc.name      VPN_ConfigBoundary_0161
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app160,iface1,10.0.160.224,24,10.0.0.160,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0161 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app160,iface1,10.0.160.224,24,10.0.0.160,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app160", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.160.224", 24, "10.0.0.160", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app160");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app160|iface1:10.0.160.224/24:10.0.0.160:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app160|iface1:10.0.160.224/24:10.0.0.160:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0161 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0162
     * @tc.name      VPN_ConfigBoundary_0162
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app161,iface2,10.0.161.227,0,10.0.0.161,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0162 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app161,iface2,10.0.161.227,0,10.0.0.161,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app161", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.161.227", 0, "10.0.0.161", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app161");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app161|iface2:10.0.161.227/0:10.0.0.161:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app161|iface2:10.0.161.227/0:10.0.0.161:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0162 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0163
     * @tc.name      VPN_ConfigBoundary_0163
     * @tc.desc      vpn config boundary ,32,1500,,app162,iface0,10.0.162.230,32,10.0.0.162,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0163 begin`);
      logInfo("config boundary ,32,1500,,app162,iface0,10.0.162.230,32,10.0.0.162,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app162", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.162.230", 32, "10.0.0.162", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app162");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app162|iface0:10.0.162.230/32:10.0.0.162:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app162|iface0:10.0.162.230/32:10.0.0.162:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0163 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0164
     * @tc.name      VPN_ConfigBoundary_0164
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app163,iface1,10.0.163.233,33,10.0.0.163,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0164 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app163,iface1,10.0.163.233,33,10.0.0.163,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app163", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.163.233", 33, "10.0.0.163", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app163");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app163|iface1:10.0.163.233/33:10.0.0.163:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app163|iface1:10.0.163.233/33:10.0.0.163:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0164 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0165
     * @tc.name      VPN_ConfigBoundary_0165
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app164,iface2,10.0.164.236,24,10.0.0.164,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0165 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app164,iface2,10.0.164.236,24,10.0.0.164,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app164", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.164.236", 24, "10.0.0.164", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app164");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app164|iface2:10.0.164.236/24:10.0.0.164:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app164|iface2:10.0.164.236/24:10.0.0.164:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0165 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0166
     * @tc.name      VPN_ConfigBoundary_0166
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app165,iface0,10.0.165.239,0,10.0.0.165,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0166 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app165,iface0,10.0.165.239,0,10.0.0.165,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app165", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.165.239", 0, "10.0.0.165", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app165");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app165|iface0:10.0.165.239/0:10.0.0.165:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app165|iface0:10.0.165.239/0:10.0.0.165:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0166 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0167
     * @tc.name      VPN_ConfigBoundary_0167
     * @tc.desc      vpn config boundary ,32,1500,,app166,iface1,10.0.166.242,32,10.0.0.166,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0167 begin`);
      logInfo("config boundary ,32,1500,,app166,iface1,10.0.166.242,32,10.0.0.166,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app166", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.166.242", 32, "10.0.0.166", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app166");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app166|iface1:10.0.166.242/32:10.0.0.166:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app166|iface1:10.0.166.242/32:10.0.0.166:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0167 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0168
     * @tc.name      VPN_ConfigBoundary_0168
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app167,iface2,10.0.167.245,33,10.0.0.167,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0168 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app167,iface2,10.0.167.245,33,10.0.0.167,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app167", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.167.245", 33, "10.0.0.167", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app167");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app167|iface2:10.0.167.245/33:10.0.0.167:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app167|iface2:10.0.167.245/33:10.0.0.167:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0168 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0169
     * @tc.name      VPN_ConfigBoundary_0169
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app168,iface0,10.0.168.248,24,10.0.0.168,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0169 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app168,iface0,10.0.168.248,24,10.0.0.168,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app168", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.168.248", 24, "10.0.0.168", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app168");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app168|iface0:10.0.168.248/24:10.0.0.168:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app168|iface0:10.0.168.248/24:10.0.0.168:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0169 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0170
     * @tc.name      VPN_ConfigBoundary_0170
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app169,iface1,10.0.169.251,0,10.0.0.169,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0170 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app169,iface1,10.0.169.251,0,10.0.0.169,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app169", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.169.251", 0, "10.0.0.169", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app169");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app169|iface1:10.0.169.251/0:10.0.0.169:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app169|iface1:10.0.169.251/0:10.0.0.169:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0170 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0171
     * @tc.name      VPN_ConfigBoundary_0171
     * @tc.desc      vpn config boundary ,32,1500,,app170,iface2,10.0.170.254,32,10.0.0.170,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0171 begin`);
      logInfo("config boundary ,32,1500,,app170,iface2,10.0.170.254,32,10.0.0.170,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app170", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.170.254", 32, "10.0.0.170", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app170");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app170|iface2:10.0.170.254/32:10.0.0.170:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app170|iface2:10.0.170.254/32:10.0.0.170:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0171 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0172
     * @tc.name      VPN_ConfigBoundary_0172
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app171,iface0,10.0.171.1,33,10.0.0.171,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0172 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app171,iface0,10.0.171.1,33,10.0.0.171,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app171", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.171.1", 33, "10.0.0.171", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app171");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app171|iface0:10.0.171.1/33:10.0.0.171:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app171|iface0:10.0.171.1/33:10.0.0.171:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0172 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0173
     * @tc.name      VPN_ConfigBoundary_0173
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app172,iface1,10.0.172.4,24,10.0.0.172,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0173 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app172,iface1,10.0.172.4,24,10.0.0.172,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app172", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.172.4", 24, "10.0.0.172", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app172");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app172|iface1:10.0.172.4/24:10.0.0.172:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app172|iface1:10.0.172.4/24:10.0.0.172:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0173 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0174
     * @tc.name      VPN_ConfigBoundary_0174
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app173,iface2,10.0.173.7,0,10.0.0.173,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0174 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app173,iface2,10.0.173.7,0,10.0.0.173,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app173", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.173.7", 0, "10.0.0.173", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app173");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app173|iface2:10.0.173.7/0:10.0.0.173:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app173|iface2:10.0.173.7/0:10.0.0.173:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0174 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0175
     * @tc.name      VPN_ConfigBoundary_0175
     * @tc.desc      vpn config boundary ,32,1500,,app174,iface0,10.0.174.10,32,10.0.0.174,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0175 begin`);
      logInfo("config boundary ,32,1500,,app174,iface0,10.0.174.10,32,10.0.0.174,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app174", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.174.10", 32, "10.0.0.174", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app174");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app174|iface0:10.0.174.10/32:10.0.0.174:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app174|iface0:10.0.174.10/32:10.0.0.174:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0175 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0176
     * @tc.name      VPN_ConfigBoundary_0176
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app175,iface1,10.0.175.13,33,10.0.0.175,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0176 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app175,iface1,10.0.175.13,33,10.0.0.175,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app175", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.175.13", 33, "10.0.0.175", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app175");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app175|iface1:10.0.175.13/33:10.0.0.175:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app175|iface1:10.0.175.13/33:10.0.0.175:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0176 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0177
     * @tc.name      VPN_ConfigBoundary_0177
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app176,iface2,10.0.176.16,24,10.0.0.176,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0177 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app176,iface2,10.0.176.16,24,10.0.0.176,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app176", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.176.16", 24, "10.0.0.176", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app176");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app176|iface2:10.0.176.16/24:10.0.0.176:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app176|iface2:10.0.176.16/24:10.0.0.176:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0177 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0178
     * @tc.name      VPN_ConfigBoundary_0178
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app177,iface0,10.0.177.19,0,10.0.0.177,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0178 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app177,iface0,10.0.177.19,0,10.0.0.177,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app177", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.177.19", 0, "10.0.0.177", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app177");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app177|iface0:10.0.177.19/0:10.0.0.177:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app177|iface0:10.0.177.19/0:10.0.0.177:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0178 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0179
     * @tc.name      VPN_ConfigBoundary_0179
     * @tc.desc      vpn config boundary ,32,1500,,app178,iface1,10.0.178.22,32,10.0.0.178,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0179 begin`);
      logInfo("config boundary ,32,1500,,app178,iface1,10.0.178.22,32,10.0.0.178,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app178", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.178.22", 32, "10.0.0.178", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app178");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app178|iface1:10.0.178.22/32:10.0.0.178:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app178|iface1:10.0.178.22/32:10.0.0.178:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0179 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0180
     * @tc.name      VPN_ConfigBoundary_0180
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app179,iface2,10.0.179.25,33,10.0.0.179,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0180 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app179,iface2,10.0.179.25,33,10.0.0.179,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app179", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.179.25", 33, "10.0.0.179", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app179");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app179|iface2:10.0.179.25/33:10.0.0.179:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app179|iface2:10.0.179.25/33:10.0.0.179:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0180 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0181
     * @tc.name      VPN_ConfigBoundary_0181
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app180,iface0,10.0.180.28,24,10.0.0.180,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0181 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app180,iface0,10.0.180.28,24,10.0.0.180,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app180", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.180.28", 24, "10.0.0.180", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app180");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app180|iface0:10.0.180.28/24:10.0.0.180:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app180|iface0:10.0.180.28/24:10.0.0.180:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0181 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0182
     * @tc.name      VPN_ConfigBoundary_0182
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app181,iface1,10.0.181.31,0,10.0.0.181,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0182 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app181,iface1,10.0.181.31,0,10.0.0.181,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app181", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.181.31", 0, "10.0.0.181", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app181");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app181|iface1:10.0.181.31/0:10.0.0.181:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app181|iface1:10.0.181.31/0:10.0.0.181:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0182 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0183
     * @tc.name      VPN_ConfigBoundary_0183
     * @tc.desc      vpn config boundary ,32,1500,,app182,iface2,10.0.182.34,32,10.0.0.182,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0183 begin`);
      logInfo("config boundary ,32,1500,,app182,iface2,10.0.182.34,32,10.0.0.182,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app182", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.182.34", 32, "10.0.0.182", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app182");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app182|iface2:10.0.182.34/32:10.0.0.182:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app182|iface2:10.0.182.34/32:10.0.0.182:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0183 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0184
     * @tc.name      VPN_ConfigBoundary_0184
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app183,iface0,10.0.183.37,33,10.0.0.183,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0184 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app183,iface0,10.0.183.37,33,10.0.0.183,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app183", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.183.37", 33, "10.0.0.183", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app183");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app183|iface0:10.0.183.37/33:10.0.0.183:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app183|iface0:10.0.183.37/33:10.0.0.183:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0184 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0185
     * @tc.name      VPN_ConfigBoundary_0185
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app184,iface1,10.0.184.40,24,10.0.0.184,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0185 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app184,iface1,10.0.184.40,24,10.0.0.184,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app184", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.184.40", 24, "10.0.0.184", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app184");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app184|iface1:10.0.184.40/24:10.0.0.184:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app184|iface1:10.0.184.40/24:10.0.0.184:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0185 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0186
     * @tc.name      VPN_ConfigBoundary_0186
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app185,iface2,10.0.185.43,0,10.0.0.185,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0186 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app185,iface2,10.0.185.43,0,10.0.0.185,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app185", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.185.43", 0, "10.0.0.185", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app185");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app185|iface2:10.0.185.43/0:10.0.0.185:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app185|iface2:10.0.185.43/0:10.0.0.185:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0186 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0187
     * @tc.name      VPN_ConfigBoundary_0187
     * @tc.desc      vpn config boundary ,32,1500,,app186,iface0,10.0.186.46,32,10.0.0.186,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0187 begin`);
      logInfo("config boundary ,32,1500,,app186,iface0,10.0.186.46,32,10.0.0.186,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app186", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.186.46", 32, "10.0.0.186", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app186");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app186|iface0:10.0.186.46/32:10.0.0.186:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app186|iface0:10.0.186.46/32:10.0.0.186:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0187 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0188
     * @tc.name      VPN_ConfigBoundary_0188
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app187,iface1,10.0.187.49,33,10.0.0.187,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0188 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app187,iface1,10.0.187.49,33,10.0.0.187,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app187", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.187.49", 33, "10.0.0.187", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app187");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app187|iface1:10.0.187.49/33:10.0.0.187:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app187|iface1:10.0.187.49/33:10.0.0.187:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0188 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0189
     * @tc.name      VPN_ConfigBoundary_0189
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app188,iface2,10.0.188.52,24,10.0.0.188,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0189 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app188,iface2,10.0.188.52,24,10.0.0.188,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app188", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.188.52", 24, "10.0.0.188", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app188");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app188|iface2:10.0.188.52/24:10.0.0.188:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app188|iface2:10.0.188.52/24:10.0.0.188:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0189 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0190
     * @tc.name      VPN_ConfigBoundary_0190
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app189,iface0,10.0.189.55,0,10.0.0.189,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0190 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app189,iface0,10.0.189.55,0,10.0.0.189,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app189", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.189.55", 0, "10.0.0.189", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app189");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app189|iface0:10.0.189.55/0:10.0.0.189:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app189|iface0:10.0.189.55/0:10.0.0.189:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0190 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0191
     * @tc.name      VPN_ConfigBoundary_0191
     * @tc.desc      vpn config boundary ,32,1500,,app190,iface1,10.0.190.58,32,10.0.0.190,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0191 begin`);
      logInfo("config boundary ,32,1500,,app190,iface1,10.0.190.58,32,10.0.0.190,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app190", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.190.58", 32, "10.0.0.190", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app190");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app190|iface1:10.0.190.58/32:10.0.0.190:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app190|iface1:10.0.190.58/32:10.0.0.190:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0191 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0192
     * @tc.name      VPN_ConfigBoundary_0192
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app191,iface2,10.0.191.61,33,10.0.0.191,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0192 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app191,iface2,10.0.191.61,33,10.0.0.191,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app191", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.191.61", 33, "10.0.0.191", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app191");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app191|iface2:10.0.191.61/33:10.0.0.191:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app191|iface2:10.0.191.61/33:10.0.0.191:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0192 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0193
     * @tc.name      VPN_ConfigBoundary_0193
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app192,iface0,10.0.192.64,24,10.0.0.192,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0193 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app192,iface0,10.0.192.64,24,10.0.0.192,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app192", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.192.64", 24, "10.0.0.192", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app192");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app192|iface0:10.0.192.64/24:10.0.0.192:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app192|iface0:10.0.192.64/24:10.0.0.192:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0193 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0194
     * @tc.name      VPN_ConfigBoundary_0194
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app193,iface1,10.0.193.67,0,10.0.0.193,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0194 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app193,iface1,10.0.193.67,0,10.0.0.193,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app193", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.193.67", 0, "10.0.0.193", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app193");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app193|iface1:10.0.193.67/0:10.0.0.193:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app193|iface1:10.0.193.67/0:10.0.0.193:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0194 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0195
     * @tc.name      VPN_ConfigBoundary_0195
     * @tc.desc      vpn config boundary ,32,1500,,app194,iface2,10.0.194.70,32,10.0.0.194,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0195 begin`);
      logInfo("config boundary ,32,1500,,app194,iface2,10.0.194.70,32,10.0.0.194,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app194", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.194.70", 32, "10.0.0.194", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app194");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app194|iface2:10.0.194.70/32:10.0.0.194:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app194|iface2:10.0.194.70/32:10.0.0.194:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0195 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0196
     * @tc.name      VPN_ConfigBoundary_0196
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app195,iface0,10.0.195.73,33,10.0.0.195,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0196 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app195,iface0,10.0.195.73,33,10.0.0.195,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app195", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.195.73", 33, "10.0.0.195", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app195");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app195|iface0:10.0.195.73/33:10.0.0.195:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app195|iface0:10.0.195.73/33:10.0.0.195:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0196 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0197
     * @tc.name      VPN_ConfigBoundary_0197
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app196,iface1,10.0.196.76,24,10.0.0.196,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0197 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app196,iface1,10.0.196.76,24,10.0.0.196,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app196", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.196.76", 24, "10.0.0.196", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app196");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app196|iface1:10.0.196.76/24:10.0.0.196:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app196|iface1:10.0.196.76/24:10.0.0.196:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0197 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0198
     * @tc.name      VPN_ConfigBoundary_0198
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app197,iface2,10.0.197.79,0,10.0.0.197,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0198 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app197,iface2,10.0.197.79,0,10.0.0.197,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app197", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.197.79", 0, "10.0.0.197", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app197");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app197|iface2:10.0.197.79/0:10.0.0.197:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app197|iface2:10.0.197.79/0:10.0.0.197:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0198 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0199
     * @tc.name      VPN_ConfigBoundary_0199
     * @tc.desc      vpn config boundary ,32,1500,,app198,iface0,10.0.198.82,32,10.0.0.198,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0199 begin`);
      logInfo("config boundary ,32,1500,,app198,iface0,10.0.198.82,32,10.0.0.198,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app198", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.198.82", 32, "10.0.0.198", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app198");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app198|iface0:10.0.198.82/32:10.0.0.198:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app198|iface0:10.0.198.82/32:10.0.0.198:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0199 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0200
     * @tc.name      VPN_ConfigBoundary_0200
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app199,iface1,10.0.199.85,33,10.0.0.199,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0200 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app199,iface1,10.0.199.85,33,10.0.0.199,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app199", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.199.85", 33, "10.0.0.199", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app199");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app199|iface1:10.0.199.85/33:10.0.0.199:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app199|iface1:10.0.199.85/33:10.0.0.199:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0200 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0201
     * @tc.name      VPN_ConfigBoundary_0201
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app200,iface2,10.0.200.88,24,10.0.0.200,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0201 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app200,iface2,10.0.200.88,24,10.0.0.200,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app200", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.200.88", 24, "10.0.0.200", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app200");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app200|iface2:10.0.200.88/24:10.0.0.200:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app200|iface2:10.0.200.88/24:10.0.0.200:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0201 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0202
     * @tc.name      VPN_ConfigBoundary_0202
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app201,iface0,10.0.201.91,0,10.0.0.201,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0202 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app201,iface0,10.0.201.91,0,10.0.0.201,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app201", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.201.91", 0, "10.0.0.201", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app201");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app201|iface0:10.0.201.91/0:10.0.0.201:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app201|iface0:10.0.201.91/0:10.0.0.201:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0202 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0203
     * @tc.name      VPN_ConfigBoundary_0203
     * @tc.desc      vpn config boundary ,32,1500,,app202,iface1,10.0.202.94,32,10.0.0.202,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0203 begin`);
      logInfo("config boundary ,32,1500,,app202,iface1,10.0.202.94,32,10.0.0.202,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app202", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.202.94", 32, "10.0.0.202", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app202");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app202|iface1:10.0.202.94/32:10.0.0.202:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app202|iface1:10.0.202.94/32:10.0.0.202:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0203 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0204
     * @tc.name      VPN_ConfigBoundary_0204
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app203,iface2,10.0.203.97,33,10.0.0.203,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0204 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app203,iface2,10.0.203.97,33,10.0.0.203,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app203", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.203.97", 33, "10.0.0.203", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app203");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app203|iface2:10.0.203.97/33:10.0.0.203:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app203|iface2:10.0.203.97/33:10.0.0.203:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0204 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0205
     * @tc.name      VPN_ConfigBoundary_0205
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app204,iface0,10.0.204.100,24,10.0.0.204,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0205 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app204,iface0,10.0.204.100,24,10.0.0.204,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app204", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.204.100", 24, "10.0.0.204", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app204");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app204|iface0:10.0.204.100/24:10.0.0.204:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app204|iface0:10.0.204.100/24:10.0.0.204:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0205 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0206
     * @tc.name      VPN_ConfigBoundary_0206
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app205,iface1,10.0.205.103,0,10.0.0.205,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0206 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app205,iface1,10.0.205.103,0,10.0.0.205,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app205", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.205.103", 0, "10.0.0.205", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app205");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app205|iface1:10.0.205.103/0:10.0.0.205:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app205|iface1:10.0.205.103/0:10.0.0.205:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0206 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0207
     * @tc.name      VPN_ConfigBoundary_0207
     * @tc.desc      vpn config boundary ,32,1500,,app206,iface2,10.0.206.106,32,10.0.0.206,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0207 begin`);
      logInfo("config boundary ,32,1500,,app206,iface2,10.0.206.106,32,10.0.0.206,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app206", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.206.106", 32, "10.0.0.206", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app206");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app206|iface2:10.0.206.106/32:10.0.0.206:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app206|iface2:10.0.206.106/32:10.0.0.206:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0207 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0208
     * @tc.name      VPN_ConfigBoundary_0208
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app207,iface0,10.0.207.109,33,10.0.0.207,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0208 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app207,iface0,10.0.207.109,33,10.0.0.207,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app207", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.207.109", 33, "10.0.0.207", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app207");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app207|iface0:10.0.207.109/33:10.0.0.207:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app207|iface0:10.0.207.109/33:10.0.0.207:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0208 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0209
     * @tc.name      VPN_ConfigBoundary_0209
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app208,iface1,10.0.208.112,24,10.0.0.208,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0209 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app208,iface1,10.0.208.112,24,10.0.0.208,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app208", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.208.112", 24, "10.0.0.208", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app208");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app208|iface1:10.0.208.112/24:10.0.0.208:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app208|iface1:10.0.208.112/24:10.0.0.208:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0209 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0210
     * @tc.name      VPN_ConfigBoundary_0210
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app209,iface2,10.0.209.115,0,10.0.0.209,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0210 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app209,iface2,10.0.209.115,0,10.0.0.209,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app209", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.209.115", 0, "10.0.0.209", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app209");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app209|iface2:10.0.209.115/0:10.0.0.209:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app209|iface2:10.0.209.115/0:10.0.0.209:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0210 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0211
     * @tc.name      VPN_ConfigBoundary_0211
     * @tc.desc      vpn config boundary ,32,1500,,app210,iface0,10.0.210.118,32,10.0.0.210,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0211 begin`);
      logInfo("config boundary ,32,1500,,app210,iface0,10.0.210.118,32,10.0.0.210,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app210", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.210.118", 32, "10.0.0.210", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app210");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app210|iface0:10.0.210.118/32:10.0.0.210:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app210|iface0:10.0.210.118/32:10.0.0.210:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0211 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0212
     * @tc.name      VPN_ConfigBoundary_0212
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app211,iface1,10.0.211.121,33,10.0.0.211,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0212 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app211,iface1,10.0.211.121,33,10.0.0.211,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app211", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.211.121", 33, "10.0.0.211", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app211");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app211|iface1:10.0.211.121/33:10.0.0.211:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app211|iface1:10.0.211.121/33:10.0.0.211:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0212 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0213
     * @tc.name      VPN_ConfigBoundary_0213
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app212,iface2,10.0.212.124,24,10.0.0.212,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0213 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app212,iface2,10.0.212.124,24,10.0.0.212,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app212", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.212.124", 24, "10.0.0.212", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app212");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app212|iface2:10.0.212.124/24:10.0.0.212:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app212|iface2:10.0.212.124/24:10.0.0.212:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0213 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0214
     * @tc.name      VPN_ConfigBoundary_0214
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app213,iface0,10.0.213.127,0,10.0.0.213,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0214 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app213,iface0,10.0.213.127,0,10.0.0.213,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app213", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.213.127", 0, "10.0.0.213", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app213");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app213|iface0:10.0.213.127/0:10.0.0.213:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app213|iface0:10.0.213.127/0:10.0.0.213:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0214 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0215
     * @tc.name      VPN_ConfigBoundary_0215
     * @tc.desc      vpn config boundary ,32,1500,,app214,iface1,10.0.214.130,32,10.0.0.214,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0215 begin`);
      logInfo("config boundary ,32,1500,,app214,iface1,10.0.214.130,32,10.0.0.214,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app214", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.214.130", 32, "10.0.0.214", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app214");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app214|iface1:10.0.214.130/32:10.0.0.214:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app214|iface1:10.0.214.130/32:10.0.0.214:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0215 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0216
     * @tc.name      VPN_ConfigBoundary_0216
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app215,iface2,10.0.215.133,33,10.0.0.215,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0216 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app215,iface2,10.0.215.133,33,10.0.0.215,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app215", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.215.133", 33, "10.0.0.215", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app215");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app215|iface2:10.0.215.133/33:10.0.0.215:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app215|iface2:10.0.215.133/33:10.0.0.215:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0216 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0217
     * @tc.name      VPN_ConfigBoundary_0217
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app216,iface0,10.0.216.136,24,10.0.0.216,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0217 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app216,iface0,10.0.216.136,24,10.0.0.216,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app216", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.216.136", 24, "10.0.0.216", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app216");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app216|iface0:10.0.216.136/24:10.0.0.216:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app216|iface0:10.0.216.136/24:10.0.0.216:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0217 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0218
     * @tc.name      VPN_ConfigBoundary_0218
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app217,iface1,10.0.217.139,0,10.0.0.217,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0218 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app217,iface1,10.0.217.139,0,10.0.0.217,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app217", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.217.139", 0, "10.0.0.217", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app217");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app217|iface1:10.0.217.139/0:10.0.0.217:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app217|iface1:10.0.217.139/0:10.0.0.217:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0218 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0219
     * @tc.name      VPN_ConfigBoundary_0219
     * @tc.desc      vpn config boundary ,32,1500,,app218,iface2,10.0.218.142,32,10.0.0.218,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0219 begin`);
      logInfo("config boundary ,32,1500,,app218,iface2,10.0.218.142,32,10.0.0.218,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app218", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.218.142", 32, "10.0.0.218", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app218");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app218|iface2:10.0.218.142/32:10.0.0.218:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app218|iface2:10.0.218.142/32:10.0.0.218:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0219 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0220
     * @tc.name      VPN_ConfigBoundary_0220
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app219,iface0,10.0.219.145,33,10.0.0.219,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0220 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app219,iface0,10.0.219.145,33,10.0.0.219,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app219", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.219.145", 33, "10.0.0.219", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app219");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app219|iface0:10.0.219.145/33:10.0.0.219:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app219|iface0:10.0.219.145/33:10.0.0.219:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0220 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0221
     * @tc.name      VPN_ConfigBoundary_0221
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app220,iface1,10.0.220.148,24,10.0.0.220,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0221 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app220,iface1,10.0.220.148,24,10.0.0.220,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app220", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.220.148", 24, "10.0.0.220", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app220");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app220|iface1:10.0.220.148/24:10.0.0.220:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app220|iface1:10.0.220.148/24:10.0.0.220:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0221 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0222
     * @tc.name      VPN_ConfigBoundary_0222
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app221,iface2,10.0.221.151,0,10.0.0.221,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0222 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app221,iface2,10.0.221.151,0,10.0.0.221,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app221", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.221.151", 0, "10.0.0.221", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app221");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app221|iface2:10.0.221.151/0:10.0.0.221:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app221|iface2:10.0.221.151/0:10.0.0.221:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0222 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0223
     * @tc.name      VPN_ConfigBoundary_0223
     * @tc.desc      vpn config boundary ,32,1500,,app222,iface0,10.0.222.154,32,10.0.0.222,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0223 begin`);
      logInfo("config boundary ,32,1500,,app222,iface0,10.0.222.154,32,10.0.0.222,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app222", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.222.154", 32, "10.0.0.222", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app222");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app222|iface0:10.0.222.154/32:10.0.0.222:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app222|iface0:10.0.222.154/32:10.0.0.222:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0223 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0224
     * @tc.name      VPN_ConfigBoundary_0224
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app223,iface1,10.0.223.157,33,10.0.0.223,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0224 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app223,iface1,10.0.223.157,33,10.0.0.223,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app223", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.223.157", 33, "10.0.0.223", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app223");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app223|iface1:10.0.223.157/33:10.0.0.223:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app223|iface1:10.0.223.157/33:10.0.0.223:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0224 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0225
     * @tc.name      VPN_ConfigBoundary_0225
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app224,iface2,10.0.224.160,24,10.0.0.224,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0225 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app224,iface2,10.0.224.160,24,10.0.0.224,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app224", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.224.160", 24, "10.0.0.224", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app224");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app224|iface2:10.0.224.160/24:10.0.0.224:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app224|iface2:10.0.224.160/24:10.0.0.224:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0225 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0226
     * @tc.name      VPN_ConfigBoundary_0226
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app225,iface0,10.0.225.163,0,10.0.0.225,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0226 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app225,iface0,10.0.225.163,0,10.0.0.225,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app225", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.225.163", 0, "10.0.0.225", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app225");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app225|iface0:10.0.225.163/0:10.0.0.225:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app225|iface0:10.0.225.163/0:10.0.0.225:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0226 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0227
     * @tc.name      VPN_ConfigBoundary_0227
     * @tc.desc      vpn config boundary ,32,1500,,app226,iface1,10.0.226.166,32,10.0.0.226,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0227 begin`);
      logInfo("config boundary ,32,1500,,app226,iface1,10.0.226.166,32,10.0.0.226,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app226", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.226.166", 32, "10.0.0.226", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app226");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app226|iface1:10.0.226.166/32:10.0.0.226:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app226|iface1:10.0.226.166/32:10.0.0.226:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0227 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0228
     * @tc.name      VPN_ConfigBoundary_0228
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app227,iface2,10.0.227.169,33,10.0.0.227,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0228 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app227,iface2,10.0.227.169,33,10.0.0.227,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app227", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.227.169", 33, "10.0.0.227", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app227");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app227|iface2:10.0.227.169/33:10.0.0.227:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app227|iface2:10.0.227.169/33:10.0.0.227:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0228 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0229
     * @tc.name      VPN_ConfigBoundary_0229
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app228,iface0,10.0.228.172,24,10.0.0.228,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0229 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app228,iface0,10.0.228.172,24,10.0.0.228,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app228", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.228.172", 24, "10.0.0.228", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app228");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app228|iface0:10.0.228.172/24:10.0.0.228:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app228|iface0:10.0.228.172/24:10.0.0.228:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0229 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0230
     * @tc.name      VPN_ConfigBoundary_0230
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app229,iface1,10.0.229.175,0,10.0.0.229,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0230 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app229,iface1,10.0.229.175,0,10.0.0.229,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app229", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.229.175", 0, "10.0.0.229", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app229");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app229|iface1:10.0.229.175/0:10.0.0.229:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app229|iface1:10.0.229.175/0:10.0.0.229:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0230 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0231
     * @tc.name      VPN_ConfigBoundary_0231
     * @tc.desc      vpn config boundary ,32,1500,,app230,iface2,10.0.230.178,32,10.0.0.230,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0231 begin`);
      logInfo("config boundary ,32,1500,,app230,iface2,10.0.230.178,32,10.0.0.230,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app230", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.230.178", 32, "10.0.0.230", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app230");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app230|iface2:10.0.230.178/32:10.0.0.230:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app230|iface2:10.0.230.178/32:10.0.0.230:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0231 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0232
     * @tc.name      VPN_ConfigBoundary_0232
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app231,iface0,10.0.231.181,33,10.0.0.231,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0232 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app231,iface0,10.0.231.181,33,10.0.0.231,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app231", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.231.181", 33, "10.0.0.231", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app231");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app231|iface0:10.0.231.181/33:10.0.0.231:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app231|iface0:10.0.231.181/33:10.0.0.231:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0232 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0233
     * @tc.name      VPN_ConfigBoundary_0233
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app232,iface1,10.0.232.184,24,10.0.0.232,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0233 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app232,iface1,10.0.232.184,24,10.0.0.232,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app232", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.232.184", 24, "10.0.0.232", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app232");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app232|iface1:10.0.232.184/24:10.0.0.232:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app232|iface1:10.0.232.184/24:10.0.0.232:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0233 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0234
     * @tc.name      VPN_ConfigBoundary_0234
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app233,iface2,10.0.233.187,0,10.0.0.233,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0234 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app233,iface2,10.0.233.187,0,10.0.0.233,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app233", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.233.187", 0, "10.0.0.233", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app233");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app233|iface2:10.0.233.187/0:10.0.0.233:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app233|iface2:10.0.233.187/0:10.0.0.233:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0234 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0235
     * @tc.name      VPN_ConfigBoundary_0235
     * @tc.desc      vpn config boundary ,32,1500,,app234,iface0,10.0.234.190,32,10.0.0.234,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0235 begin`);
      logInfo("config boundary ,32,1500,,app234,iface0,10.0.234.190,32,10.0.0.234,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app234", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.234.190", 32, "10.0.0.234", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app234");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app234|iface0:10.0.234.190/32:10.0.0.234:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app234|iface0:10.0.234.190/32:10.0.0.234:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0235 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0236
     * @tc.name      VPN_ConfigBoundary_0236
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app235,iface1,10.0.235.193,33,10.0.0.235,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0236 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app235,iface1,10.0.235.193,33,10.0.0.235,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app235", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.235.193", 33, "10.0.0.235", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app235");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app235|iface1:10.0.235.193/33:10.0.0.235:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app235|iface1:10.0.235.193/33:10.0.0.235:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0236 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0237
     * @tc.name      VPN_ConfigBoundary_0237
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app236,iface2,10.0.236.196,24,10.0.0.236,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0237 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app236,iface2,10.0.236.196,24,10.0.0.236,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app236", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.236.196", 24, "10.0.0.236", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app236");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app236|iface2:10.0.236.196/24:10.0.0.236:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app236|iface2:10.0.236.196/24:10.0.0.236:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0237 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0238
     * @tc.name      VPN_ConfigBoundary_0238
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app237,iface0,10.0.237.199,0,10.0.0.237,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0238 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app237,iface0,10.0.237.199,0,10.0.0.237,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app237", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.237.199", 0, "10.0.0.237", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app237");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app237|iface0:10.0.237.199/0:10.0.0.237:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app237|iface0:10.0.237.199/0:10.0.0.237:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0238 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0239
     * @tc.name      VPN_ConfigBoundary_0239
     * @tc.desc      vpn config boundary ,32,1500,,app238,iface1,10.0.238.202,32,10.0.0.238,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0239 begin`);
      logInfo("config boundary ,32,1500,,app238,iface1,10.0.238.202,32,10.0.0.238,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app238", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.238.202", 32, "10.0.0.238", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app238");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app238|iface1:10.0.238.202/32:10.0.0.238:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app238|iface1:10.0.238.202/32:10.0.0.238:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0239 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0240
     * @tc.name      VPN_ConfigBoundary_0240
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app239,iface2,10.0.239.205,33,10.0.0.239,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0240 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app239,iface2,10.0.239.205,33,10.0.0.239,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app239", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.239.205", 33, "10.0.0.239", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app239");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app239|iface2:10.0.239.205/33:10.0.0.239:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app239|iface2:10.0.239.205/33:10.0.0.239:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0240 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0241
     * @tc.name      VPN_ConfigBoundary_0241
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app240,iface0,10.0.240.208,24,10.0.0.240,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0241 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app240,iface0,10.0.240.208,24,10.0.0.240,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app240", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.240.208", 24, "10.0.0.240", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app240");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app240|iface0:10.0.240.208/24:10.0.0.240:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app240|iface0:10.0.240.208/24:10.0.0.240:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0241 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0242
     * @tc.name      VPN_ConfigBoundary_0242
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app241,iface1,10.0.241.211,0,10.0.0.241,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0242 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app241,iface1,10.0.241.211,0,10.0.0.241,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app241", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.241.211", 0, "10.0.0.241", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app241");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app241|iface1:10.0.241.211/0:10.0.0.241:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app241|iface1:10.0.241.211/0:10.0.0.241:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0242 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0243
     * @tc.name      VPN_ConfigBoundary_0243
     * @tc.desc      vpn config boundary ,32,1500,,app242,iface2,10.0.242.214,32,10.0.0.242,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0243 begin`);
      logInfo("config boundary ,32,1500,,app242,iface2,10.0.242.214,32,10.0.0.242,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app242", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.242.214", 32, "10.0.0.242", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app242");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app242|iface2:10.0.242.214/32:10.0.0.242:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app242|iface2:10.0.242.214/32:10.0.0.242:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0243 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0244
     * @tc.name      VPN_ConfigBoundary_0244
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app243,iface0,10.0.243.217,33,10.0.0.243,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0244 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app243,iface0,10.0.243.217,33,10.0.0.243,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app243", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.243.217", 33, "10.0.0.243", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app243");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app243|iface0:10.0.243.217/33:10.0.0.243:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app243|iface0:10.0.243.217/33:10.0.0.243:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0244 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0245
     * @tc.name      VPN_ConfigBoundary_0245
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app244,iface1,10.0.244.220,24,10.0.0.244,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0245 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app244,iface1,10.0.244.220,24,10.0.0.244,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app244", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.244.220", 24, "10.0.0.244", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app244");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app244|iface1:10.0.244.220/24:10.0.0.244:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app244|iface1:10.0.244.220/24:10.0.0.244:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0245 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0246
     * @tc.name      VPN_ConfigBoundary_0246
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app245,iface2,10.0.245.223,0,10.0.0.245,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0246 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app245,iface2,10.0.245.223,0,10.0.0.245,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app245", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.245.223", 0, "10.0.0.245", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app245");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app245|iface2:10.0.245.223/0:10.0.0.245:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app245|iface2:10.0.245.223/0:10.0.0.245:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0246 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0247
     * @tc.name      VPN_ConfigBoundary_0247
     * @tc.desc      vpn config boundary ,32,1500,,app246,iface0,10.0.246.226,32,10.0.0.246,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0247 begin`);
      logInfo("config boundary ,32,1500,,app246,iface0,10.0.246.226,32,10.0.0.246,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app246", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.246.226", 32, "10.0.0.246", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app246");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app246|iface0:10.0.246.226/32:10.0.0.246:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app246|iface0:10.0.246.226/32:10.0.0.246:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0247 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0248
     * @tc.name      VPN_ConfigBoundary_0248
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app247,iface1,10.0.247.229,33,10.0.0.247,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0248 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app247,iface1,10.0.247.229,33,10.0.0.247,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app247", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.247.229", 33, "10.0.0.247", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app247");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app247|iface1:10.0.247.229/33:10.0.0.247:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app247|iface1:10.0.247.229/33:10.0.0.247:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0248 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0249
     * @tc.name      VPN_ConfigBoundary_0249
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app248,iface2,10.0.248.232,24,10.0.0.248,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0249 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app248,iface2,10.0.248.232,24,10.0.0.248,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app248", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.248.232", 24, "10.0.0.248", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app248");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app248|iface2:10.0.248.232/24:10.0.0.248:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app248|iface2:10.0.248.232/24:10.0.0.248:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0249 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0250
     * @tc.name      VPN_ConfigBoundary_0250
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app249,iface0,10.0.249.235,0,10.0.0.249,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0250 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app249,iface0,10.0.249.235,0,10.0.0.249,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app249", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.249.235", 0, "10.0.0.249", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app249");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app249|iface0:10.0.249.235/0:10.0.0.249:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app249|iface0:10.0.249.235/0:10.0.0.249:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0250 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0251
     * @tc.name      VPN_ConfigBoundary_0251
     * @tc.desc      vpn config boundary ,32,1500,,app250,iface1,10.0.250.238,32,10.0.0.250,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0251 begin`);
      logInfo("config boundary ,32,1500,,app250,iface1,10.0.250.238,32,10.0.0.250,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app250", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.250.238", 32, "10.0.0.250", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app250");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app250|iface1:10.0.250.238/32:10.0.0.250:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app250|iface1:10.0.250.238/32:10.0.0.250:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0251 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0252
     * @tc.name      VPN_ConfigBoundary_0252
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app251,iface2,10.0.251.241,33,10.0.0.251,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0252 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app251,iface2,10.0.251.241,33,10.0.0.251,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app251", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.251.241", 33, "10.0.0.251", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app251");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app251|iface2:10.0.251.241/33:10.0.0.251:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app251|iface2:10.0.251.241/33:10.0.0.251:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0252 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0253
     * @tc.name      VPN_ConfigBoundary_0253
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app252,iface0,10.0.252.244,24,10.0.0.252,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0253 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app252,iface0,10.0.252.244,24,10.0.0.252,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app252", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.252.244", 24, "10.0.0.252", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app252");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app252|iface0:10.0.252.244/24:10.0.0.252:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app252|iface0:10.0.252.244/24:10.0.0.252:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0253 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0254
     * @tc.name      VPN_ConfigBoundary_0254
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app253,iface1,10.0.253.247,0,10.0.0.253,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0254 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app253,iface1,10.0.253.247,0,10.0.0.253,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app253", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.253.247", 0, "10.0.0.253", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app253");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app253|iface1:10.0.253.247/0:10.0.0.253:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app253|iface1:10.0.253.247/0:10.0.0.253:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0254 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0255
     * @tc.name      VPN_ConfigBoundary_0255
     * @tc.desc      vpn config boundary ,32,1500,,app254,iface2,10.0.254.250,32,10.0.0.254,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0255 begin`);
      logInfo("config boundary ,32,1500,,app254,iface2,10.0.254.250,32,10.0.0.254,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app254", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.254.250", 32, "10.0.0.254", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app254");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app254|iface2:10.0.254.250/32:10.0.0.254:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app254|iface2:10.0.254.250/32:10.0.0.254:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0255 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0256
     * @tc.name      VPN_ConfigBoundary_0256
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app255,iface0,10.0.255.253,33,10.0.0.255,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0256 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app255,iface0,10.0.255.253,33,10.0.0.255,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app255", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.255.253", 33, "10.0.0.255", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app255");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app255|iface0:10.0.255.253/33:10.0.0.255:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app255|iface0:10.0.255.253/33:10.0.0.255:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0256 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0257
     * @tc.name      VPN_ConfigBoundary_0257
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app256,iface1,10.0.0.0,24,10.0.0.0,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0257 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app256,iface1,10.0.0.0,24,10.0.0.0,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app256", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.0.0", 24, "10.0.0.0", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app256");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app256|iface1:10.0.0.0/24:10.0.0.0:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app256|iface1:10.0.0.0/24:10.0.0.0:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0257 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0258
     * @tc.name      VPN_ConfigBoundary_0258
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app257,iface2,10.0.1.3,0,10.0.0.1,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0258 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app257,iface2,10.0.1.3,0,10.0.0.1,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app257", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.1.3", 0, "10.0.0.1", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app257");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app257|iface2:10.0.1.3/0:10.0.0.1:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app257|iface2:10.0.1.3/0:10.0.0.1:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0258 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0259
     * @tc.name      VPN_ConfigBoundary_0259
     * @tc.desc      vpn config boundary ,32,1500,,app258,iface0,10.0.2.6,32,10.0.0.2,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0259 begin`);
      logInfo("config boundary ,32,1500,,app258,iface0,10.0.2.6,32,10.0.0.2,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app258", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.2.6", 32, "10.0.0.2", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app258");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app258|iface0:10.0.2.6/32:10.0.0.2:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app258|iface0:10.0.2.6/32:10.0.0.2:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0259 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0260
     * @tc.name      VPN_ConfigBoundary_0260
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app259,iface1,10.0.3.9,33,10.0.0.3,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0260 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app259,iface1,10.0.3.9,33,10.0.0.3,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app259", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.3.9", 33, "10.0.0.3", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app259");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app259|iface1:10.0.3.9/33:10.0.0.3:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app259|iface1:10.0.3.9/33:10.0.0.3:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0260 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0261
     * @tc.name      VPN_ConfigBoundary_0261
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app260,iface2,10.0.4.12,24,10.0.0.4,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0261 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app260,iface2,10.0.4.12,24,10.0.0.4,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app260", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.4.12", 24, "10.0.0.4", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app260");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app260|iface2:10.0.4.12/24:10.0.0.4:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app260|iface2:10.0.4.12/24:10.0.0.4:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0261 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0262
     * @tc.name      VPN_ConfigBoundary_0262
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app261,iface0,10.0.5.15,0,10.0.0.5,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0262 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app261,iface0,10.0.5.15,0,10.0.0.5,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app261", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.5.15", 0, "10.0.0.5", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app261");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app261|iface0:10.0.5.15/0:10.0.0.5:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app261|iface0:10.0.5.15/0:10.0.0.5:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0262 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0263
     * @tc.name      VPN_ConfigBoundary_0263
     * @tc.desc      vpn config boundary ,32,1500,,app262,iface1,10.0.6.18,32,10.0.0.6,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0263 begin`);
      logInfo("config boundary ,32,1500,,app262,iface1,10.0.6.18,32,10.0.0.6,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app262", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.6.18", 32, "10.0.0.6", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app262");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app262|iface1:10.0.6.18/32:10.0.0.6:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app262|iface1:10.0.6.18/32:10.0.0.6:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0263 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0264
     * @tc.name      VPN_ConfigBoundary_0264
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app263,iface2,10.0.7.21,33,10.0.0.7,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0264 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app263,iface2,10.0.7.21,33,10.0.0.7,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app263", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.7.21", 33, "10.0.0.7", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app263");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app263|iface2:10.0.7.21/33:10.0.0.7:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app263|iface2:10.0.7.21/33:10.0.0.7:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0264 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0265
     * @tc.name      VPN_ConfigBoundary_0265
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app264,iface0,10.0.8.24,24,10.0.0.8,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0265 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app264,iface0,10.0.8.24,24,10.0.0.8,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app264", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.8.24", 24, "10.0.0.8", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app264");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app264|iface0:10.0.8.24/24:10.0.0.8:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app264|iface0:10.0.8.24/24:10.0.0.8:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0265 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0266
     * @tc.name      VPN_ConfigBoundary_0266
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app265,iface1,10.0.9.27,0,10.0.0.9,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0266 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app265,iface1,10.0.9.27,0,10.0.0.9,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app265", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.9.27", 0, "10.0.0.9", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app265");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app265|iface1:10.0.9.27/0:10.0.0.9:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app265|iface1:10.0.9.27/0:10.0.0.9:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0266 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0267
     * @tc.name      VPN_ConfigBoundary_0267
     * @tc.desc      vpn config boundary ,32,1500,,app266,iface2,10.0.10.30,32,10.0.0.10,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0267 begin`);
      logInfo("config boundary ,32,1500,,app266,iface2,10.0.10.30,32,10.0.0.10,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app266", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.10.30", 32, "10.0.0.10", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app266");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app266|iface2:10.0.10.30/32:10.0.0.10:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app266|iface2:10.0.10.30/32:10.0.0.10:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0267 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0268
     * @tc.name      VPN_ConfigBoundary_0268
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app267,iface0,10.0.11.33,33,10.0.0.11,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0268 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app267,iface0,10.0.11.33,33,10.0.0.11,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app267", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.11.33", 33, "10.0.0.11", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app267");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app267|iface0:10.0.11.33/33:10.0.0.11:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app267|iface0:10.0.11.33/33:10.0.0.11:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0268 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0269
     * @tc.name      VPN_ConfigBoundary_0269
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app268,iface1,10.0.12.36,24,10.0.0.12,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0269 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app268,iface1,10.0.12.36,24,10.0.0.12,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app268", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.12.36", 24, "10.0.0.12", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app268");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app268|iface1:10.0.12.36/24:10.0.0.12:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app268|iface1:10.0.12.36/24:10.0.0.12:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0269 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0270
     * @tc.name      VPN_ConfigBoundary_0270
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app269,iface2,10.0.13.39,0,10.0.0.13,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0270 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app269,iface2,10.0.13.39,0,10.0.0.13,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app269", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.13.39", 0, "10.0.0.13", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app269");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app269|iface2:10.0.13.39/0:10.0.0.13:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app269|iface2:10.0.13.39/0:10.0.0.13:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0270 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0271
     * @tc.name      VPN_ConfigBoundary_0271
     * @tc.desc      vpn config boundary ,32,1500,,app270,iface0,10.0.14.42,32,10.0.0.14,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0271 begin`);
      logInfo("config boundary ,32,1500,,app270,iface0,10.0.14.42,32,10.0.0.14,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app270", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.14.42", 32, "10.0.0.14", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app270");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app270|iface0:10.0.14.42/32:10.0.0.14:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app270|iface0:10.0.14.42/32:10.0.0.14:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0271 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0272
     * @tc.name      VPN_ConfigBoundary_0272
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app271,iface1,10.0.15.45,33,10.0.0.15,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0272 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app271,iface1,10.0.15.45,33,10.0.0.15,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app271", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.15.45", 33, "10.0.0.15", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app271");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app271|iface1:10.0.15.45/33:10.0.0.15:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app271|iface1:10.0.15.45/33:10.0.0.15:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0272 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0273
     * @tc.name      VPN_ConfigBoundary_0273
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app272,iface2,10.0.16.48,24,10.0.0.16,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0273 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app272,iface2,10.0.16.48,24,10.0.0.16,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app272", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.16.48", 24, "10.0.0.16", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app272");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app272|iface2:10.0.16.48/24:10.0.0.16:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app272|iface2:10.0.16.48/24:10.0.0.16:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0273 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0274
     * @tc.name      VPN_ConfigBoundary_0274
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app273,iface0,10.0.17.51,0,10.0.0.17,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0274 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app273,iface0,10.0.17.51,0,10.0.0.17,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app273", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.17.51", 0, "10.0.0.17", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app273");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app273|iface0:10.0.17.51/0:10.0.0.17:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app273|iface0:10.0.17.51/0:10.0.0.17:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0274 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0275
     * @tc.name      VPN_ConfigBoundary_0275
     * @tc.desc      vpn config boundary ,32,1500,,app274,iface1,10.0.18.54,32,10.0.0.18,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0275 begin`);
      logInfo("config boundary ,32,1500,,app274,iface1,10.0.18.54,32,10.0.0.18,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app274", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.18.54", 32, "10.0.0.18", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app274");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app274|iface1:10.0.18.54/32:10.0.0.18:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app274|iface1:10.0.18.54/32:10.0.0.18:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0275 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0276
     * @tc.name      VPN_ConfigBoundary_0276
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app275,iface2,10.0.19.57,33,10.0.0.19,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0276 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app275,iface2,10.0.19.57,33,10.0.0.19,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app275", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.19.57", 33, "10.0.0.19", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app275");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app275|iface2:10.0.19.57/33:10.0.0.19:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app275|iface2:10.0.19.57/33:10.0.0.19:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0276 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0277
     * @tc.name      VPN_ConfigBoundary_0277
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app276,iface0,10.0.20.60,24,10.0.0.20,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0277 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app276,iface0,10.0.20.60,24,10.0.0.20,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app276", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.20.60", 24, "10.0.0.20", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app276");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app276|iface0:10.0.20.60/24:10.0.0.20:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app276|iface0:10.0.20.60/24:10.0.0.20:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0277 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0278
     * @tc.name      VPN_ConfigBoundary_0278
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app277,iface1,10.0.21.63,0,10.0.0.21,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0278 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app277,iface1,10.0.21.63,0,10.0.0.21,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app277", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.21.63", 0, "10.0.0.21", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app277");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app277|iface1:10.0.21.63/0:10.0.0.21:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app277|iface1:10.0.21.63/0:10.0.0.21:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0278 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0279
     * @tc.name      VPN_ConfigBoundary_0279
     * @tc.desc      vpn config boundary ,32,1500,,app278,iface2,10.0.22.66,32,10.0.0.22,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0279 begin`);
      logInfo("config boundary ,32,1500,,app278,iface2,10.0.22.66,32,10.0.0.22,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app278", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.22.66", 32, "10.0.0.22", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app278");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app278|iface2:10.0.22.66/32:10.0.0.22:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app278|iface2:10.0.22.66/32:10.0.0.22:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0279 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0280
     * @tc.name      VPN_ConfigBoundary_0280
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app279,iface0,10.0.23.69,33,10.0.0.23,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0280 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app279,iface0,10.0.23.69,33,10.0.0.23,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app279", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.23.69", 33, "10.0.0.23", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app279");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app279|iface0:10.0.23.69/33:10.0.0.23:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app279|iface0:10.0.23.69/33:10.0.0.23:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0280 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0281
     * @tc.name      VPN_ConfigBoundary_0281
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app280,iface1,10.0.24.72,24,10.0.0.24,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0281 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app280,iface1,10.0.24.72,24,10.0.0.24,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app280", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.24.72", 24, "10.0.0.24", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app280");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app280|iface1:10.0.24.72/24:10.0.0.24:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app280|iface1:10.0.24.72/24:10.0.0.24:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0281 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0282
     * @tc.name      VPN_ConfigBoundary_0282
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app281,iface2,10.0.25.75,0,10.0.0.25,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0282 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app281,iface2,10.0.25.75,0,10.0.0.25,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app281", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.25.75", 0, "10.0.0.25", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app281");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app281|iface2:10.0.25.75/0:10.0.0.25:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app281|iface2:10.0.25.75/0:10.0.0.25:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0282 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0283
     * @tc.name      VPN_ConfigBoundary_0283
     * @tc.desc      vpn config boundary ,32,1500,,app282,iface0,10.0.26.78,32,10.0.0.26,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0283 begin`);
      logInfo("config boundary ,32,1500,,app282,iface0,10.0.26.78,32,10.0.0.26,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app282", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.26.78", 32, "10.0.0.26", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app282");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app282|iface0:10.0.26.78/32:10.0.0.26:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app282|iface0:10.0.26.78/32:10.0.0.26:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0283 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0284
     * @tc.name      VPN_ConfigBoundary_0284
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app283,iface1,10.0.27.81,33,10.0.0.27,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0284 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app283,iface1,10.0.27.81,33,10.0.0.27,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app283", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.27.81", 33, "10.0.0.27", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app283");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app283|iface1:10.0.27.81/33:10.0.0.27:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app283|iface1:10.0.27.81/33:10.0.0.27:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0284 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0285
     * @tc.name      VPN_ConfigBoundary_0285
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app284,iface2,10.0.28.84,24,10.0.0.28,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0285 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app284,iface2,10.0.28.84,24,10.0.0.28,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app284", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.28.84", 24, "10.0.0.28", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app284");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app284|iface2:10.0.28.84/24:10.0.0.28:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app284|iface2:10.0.28.84/24:10.0.0.28:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0285 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0286
     * @tc.name      VPN_ConfigBoundary_0286
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app285,iface0,10.0.29.87,0,10.0.0.29,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0286 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app285,iface0,10.0.29.87,0,10.0.0.29,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app285", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.29.87", 0, "10.0.0.29", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app285");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app285|iface0:10.0.29.87/0:10.0.0.29:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app285|iface0:10.0.29.87/0:10.0.0.29:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0286 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0287
     * @tc.name      VPN_ConfigBoundary_0287
     * @tc.desc      vpn config boundary ,32,1500,,app286,iface1,10.0.30.90,32,10.0.0.30,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0287 begin`);
      logInfo("config boundary ,32,1500,,app286,iface1,10.0.30.90,32,10.0.0.30,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app286", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.30.90", 32, "10.0.0.30", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app286");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app286|iface1:10.0.30.90/32:10.0.0.30:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app286|iface1:10.0.30.90/32:10.0.0.30:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0287 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0288
     * @tc.name      VPN_ConfigBoundary_0288
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app287,iface2,10.0.31.93,33,10.0.0.31,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0288 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app287,iface2,10.0.31.93,33,10.0.0.31,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app287", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.31.93", 33, "10.0.0.31", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app287");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app287|iface2:10.0.31.93/33:10.0.0.31:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app287|iface2:10.0.31.93/33:10.0.0.31:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0288 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0289
     * @tc.name      VPN_ConfigBoundary_0289
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app288,iface0,10.0.32.96,24,10.0.0.32,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0289 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app288,iface0,10.0.32.96,24,10.0.0.32,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app288", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.32.96", 24, "10.0.0.32", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app288");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app288|iface0:10.0.32.96/24:10.0.0.32:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app288|iface0:10.0.32.96/24:10.0.0.32:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0289 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0290
     * @tc.name      VPN_ConfigBoundary_0290
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app289,iface1,10.0.33.99,0,10.0.0.33,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0290 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app289,iface1,10.0.33.99,0,10.0.0.33,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app289", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.33.99", 0, "10.0.0.33", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app289");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app289|iface1:10.0.33.99/0:10.0.0.33:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app289|iface1:10.0.33.99/0:10.0.0.33:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0290 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0291
     * @tc.name      VPN_ConfigBoundary_0291
     * @tc.desc      vpn config boundary ,32,1500,,app290,iface2,10.0.34.102,32,10.0.0.34,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0291 begin`);
      logInfo("config boundary ,32,1500,,app290,iface2,10.0.34.102,32,10.0.0.34,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app290", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.34.102", 32, "10.0.0.34", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app290");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app290|iface2:10.0.34.102/32:10.0.0.34:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app290|iface2:10.0.34.102/32:10.0.0.34:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0291 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0292
     * @tc.name      VPN_ConfigBoundary_0292
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app291,iface0,10.0.35.105,33,10.0.0.35,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0292 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app291,iface0,10.0.35.105,33,10.0.0.35,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app291", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.35.105", 33, "10.0.0.35", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app291");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app291|iface0:10.0.35.105/33:10.0.0.35:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app291|iface0:10.0.35.105/33:10.0.0.35:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0292 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0293
     * @tc.name      VPN_ConfigBoundary_0293
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app292,iface1,10.0.36.108,24,10.0.0.36,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0293 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app292,iface1,10.0.36.108,24,10.0.0.36,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app292", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.36.108", 24, "10.0.0.36", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app292");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app292|iface1:10.0.36.108/24:10.0.0.36:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app292|iface1:10.0.36.108/24:10.0.0.36:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0293 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0294
     * @tc.name      VPN_ConfigBoundary_0294
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app293,iface2,10.0.37.111,0,10.0.0.37,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0294 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app293,iface2,10.0.37.111,0,10.0.0.37,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app293", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.37.111", 0, "10.0.0.37", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app293");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app293|iface2:10.0.37.111/0:10.0.0.37:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app293|iface2:10.0.37.111/0:10.0.0.37:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0294 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0295
     * @tc.name      VPN_ConfigBoundary_0295
     * @tc.desc      vpn config boundary ,32,1500,,app294,iface0,10.0.38.114,32,10.0.0.38,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0295 begin`);
      logInfo("config boundary ,32,1500,,app294,iface0,10.0.38.114,32,10.0.0.38,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app294", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.38.114", 32, "10.0.0.38", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app294");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app294|iface0:10.0.38.114/32:10.0.0.38:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app294|iface0:10.0.38.114/32:10.0.0.38:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0295 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0296
     * @tc.name      VPN_ConfigBoundary_0296
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app295,iface1,10.0.39.117,33,10.0.0.39,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0296 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app295,iface1,10.0.39.117,33,10.0.0.39,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app295", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.39.117", 33, "10.0.0.39", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app295");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app295|iface1:10.0.39.117/33:10.0.0.39:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app295|iface1:10.0.39.117/33:10.0.0.39:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0296 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0297
     * @tc.name      VPN_ConfigBoundary_0297
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app296,iface2,10.0.40.120,24,10.0.0.40,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0297 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app296,iface2,10.0.40.120,24,10.0.0.40,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app296", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.40.120", 24, "10.0.0.40", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app296");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app296|iface2:10.0.40.120/24:10.0.0.40:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app296|iface2:10.0.40.120/24:10.0.0.40:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0297 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0298
     * @tc.name      VPN_ConfigBoundary_0298
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app297,iface0,10.0.41.123,0,10.0.0.41,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0298 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app297,iface0,10.0.41.123,0,10.0.0.41,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app297", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.41.123", 0, "10.0.0.41", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app297");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app297|iface0:10.0.41.123/0:10.0.0.41:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app297|iface0:10.0.41.123/0:10.0.0.41:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0298 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0299
     * @tc.name      VPN_ConfigBoundary_0299
     * @tc.desc      vpn config boundary ,32,1500,,app298,iface1,10.0.42.126,32,10.0.0.42,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0299 begin`);
      logInfo("config boundary ,32,1500,,app298,iface1,10.0.42.126,32,10.0.0.42,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app298", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.42.126", 32, "10.0.0.42", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app298");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app298|iface1:10.0.42.126/32:10.0.0.42:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app298|iface1:10.0.42.126/32:10.0.0.42:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0299 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0300
     * @tc.name      VPN_ConfigBoundary_0300
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app299,iface2,10.0.43.129,33,10.0.0.43,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0300 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app299,iface2,10.0.43.129,33,10.0.0.43,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app299", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.43.129", 33, "10.0.0.43", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app299");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app299|iface2:10.0.43.129/33:10.0.0.43:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app299|iface2:10.0.43.129/33:10.0.0.43:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0300 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0301
     * @tc.name      VPN_ConfigBoundary_0301
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app300,iface0,10.0.44.132,24,10.0.0.44,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0301 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app300,iface0,10.0.44.132,24,10.0.0.44,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app300", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.44.132", 24, "10.0.0.44", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app300");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app300|iface0:10.0.44.132/24:10.0.0.44:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app300|iface0:10.0.44.132/24:10.0.0.44:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0301 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0302
     * @tc.name      VPN_ConfigBoundary_0302
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app301,iface1,10.0.45.135,0,10.0.0.45,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0302 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app301,iface1,10.0.45.135,0,10.0.0.45,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app301", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.45.135", 0, "10.0.0.45", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app301");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app301|iface1:10.0.45.135/0:10.0.0.45:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app301|iface1:10.0.45.135/0:10.0.0.45:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0302 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0303
     * @tc.name      VPN_ConfigBoundary_0303
     * @tc.desc      vpn config boundary ,32,1500,,app302,iface2,10.0.46.138,32,10.0.0.46,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0303 begin`);
      logInfo("config boundary ,32,1500,,app302,iface2,10.0.46.138,32,10.0.0.46,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app302", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.46.138", 32, "10.0.0.46", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app302");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app302|iface2:10.0.46.138/32:10.0.0.46:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app302|iface2:10.0.46.138/32:10.0.0.46:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0303 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0304
     * @tc.name      VPN_ConfigBoundary_0304
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app303,iface0,10.0.47.141,33,10.0.0.47,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0304 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app303,iface0,10.0.47.141,33,10.0.0.47,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app303", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.47.141", 33, "10.0.0.47", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app303");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app303|iface0:10.0.47.141/33:10.0.0.47:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app303|iface0:10.0.47.141/33:10.0.0.47:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0304 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0305
     * @tc.name      VPN_ConfigBoundary_0305
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app304,iface1,10.0.48.144,24,10.0.0.48,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0305 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app304,iface1,10.0.48.144,24,10.0.0.48,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app304", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.48.144", 24, "10.0.0.48", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app304");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app304|iface1:10.0.48.144/24:10.0.0.48:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app304|iface1:10.0.48.144/24:10.0.0.48:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0305 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0306
     * @tc.name      VPN_ConfigBoundary_0306
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app305,iface2,10.0.49.147,0,10.0.0.49,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0306 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app305,iface2,10.0.49.147,0,10.0.0.49,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app305", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.49.147", 0, "10.0.0.49", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app305");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app305|iface2:10.0.49.147/0:10.0.0.49:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app305|iface2:10.0.49.147/0:10.0.0.49:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0306 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0307
     * @tc.name      VPN_ConfigBoundary_0307
     * @tc.desc      vpn config boundary ,32,1500,,app306,iface0,10.0.50.150,32,10.0.0.50,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0307 begin`);
      logInfo("config boundary ,32,1500,,app306,iface0,10.0.50.150,32,10.0.0.50,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app306", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.50.150", 32, "10.0.0.50", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app306");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app306|iface0:10.0.50.150/32:10.0.0.50:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app306|iface0:10.0.50.150/32:10.0.0.50:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0307 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0308
     * @tc.name      VPN_ConfigBoundary_0308
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app307,iface1,10.0.51.153,33,10.0.0.51,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0308 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app307,iface1,10.0.51.153,33,10.0.0.51,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app307", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.51.153", 33, "10.0.0.51", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app307");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app307|iface1:10.0.51.153/33:10.0.0.51:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app307|iface1:10.0.51.153/33:10.0.0.51:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0308 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0309
     * @tc.name      VPN_ConfigBoundary_0309
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app308,iface2,10.0.52.156,24,10.0.0.52,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0309 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app308,iface2,10.0.52.156,24,10.0.0.52,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app308", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.52.156", 24, "10.0.0.52", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app308");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app308|iface2:10.0.52.156/24:10.0.0.52:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app308|iface2:10.0.52.156/24:10.0.0.52:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0309 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0310
     * @tc.name      VPN_ConfigBoundary_0310
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app309,iface0,10.0.53.159,0,10.0.0.53,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0310 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app309,iface0,10.0.53.159,0,10.0.0.53,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app309", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.53.159", 0, "10.0.0.53", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app309");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app309|iface0:10.0.53.159/0:10.0.0.53:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app309|iface0:10.0.53.159/0:10.0.0.53:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0310 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0311
     * @tc.name      VPN_ConfigBoundary_0311
     * @tc.desc      vpn config boundary ,32,1500,,app310,iface1,10.0.54.162,32,10.0.0.54,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0311 begin`);
      logInfo("config boundary ,32,1500,,app310,iface1,10.0.54.162,32,10.0.0.54,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app310", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.54.162", 32, "10.0.0.54", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app310");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app310|iface1:10.0.54.162/32:10.0.0.54:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app310|iface1:10.0.54.162/32:10.0.0.54:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0311 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0312
     * @tc.name      VPN_ConfigBoundary_0312
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app311,iface2,10.0.55.165,33,10.0.0.55,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0312 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app311,iface2,10.0.55.165,33,10.0.0.55,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app311", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.55.165", 33, "10.0.0.55", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app311");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app311|iface2:10.0.55.165/33:10.0.0.55:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app311|iface2:10.0.55.165/33:10.0.0.55:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0312 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0313
     * @tc.name      VPN_ConfigBoundary_0313
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app312,iface0,10.0.56.168,24,10.0.0.56,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0313 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app312,iface0,10.0.56.168,24,10.0.0.56,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app312", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.56.168", 24, "10.0.0.56", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app312");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app312|iface0:10.0.56.168/24:10.0.0.56:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app312|iface0:10.0.56.168/24:10.0.0.56:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0313 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0314
     * @tc.name      VPN_ConfigBoundary_0314
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app313,iface1,10.0.57.171,0,10.0.0.57,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0314 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app313,iface1,10.0.57.171,0,10.0.0.57,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app313", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.57.171", 0, "10.0.0.57", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app313");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app313|iface1:10.0.57.171/0:10.0.0.57:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app313|iface1:10.0.57.171/0:10.0.0.57:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0314 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0315
     * @tc.name      VPN_ConfigBoundary_0315
     * @tc.desc      vpn config boundary ,32,1500,,app314,iface2,10.0.58.174,32,10.0.0.58,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0315 begin`);
      logInfo("config boundary ,32,1500,,app314,iface2,10.0.58.174,32,10.0.0.58,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app314", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.58.174", 32, "10.0.0.58", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app314");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app314|iface2:10.0.58.174/32:10.0.0.58:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app314|iface2:10.0.58.174/32:10.0.0.58:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0315 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0316
     * @tc.name      VPN_ConfigBoundary_0316
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app315,iface0,10.0.59.177,33,10.0.0.59,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0316 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app315,iface0,10.0.59.177,33,10.0.0.59,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app315", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.59.177", 33, "10.0.0.59", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app315");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app315|iface0:10.0.59.177/33:10.0.0.59:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app315|iface0:10.0.59.177/33:10.0.0.59:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0316 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0317
     * @tc.name      VPN_ConfigBoundary_0317
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app316,iface1,10.0.60.180,24,10.0.0.60,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0317 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app316,iface1,10.0.60.180,24,10.0.0.60,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app316", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.60.180", 24, "10.0.0.60", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app316");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app316|iface1:10.0.60.180/24:10.0.0.60:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app316|iface1:10.0.60.180/24:10.0.0.60:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0317 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0318
     * @tc.name      VPN_ConfigBoundary_0318
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app317,iface2,10.0.61.183,0,10.0.0.61,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0318 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app317,iface2,10.0.61.183,0,10.0.0.61,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app317", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.61.183", 0, "10.0.0.61", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app317");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app317|iface2:10.0.61.183/0:10.0.0.61:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app317|iface2:10.0.61.183/0:10.0.0.61:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0318 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0319
     * @tc.name      VPN_ConfigBoundary_0319
     * @tc.desc      vpn config boundary ,32,1500,,app318,iface0,10.0.62.186,32,10.0.0.62,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0319 begin`);
      logInfo("config boundary ,32,1500,,app318,iface0,10.0.62.186,32,10.0.0.62,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app318", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.62.186", 32, "10.0.0.62", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app318");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app318|iface0:10.0.62.186/32:10.0.0.62:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app318|iface0:10.0.62.186/32:10.0.0.62:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0319 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0320
     * @tc.name      VPN_ConfigBoundary_0320
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app319,iface1,10.0.63.189,33,10.0.0.63,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0320 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app319,iface1,10.0.63.189,33,10.0.0.63,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app319", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.63.189", 33, "10.0.0.63", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app319");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app319|iface1:10.0.63.189/33:10.0.0.63:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app319|iface1:10.0.63.189/33:10.0.0.63:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0320 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0321
     * @tc.name      VPN_ConfigBoundary_0321
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app320,iface2,10.0.64.192,24,10.0.0.64,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0321 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app320,iface2,10.0.64.192,24,10.0.0.64,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app320", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.64.192", 24, "10.0.0.64", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app320");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app320|iface2:10.0.64.192/24:10.0.0.64:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app320|iface2:10.0.64.192/24:10.0.0.64:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0321 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0322
     * @tc.name      VPN_ConfigBoundary_0322
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app321,iface0,10.0.65.195,0,10.0.0.65,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0322 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app321,iface0,10.0.65.195,0,10.0.0.65,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app321", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.65.195", 0, "10.0.0.65", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app321");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app321|iface0:10.0.65.195/0:10.0.0.65:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app321|iface0:10.0.65.195/0:10.0.0.65:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0322 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0323
     * @tc.name      VPN_ConfigBoundary_0323
     * @tc.desc      vpn config boundary ,32,1500,,app322,iface1,10.0.66.198,32,10.0.0.66,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0323 begin`);
      logInfo("config boundary ,32,1500,,app322,iface1,10.0.66.198,32,10.0.0.66,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app322", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.66.198", 32, "10.0.0.66", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app322");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app322|iface1:10.0.66.198/32:10.0.0.66:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app322|iface1:10.0.66.198/32:10.0.0.66:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0323 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0324
     * @tc.name      VPN_ConfigBoundary_0324
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app323,iface2,10.0.67.201,33,10.0.0.67,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0324 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app323,iface2,10.0.67.201,33,10.0.0.67,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app323", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.67.201", 33, "10.0.0.67", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app323");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app323|iface2:10.0.67.201/33:10.0.0.67:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app323|iface2:10.0.67.201/33:10.0.0.67:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0324 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0325
     * @tc.name      VPN_ConfigBoundary_0325
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app324,iface0,10.0.68.204,24,10.0.0.68,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0325 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app324,iface0,10.0.68.204,24,10.0.0.68,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app324", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.68.204", 24, "10.0.0.68", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app324");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app324|iface0:10.0.68.204/24:10.0.0.68:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app324|iface0:10.0.68.204/24:10.0.0.68:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0325 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0326
     * @tc.name      VPN_ConfigBoundary_0326
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app325,iface1,10.0.69.207,0,10.0.0.69,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0326 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app325,iface1,10.0.69.207,0,10.0.0.69,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app325", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.69.207", 0, "10.0.0.69", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app325");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app325|iface1:10.0.69.207/0:10.0.0.69:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app325|iface1:10.0.69.207/0:10.0.0.69:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0326 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0327
     * @tc.name      VPN_ConfigBoundary_0327
     * @tc.desc      vpn config boundary ,32,1500,,app326,iface2,10.0.70.210,32,10.0.0.70,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0327 begin`);
      logInfo("config boundary ,32,1500,,app326,iface2,10.0.70.210,32,10.0.0.70,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app326", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.70.210", 32, "10.0.0.70", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app326");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app326|iface2:10.0.70.210/32:10.0.0.70:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app326|iface2:10.0.70.210/32:10.0.0.70:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0327 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0328
     * @tc.name      VPN_ConfigBoundary_0328
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app327,iface0,10.0.71.213,33,10.0.0.71,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0328 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app327,iface0,10.0.71.213,33,10.0.0.71,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app327", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.71.213", 33, "10.0.0.71", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app327");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app327|iface0:10.0.71.213/33:10.0.0.71:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app327|iface0:10.0.71.213/33:10.0.0.71:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0328 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0329
     * @tc.name      VPN_ConfigBoundary_0329
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app328,iface1,10.0.72.216,24,10.0.0.72,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0329 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app328,iface1,10.0.72.216,24,10.0.0.72,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app328", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.72.216", 24, "10.0.0.72", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app328");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app328|iface1:10.0.72.216/24:10.0.0.72:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app328|iface1:10.0.72.216/24:10.0.0.72:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0329 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0330
     * @tc.name      VPN_ConfigBoundary_0330
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app329,iface2,10.0.73.219,0,10.0.0.73,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0330 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app329,iface2,10.0.73.219,0,10.0.0.73,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app329", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.73.219", 0, "10.0.0.73", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app329");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app329|iface2:10.0.73.219/0:10.0.0.73:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app329|iface2:10.0.73.219/0:10.0.0.73:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0330 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0331
     * @tc.name      VPN_ConfigBoundary_0331
     * @tc.desc      vpn config boundary ,32,1500,,app330,iface0,10.0.74.222,32,10.0.0.74,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0331 begin`);
      logInfo("config boundary ,32,1500,,app330,iface0,10.0.74.222,32,10.0.0.74,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app330", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.74.222", 32, "10.0.0.74", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app330");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app330|iface0:10.0.74.222/32:10.0.0.74:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app330|iface0:10.0.74.222/32:10.0.0.74:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0331 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0332
     * @tc.name      VPN_ConfigBoundary_0332
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app331,iface1,10.0.75.225,33,10.0.0.75,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0332 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app331,iface1,10.0.75.225,33,10.0.0.75,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app331", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.75.225", 33, "10.0.0.75", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app331");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app331|iface1:10.0.75.225/33:10.0.0.75:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app331|iface1:10.0.75.225/33:10.0.0.75:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0332 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0333
     * @tc.name      VPN_ConfigBoundary_0333
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app332,iface2,10.0.76.228,24,10.0.0.76,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0333 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app332,iface2,10.0.76.228,24,10.0.0.76,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app332", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.76.228", 24, "10.0.0.76", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app332");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app332|iface2:10.0.76.228/24:10.0.0.76:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app332|iface2:10.0.76.228/24:10.0.0.76:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0333 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0334
     * @tc.name      VPN_ConfigBoundary_0334
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app333,iface0,10.0.77.231,0,10.0.0.77,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0334 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app333,iface0,10.0.77.231,0,10.0.0.77,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app333", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.77.231", 0, "10.0.0.77", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app333");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app333|iface0:10.0.77.231/0:10.0.0.77:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app333|iface0:10.0.77.231/0:10.0.0.77:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0334 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0335
     * @tc.name      VPN_ConfigBoundary_0335
     * @tc.desc      vpn config boundary ,32,1500,,app334,iface1,10.0.78.234,32,10.0.0.78,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0335 begin`);
      logInfo("config boundary ,32,1500,,app334,iface1,10.0.78.234,32,10.0.0.78,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app334", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.78.234", 32, "10.0.0.78", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app334");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app334|iface1:10.0.78.234/32:10.0.0.78:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app334|iface1:10.0.78.234/32:10.0.0.78:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0335 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0336
     * @tc.name      VPN_ConfigBoundary_0336
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app335,iface2,10.0.79.237,33,10.0.0.79,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0336 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app335,iface2,10.0.79.237,33,10.0.0.79,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app335", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.79.237", 33, "10.0.0.79", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app335");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app335|iface2:10.0.79.237/33:10.0.0.79:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app335|iface2:10.0.79.237/33:10.0.0.79:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0336 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0337
     * @tc.name      VPN_ConfigBoundary_0337
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app336,iface0,10.0.80.240,24,10.0.0.80,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0337 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app336,iface0,10.0.80.240,24,10.0.0.80,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app336", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.80.240", 24, "10.0.0.80", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app336");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app336|iface0:10.0.80.240/24:10.0.0.80:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app336|iface0:10.0.80.240/24:10.0.0.80:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0337 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0338
     * @tc.name      VPN_ConfigBoundary_0338
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app337,iface1,10.0.81.243,0,10.0.0.81,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0338 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app337,iface1,10.0.81.243,0,10.0.0.81,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app337", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.81.243", 0, "10.0.0.81", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app337");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app337|iface1:10.0.81.243/0:10.0.0.81:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app337|iface1:10.0.81.243/0:10.0.0.81:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0338 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0339
     * @tc.name      VPN_ConfigBoundary_0339
     * @tc.desc      vpn config boundary ,32,1500,,app338,iface2,10.0.82.246,32,10.0.0.82,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0339 begin`);
      logInfo("config boundary ,32,1500,,app338,iface2,10.0.82.246,32,10.0.0.82,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app338", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.82.246", 32, "10.0.0.82", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app338");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app338|iface2:10.0.82.246/32:10.0.0.82:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app338|iface2:10.0.82.246/32:10.0.0.82:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0339 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0340
     * @tc.name      VPN_ConfigBoundary_0340
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app339,iface0,10.0.83.249,33,10.0.0.83,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0340 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app339,iface0,10.0.83.249,33,10.0.0.83,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app339", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.83.249", 33, "10.0.0.83", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app339");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app339|iface0:10.0.83.249/33:10.0.0.83:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app339|iface0:10.0.83.249/33:10.0.0.83:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0340 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0341
     * @tc.name      VPN_ConfigBoundary_0341
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app340,iface1,10.0.84.252,24,10.0.0.84,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0341 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app340,iface1,10.0.84.252,24,10.0.0.84,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app340", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.84.252", 24, "10.0.0.84", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app340");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app340|iface1:10.0.84.252/24:10.0.0.84:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app340|iface1:10.0.84.252/24:10.0.0.84:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0341 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0342
     * @tc.name      VPN_ConfigBoundary_0342
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app341,iface2,10.0.85.255,0,10.0.0.85,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0342 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app341,iface2,10.0.85.255,0,10.0.0.85,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app341", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.85.255", 0, "10.0.0.85", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app341");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app341|iface2:10.0.85.255/0:10.0.0.85:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app341|iface2:10.0.85.255/0:10.0.0.85:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0342 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0343
     * @tc.name      VPN_ConfigBoundary_0343
     * @tc.desc      vpn config boundary ,32,1500,,app342,iface0,10.0.86.2,32,10.0.0.86,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0343 begin`);
      logInfo("config boundary ,32,1500,,app342,iface0,10.0.86.2,32,10.0.0.86,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app342", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.86.2", 32, "10.0.0.86", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app342");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app342|iface0:10.0.86.2/32:10.0.0.86:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app342|iface0:10.0.86.2/32:10.0.0.86:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0343 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0344
     * @tc.name      VPN_ConfigBoundary_0344
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app343,iface1,10.0.87.5,33,10.0.0.87,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0344 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app343,iface1,10.0.87.5,33,10.0.0.87,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app343", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.87.5", 33, "10.0.0.87", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app343");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app343|iface1:10.0.87.5/33:10.0.0.87:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app343|iface1:10.0.87.5/33:10.0.0.87:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0344 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0345
     * @tc.name      VPN_ConfigBoundary_0345
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app344,iface2,10.0.88.8,24,10.0.0.88,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0345 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app344,iface2,10.0.88.8,24,10.0.0.88,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app344", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.88.8", 24, "10.0.0.88", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app344");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app344|iface2:10.0.88.8/24:10.0.0.88:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app344|iface2:10.0.88.8/24:10.0.0.88:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0345 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0346
     * @tc.name      VPN_ConfigBoundary_0346
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app345,iface0,10.0.89.11,0,10.0.0.89,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0346 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app345,iface0,10.0.89.11,0,10.0.0.89,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app345", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.89.11", 0, "10.0.0.89", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app345");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app345|iface0:10.0.89.11/0:10.0.0.89:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app345|iface0:10.0.89.11/0:10.0.0.89:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0346 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0347
     * @tc.name      VPN_ConfigBoundary_0347
     * @tc.desc      vpn config boundary ,32,1500,,app346,iface1,10.0.90.14,32,10.0.0.90,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0347 begin`);
      logInfo("config boundary ,32,1500,,app346,iface1,10.0.90.14,32,10.0.0.90,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app346", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.90.14", 32, "10.0.0.90", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app346");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app346|iface1:10.0.90.14/32:10.0.0.90:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app346|iface1:10.0.90.14/32:10.0.0.90:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0347 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0348
     * @tc.name      VPN_ConfigBoundary_0348
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app347,iface2,10.0.91.17,33,10.0.0.91,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0348 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app347,iface2,10.0.91.17,33,10.0.0.91,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app347", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.91.17", 33, "10.0.0.91", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app347");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app347|iface2:10.0.91.17/33:10.0.0.91:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app347|iface2:10.0.91.17/33:10.0.0.91:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0348 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0349
     * @tc.name      VPN_ConfigBoundary_0349
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app348,iface0,10.0.92.20,24,10.0.0.92,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0349 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app348,iface0,10.0.92.20,24,10.0.0.92,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app348", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.92.20", 24, "10.0.0.92", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app348");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app348|iface0:10.0.92.20/24:10.0.0.92:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app348|iface0:10.0.92.20/24:10.0.0.92:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0349 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0350
     * @tc.name      VPN_ConfigBoundary_0350
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app349,iface1,10.0.93.23,0,10.0.0.93,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0350 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app349,iface1,10.0.93.23,0,10.0.0.93,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app349", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.93.23", 0, "10.0.0.93", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app349");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app349|iface1:10.0.93.23/0:10.0.0.93:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app349|iface1:10.0.93.23/0:10.0.0.93:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0350 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0351
     * @tc.name      VPN_ConfigBoundary_0351
     * @tc.desc      vpn config boundary ,32,1500,,app350,iface2,10.0.94.26,32,10.0.0.94,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0351 begin`);
      logInfo("config boundary ,32,1500,,app350,iface2,10.0.94.26,32,10.0.0.94,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app350", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.94.26", 32, "10.0.0.94", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app350");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app350|iface2:10.0.94.26/32:10.0.0.94:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app350|iface2:10.0.94.26/32:10.0.0.94:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0351 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0352
     * @tc.name      VPN_ConfigBoundary_0352
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app351,iface0,10.0.95.29,33,10.0.0.95,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0352 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app351,iface0,10.0.95.29,33,10.0.0.95,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app351", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.95.29", 33, "10.0.0.95", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app351");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app351|iface0:10.0.95.29/33:10.0.0.95:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app351|iface0:10.0.95.29/33:10.0.0.95:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0352 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0353
     * @tc.name      VPN_ConfigBoundary_0353
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app352,iface1,10.0.96.32,24,10.0.0.96,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0353 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app352,iface1,10.0.96.32,24,10.0.0.96,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app352", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.96.32", 24, "10.0.0.96", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app352");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app352|iface1:10.0.96.32/24:10.0.0.96:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app352|iface1:10.0.96.32/24:10.0.0.96:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0353 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0354
     * @tc.name      VPN_ConfigBoundary_0354
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app353,iface2,10.0.97.35,0,10.0.0.97,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0354 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app353,iface2,10.0.97.35,0,10.0.0.97,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app353", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.97.35", 0, "10.0.0.97", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app353");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app353|iface2:10.0.97.35/0:10.0.0.97:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app353|iface2:10.0.97.35/0:10.0.0.97:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0354 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0355
     * @tc.name      VPN_ConfigBoundary_0355
     * @tc.desc      vpn config boundary ,32,1500,,app354,iface0,10.0.98.38,32,10.0.0.98,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0355 begin`);
      logInfo("config boundary ,32,1500,,app354,iface0,10.0.98.38,32,10.0.0.98,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app354", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.98.38", 32, "10.0.0.98", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app354");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app354|iface0:10.0.98.38/32:10.0.0.98:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app354|iface0:10.0.98.38/32:10.0.0.98:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0355 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0356
     * @tc.name      VPN_ConfigBoundary_0356
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app355,iface1,10.0.99.41,33,10.0.0.99,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0356 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app355,iface1,10.0.99.41,33,10.0.0.99,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app355", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.99.41", 33, "10.0.0.99", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app355");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app355|iface1:10.0.99.41/33:10.0.0.99:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app355|iface1:10.0.99.41/33:10.0.0.99:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0356 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0357
     * @tc.name      VPN_ConfigBoundary_0357
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app356,iface2,10.0.100.44,24,10.0.0.100,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0357 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app356,iface2,10.0.100.44,24,10.0.0.100,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app356", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.100.44", 24, "10.0.0.100", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app356");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app356|iface2:10.0.100.44/24:10.0.0.100:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app356|iface2:10.0.100.44/24:10.0.0.100:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0357 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0358
     * @tc.name      VPN_ConfigBoundary_0358
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app357,iface0,10.0.101.47,0,10.0.0.101,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0358 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app357,iface0,10.0.101.47,0,10.0.0.101,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app357", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.101.47", 0, "10.0.0.101", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app357");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app357|iface0:10.0.101.47/0:10.0.0.101:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app357|iface0:10.0.101.47/0:10.0.0.101:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0358 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0359
     * @tc.name      VPN_ConfigBoundary_0359
     * @tc.desc      vpn config boundary ,32,1500,,app358,iface1,10.0.102.50,32,10.0.0.102,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0359 begin`);
      logInfo("config boundary ,32,1500,,app358,iface1,10.0.102.50,32,10.0.0.102,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app358", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.102.50", 32, "10.0.0.102", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app358");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app358|iface1:10.0.102.50/32:10.0.0.102:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app358|iface1:10.0.102.50/32:10.0.0.102:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0359 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0360
     * @tc.name      VPN_ConfigBoundary_0360
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app359,iface2,10.0.103.53,33,10.0.0.103,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0360 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app359,iface2,10.0.103.53,33,10.0.0.103,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app359", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.103.53", 33, "10.0.0.103", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app359");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app359|iface2:10.0.103.53/33:10.0.0.103:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app359|iface2:10.0.103.53/33:10.0.0.103:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0360 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0361
     * @tc.name      VPN_ConfigBoundary_0361
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app360,iface0,10.0.104.56,24,10.0.0.104,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0361 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app360,iface0,10.0.104.56,24,10.0.0.104,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app360", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.104.56", 24, "10.0.0.104", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app360");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app360|iface0:10.0.104.56/24:10.0.0.104:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app360|iface0:10.0.104.56/24:10.0.0.104:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0361 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0362
     * @tc.name      VPN_ConfigBoundary_0362
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app361,iface1,10.0.105.59,0,10.0.0.105,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0362 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app361,iface1,10.0.105.59,0,10.0.0.105,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app361", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.105.59", 0, "10.0.0.105", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app361");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app361|iface1:10.0.105.59/0:10.0.0.105:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app361|iface1:10.0.105.59/0:10.0.0.105:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0362 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0363
     * @tc.name      VPN_ConfigBoundary_0363
     * @tc.desc      vpn config boundary ,32,1500,,app362,iface2,10.0.106.62,32,10.0.0.106,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0363 begin`);
      logInfo("config boundary ,32,1500,,app362,iface2,10.0.106.62,32,10.0.0.106,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app362", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.106.62", 32, "10.0.0.106", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app362");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app362|iface2:10.0.106.62/32:10.0.0.106:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app362|iface2:10.0.106.62/32:10.0.0.106:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0363 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0364
     * @tc.name      VPN_ConfigBoundary_0364
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app363,iface0,10.0.107.65,33,10.0.0.107,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0364 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app363,iface0,10.0.107.65,33,10.0.0.107,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app363", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.107.65", 33, "10.0.0.107", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app363");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app363|iface0:10.0.107.65/33:10.0.0.107:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app363|iface0:10.0.107.65/33:10.0.0.107:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0364 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0365
     * @tc.name      VPN_ConfigBoundary_0365
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app364,iface1,10.0.108.68,24,10.0.0.108,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0365 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app364,iface1,10.0.108.68,24,10.0.0.108,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app364", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.108.68", 24, "10.0.0.108", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app364");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app364|iface1:10.0.108.68/24:10.0.0.108:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app364|iface1:10.0.108.68/24:10.0.0.108:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0365 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0366
     * @tc.name      VPN_ConfigBoundary_0366
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app365,iface2,10.0.109.71,0,10.0.0.109,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0366 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app365,iface2,10.0.109.71,0,10.0.0.109,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app365", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.109.71", 0, "10.0.0.109", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app365");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app365|iface2:10.0.109.71/0:10.0.0.109:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app365|iface2:10.0.109.71/0:10.0.0.109:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0366 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0367
     * @tc.name      VPN_ConfigBoundary_0367
     * @tc.desc      vpn config boundary ,32,1500,,app366,iface0,10.0.110.74,32,10.0.0.110,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0367 begin`);
      logInfo("config boundary ,32,1500,,app366,iface0,10.0.110.74,32,10.0.0.110,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app366", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.110.74", 32, "10.0.0.110", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app366");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app366|iface0:10.0.110.74/32:10.0.0.110:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app366|iface0:10.0.110.74/32:10.0.0.110:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0367 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0368
     * @tc.name      VPN_ConfigBoundary_0368
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app367,iface1,10.0.111.77,33,10.0.0.111,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0368 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app367,iface1,10.0.111.77,33,10.0.0.111,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app367", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.111.77", 33, "10.0.0.111", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app367");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app367|iface1:10.0.111.77/33:10.0.0.111:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app367|iface1:10.0.111.77/33:10.0.0.111:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0368 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0369
     * @tc.name      VPN_ConfigBoundary_0369
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app368,iface2,10.0.112.80,24,10.0.0.112,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0369 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app368,iface2,10.0.112.80,24,10.0.0.112,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app368", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.112.80", 24, "10.0.0.112", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app368");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app368|iface2:10.0.112.80/24:10.0.0.112:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app368|iface2:10.0.112.80/24:10.0.0.112:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0369 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0370
     * @tc.name      VPN_ConfigBoundary_0370
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app369,iface0,10.0.113.83,0,10.0.0.113,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0370 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app369,iface0,10.0.113.83,0,10.0.0.113,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app369", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.113.83", 0, "10.0.0.113", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app369");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app369|iface0:10.0.113.83/0:10.0.0.113:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app369|iface0:10.0.113.83/0:10.0.0.113:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0370 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0371
     * @tc.name      VPN_ConfigBoundary_0371
     * @tc.desc      vpn config boundary ,32,1500,,app370,iface1,10.0.114.86,32,10.0.0.114,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0371 begin`);
      logInfo("config boundary ,32,1500,,app370,iface1,10.0.114.86,32,10.0.0.114,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app370", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.114.86", 32, "10.0.0.114", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app370");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app370|iface1:10.0.114.86/32:10.0.0.114:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app370|iface1:10.0.114.86/32:10.0.0.114:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0371 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0372
     * @tc.name      VPN_ConfigBoundary_0372
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app371,iface2,10.0.115.89,33,10.0.0.115,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0372 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app371,iface2,10.0.115.89,33,10.0.0.115,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app371", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.115.89", 33, "10.0.0.115", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app371");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app371|iface2:10.0.115.89/33:10.0.0.115:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app371|iface2:10.0.115.89/33:10.0.0.115:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0372 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0373
     * @tc.name      VPN_ConfigBoundary_0373
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app372,iface0,10.0.116.92,24,10.0.0.116,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0373 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app372,iface0,10.0.116.92,24,10.0.0.116,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app372", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.116.92", 24, "10.0.0.116", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app372");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app372|iface0:10.0.116.92/24:10.0.0.116:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app372|iface0:10.0.116.92/24:10.0.0.116:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0373 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0374
     * @tc.name      VPN_ConfigBoundary_0374
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app373,iface1,10.0.117.95,0,10.0.0.117,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0374 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app373,iface1,10.0.117.95,0,10.0.0.117,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app373", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.117.95", 0, "10.0.0.117", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app373");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app373|iface1:10.0.117.95/0:10.0.0.117:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app373|iface1:10.0.117.95/0:10.0.0.117:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0374 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0375
     * @tc.name      VPN_ConfigBoundary_0375
     * @tc.desc      vpn config boundary ,32,1500,,app374,iface2,10.0.118.98,32,10.0.0.118,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0375 begin`);
      logInfo("config boundary ,32,1500,,app374,iface2,10.0.118.98,32,10.0.0.118,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app374", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.118.98", 32, "10.0.0.118", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app374");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app374|iface2:10.0.118.98/32:10.0.0.118:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app374|iface2:10.0.118.98/32:10.0.0.118:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0375 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0376
     * @tc.name      VPN_ConfigBoundary_0376
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app375,iface0,10.0.119.101,33,10.0.0.119,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0376 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app375,iface0,10.0.119.101,33,10.0.0.119,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app375", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.119.101", 33, "10.0.0.119", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app375");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app375|iface0:10.0.119.101/33:10.0.0.119:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app375|iface0:10.0.119.101/33:10.0.0.119:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0376 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0377
     * @tc.name      VPN_ConfigBoundary_0377
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app376,iface1,10.0.120.104,24,10.0.0.120,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0377 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app376,iface1,10.0.120.104,24,10.0.0.120,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app376", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.120.104", 24, "10.0.0.120", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app376");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app376|iface1:10.0.120.104/24:10.0.0.120:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app376|iface1:10.0.120.104/24:10.0.0.120:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0377 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0378
     * @tc.name      VPN_ConfigBoundary_0378
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app377,iface2,10.0.121.107,0,10.0.0.121,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0378 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app377,iface2,10.0.121.107,0,10.0.0.121,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app377", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.121.107", 0, "10.0.0.121", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app377");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app377|iface2:10.0.121.107/0:10.0.0.121:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app377|iface2:10.0.121.107/0:10.0.0.121:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0378 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0379
     * @tc.name      VPN_ConfigBoundary_0379
     * @tc.desc      vpn config boundary ,32,1500,,app378,iface0,10.0.122.110,32,10.0.0.122,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0379 begin`);
      logInfo("config boundary ,32,1500,,app378,iface0,10.0.122.110,32,10.0.0.122,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app378", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.122.110", 32, "10.0.0.122", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app378");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app378|iface0:10.0.122.110/32:10.0.0.122:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app378|iface0:10.0.122.110/32:10.0.0.122:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0379 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0380
     * @tc.name      VPN_ConfigBoundary_0380
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app379,iface1,10.0.123.113,33,10.0.0.123,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0380 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app379,iface1,10.0.123.113,33,10.0.0.123,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app379", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.123.113", 33, "10.0.0.123", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app379");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app379|iface1:10.0.123.113/33:10.0.0.123:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app379|iface1:10.0.123.113/33:10.0.0.123:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0380 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0381
     * @tc.name      VPN_ConfigBoundary_0381
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app380,iface2,10.0.124.116,24,10.0.0.124,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0381 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app380,iface2,10.0.124.116,24,10.0.0.124,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app380", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.124.116", 24, "10.0.0.124", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app380");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app380|iface2:10.0.124.116/24:10.0.0.124:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app380|iface2:10.0.124.116/24:10.0.0.124:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0381 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0382
     * @tc.name      VPN_ConfigBoundary_0382
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app381,iface0,10.0.125.119,0,10.0.0.125,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0382 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app381,iface0,10.0.125.119,0,10.0.0.125,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app381", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.125.119", 0, "10.0.0.125", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app381");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app381|iface0:10.0.125.119/0:10.0.0.125:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app381|iface0:10.0.125.119/0:10.0.0.125:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0382 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0383
     * @tc.name      VPN_ConfigBoundary_0383
     * @tc.desc      vpn config boundary ,32,1500,,app382,iface1,10.0.126.122,32,10.0.0.126,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0383 begin`);
      logInfo("config boundary ,32,1500,,app382,iface1,10.0.126.122,32,10.0.0.126,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app382", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.126.122", 32, "10.0.0.126", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app382");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app382|iface1:10.0.126.122/32:10.0.0.126:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app382|iface1:10.0.126.122/32:10.0.0.126:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0383 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0384
     * @tc.name      VPN_ConfigBoundary_0384
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app383,iface2,10.0.127.125,33,10.0.0.127,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0384 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app383,iface2,10.0.127.125,33,10.0.0.127,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app383", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.127.125", 33, "10.0.0.127", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app383");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app383|iface2:10.0.127.125/33:10.0.0.127:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app383|iface2:10.0.127.125/33:10.0.0.127:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0384 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0385
     * @tc.name      VPN_ConfigBoundary_0385
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app384,iface0,10.0.128.128,24,10.0.0.128,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0385 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app384,iface0,10.0.128.128,24,10.0.0.128,true,true");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app384", 0, 68, "114.114.114.114") + '|' + routeSummary("iface0", "10.0.128.128", 24, "10.0.0.128", true, true) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app384");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app384|iface0:10.0.128.128/24:10.0.0.128:true:true|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app384|iface0:10.0.128.128/24:10.0.0.128:true:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0385 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0386
     * @tc.name      VPN_ConfigBoundary_0386
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app385,iface1,10.0.129.131,0,10.0.0.129,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0386 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app385,iface1,10.0.129.131,0,10.0.0.129,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app385", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface1", "10.0.129.131", 0, "10.0.0.129", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app385");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app385|iface1:10.0.129.131/0:10.0.0.129:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app385|iface1:10.0.129.131/0:10.0.0.129:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0386 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0387
     * @tc.name      VPN_ConfigBoundary_0387
     * @tc.desc      vpn config boundary ,32,1500,,app386,iface2,10.0.130.134,32,10.0.0.130,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0387 begin`);
      logInfo("config boundary ,32,1500,,app386,iface2,10.0.130.134,32,10.0.0.130,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app386", 32, 1500, "") + '|' + routeSummary("iface2", "10.0.130.134", 32, "10.0.0.130", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app386");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app386|iface2:10.0.130.134/32:10.0.0.130:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app386|iface2:10.0.130.134/32:10.0.0.130:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0387 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0388
     * @tc.name      VPN_ConfigBoundary_0388
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app387,iface0,10.0.131.137,33,10.0.0.131,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0388 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app387,iface0,10.0.131.137,33,10.0.0.131,false,true");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app387", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface0", "10.0.131.137", 33, "10.0.0.131", false, true) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app387");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app387|iface0:10.0.131.137/33:10.0.0.131:false:true|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app387|iface0:10.0.131.137/33:10.0.0.131:false:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0388 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0389
     * @tc.name      VPN_ConfigBoundary_0389
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app388,iface1,10.0.132.140,24,10.0.0.132,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0389 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app388,iface1,10.0.132.140,24,10.0.0.132,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app388", 0, 68, "114.114.114.114") + '|' + routeSummary("iface1", "10.0.132.140", 24, "10.0.0.132", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app388");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app388|iface1:10.0.132.140/24:10.0.0.132:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app388|iface1:10.0.132.140/24:10.0.0.132:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0389 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0390
     * @tc.name      VPN_ConfigBoundary_0390
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app389,iface2,10.0.133.143,0,10.0.0.133,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0390 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app389,iface2,10.0.133.143,0,10.0.0.133,false,false");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app389", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface2", "10.0.133.143", 0, "10.0.0.133", false, false) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app389");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app389|iface2:10.0.133.143/0:10.0.0.133:false:false|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app389|iface2:10.0.133.143/0:10.0.0.133:false:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0390 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0391
     * @tc.name      VPN_ConfigBoundary_0391
     * @tc.desc      vpn config boundary ,32,1500,,app390,iface0,10.0.134.146,32,10.0.0.134,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0391 begin`);
      logInfo("config boundary ,32,1500,,app390,iface0,10.0.134.146,32,10.0.0.134,true,true");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app390", 32, 1500, "") + '|' + routeSummary("iface0", "10.0.134.146", 32, "10.0.0.134", true, true) + '|' + addressCount("", 32) + '|' + blockedAppCount("app390");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app390|iface0:10.0.134.146/32:10.0.0.134:true:true|0|1");
      expect(actual).assertEqual("false|/32|1500||app390|iface0:10.0.134.146/32:10.0.0.134:true:true|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0391 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0392
     * @tc.name      VPN_ConfigBoundary_0392
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app391,iface1,10.0.135.149,33,10.0.0.135,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ConfigBoundary_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0392 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app391,iface1,10.0.135.149,33,10.0.0.135,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app391", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface1", "10.0.135.149", 33, "10.0.0.135", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app391");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app391|iface1:10.0.135.149/33:10.0.0.135:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app391|iface1:10.0.135.149/33:10.0.0.135:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0392 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0393
     * @tc.name      VPN_ConfigBoundary_0393
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app392,iface2,10.0.136.152,24,10.0.0.136,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0393 begin`);
      logInfo("config boundary 10.0.0.5,0,68,114.114.114.114,app392,iface2,10.0.136.152,24,10.0.0.136,true,false");
      const actual: string = networkValid("10.0.0.5", 0, 68, "114.114.114.114") + '|' + vpnConfigSummary("10.0.0.5", "app392", 0, 68, "114.114.114.114") + '|' + routeSummary("iface2", "10.0.136.152", 24, "10.0.0.136", true, false) + '|' + addressCount("10.0.0.5", 0) + '|' + blockedAppCount("app392");
      logInfo('actual=' + String(actual) + ', expected=' + "true|10.0.0.5/0|68|114.114.114.114|app392|iface2:10.0.136.152/24:10.0.0.136:true:false|1|1");
      expect(actual).assertEqual("true|10.0.0.5/0|68|114.114.114.114|app392|iface2:10.0.136.152/24:10.0.0.136:true:false|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0393 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0394
     * @tc.name      VPN_ConfigBoundary_0394
     * @tc.desc      vpn config boundary 1.2.3.4,24,1400,8.8.8.8,app393,iface0,10.0.137.155,0,10.0.0.137,false,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0394 begin`);
      logInfo("config boundary 1.2.3.4,24,1400,8.8.8.8,app393,iface0,10.0.137.155,0,10.0.0.137,false,true");
      const actual: string = networkValid("1.2.3.4", 24, 1400, "8.8.8.8") + '|' + vpnConfigSummary("1.2.3.4", "app393", 24, 1400, "8.8.8.8") + '|' + routeSummary("iface0", "10.0.137.155", 0, "10.0.0.137", false, true) + '|' + addressCount("1.2.3.4", 24) + '|' + blockedAppCount("app393");
      logInfo('actual=' + String(actual) + ', expected=' + "true|1.2.3.4/24|1400|8.8.8.8|app393|iface0:10.0.137.155/0:10.0.0.137:false:true|1|1");
      expect(actual).assertEqual("true|1.2.3.4/24|1400|8.8.8.8|app393|iface0:10.0.137.155/0:10.0.0.137:false:true|1|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0394 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0395
     * @tc.name      VPN_ConfigBoundary_0395
     * @tc.desc      vpn config boundary ,32,1500,,app394,iface1,10.0.138.158,32,10.0.0.138,true,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0395 begin`);
      logInfo("config boundary ,32,1500,,app394,iface1,10.0.138.158,32,10.0.0.138,true,false");
      const actual: string = networkValid("", 32, 1500, "") + '|' + vpnConfigSummary("", "app394", 32, 1500, "") + '|' + routeSummary("iface1", "10.0.138.158", 32, "10.0.0.138", true, false) + '|' + addressCount("", 32) + '|' + blockedAppCount("app394");
      logInfo('actual=' + String(actual) + ', expected=' + "false|/32|1500||app394|iface1:10.0.138.158/32:10.0.0.138:true:false|0|1");
      expect(actual).assertEqual("false|/32|1500||app394|iface1:10.0.138.158/32:10.0.0.138:true:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0395 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0396
     * @tc.name      VPN_ConfigBoundary_0396
     * @tc.desc      vpn config boundary 256.1.1.1,33,1501,1.1.1.1,app395,iface2,10.0.139.161,33,10.0.0.139,false,false keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ConfigBoundary_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigBoundary_0396 begin`);
      logInfo("config boundary 256.1.1.1,33,1501,1.1.1.1,app395,iface2,10.0.139.161,33,10.0.0.139,false,false");
      const actual: string = networkValid("256.1.1.1", 33, 1501, "1.1.1.1") + '|' + vpnConfigSummary("256.1.1.1", "app395", 33, 1501, "1.1.1.1") + '|' + routeSummary("iface2", "10.0.139.161", 33, "10.0.0.139", false, false) + '|' + addressCount("256.1.1.1", 33) + '|' + blockedAppCount("app395");
      logInfo('actual=' + String(actual) + ', expected=' + "false|256.1.1.1/33|1501|1.1.1.1|app395|iface2:10.0.139.161/33:10.0.0.139:false:false|0|1");
      expect(actual).assertEqual("false|256.1.1.1/33|1501|1.1.1.1|app395|iface2:10.0.139.161/33:10.0.0.139:false:false|0|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConfigBoundary_0396 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONFIG_BOUNDARY_0397
     * @tc.name      VPN_ConfigBoundary_0397
     * @tc.desc      vpn config boundary 10.0.0.5,0,68,114.114.114.114,app396,iface0,10.0.140.164,24,10.0.0.140,true,true keeps config decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ConfigBoundary_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
