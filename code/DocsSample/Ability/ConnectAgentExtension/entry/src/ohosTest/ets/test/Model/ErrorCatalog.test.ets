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

export default function connectAgentExtensionErrorCatalogTest(): void {
  describe('ConnectAgentExtensionModelTestErrorCatalog', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'connectAgentExtensionErrorCatalogTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'connectAgentExtensionErrorCatalogTest finished');
    });

    // @tc.number    SUB_AGENT_EXTENSION_ERRORCATALOG_0001
    // @tc.name      connectAgentExtensionErrorCatalogCase001
    // @tc.desc      Verify errorMessage for error code 0. (parameterised matrix part 1).
    it('connectAgentExtensionErrorCatalogCase001', 0, (): void => {
      {
        const code: number = 0;
        const result: string = AgentModel.errorMessage(code);
        expect(result).assertEqual('success');
      }
      {
        const code: number = 401;
        const result: string = AgentModel.errorMessage(code);
        expect(result).assertEqual('invalid parameter');
      }
      {
        const code: number = 16000011;
        const result: string = AgentModel.errorMessage(code);
        expect(result).assertEqual('agent proxy not connected');
      }
      {
        const code: number = 16000012;
        const result: string = AgentModel.errorMessage(code);
        expect(result).assertEqual('agent authorize failed');
      }
      {
        const code: number = 16000013;
        const result: string = AgentModel.errorMessage(code);
        expect(result).assertEqual('agent proxy released');
      }
      {
        const code: number = -1;
        const result: string = AgentModel.errorMessage(code);
        expect(result).assertEqual('unknown error');
      }
      {
        const code: number = 1;
        const result: string = AgentModel.errorMessage(code);
        expect(result).assertEqual('unknown error');
      }
      {
        const code: number = 500;
        const result: string = AgentModel.errorMessage(code);
        expect(result).assertEqual('unknown error');
      }
      {
        const code: number = 0;
        const result: boolean = AgentModel.isSuccessCode(code);
        expect(result).assertTrue();
      }
      {
        const code: number = 401;
        const result: boolean = AgentModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
    });

    // @tc.number    SUB_AGENT_EXTENSION_ERRORCATALOG_0002
    // @tc.name      connectAgentExtensionErrorCatalogCase002
    // @tc.desc      Verify isSuccessCode for error code 16000011. (parameterised matrix part 2).
    it('connectAgentExtensionErrorCatalogCase002', 0, (): void => {
      {
        const code: number = 16000011;
        const result: boolean = AgentModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 16000012;
        const result: boolean = AgentModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 16000013;
        const result: boolean = AgentModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = -1;
        const result: boolean = AgentModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 1;
        const result: boolean = AgentModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
      {
        const code: number = 500;
        const result: boolean = AgentModel.isSuccessCode(code);
        expect(result).assertFalse();
      }
    });

  });
}
