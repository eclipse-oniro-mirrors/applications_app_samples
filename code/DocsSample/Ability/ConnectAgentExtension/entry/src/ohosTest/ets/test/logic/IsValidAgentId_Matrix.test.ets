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
export default function isValidAgentIdMatrixTest(): void {
  describe('IsValidAgentIdMatrixTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidAgentIdMatrixTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidAgentIdMatrixTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0001
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0001
     * @tc.desc      [LongString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: LongString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0002
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0002
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0003
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0003
     * @tc.desc      [LongString|expected=false] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LongString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0004
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0004
     * @tc.desc      [LongString|expected=false] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LongString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0005
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0005
     * @tc.desc      [EmptyString|expected=false] Verify isValidAgentId((empty)) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: EmptyString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidAgentId('');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0006
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0006
     * @tc.desc      [ShortString|expected=true] Verify isValidAgentId(a) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('a');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0007
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0007
     * @tc.desc      [ShortString|expected=true] Verify isValidAgentId(aa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0008
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0008
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0009
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0009
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0010
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0010
     * @tc.desc      [LongString|expected=false] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LongString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0011
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0011
     * @tc.desc      [ShortString|expected=true] Verify isValidAgentId(aaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0012
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0012
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0013
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0013
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0014
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0014
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0015
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0015
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0016
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0016
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0017
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0017
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0018
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0018
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0019
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0019
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0020
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0020
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0021
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0021
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0022
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0022
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0023
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0023
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0024
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0024
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0025
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0025
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0026
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0026
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0027
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0027
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0028
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0028
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0029
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0029
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0030
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0030
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0031
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0031
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0032
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0032
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0033
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0033
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0034
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0034
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0035
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0035
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0036
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0036
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0037
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0037
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0038
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0038
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0039
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0039
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0040
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0040
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0041
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0041
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0042
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0042
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0043
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0043
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0044
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0044
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0045
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0045
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0046
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0046
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0047
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0047
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0048
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0048
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0049
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0049
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_AGENT_ID_MATRIX_0050
     * @tc.name      ConnectAgentExtension_isValidAgentId_Matrix_0050
     * @tc.desc      [PlainString|expected=true] Verify isValidAgentId(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidAgentId_Matrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidAgentId('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
