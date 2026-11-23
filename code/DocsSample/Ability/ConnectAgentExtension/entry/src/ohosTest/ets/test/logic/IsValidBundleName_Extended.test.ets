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
export default function isValidBundleNameExtendedTest(): void {
  describe('IsValidBundleNameExtendedTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameExtendedTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameExtendedTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0001
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0001
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample0.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample0.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0002
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample1.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample1.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0003
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample2.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample2.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0004
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample3.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample3.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0005
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample4.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample4.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0006
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample5.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample5.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0007
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample6.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample6.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0008
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0008
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample7.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample7.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0009
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0009
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample8.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample8.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0010
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0010
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample9.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample9.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0011
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0011
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample10.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample10.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0012
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0012
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample11.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample11.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0013
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0013
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample12.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample12.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0014
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0014
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample13.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample13.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0015
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0015
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample14.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample14.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0016
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0016
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample15.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample15.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0017
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0017
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample16.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample16.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0018
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0018
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample17.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample17.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0019
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0019
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample18.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample18.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0020
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0020
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample19.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample19.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0021
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0021
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample20.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample20.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0022
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0022
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample21.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample21.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0023
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0023
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample22.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample22.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0024
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0024
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample23.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample23.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0025
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0025
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample24.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample24.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0026
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0026
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample25.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample25.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0027
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0027
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample26.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample26.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0028
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0028
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample27.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample27.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0029
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0029
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample28.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample28.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0030
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0030
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample29.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample29.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0031
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0031
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample30.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample30.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0032
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0032
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample31.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample31.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0033
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0033
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample32.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample32.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0034
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0034
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample33.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample33.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0035
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0035
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample34.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample34.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0036
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0036
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample35.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample35.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0037
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0037
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample36.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample36.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0038
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0038
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample37.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample37.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0039
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0039
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample38.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample38.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0040
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0040
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample39.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample39.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0041
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0041
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample40.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample40.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0042
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0042
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample41.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample41.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0043
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0043
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample42.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample42.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0044
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0044
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample43.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample43.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0045
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0045
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample44.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample44.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0046
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0046
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample45.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample45.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0047
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0047
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample46.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample46.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0048
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0048
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample47.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample47.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0049
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0049
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample48.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample48.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_EXTENDED_0050
     * @tc.name      ConnectAgentExtension_isValidBundleName_Extended_0050
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com.sample49.x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Extended_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com.sample49.x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
