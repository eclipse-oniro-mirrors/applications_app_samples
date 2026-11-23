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
export default function isValidAbilityNameEdgeTest(): void {
  describe('IsValidAbilityNameEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidAbilityNameEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidAbilityNameEdgeTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0001
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0001
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0002
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0002
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0003
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0003
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0004
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0004
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0005
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0005
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0006
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0006
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0007
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0007
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0008
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0008
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0009
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0009
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0010
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0010
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0011
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0011
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0012
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0012
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0013
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0013
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0014
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0014
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0015
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0015
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0016
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0016
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0017
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0017
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0018
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0018
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0019
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0019
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0020
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0020
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0021
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0021
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0022
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0022
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0023
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0023
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0024
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0024
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0025
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0025
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0026
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0026
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0027
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0027
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0028
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0028
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0029
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0029
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0030
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0030
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0031
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0031
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0032
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0032
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0033
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0033
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0034
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0034
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0035
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0035
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0036
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0036
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0037
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0037
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0038
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0038
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0039
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0039
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0040
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0040
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0041
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0041
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0042
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0042
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0043
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0043
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0044
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0044
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility43');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0045
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0045
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility44) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility44');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0046
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0046
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility45) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility45');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0047
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0047
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility46) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility46');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0048
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0048
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility47) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility47');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0049
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0049
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility48) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility48');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EDGE_0050
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Edge_0050
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ExtAbility49) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('ExtAbility49');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
