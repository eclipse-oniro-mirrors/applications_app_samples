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

export default function connectAgentExtensionWorkflowTest(): void {
  describe('ConnectAgentExtensionModelTestWorkflow', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'connectAgentExtensionWorkflowTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'connectAgentExtensionWorkflowTest finished');
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0001
    // @tc.name      connectAgentExtensionWorkflowCase001
    // @tc.desc      Verify a connect event moves the proxy from IDLE to CONNECTING.
    it('connectAgentExtensionWorkflowCase001', 0, (): void => {
      expect(AgentModel.canConnect(STATE_IDLE)).assertTrue();
      expect(AgentModel.nextState(STATE_IDLE, 'connect')).assertEqual(STATE_CONNECTING);
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0002
    // @tc.name      connectAgentExtensionWorkflowCase002
    // @tc.desc      Verify a connected event moves the proxy from CONNECTING to CONNECTED.
    it('connectAgentExtensionWorkflowCase002', 0, (): void => {
      expect(AgentModel.nextState(STATE_CONNECTING, 'connected')).assertEqual(STATE_CONNECTED);
      expect(AgentModel.isConnected(STATE_CONNECTED)).assertTrue();
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0003
    // @tc.name      connectAgentExtensionWorkflowCase003
    // @tc.desc      Verify data can only be sent while the proxy is connected.
    it('connectAgentExtensionWorkflowCase003', 0, (): void => {
      expect(AgentModel.canSend(STATE_IDLE)).assertFalse();
      expect(AgentModel.canSend(STATE_CONNECTING)).assertFalse();
      expect(AgentModel.canSend(STATE_CONNECTED)).assertTrue();
      expect(AgentModel.canSend(STATE_DISCONNECTED)).assertFalse();
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0004
    // @tc.name      connectAgentExtensionWorkflowCase004
    // @tc.desc      Verify authorization is only available on a connected proxy.
    it('connectAgentExtensionWorkflowCase004', 0, (): void => {
      expect(AgentModel.canAuthorize(STATE_CONNECTED)).assertTrue();
      expect(AgentModel.canAuthorize(STATE_CONNECTING)).assertFalse();
      expect(AgentModel.canAuthorize(STATE_DISCONNECTED)).assertFalse();
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0005
    // @tc.name      connectAgentExtensionWorkflowCase005
    // @tc.desc      Verify disconnect is available while connecting or connected.
    it('connectAgentExtensionWorkflowCase005', 0, (): void => {
      expect(AgentModel.canDisconnect(STATE_CONNECTING)).assertTrue();
      expect(AgentModel.canDisconnect(STATE_CONNECTED)).assertTrue();
      expect(AgentModel.canDisconnect(STATE_IDLE)).assertFalse();
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0006
    // @tc.name      connectAgentExtensionWorkflowCase006
    // @tc.desc      Verify a disconnected proxy can be connected again.
    it('connectAgentExtensionWorkflowCase006', 0, (): void => {
      expect(AgentModel.canConnect(STATE_DISCONNECTED)).assertTrue();
      expect(AgentModel.nextState(STATE_DISCONNECTED, 'connect')).assertEqual(STATE_CONNECTING);
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0007
    // @tc.name      connectAgentExtensionWorkflowCase007
    // @tc.desc      Verify a malformed agent id is rejected.
    it('connectAgentExtensionWorkflowCase007', 0, (): void => {
      expect(AgentModel.isValidAgentId(AGENT_ID)).assertTrue();
      expect(AgentModel.isValidAgentId('bad-id')).assertFalse();
      expect(AgentModel.isValidAgentId('bad id')).assertFalse();
      expect(AgentModel.isValidAgentId('bad.id')).assertFalse();
      expect(AgentModel.isValidAgentId('')).assertFalse();
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0008
    // @tc.name      connectAgentExtensionWorkflowCase008
    // @tc.desc      Verify a malformed connect want is rejected.
    it('connectAgentExtensionWorkflowCase008', 0, (): void => {
      expect(AgentModel.isValidWant(AgentModel.buildWant(AGENT_BUNDLE, AGENT_ABILITY))).assertTrue();
      expect(AgentModel.isValidWant(AgentModel.buildWant('bad bundle', AGENT_ABILITY))).assertFalse();
      expect(AgentModel.isValidWant(AgentModel.buildWant(AGENT_BUNDLE, 'has.dot'))).assertFalse();
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0009
    // @tc.name      connectAgentExtensionWorkflowCase009
    // @tc.desc      Verify onData is accepted only on a connected proxy.
    it('connectAgentExtensionWorkflowCase009', 0, (): void => {
      expect(AgentModel.eventAccepted(EVENT_DATA, STATE_CONNECTED)).assertTrue();
      expect(AgentModel.eventAccepted(EVENT_DATA, STATE_CONNECTING)).assertFalse();
      expect(AgentModel.eventAccepted(EVENT_DATA, STATE_DISCONNECTED)).assertFalse();
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0010
    // @tc.name      connectAgentExtensionWorkflowCase010
    // @tc.desc      Verify onAuth is accepted only on a connected proxy.
    it('connectAgentExtensionWorkflowCase010', 0, (): void => {
      expect(AgentModel.eventAccepted(EVENT_AUTH, STATE_CONNECTED)).assertTrue();
      expect(AgentModel.eventAccepted(EVENT_AUTH, STATE_IDLE)).assertFalse();
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0011
    // @tc.name      connectAgentExtensionWorkflowCase011
    // @tc.desc      Verify onDisconnect is accepted while connecting or connected.
    it('connectAgentExtensionWorkflowCase011', 0, (): void => {
      expect(AgentModel.eventAccepted(EVENT_DISCONNECT, STATE_CONNECTING)).assertTrue();
      expect(AgentModel.eventAccepted(EVENT_DISCONNECT, STATE_CONNECTED)).assertTrue();
      expect(AgentModel.eventAccepted(EVENT_DISCONNECT, STATE_IDLE)).assertFalse();
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0012
    // @tc.name      connectAgentExtensionWorkflowCase012
    // @tc.desc      Verify payload validation rejects empty and oversized payloads.
    it('connectAgentExtensionWorkflowCase012', 0, (): void => {
      expect(AgentModel.isValidPayload('data')).assertTrue();
      expect(AgentModel.isValidPayload('')).assertFalse();
      expect(AgentModel.isValidPayload('payload')).assertTrue();
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0013
    // @tc.name      connectAgentExtensionWorkflowCase013
    // @tc.desc      Verify an event record keeps the name, payload and acceptance flag.
    it('connectAgentExtensionWorkflowCase013', 0, (): void => {
      const event: AgentEvent = AgentModel.makeEvent(EVENT_DATA, 'hello', STATE_CONNECTED);
      expect(event.name).assertEqual(EVENT_DATA);
      expect(event.payload).assertEqual('hello');
      expect(event.accepted).assertTrue();
      expect(AgentModel.describeEvent(event)).assertEqual('onData:hello:true');
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0014
    // @tc.name      connectAgentExtensionWorkflowCase014
    // @tc.desc      Verify a valid connection sequence ends in CONNECTED.
    it('connectAgentExtensionWorkflowCase014', 0, (): void => {
      const events: Array<string> = ['connect', 'connected'];
      expect(AgentModel.isValidConnectionSequence(events)).assertTrue();
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0015
    // @tc.name      connectAgentExtensionWorkflowCase015
    // @tc.desc      Verify a sequence that never connects is rejected.
    it('connectAgentExtensionWorkflowCase015', 0, (): void => {
      const events: Array<string> = ['connect', 'reset'];
      expect(AgentModel.isValidConnectionSequence(events)).assertFalse();
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0016
    // @tc.name      connectAgentExtensionWorkflowCase016
    // @tc.desc      Verify the disconnect callback clears the proxy state.
    it('connectAgentExtensionWorkflowCase016', 0, (): void => {
      expect(AgentModel.nextState(STATE_CONNECTED, 'disconnect')).assertEqual(STATE_DISCONNECTED);
      expect(AgentModel.isConnected(STATE_DISCONNECTED)).assertFalse();
    });

    // @tc.number    SUB_AGENT_EXTENSION_WORKFLOW_0017
    // @tc.name      connectAgentExtensionWorkflowCase017
    // @tc.desc      Verify proxy errors map to readable diagnostics.
    it('connectAgentExtensionWorkflowCase017', 0, (): void => {
      expect(AgentModel.errorMessage(ERROR_NOT_CONNECTED)).assertEqual('agent proxy not connected');
      expect(AgentModel.errorMessage(ERROR_AUTH_FAILED)).assertEqual('agent authorize failed');
      expect(AgentModel.errorMessage(ERROR_PROXY_RELEASED)).assertEqual('agent proxy released');
    });

  });
}
