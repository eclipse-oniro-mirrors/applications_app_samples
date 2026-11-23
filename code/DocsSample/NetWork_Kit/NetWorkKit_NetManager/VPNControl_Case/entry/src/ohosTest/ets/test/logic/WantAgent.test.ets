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
  wantAgentRequestCode,
  wantAgentActionType,
  wantAgentBundleName,
  wantAgentAbilityName,
} from '../model/VPNLogic';

/** WantAgentTest logic checks (3 cases). */
export default function wantAgentTest(): void {
  describe('WantAgentTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_WANT_AGENT_0001
     * @tc.name      VPN_WantAgent_0001
     * @tc.desc      want agent contract for kind 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_WantAgent_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WantAgent_0001 begin`);
      logInfo("wantAgentRequestCode() + ':' + wantAgentActionType(0) + ':' + wantAgentBundleName() + ':' + wantAgentAbilityName()");
      const actual: string = wantAgentRequestCode() + ':' + wantAgentActionType(0) + ':' + wantAgentBundleName() + ':' + wantAgentAbilityName();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:com.samples.vpncontrol_case:EntryAbility");
      expect(actual).assertEqual("0:0:com.samples.vpncontrol_case:EntryAbility");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WantAgent_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_WANT_AGENT_0002
     * @tc.name      VPN_WantAgent_0002
     * @tc.desc      want agent contract for kind 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_WantAgent_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WantAgent_0002 begin`);
      logInfo("wantAgentRequestCode() + ':' + wantAgentActionType(1) + ':' + wantAgentBundleName() + ':' + wantAgentAbilityName()");
      const actual: string = wantAgentRequestCode() + ':' + wantAgentActionType(1) + ':' + wantAgentBundleName() + ':' + wantAgentAbilityName();
      logInfo('actual=' + String(actual) + ', expected=' + "0:1:com.samples.vpncontrol_case:EntryAbility");
      expect(actual).assertEqual("0:1:com.samples.vpncontrol_case:EntryAbility");
      logInfo(`${BUNDLE}WantAgent_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_WANT_AGENT_0003
     * @tc.name      VPN_WantAgent_0003
     * @tc.desc      want agent contract for kind 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_WantAgent_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WantAgent_0003 begin`);
      logInfo("wantAgentRequestCode() + ':' + wantAgentActionType(2) + ':' + wantAgentBundleName() + ':' + wantAgentAbilityName()");
      const actual: string = wantAgentRequestCode() + ':' + wantAgentActionType(2) + ':' + wantAgentBundleName() + ':' + wantAgentAbilityName();
      logInfo('actual=' + String(actual) + ', expected=' + "0:1:com.samples.vpncontrol_case:EntryAbility");
      expect(actual).assertEqual("0:1:com.samples.vpncontrol_case:EntryAbility");
      logInfo(`${BUNDLE}WantAgent_0003 end`);
    });
  });
}
