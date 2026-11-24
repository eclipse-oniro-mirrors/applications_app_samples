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

/** Logic checks for isValidBundleName (50 cases). */
export default function isValidBundleNameCoreTest(): void {
  describe('IsValidBundleNameCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameCoreTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0001
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0001
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0002
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0003
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0004
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0005
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0006
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0007
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0008
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0008
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0009
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0009
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0010
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0010
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0011
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0011
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0012
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0012
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0013
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0013
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0014
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0014
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0015
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0015
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0016
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0016
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0017
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0017
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0018
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0018
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0019
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0019
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0020
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0020
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0021
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0021
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0022
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0022
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0023
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0023
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0024
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0024
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0025
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0025
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0026
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0026
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0027
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0027
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0028
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0028
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0029
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0029
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0030
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0030
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0031
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0031
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0032
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0032
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0033
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0033
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0034
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0034
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0035
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0035
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0036
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0036
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0037
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0037
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0038
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0038
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0039
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0039
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0040
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0040
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0041
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0041
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0042
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0042
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0043
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0043
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0044
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0044
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent43');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0045
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0045
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent44) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent44');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0046
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0046
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent45) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent45');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0047
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0047
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent46) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent46');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0048
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0048
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent47) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent47');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0049
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0049
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent48) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent48');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_CORE_0050
     * @tc.name      ConnectAgentExtension_isValidBundleName_Core_0050
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample.agent49) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample.agent49');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
