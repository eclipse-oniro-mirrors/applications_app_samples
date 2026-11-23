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
export default function isValidAgentIdExtendedTest(): void {
  describe('IsValidAgentIdExtendedTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidAgentIdExtendedTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidAgentIdExtendedTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0001
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0001
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_0_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_0_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0002
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_1_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_1_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0003
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_2_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_2_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0004
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_3_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_3_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0005
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_4_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_4_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0006
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_5_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_5_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0007
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_6_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_6_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0008
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0008
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_7_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_7_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0009
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0009
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_8_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_8_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0010
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0010
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_9_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_9_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0011
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0011
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_10_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_10_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0012
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0012
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_11_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_11_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0013
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0013
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_12_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_12_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0014
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0014
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_13_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_13_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0015
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0015
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_14_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_14_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0016
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0016
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_15_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_15_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0017
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0017
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_16_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_16_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0018
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0018
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_17_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_17_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0019
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0019
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_18_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_18_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0020
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0020
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_19_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_19_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0021
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0021
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_20_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_20_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0022
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0022
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_21_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_21_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0023
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0023
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_22_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_22_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0024
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0024
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_23_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_23_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0025
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0025
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_24_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_24_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0026
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0026
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_25_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_25_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0027
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0027
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_26_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_26_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0028
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0028
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_27_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_27_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0029
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0029
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_28_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_28_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0030
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0030
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_29_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_29_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0031
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0031
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_30_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_30_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0032
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0032
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_31_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_31_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0033
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0033
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_32_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_32_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0034
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0034
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_33_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_33_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0035
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0035
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_34_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_34_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0036
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0036
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_35_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_35_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0037
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0037
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_36_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_36_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0038
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0038
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_37_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_37_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0039
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0039
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_38_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_38_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0040
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0040
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_39_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_39_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0041
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0041
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_40_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_40_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0042
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0042
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_41_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_41_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0043
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0043
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_42_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_42_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0044
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0044
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_43_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_43_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0045
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0045
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_44_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_44_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0046
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0046
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_45_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_45_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0047
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0047
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_46_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_46_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0048
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0048
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_47_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_47_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0049
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0049
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_48_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_48_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_EXTENDED_0050
     * @tc.name      ConnectAgentExtension_isValidAgentId_Extended_0050
     * @tc.desc      [DelimitedString|expected=true] Verify isValidAgentId(id_49_) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Extended_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('id_49_');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
