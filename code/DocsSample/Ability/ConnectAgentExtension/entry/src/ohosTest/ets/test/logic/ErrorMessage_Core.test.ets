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

import { describe, expect, it, beforeAll, afterAll, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AgentModel } from '../Shared/AgentFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_connectagentextension]';
const BUNDLE: string = 'ConnectAgentExtension_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for errorMessage (50 cases). */
export default function errorMessageCoreTest(): void {
  describe('ErrorMessageCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}ErrorMessageCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}ErrorMessageCoreTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0001
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0001
     * @tc.desc      [Zero] Verify errorMessage(0) returns success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_errorMessage_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero; expected: success
      const actual: string = AgentModel.errorMessage(0);
      expect(actual).assertEqual('success');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0002
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0002
     * @tc.desc      [Large] Verify errorMessage(401) returns invalid parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_errorMessage_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: invalid parameter
      const actual: string = AgentModel.errorMessage(401);
      expect(actual).assertEqual('invalid parameter');
      expect(actual.length).assertEqual(17);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0003
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0003
     * @tc.desc      [Extreme] Verify errorMessage(16000011) returns agent proxy not connected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_errorMessage_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Extreme; expected: agent proxy not connected
      const actual: string = AgentModel.errorMessage(16000011);
      expect(actual).assertEqual('agent proxy not connected');
      expect(actual.length).assertEqual(25);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0004
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0004
     * @tc.desc      [Extreme] Verify errorMessage(16000012) returns agent authorize failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_errorMessage_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Extreme; expected: agent authorize failed
      const actual: string = AgentModel.errorMessage(16000012);
      expect(actual).assertEqual('agent authorize failed');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0005
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0005
     * @tc.desc      [Extreme] Verify errorMessage(16000013) returns agent proxy released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_errorMessage_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Extreme; expected: agent proxy released
      const actual: string = AgentModel.errorMessage(16000013);
      expect(actual).assertEqual('agent proxy released');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0006
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0006
     * @tc.desc      [Zero] Verify errorMessage(0) returns success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_errorMessage_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Zero; expected: success
      const actual: string = AgentModel.errorMessage(0);
      expect(actual).assertEqual('success');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0007
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0007
     * @tc.desc      [SmallPositive] Verify errorMessage(1) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_errorMessage_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: unknown error
      const actual: string = AgentModel.errorMessage(1);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0008
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0008
     * @tc.desc      [SmallPositive] Verify errorMessage(2) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_errorMessage_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: unknown error
      const actual: string = AgentModel.errorMessage(2);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0009
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0009
     * @tc.desc      [SmallPositive] Verify errorMessage(3) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_errorMessage_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: unknown error
      const actual: string = AgentModel.errorMessage(3);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0010
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0010
     * @tc.desc      [Medium] Verify errorMessage(4) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_errorMessage_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(4);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0011
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0011
     * @tc.desc      [Medium] Verify errorMessage(5) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(5);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0012
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0012
     * @tc.desc      [Medium] Verify errorMessage(6) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(6);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0013
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0013
     * @tc.desc      [Medium] Verify errorMessage(7) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(7);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0014
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0014
     * @tc.desc      [Medium] Verify errorMessage(8) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(8);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0015
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0015
     * @tc.desc      [Medium] Verify errorMessage(9) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(9);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0016
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0016
     * @tc.desc      [Medium] Verify errorMessage(10) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(10);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0017
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0017
     * @tc.desc      [Medium] Verify errorMessage(11) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(11);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0018
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0018
     * @tc.desc      [Medium] Verify errorMessage(12) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(12);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0019
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0019
     * @tc.desc      [Medium] Verify errorMessage(13) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(13);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0020
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0020
     * @tc.desc      [Medium] Verify errorMessage(14) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(14);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0021
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0021
     * @tc.desc      [Medium] Verify errorMessage(15) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(15);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0022
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0022
     * @tc.desc      [Medium] Verify errorMessage(16) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(16);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0023
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0023
     * @tc.desc      [Medium] Verify errorMessage(17) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(17);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0024
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0024
     * @tc.desc      [Medium] Verify errorMessage(18) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(18);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0025
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0025
     * @tc.desc      [Medium] Verify errorMessage(19) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(19);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0026
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0026
     * @tc.desc      [Medium] Verify errorMessage(20) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(20);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0027
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0027
     * @tc.desc      [Medium] Verify errorMessage(21) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(21);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0028
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0028
     * @tc.desc      [Medium] Verify errorMessage(22) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(22);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0029
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0029
     * @tc.desc      [Medium] Verify errorMessage(23) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(23);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0030
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0030
     * @tc.desc      [Medium] Verify errorMessage(24) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_errorMessage_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(24);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0031
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0031
     * @tc.desc      [Medium] Verify errorMessage(25) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(25);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0032
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0032
     * @tc.desc      [Medium] Verify errorMessage(26) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(26);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0033
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0033
     * @tc.desc      [Medium] Verify errorMessage(27) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(27);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0034
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0034
     * @tc.desc      [Medium] Verify errorMessage(28) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(28);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0035
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0035
     * @tc.desc      [Medium] Verify errorMessage(29) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(29);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0036
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0036
     * @tc.desc      [Medium] Verify errorMessage(30) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(30);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0037
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0037
     * @tc.desc      [Medium] Verify errorMessage(31) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(31);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0038
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0038
     * @tc.desc      [Medium] Verify errorMessage(32) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(32);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0039
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0039
     * @tc.desc      [Medium] Verify errorMessage(33) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(33);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0040
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0040
     * @tc.desc      [Medium] Verify errorMessage(34) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(34);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0041
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0041
     * @tc.desc      [Medium] Verify errorMessage(35) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(35);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0042
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0042
     * @tc.desc      [Medium] Verify errorMessage(36) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(36);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0043
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0043
     * @tc.desc      [Medium] Verify errorMessage(37) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(37);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0044
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0044
     * @tc.desc      [Medium] Verify errorMessage(38) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(38);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0045
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0045
     * @tc.desc      [Medium] Verify errorMessage(39) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(39);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0046
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0046
     * @tc.desc      [Medium] Verify errorMessage(40) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(40);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0047
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0047
     * @tc.desc      [Medium] Verify errorMessage(41) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(41);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0048
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0048
     * @tc.desc      [Medium] Verify errorMessage(42) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(42);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0049
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0049
     * @tc.desc      [Medium] Verify errorMessage(43) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(43);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_ERROR_MESSAGE_CORE_0050
     * @tc.name      ConnectAgentExtension_errorMessage_Core_0050
     * @tc.desc      [Medium] Verify errorMessage(44) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_errorMessage_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = AgentModel.errorMessage(44);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

  });
}
