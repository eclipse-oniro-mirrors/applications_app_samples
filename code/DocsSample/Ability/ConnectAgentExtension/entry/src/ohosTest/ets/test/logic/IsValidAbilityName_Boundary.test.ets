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

/** Logic checks for isValidAbilityName (50 cases). */
export default function isValidAbilityNameBoundaryTest(): void {
  describe('IsValidAbilityNameBoundaryTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidAbilityNameBoundaryTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidAbilityNameBoundaryTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0001
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0001
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0002
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0002
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0003
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0003
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0004
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0004
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0005
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0005
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0006
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0006
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0007
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0007
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0008
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0008
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0009
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0009
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0010
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0010
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0011
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0011
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0012
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0012
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0013
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0013
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0014
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0014
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0015
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0015
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0016
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0016
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0017
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0017
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0018
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0018
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0019
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0019
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0020
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0020
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0021
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0021
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0022
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0022
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0023
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0023
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0024
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0024
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0025
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0025
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0026
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0026
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0027
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0027
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0028
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0028
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0029
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0029
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0030
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0030
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0031
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0031
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0032
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0032
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0033
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0033
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0034
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0034
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0035
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0035
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0036
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0036
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0037
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0037
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0038
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0038
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0039
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0039
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0040
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0040
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0041
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0041
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0042
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0042
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0043
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0043
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0044
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0044
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler43');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0045
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0045
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler44) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler44');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0046
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0046
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler45) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler45');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0047
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0047
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler46) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler46');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0048
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0048
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler47) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler47');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0049
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0049
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler48) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler48');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_BOUNDARY_0050
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Boundary_0050
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Handler49) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Boundary_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Handler49');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
