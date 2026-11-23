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

export default function connectAgentExtensionIntegrationTest(): void {
  describe('ConnectAgentExtensionModelTestIntegration', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'connectAgentExtensionIntegrationTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'connectAgentExtensionIntegrationTest finished');
    });

    // @tc.number    SUB_AGENT_EXTENSION_INTEGRATION_0001
    // @tc.name      connectAgentExtensionIntegrationCase001
    // @tc.desc      Verify connection sequence slot 0. (parameterised matrix part 1).
    it('connectAgentExtensionIntegrationCase001', 0, (): void => {
      {
        const events: Array<string> = ['connect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'connected'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
      {
        const events: Array<string> = ['connect', 'connected', 'disconnect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
      {
        const events: Array<string> = ['connect', 'disconnect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
      {
        const events: Array<string> = ['reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['disconnect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'connected', 'disconnect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'connected'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_INTEGRATION_0002
    // @tc.name      connectAgentExtensionIntegrationCase002
    // @tc.desc      Verify connection sequence slot 10. (parameterised matrix part 2).
    it('connectAgentExtensionIntegrationCase002', 0, (): void => {
      {
        const events: Array<string> = ['connect', 'connected', 'disconnect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
      {
        const events: Array<string> = ['connect', 'disconnect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
      {
        const events: Array<string> = ['reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['disconnect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'connected', 'disconnect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'connected'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
      {
        const events: Array<string> = ['connect', 'connected', 'disconnect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
      {
        const events: Array<string> = ['connect', 'disconnect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_INTEGRATION_0003
    // @tc.name      connectAgentExtensionIntegrationCase003
    // @tc.desc      Verify connection sequence slot 20. (parameterised matrix part 3).
    it('connectAgentExtensionIntegrationCase003', 0, (): void => {
      {
        const events: Array<string> = ['reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['disconnect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'connected', 'disconnect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'connected'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
      {
        const events: Array<string> = ['connect', 'connected', 'disconnect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
      {
        const events: Array<string> = ['connect', 'disconnect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
      {
        const events: Array<string> = ['reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_INTEGRATION_0004
    // @tc.name      connectAgentExtensionIntegrationCase004
    // @tc.desc      Verify connection sequence slot 30. (parameterised matrix part 4).
    it('connectAgentExtensionIntegrationCase004', 0, (): void => {
      {
        const events: Array<string> = ['disconnect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'connected', 'disconnect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'connected'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
      {
        const events: Array<string> = ['connect', 'connected', 'disconnect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
      {
        const events: Array<string> = ['connect', 'disconnect'];
        expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
      }
      {
        const events: Array<string> = ['reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['disconnect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
      {
        const events: Array<string> = ['connect', 'connected', 'disconnect', 'reset'];
        expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
      }
    });

  });
}
