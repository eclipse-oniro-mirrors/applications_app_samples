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

export default function connectAgentExtensionBuilderTest(): void {
  describe('ConnectAgentExtensionModelTestBuilder', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'connectAgentExtensionBuilderTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'connectAgentExtensionBuilderTest finished');
    });

    // @tc.number    SUB_AGENT_EXTENSION_BUILDER_0001
    // @tc.name      connectAgentExtensionBuilderCase001
    // @tc.desc      Verify buildWant fields for builder slot 0. (parameterised matrix part 1).
    it('connectAgentExtensionBuilderCase001', 0, (): void => {
      {
        const want: AgentWant = AgentModel.buildWant('com.sample.agentextensionability', 'AgentExtAbility');
        expect(want.bundleName).assertEqual('com.sample.agentextensionability');
        expect(want.abilityName).assertEqual('AgentExtAbility');
      }
      {
        const want: AgentWant = AgentModel.buildWant('com.sample.x', 'Ability');
        expect(want.bundleName).assertEqual('com.sample.x');
        expect(want.abilityName).assertEqual('Ability');
      }
      {
        const want: AgentWant = AgentModel.buildWant('a.b', 'A');
        expect(want.bundleName).assertEqual('a.b');
        expect(want.abilityName).assertEqual('A');
      }
      {
        const want: AgentWant = AgentModel.buildWant('abc', '');
        expect(want.bundleName).assertEqual('abc');
        expect(want.abilityName).assertEqual('');
      }
      {
        const want: AgentWant = AgentModel.buildWant('', 'has space');
        expect(want.bundleName).assertEqual('');
        expect(want.abilityName).assertEqual('has space');
      }
      {
        const want: AgentWant = AgentModel.buildWant('.abc', 'has.dot');
        expect(want.bundleName).assertEqual('.abc');
        expect(want.abilityName).assertEqual('has.dot');
      }
      {
        const want: AgentWant = AgentModel.buildWant('abc.', 'AgentExtAbility');
        expect(want.bundleName).assertEqual('abc.');
        expect(want.abilityName).assertEqual('AgentExtAbility');
      }
      {
        const want: AgentWant = AgentModel.buildWant('a b', 'Ability');
        expect(want.bundleName).assertEqual('a b');
        expect(want.abilityName).assertEqual('Ability');
      }
      {
        const want: AgentWant = AgentModel.buildWant('com..x', 'A');
        expect(want.bundleName).assertEqual('com..x');
        expect(want.abilityName).assertEqual('A');
      }
      {
        const want: AgentWant = AgentModel.buildWant('com.sample.agentextensionability', '');
        expect(want.bundleName).assertEqual('com.sample.agentextensionability');
        expect(want.abilityName).assertEqual('');
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_BUILDER_0002
    // @tc.name      connectAgentExtensionBuilderCase002
    // @tc.desc      Verify buildWant fields for builder slot 10. (parameterised matrix part 2).
    it('connectAgentExtensionBuilderCase002', 0, (): void => {
      {
        const want: AgentWant = AgentModel.buildWant('com.sample.x', 'has space');
        expect(want.bundleName).assertEqual('com.sample.x');
        expect(want.abilityName).assertEqual('has space');
      }
      {
        const want: AgentWant = AgentModel.buildWant('a.b', 'has.dot');
        expect(want.bundleName).assertEqual('a.b');
        expect(want.abilityName).assertEqual('has.dot');
      }
      {
        const want: AgentWant = AgentModel.buildWant('abc', 'AgentExtAbility');
        expect(want.bundleName).assertEqual('abc');
        expect(want.abilityName).assertEqual('AgentExtAbility');
      }
      {
        const want: AgentWant = AgentModel.buildWant('', 'Ability');
        expect(want.bundleName).assertEqual('');
        expect(want.abilityName).assertEqual('Ability');
      }
      {
        const want: AgentWant = AgentModel.buildWant('.abc', 'A');
        expect(want.bundleName).assertEqual('.abc');
        expect(want.abilityName).assertEqual('A');
      }
      {
        const want: AgentWant = AgentModel.buildWant('com.sample.agentextensionability', 'AgentExtAbility');
        expect(AgentModel.isValidWant(want)).assertTrue();
      }
      {
        const want: AgentWant = AgentModel.buildWant('com.sample.x', 'Ability');
        expect(AgentModel.isValidWant(want)).assertTrue();
      }
      {
        const want: AgentWant = AgentModel.buildWant('a.b', 'A');
        expect(AgentModel.isValidWant(want)).assertTrue();
      }
      {
        const want: AgentWant = AgentModel.buildWant('abc', '');
        expect(AgentModel.isValidWant(want)).assertFalse();
      }
      {
        const want: AgentWant = AgentModel.buildWant('', 'has space');
        expect(AgentModel.isValidWant(want)).assertFalse();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_BUILDER_0003
    // @tc.name      connectAgentExtensionBuilderCase003
    // @tc.desc      Verify isValidWant for builder slot 5. (parameterised matrix part 3).
    it('connectAgentExtensionBuilderCase003', 0, (): void => {
      {
        const want: AgentWant = AgentModel.buildWant('.abc', 'has.dot');
        expect(AgentModel.isValidWant(want)).assertFalse();
      }
      {
        const want: AgentWant = AgentModel.buildWant('abc.', 'AgentExtAbility');
        expect(AgentModel.isValidWant(want)).assertTrue();
      }
      {
        const want: AgentWant = AgentModel.buildWant('a b', 'Ability');
        expect(AgentModel.isValidWant(want)).assertFalse();
      }
      {
        const want: AgentWant = AgentModel.buildWant('com..x', 'A');
        expect(AgentModel.isValidWant(want)).assertTrue();
      }
      {
        const want: AgentWant = AgentModel.buildWant('com.sample.agentextensionability', '');
        expect(AgentModel.isValidWant(want)).assertFalse();
      }
      {
        const want: AgentWant = AgentModel.buildWant('com.sample.x', 'has space');
        expect(AgentModel.isValidWant(want)).assertFalse();
      }
      {
        const want: AgentWant = AgentModel.buildWant('a.b', 'has.dot');
        expect(AgentModel.isValidWant(want)).assertFalse();
      }
      {
        const want: AgentWant = AgentModel.buildWant('abc', 'AgentExtAbility');
        expect(AgentModel.isValidWant(want)).assertFalse();
      }
      {
        const want: AgentWant = AgentModel.buildWant('', 'Ability');
        expect(AgentModel.isValidWant(want)).assertFalse();
      }
      {
        const want: AgentWant = AgentModel.buildWant('.abc', 'A');
        expect(AgentModel.isValidWant(want)).assertTrue();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_BUILDER_0004
    // @tc.name      connectAgentExtensionBuilderCase004
    // @tc.desc      Verify makeEvent accepted flag for slot 0. (parameterised matrix part 4).
    it('connectAgentExtensionBuilderCase004', 0, (): void => {
      {
        const event: AgentEvent = AgentModel.makeEvent('onData', 'payload0', -1);
        expect(event.name).assertEqual('onData');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('onAuth', 'payload1', 0);
        expect(event.name).assertEqual('onAuth');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('onDisconnect', 'payload2', 1);
        expect(event.name).assertEqual('onDisconnect');
        expect(event.accepted).assertEqual(true);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('unknown', 'payload3', 2);
        expect(event.name).assertEqual('unknown');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('', 'payload4', 3);
        expect(event.name).assertEqual('');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('onData', 'payload5', 4);
        expect(event.name).assertEqual('onData');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('onAuth', 'payload6', 10);
        expect(event.name).assertEqual('onAuth');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('onDisconnect', 'payload7', -1);
        expect(event.name).assertEqual('onDisconnect');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('unknown', 'payload8', 0);
        expect(event.name).assertEqual('unknown');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('', 'payload9', 1);
        expect(event.name).assertEqual('');
        expect(event.accepted).assertEqual(false);
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_BUILDER_0005
    // @tc.name      connectAgentExtensionBuilderCase005
    // @tc.desc      Verify makeEvent accepted flag for slot 10. (parameterised matrix part 5).
    it('connectAgentExtensionBuilderCase005', 0, (): void => {
      {
        const event: AgentEvent = AgentModel.makeEvent('onData', 'payload10', 2);
        expect(event.name).assertEqual('onData');
        expect(event.accepted).assertEqual(true);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('onAuth', 'payload11', 3);
        expect(event.name).assertEqual('onAuth');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('onDisconnect', 'payload12', 4);
        expect(event.name).assertEqual('onDisconnect');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('unknown', 'payload13', 10);
        expect(event.name).assertEqual('unknown');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('', 'payload14', -1);
        expect(event.name).assertEqual('');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('onData', 'payload15', 0);
        expect(event.name).assertEqual('onData');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('onAuth', 'payload16', 1);
        expect(event.name).assertEqual('onAuth');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('onDisconnect', 'payload17', 2);
        expect(event.name).assertEqual('onDisconnect');
        expect(event.accepted).assertEqual(true);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('unknown', 'payload18', 3);
        expect(event.name).assertEqual('unknown');
        expect(event.accepted).assertEqual(false);
      }
      {
        const event: AgentEvent = AgentModel.makeEvent('', 'payload19', 4);
        expect(event.name).assertEqual('');
        expect(event.accepted).assertEqual(false);
      }
    });

  });
}
