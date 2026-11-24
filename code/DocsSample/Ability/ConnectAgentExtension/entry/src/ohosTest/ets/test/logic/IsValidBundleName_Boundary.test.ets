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
export default function isValidBundleNameBoundaryTest(): void {
  describe('IsValidBundleNameBoundaryTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameBoundaryTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameBoundaryTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0001
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0001
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent0.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent0.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0002
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent1.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent1.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0003
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent2.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent2.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0004
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent3.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent3.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0005
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent4.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent4.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0006
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent5.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent5.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0007
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent6.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent6.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0008
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0008
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent7.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent7.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0009
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0009
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent8.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent8.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0010
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0010
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent9.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent9.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0011
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0011
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent10.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent10.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0012
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0012
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent11.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent11.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0013
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0013
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent12.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent12.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0014
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0014
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent13.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent13.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0015
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0015
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent14.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent14.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0016
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0016
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent15.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent15.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0017
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0017
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent16.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent16.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0018
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0018
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent17.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent17.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0019
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0019
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent18.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent18.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0020
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0020
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent19.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent19.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0021
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0021
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent20.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent20.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0022
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0022
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent21.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent21.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0023
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0023
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent22.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent22.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0024
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0024
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent23.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent23.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0025
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0025
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent24.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent24.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0026
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0026
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent25.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent25.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0027
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0027
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent26.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent26.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0028
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0028
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent27.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent27.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0029
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0029
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent28.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent28.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0030
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0030
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent29.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent29.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0031
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0031
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent30.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent30.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0032
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0032
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent31.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent31.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0033
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0033
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent32.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent32.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0034
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0034
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent33.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent33.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0035
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0035
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent34.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent34.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0036
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0036
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent35.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent35.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0037
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0037
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent36.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent36.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0038
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0038
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent37.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent37.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0039
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0039
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent38.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent38.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0040
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0040
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent39.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent39.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0041
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0041
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent40.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent40.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0042
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0042
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent41.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent41.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0043
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0043
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent42.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent42.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0044
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0044
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent43.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent43.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0045
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0045
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent44.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent44.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0046
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0046
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent45.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent45.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0047
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0047
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent46.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent46.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0048
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0048
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent47.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent47.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0049
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0049
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent48.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent48.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_BOUNDARY_0050
     * @tc.name      ConnectAgentExtension_isValidBundleName_Boundary_0050
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(org.agent49.app) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Boundary_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('org.agent49.app');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
