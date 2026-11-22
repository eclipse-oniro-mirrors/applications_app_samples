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
  VpnFlowModel,
} from '../model/VPNLogic';

/** VpnFlowStopTest logic checks (4 cases). */
export default function vpnFlowStopTest(): void {
  describe('VpnFlowStopTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_STOP_0001
     * @tc.name      VPN_FlowStop_0001
     * @tc.desc      stop flow destroy=true, stopFd=true -> destroyed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowStop_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowStop_0001 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("stop(true,true)");
      const actual: string = subject.stop(true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed");
      expect(actual).assertEqual("destroyed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStop_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_STOP_0002
     * @tc.name      VPN_FlowStop_0002
     * @tc.desc      stop flow destroy=false, stopFd=false -> stop-fd-skipped.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStop_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStop_0002 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("stop(false,false)");
      const actual: string = subject.stop(false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped");
      expect(actual).assertEqual("stop-fd-skipped");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStop_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_STOP_0003
     * @tc.name      VPN_FlowStop_0003
     * @tc.desc      stop flow destroy=true, stopFd=false -> stop-fd-skipped.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStop_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStop_0003 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("stop(true,false)");
      const actual: string = subject.stop(true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped");
      expect(actual).assertEqual("stop-fd-skipped");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStop_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_STOP_0004
     * @tc.name      VPN_FlowStop_0004
     * @tc.desc      stop flow destroy=false, stopFd=true -> destroy-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStop_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStop_0004 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("stop(false,true)");
      const actual: string = subject.stop(false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed");
      expect(actual).assertEqual("destroy-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStop_0004 end`);
    });
  });
}
