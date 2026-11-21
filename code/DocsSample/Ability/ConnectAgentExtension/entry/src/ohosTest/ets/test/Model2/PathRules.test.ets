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

export default function connectAgentExtensionPathRulesTest(): void {
  describe('ConnectAgentExtensionModelTestPathRules', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'connectAgentExtensionPathRulesTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'connectAgentExtensionPathRulesTest finished');
    });

    // @tc.number    SUB_AGENT_EXTENSION_PATHRULES_0001
    // @tc.name      connectAgentExtensionPathRulesCase001
    // @tc.desc      Verify agent id charset rule for slot 0. (parameterised matrix part 1).
    it('connectAgentExtensionPathRulesCase001', 0, (): void => {
      {
        const agentId: string = 'weather_assistant_001';
        const result: boolean = AgentModel.isValidAgentId(agentId) === true;
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_1';
        const result: boolean = AgentModel.isValidAgentId(agentId) === true;
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'A1_b2';
        const result: boolean = AgentModel.isValidAgentId(agentId) === true;
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'a';
        const result: boolean = AgentModel.isValidAgentId(agentId) === true;
        expect(result).assertTrue();
      }
      {
        const agentId: string = '';
        const result: boolean = AgentModel.isValidAgentId(agentId) === false;
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'bad-id';
        const result: boolean = AgentModel.isValidAgentId(agentId) === false;
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'bad id';
        const result: boolean = AgentModel.isValidAgentId(agentId) === false;
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'bad.dot';
        const result: boolean = AgentModel.isValidAgentId(agentId) === false;
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'bad/slash';
        const result: boolean = AgentModel.isValidAgentId(agentId) === false;
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'bad@char';
        const result: boolean = AgentModel.isValidAgentId(agentId) === false;
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_PATHRULES_0002
    // @tc.name      connectAgentExtensionPathRulesCase002
    // @tc.desc      Verify agent id charset rule for slot 10. (parameterised matrix part 2).
    it('connectAgentExtensionPathRulesCase002', 0, (): void => {
      {
        const agentId: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
        const result: boolean = AgentModel.isValidAgentId(agentId) === true;
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
        const result: boolean = AgentModel.isValidAgentId(agentId) === true;
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
        const result: boolean = AgentModel.isValidAgentId(agentId) === false;
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_0';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_1';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_2';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_3';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_4';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_5';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_6';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_PATHRULES_0003
    // @tc.name      connectAgentExtensionPathRulesCase003
    // @tc.desc      Verify generated agent id is accepted at slot 7. (parameterised matrix part 3).
    it('connectAgentExtensionPathRulesCase003', 0, (): void => {
      {
        const agentId: string = 'agent_7';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_8';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_9';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_10';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_11';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_12';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_13';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
      {
        const agentId: string = 'agent_14';
        const result: boolean = AgentModel.isValidAgentId(agentId);
        expect(result).assertTrue();
      }
    });

  });
}
