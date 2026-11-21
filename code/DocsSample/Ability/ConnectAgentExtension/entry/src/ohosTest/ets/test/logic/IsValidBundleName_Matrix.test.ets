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
export default function isValidBundleNameMatrixTest(): void {
  describe('IsValidBundleNameMatrixTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameMatrixTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidBundleNameMatrixTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0001
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0001
     * @tc.desc      [EmptyString|expected=false] Verify isValidBundleName((empty)) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: EmptyString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0002
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0002
     * @tc.desc      [ShortString|expected=false] Verify isValidBundleName(abc) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('abc');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0003
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(.abc) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('.abc');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0004
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(abc.) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('abc.');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0005
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0005
     * @tc.desc      [WhitespaceString|expected=false] Verify isValidBundleName(a b.c) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('a b.c');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0006
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0006
     * @tc.desc      [ShortString|expected=true] Verify isValidBundleName(a.b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('a.b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0007
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isValidBundleName(com..x) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('com..x');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0008
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0008
     * @tc.desc      [ShortString|expected=true] Verify isValidBundleName(x.y) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidBundleName('x.y');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0009
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0009
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item0) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item0');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0010
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0010
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item1) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item1');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0011
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0011
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item2) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item2');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0012
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0012
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item3) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item3');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0013
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0013
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item4) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item4');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0014
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0014
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item5) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item5');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0015
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0015
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item6) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item6');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0016
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0016
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item7) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item7');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0017
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0017
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item8) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item8');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0018
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0018
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item9) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item9');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0019
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0019
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item10) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item10');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0020
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0020
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item11) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item11');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0021
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0021
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item12) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item12');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0022
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0022
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item13) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item13');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0023
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0023
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item14) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item14');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0024
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0024
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item15) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item15');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0025
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0025
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item16) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item16');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0026
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0026
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item17) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item17');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0027
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0027
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item18) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item18');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0028
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0028
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item19) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item19');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0029
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0029
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item20) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item20');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0030
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0030
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item21) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item21');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0031
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0031
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item22) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item22');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0032
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0032
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item23) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item23');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0033
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0033
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item24) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item24');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0034
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0034
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item25) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item25');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0035
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0035
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item26) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item26');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0036
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0036
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item27) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item27');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0037
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0037
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item28) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item28');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0038
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0038
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item29) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item29');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0039
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0039
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item30) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item30');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0040
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0040
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item31) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item31');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0041
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0041
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item32) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item32');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0042
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0042
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item33) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item33');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0043
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0043
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item34) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item34');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0044
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0044
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item35) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item35');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0045
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0045
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item36) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item36');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0046
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0046
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item37) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item37');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0047
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0047
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item38) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item38');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0048
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0048
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item39) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item39');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0049
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0049
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item40) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item40');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_BUNDLE_NAME_MATRIX_0050
     * @tc.name      ConnectAgentExtension_isValidBundleName_Matrix_0050
     * @tc.desc      [PlainString|expected=false] Verify isValidBundleName(item41) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidBundleName_Matrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidBundleName('item41');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

  });
}
