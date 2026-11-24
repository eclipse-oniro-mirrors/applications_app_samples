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

/** Logic checks for isValidAgentId (50 cases). */
export default function isValidAgentIdBoundaryTest(): void {
  describe('IsValidAgentIdBoundaryTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidAgentIdBoundaryTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidAgentIdBoundaryTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0001
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0001
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0002
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0003
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0004
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0005
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0006
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0007
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0008
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0008
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0009
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0009
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0010
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0010
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0011
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0011
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0012
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0012
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0013
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0013
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0014
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0014
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0015
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0015
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0016
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0016
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0017
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0017
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0018
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0018
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0019
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0019
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0020
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0020
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0021
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0021
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0022
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0022
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0023
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0023
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0024
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0024
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0025
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0025
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0026
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0026
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0027
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0027
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0028
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0028
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0029
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0029
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0030
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0030
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0031
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0031
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0032
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0032
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0033
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0033
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0034
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0034
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0035
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0035
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0036
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0036
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0037
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0037
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0038
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0038
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0039
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0039
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0040
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0040
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0041
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0041
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0042
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0042
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0043
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0043
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0044
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0044
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_43');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0045
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0045
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_44) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_44');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0046
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0046
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_45) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_45');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0047
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0047
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_46) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_46');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0048
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0048
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_47) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_47');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0049
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0049
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_48) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_48');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_BOUNDARY_0050
     * @tc.name      ConnectAgentExtension_isValidAgentId_Boundary_0050
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(agentId_49) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Boundary_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('agentId_49');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
