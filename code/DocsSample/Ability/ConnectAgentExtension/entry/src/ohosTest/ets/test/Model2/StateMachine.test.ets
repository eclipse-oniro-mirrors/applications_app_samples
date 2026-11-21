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

export default function connectAgentExtensionStateMachineTest(): void {
  describe('ConnectAgentExtensionModelTestStateMachine', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'connectAgentExtensionStateMachineTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'connectAgentExtensionStateMachineTest finished');
    });

    // @tc.number    SUB_AGENT_EXTENSION_STATEMACHINE_0001
    // @tc.name      connectAgentExtensionStateMachineCase001
    // @tc.desc      Verify stateName for state -1. (parameterised matrix part 1).
    it('connectAgentExtensionStateMachineCase001', 0, (): void => {
      {
        const state: number = -1;
        const result: string = AgentModel.stateName(state);
        expect(result).assertEqual('UNKNOWN');
      }
      {
        const state: number = 0;
        const result: string = AgentModel.stateName(state);
        expect(result).assertEqual('IDLE');
      }
      {
        const state: number = 1;
        const result: string = AgentModel.stateName(state);
        expect(result).assertEqual('CONNECTING');
      }
      {
        const state: number = 2;
        const result: string = AgentModel.stateName(state);
        expect(result).assertEqual('CONNECTED');
      }
      {
        const state: number = 3;
        const result: string = AgentModel.stateName(state);
        expect(result).assertEqual('DISCONNECTED');
      }
      {
        const state: number = 4;
        const result: string = AgentModel.stateName(state);
        expect(result).assertEqual('UNKNOWN');
      }
      {
        const state: number = 10;
        const result: string = AgentModel.stateName(state);
        expect(result).assertEqual('UNKNOWN');
      }
      {
        const state: number = -1;
        const result: boolean = AgentModel.canConnect(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 0;
        const result: boolean = AgentModel.canConnect(state);
        expect(result).assertTrue();
      }
      {
        const state: number = 1;
        const result: boolean = AgentModel.canConnect(state);
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_STATEMACHINE_0002
    // @tc.name      connectAgentExtensionStateMachineCase002
    // @tc.desc      Verify canConnect for state 2. (parameterised matrix part 2).
    it('connectAgentExtensionStateMachineCase002', 0, (): void => {
      {
        const state: number = 2;
        const result: boolean = AgentModel.canConnect(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 3;
        const result: boolean = AgentModel.canConnect(state);
        expect(result).assertTrue();
      }
      {
        const state: number = 4;
        const result: boolean = AgentModel.canConnect(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 10;
        const result: boolean = AgentModel.canConnect(state);
        expect(result).assertFalse();
      }
      {
        const state: number = -1;
        const result: boolean = AgentModel.canSend(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 0;
        const result: boolean = AgentModel.canSend(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 1;
        const result: boolean = AgentModel.canSend(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 2;
        const result: boolean = AgentModel.canSend(state);
        expect(result).assertTrue();
      }
      {
        const state: number = 3;
        const result: boolean = AgentModel.canSend(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 4;
        const result: boolean = AgentModel.canSend(state);
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_STATEMACHINE_0003
    // @tc.name      connectAgentExtensionStateMachineCase003
    // @tc.desc      Verify canSend for state 10. (parameterised matrix part 3).
    it('connectAgentExtensionStateMachineCase003', 0, (): void => {
      {
        const state: number = 10;
        const result: boolean = AgentModel.canSend(state);
        expect(result).assertFalse();
      }
      {
        const state: number = -1;
        const result: boolean = AgentModel.canDisconnect(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 0;
        const result: boolean = AgentModel.canDisconnect(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 1;
        const result: boolean = AgentModel.canDisconnect(state);
        expect(result).assertTrue();
      }
      {
        const state: number = 2;
        const result: boolean = AgentModel.canDisconnect(state);
        expect(result).assertTrue();
      }
      {
        const state: number = 3;
        const result: boolean = AgentModel.canDisconnect(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 4;
        const result: boolean = AgentModel.canDisconnect(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 10;
        const result: boolean = AgentModel.canDisconnect(state);
        expect(result).assertFalse();
      }
      {
        const state: number = -1;
        const result: boolean = AgentModel.isConnected(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 0;
        const result: boolean = AgentModel.isConnected(state);
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_STATEMACHINE_0004
    // @tc.name      connectAgentExtensionStateMachineCase004
    // @tc.desc      Verify isConnected for state 1. (parameterised matrix part 4).
    it('connectAgentExtensionStateMachineCase004', 0, (): void => {
      {
        const state: number = 1;
        const result: boolean = AgentModel.isConnected(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 2;
        const result: boolean = AgentModel.isConnected(state);
        expect(result).assertTrue();
      }
      {
        const state: number = 3;
        const result: boolean = AgentModel.isConnected(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 4;
        const result: boolean = AgentModel.isConnected(state);
        expect(result).assertFalse();
      }
      {
        const state: number = 10;
        const result: boolean = AgentModel.isConnected(state);
        expect(result).assertFalse();
      }
    });

  });
}
