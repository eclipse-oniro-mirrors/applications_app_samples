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
  createTunnelToast,
  startToast,
  startExtToast,
  stopExtToast,
} from '../model/VPNLogic';

/** FlowToastsTest logic checks (2 cases). */
export default function flowToastsTest(): void {
  describe('FlowToastsTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_TOASTS_0001
     * @tc.name      VPN_FlowToasts_0001
     * @tc.desc      flow toast matrix for success true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowToasts_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowToasts_0001 begin`);
      logInfo("createTunnelToast(true) + ':' + startToast(true) + ':' + startExtToast(true) + ':' + stopExtToast(true)");
      const actual: string = createTunnelToast(true) + ':' + startToast(true) + ':' + startExtToast(true) + ':' + stopExtToast(true);
      logInfo('actual=' + String(actual) + ', expected=' + "CreateTunnel Success:VPN started successfully:start vpnExt Success:stop vpnExt Success");
      expect(actual).assertEqual("CreateTunnel Success:VPN started successfully:start vpnExt Success:stop vpnExt Success");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowToasts_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_TOASTS_0002
     * @tc.name      VPN_FlowToasts_0002
     * @tc.desc      flow toast matrix for success false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowToasts_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowToasts_0002 begin`);
      logInfo("createTunnelToast(false) + ':' + startToast(false) + ':' + startExtToast(false) + ':' + stopExtToast(false)");
      const actual: string = createTunnelToast(false) + ':' + startToast(false) + ':' + startExtToast(false) + ':' + stopExtToast(false);
      logInfo('actual=' + String(actual) + ', expected=' + "CreateTunnel Fail:VPN start failed:start vpnExt Fail:stop vpnExt Fail");
      expect(actual).assertEqual("CreateTunnel Fail:VPN start failed:start vpnExt Fail:stop vpnExt Fail");
      logInfo(`${BUNDLE}FlowToasts_0002 end`);
    });
  });
}
