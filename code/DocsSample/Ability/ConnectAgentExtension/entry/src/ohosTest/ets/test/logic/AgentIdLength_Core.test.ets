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

/** Logic checks for agentIdLength (50 cases). */
export default function agentIdLengthCoreTest(): void {
  describe('AgentIdLengthCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}AgentIdLengthCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}AgentIdLengthCoreTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0001
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0001
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_0) returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_agentIdLength_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString; expected: 7
      const actual: number = AgentModel.agentIdLength('agent_0');
      expect(actual).assertEqual(7);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0002
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0002
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_1) returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString; expected: 7
      const actual: number = AgentModel.agentIdLength('agent_1');
      expect(actual).assertEqual(7);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0003
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0003
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_2) returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString; expected: 7
      const actual: number = AgentModel.agentIdLength('agent_2');
      expect(actual).assertEqual(7);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0004
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0004
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_3) returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString; expected: 7
      const actual: number = AgentModel.agentIdLength('agent_3');
      expect(actual).assertEqual(7);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0005
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0005
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_4) returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString; expected: 7
      const actual: number = AgentModel.agentIdLength('agent_4');
      expect(actual).assertEqual(7);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0006
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0006
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_5) returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString; expected: 7
      const actual: number = AgentModel.agentIdLength('agent_5');
      expect(actual).assertEqual(7);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0007
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0007
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_6) returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString; expected: 7
      const actual: number = AgentModel.agentIdLength('agent_6');
      expect(actual).assertEqual(7);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0008
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0008
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_7) returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString; expected: 7
      const actual: number = AgentModel.agentIdLength('agent_7');
      expect(actual).assertEqual(7);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0009
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0009
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_8) returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString; expected: 7
      const actual: number = AgentModel.agentIdLength('agent_8');
      expect(actual).assertEqual(7);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0010
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0010
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_9) returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString; expected: 7
      const actual: number = AgentModel.agentIdLength('agent_9');
      expect(actual).assertEqual(7);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0011
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0011
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_10) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_10');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0012
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0012
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_11) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_11');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0013
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0013
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_12) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_12');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0014
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0014
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_13) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_13');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0015
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0015
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_14) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_14');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0016
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0016
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_15) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_15');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0017
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0017
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_16) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_16');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0018
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0018
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_17) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_17');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0019
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0019
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_18) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_18');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0020
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0020
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_19) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_19');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0021
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0021
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_20) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_20');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0022
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0022
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_21) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_21');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0023
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0023
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_22) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_22');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0024
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0024
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_23) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_23');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0025
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0025
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_24) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_24');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0026
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0026
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_25) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_25');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0027
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0027
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_26) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_26');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0028
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0028
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_27) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_27');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0029
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0029
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_28) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_28');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0030
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0030
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_29) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_29');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0031
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0031
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_30) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_30');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0032
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0032
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_31) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_31');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0033
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0033
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_32) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_32');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0034
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0034
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_33) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_33');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0035
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0035
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_34) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_34');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0036
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0036
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_35) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_35');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0037
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0037
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_36) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_36');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0038
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0038
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_37) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_37');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0039
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0039
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_38) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_38');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0040
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0040
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_39) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_39');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0041
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0041
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_40) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_40');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0042
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0042
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_41) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_41');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0043
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0043
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_42) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_42');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0044
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0044
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_43) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_43');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0045
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0045
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_44) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_44');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0046
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0046
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_45) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_45');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0047
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0047
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_46) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_46');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0048
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0048
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_47) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_47');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0049
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0049
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_48) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_48');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_CORE_0050
     * @tc.name      ConnectAgentExtension_agentIdLength_Core_0050
     * @tc.desc      [DelimitedString] Verify agentIdLength(agent_49) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString; expected: 8
      const actual: number = AgentModel.agentIdLength('agent_49');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

  });
}
