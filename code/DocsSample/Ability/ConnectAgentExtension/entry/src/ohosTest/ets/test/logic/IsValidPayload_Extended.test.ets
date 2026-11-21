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

/** Logic checks for isValidPayload (50 cases). */
export default function isValidPayloadExtendedTest(): void {
  describe('IsValidPayloadExtendedTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidPayloadExtendedTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidPayloadExtendedTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0001
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0001
     * @tc.desc      [EmptyString|expected=false] Verify isValidPayload((empty)) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: EmptyString|expected=false; expected: False
      const actual: boolean = AgentModel.isValidPayload('');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0002
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0002
     * @tc.desc      [ShortString|expected=true] Verify isValidPayload(a) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('a');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0003
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0003
     * @tc.desc      [ShortString|expected=true] Verify isValidPayload(aa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0004
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0004
     * @tc.desc      [ShortString|expected=true] Verify isValidPayload(aaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0005
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0005
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0006
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0006
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0007
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0007
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0008
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0008
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0009
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0009
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0010
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0010
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0011
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0011
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0012
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0012
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0013
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0013
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0014
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0014
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0015
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0015
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0016
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0016
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0017
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0017
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0018
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0018
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0019
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0019
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0020
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0020
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0021
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0021
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0022
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0022
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0023
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0023
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0024
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0024
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0025
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0025
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0026
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0026
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0027
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0027
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0028
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0028
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0029
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0029
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0030
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0030
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0031
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0031
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0032
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0032
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0033
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0033
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0034
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0034
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0035
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0035
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0036
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0036
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0037
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0037
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0038
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0038
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0039
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0039
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0040
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0040
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0041
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0041
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0042
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0042
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0043
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0043
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0044
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0044
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0045
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0045
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0046
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0046
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0047
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0047
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0048
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0048
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0049
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0049
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_IS_VALID_PAYLOAD_EXTENDED_0050
     * @tc.name      ConnectAgentExtension_isValidPayload_Extended_0050
     * @tc.desc      [PlainString|expected=true] Verify isValidPayload(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_isValidPayload_Extended_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = AgentModel.isValidPayload('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
