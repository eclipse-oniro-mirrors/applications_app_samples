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
export default function isValidAbilityNameMatrixTest(): void {
  describe('IsValidAbilityNameMatrixTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidAbilityNameMatrixTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidAbilityNameMatrixTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0001
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0001
     * @tc.desc      [EmptyString|expected=false] Verify isValidAbilityName((empty)) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: EmptyString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidAbilityName('');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0002
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0002
     * @tc.desc      [ShortString|expected=true] Verify isValidAbilityName(A) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('A');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0003
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0003
     * @tc.desc      [ShortString|expected=true] Verify isValidAbilityName(AB) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('AB');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0004
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0004
     * @tc.desc      [ShortString|expected=false] Verify isValidAbilityName(A B) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidAbilityName('A B');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0005
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0005
     * @tc.desc      [ShortString|expected=false] Verify isValidAbilityName(A.B) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidAbilityName('A.B');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0006
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0006
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Agent) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Agent');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0007
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0007
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0008
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0008
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0009
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0009
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0010
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0010
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0011
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0011
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0012
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0012
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0013
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0013
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0014
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0014
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0015
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0015
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0016
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0016
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0017
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0017
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0018
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0018
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0019
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0019
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0020
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0020
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0021
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0021
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0022
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0022
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0023
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0023
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0024
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0024
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0025
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0025
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0026
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0026
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0027
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0027
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0028
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0028
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0029
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0029
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0030
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0030
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0031
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0031
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0032
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0032
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0033
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0033
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0034
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0034
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0035
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0035
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0036
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0036
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0037
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0037
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0038
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0038
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0039
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0039
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0040
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0040
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0041
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0041
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0042
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0042
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0043
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0043
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0044
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0044
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0045
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0045
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0046
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0046
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0047
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0047
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0048
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0048
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0049
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0049
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_MATRIX_0050
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Matrix_0050
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(item43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Matrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('item43');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
