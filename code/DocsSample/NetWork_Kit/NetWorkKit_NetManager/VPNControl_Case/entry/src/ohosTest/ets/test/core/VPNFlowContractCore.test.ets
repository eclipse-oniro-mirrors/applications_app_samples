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
  tunnelPortForPage,
  tunnelCreatedForPage,
  tunnelCreatedForExtension,
  protectToast,
  protectFlag,
  startToast,
  createTunnelToast,
  routeUrl,
  routeFlag,
} from '../model/VPNLogic';

/** VPNFlowContractCoreTest logic checks (4 cases). */
export default function vpnFlowContractCoreTest(): void {
  describe('VPNFlowContractCoreTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_CORE_0001
     * @tc.name      VPN_FlowCore_0001
     * @tc.desc      flow contract 0,true keeps page/tunnel/route results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowCore_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowCore_0001 begin`);
      logInfo("flow contract 0,true");
      const actual: string = tunnelPortForPage(0) + ':' + tunnelCreatedForPage(3) + ':' + tunnelCreatedForExtension(3) + ':' + protectToast(true) + ':' + protectFlag(true) + ':' + startToast(true) + ':' + createTunnelToast(true) + ':' + routeUrl(0) + ':' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1194:true:true:vpn Protect Success:Pass:VPN started successfully:CreateTunnel Success:pages/StopVpn:Pass");
      expect(actual).assertEqual("1194:true:true:vpn Protect Success:Pass:VPN started successfully:CreateTunnel Success:pages/StopVpn:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowCore_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_CORE_0002
     * @tc.name      VPN_FlowCore_0002
     * @tc.desc      flow contract 1,false keeps page/tunnel/route results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowCore_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowCore_0002 begin`);
      logInfo("flow contract 1,false");
      const actual: string = tunnelPortForPage(1) + ':' + tunnelCreatedForPage(0) + ':' + tunnelCreatedForExtension(0) + ':' + protectToast(false) + ':' + protectFlag(false) + ':' + startToast(false) + ':' + createTunnelToast(false) + ':' + routeUrl(1) + ':' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "8888:false:true:vpn Protect Failed:Error:VPN start failed:CreateTunnel Fail:pages/StartVpn:Error");
      expect(actual).assertEqual("8888:false:true:vpn Protect Failed:Error:VPN start failed:CreateTunnel Fail:pages/StartVpn:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowCore_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_CORE_0003
     * @tc.name      VPN_FlowCore_0003
     * @tc.desc      flow contract 2,true keeps page/tunnel/route results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowCore_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowCore_0003 begin`);
      logInfo("flow contract 2,true");
      const actual: string = tunnelPortForPage(2) + ':' + tunnelCreatedForPage(3) + ':' + tunnelCreatedForExtension(3) + ':' + protectToast(true) + ':' + protectFlag(true) + ':' + startToast(true) + ':' + createTunnelToast(true) + ':' + routeUrl(2) + ':' + routeFlag(true);
      logInfo('actual=' + String(actual) + ', expected=' + "1194:true:true:vpn Protect Success:Pass:VPN started successfully:CreateTunnel Success:pages/StopVpn:Pass");
      expect(actual).assertEqual("1194:true:true:vpn Protect Success:Pass:VPN started successfully:CreateTunnel Success:pages/StopVpn:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowCore_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_CORE_0004
     * @tc.name      VPN_FlowCore_0004
     * @tc.desc      flow contract 3,false keeps page/tunnel/route results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowCore_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowCore_0004 begin`);
      logInfo("flow contract 3,false");
      const actual: string = tunnelPortForPage(3) + ':' + tunnelCreatedForPage(0) + ':' + tunnelCreatedForExtension(0) + ':' + protectToast(false) + ':' + protectFlag(false) + ':' + startToast(false) + ':' + createTunnelToast(false) + ':' + routeUrl(3) + ':' + routeFlag(false);
      logInfo('actual=' + String(actual) + ', expected=' + "1194:false:true:vpn Protect Failed:Error:VPN start failed:CreateTunnel Fail:pages/StopVpn:Error");
      expect(actual).assertEqual("1194:false:true:vpn Protect Failed:Error:VPN start failed:CreateTunnel Fail:pages/StopVpn:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowCore_0004 end`);
    });
  });
}
