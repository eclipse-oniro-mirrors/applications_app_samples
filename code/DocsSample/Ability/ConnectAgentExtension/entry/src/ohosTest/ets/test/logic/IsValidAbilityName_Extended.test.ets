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
export default function isValidAbilityNameExtendedTest(): void {
  describe('IsValidAbilityNameExtendedTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidAbilityNameExtendedTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidAbilityNameExtendedTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0001
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0001
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0002
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0002
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0003
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0003
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0004
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0004
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0005
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0005
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0006
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0006
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0007
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0007
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0008
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0008
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0009
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0009
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0010
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0010
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0011
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0011
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0012
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0012
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0013
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0013
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0014
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0014
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0015
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0015
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0016
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0016
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0017
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0017
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0018
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0018
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0019
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0019
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0020
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0020
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0021
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0021
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0022
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0022
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0023
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0023
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0024
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0024
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0025
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0025
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0026
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0026
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0027
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0027
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0028
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0028
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0029
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0029
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0030
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0030
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0031
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0031
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0032
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0032
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0033
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0033
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0034
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0034
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0035
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0035
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0036
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0036
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0037
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0037
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0038
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0038
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0039
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0039
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0040
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0040
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0041
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0041
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0042
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0042
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0043
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0043
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0044
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0044
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service43');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0045
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0045
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service44) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service44');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0046
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0046
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service45) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service45');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0047
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0047
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service46) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service46');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0048
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0048
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service47) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service47');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0049
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0049
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service48) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service48');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_ABILITY_NAME_EXTENDED_0050
     * @tc.name      ConnectAgentExtension_isValidAbilityName_Extended_0050
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Service49) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAbilityName_Extended_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAbilityName('Service49');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
