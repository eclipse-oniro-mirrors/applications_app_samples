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


import { describe, beforeAll, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  AGENT_BUNDLE, AGENT_ABILITY, AGENT_ID, AGENT_ID_MAX_LENGTH, PAYLOAD_MAX_LENGTH, STATE_IDLE, STATE_CONNECTING, STATE_CONNECTED, STATE_DISCONNECTED, EVENT_DATA, EVENT_AUTH, EVENT_DISCONNECT, ERROR_SUCCESS, ERROR_INVALID_PARAM, ERROR_NOT_CONNECTED, ERROR_AUTH_FAILED, ERROR_PROXY_RELEASED, AgentModel, AgentWant, AgentEvent
} from '../Shared/AgentFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AgentManager]';

export default function connectAgentExtensionSecurityTest(): void {
  describe('ConnectAgentExtensionModelTestSecurity', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'connectAgentExtensionSecurityTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'connectAgentExtensionSecurityTest finished');
    });

    // @tc.number    SUB_AGENT_EXTENSION_SECURITY_0001
    // @tc.name      connectAgentExtensionSecurityCase001
    // @tc.desc      Verify unsafe agent id rejected at slot 0. (parameterised matrix part 1).
    it('connectAgentExtensionSecurityCase001', 0, (): void => {
      {
        expect(AgentModel.isValidAgentId('-')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_0')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('.')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_1')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('/')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_2')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('@')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_3')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('#')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_4')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a-b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_5')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_6')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a.b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_7')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a/b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_8')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a@b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_9')).assertTrue();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_SECURITY_0002
    // @tc.name      connectAgentExtensionSecurityCase002
    // @tc.desc      Verify unsafe agent id rejected at slot 10. (parameterised matrix part 2).
    it('connectAgentExtensionSecurityCase002', 0, (): void => {
      {
        expect(AgentModel.isValidAgentId('a#b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_10')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a$b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_11')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a%b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_12')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a+b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_13')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a=b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_14')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a,b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_15')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a;b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_16')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a:b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_17')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a|b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_18')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a\b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_19')).assertTrue();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_SECURITY_0003
    // @tc.name      connectAgentExtensionSecurityCase003
    // @tc.desc      Verify unsafe agent id rejected at slot 20. (parameterised matrix part 3).
    it('connectAgentExtensionSecurityCase003', 0, (): void => {
      {
        expect(AgentModel.isValidAgentId('-')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_20')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('.')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_21')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('/')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_22')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('@')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_23')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('#')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_24')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a-b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_25')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_26')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a.b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_27')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a/b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_28')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a@b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_29')).assertTrue();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_SECURITY_0004
    // @tc.name      connectAgentExtensionSecurityCase004
    // @tc.desc      Verify unsafe agent id rejected at slot 30. (parameterised matrix part 4).
    it('connectAgentExtensionSecurityCase004', 0, (): void => {
      {
        expect(AgentModel.isValidAgentId('a#b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_30')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a$b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_31')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a%b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_32')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a+b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_33')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a=b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_34')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a,b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_35')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a;b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_36')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a:b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_37')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a|b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_38')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a\b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_39')).assertTrue();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_SECURITY_0005
    // @tc.name      connectAgentExtensionSecurityCase005
    // @tc.desc      Verify unsafe agent id rejected at slot 40. (parameterised matrix part 5).
    it('connectAgentExtensionSecurityCase005', 0, (): void => {
      {
        expect(AgentModel.isValidAgentId('-')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_40')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('.')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_41')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('/')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_42')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('@')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_43')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('#')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_44')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a-b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_45')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_46')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a.b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_47')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a/b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_48')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a@b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_49')).assertTrue();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_SECURITY_0006
    // @tc.name      connectAgentExtensionSecurityCase006
    // @tc.desc      Verify unsafe agent id rejected at slot 50. (parameterised matrix part 6).
    it('connectAgentExtensionSecurityCase006', 0, (): void => {
      {
        expect(AgentModel.isValidAgentId('a#b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_50')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a$b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_51')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a%b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_52')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a+b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_53')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a=b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_54')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a,b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_55')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a;b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_56')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a:b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_57')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a|b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_58')).assertTrue();
      }
      {
        expect(AgentModel.isValidAgentId('a\b')).assertFalse();
        expect(AgentModel.isValidAgentId('safe_agent_59')).assertTrue();
      }
    });

  });
}
