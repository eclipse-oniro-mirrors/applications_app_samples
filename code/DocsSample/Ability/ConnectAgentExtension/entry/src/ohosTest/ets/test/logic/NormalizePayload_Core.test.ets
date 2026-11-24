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

/** Logic checks for normalizePayload (50 cases). */
export default function normalizePayloadCoreTest(): void {
  describe('NormalizePayloadCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}NormalizePayloadCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}NormalizePayloadCoreTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0001
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0001
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  abc  ) returns abc.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_normalizePayload_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: WhitespaceString; expected: abc
      const actual: string = AgentModel.normalizePayload('  abc  ');
      expect(actual).assertEqual('abc');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0002
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0002
     * @tc.desc      [WhitespaceString] Verify normalizePayload(\\tabc\\n) returns abc.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: abc
      const actual: string = AgentModel.normalizePayload('\tabc\n');
      expect(actual).assertEqual('abc');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0003
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0003
     * @tc.desc      [ShortString] Verify normalizePayload(abc) returns abc.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: abc
      const actual: string = AgentModel.normalizePayload('abc');
      expect(actual).assertEqual('abc');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0004
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0004
     * @tc.desc      [ShortString] Verify normalizePayload( a ) returns a.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: a
      const actual: string = AgentModel.normalizePayload(' a ');
      expect(actual).assertEqual('a');
      expect(actual.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0005
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0005
     * @tc.desc      [WhitespaceString] Verify normalizePayload(a b ) returns a b.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: a b
      const actual: string = AgentModel.normalizePayload('a b ');
      expect(actual).assertEqual('a b');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0006
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0006
     * @tc.desc      [ShortString] Verify normalizePayload(  ) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: (empty)
      const actual: string = AgentModel.normalizePayload('  ');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0007
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0007
     * @tc.desc      [ShortString] Verify normalizePayload(x) returns x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: x
      const actual: string = AgentModel.normalizePayload('x');
      expect(actual).assertEqual('x');
      expect(actual.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0008
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0008
     * @tc.desc      [ShortString] Verify normalizePayload(\\n\\n) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: (empty)
      const actual: string = AgentModel.normalizePayload('\n\n');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0009
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0009
     * @tc.desc      [ShortString] Verify normalizePayload(\\t\\t) returns (empty).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: (empty)
      const actual: string = AgentModel.normalizePayload('\t\t');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0010
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0010
     * @tc.desc      [WhitespaceString] Verify normalizePayload( lead) returns lead.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: lead
      const actual: string = AgentModel.normalizePayload(' lead');
      expect(actual).assertEqual('lead');
      expect(actual.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0011
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0011
     * @tc.desc      [WhitespaceString] Verify normalizePayload(trail ) returns trail.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: trail
      const actual: string = AgentModel.normalizePayload('trail ');
      expect(actual).assertEqual('trail');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0012
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0012
     * @tc.desc      [ShortString] Verify normalizePayload(s0) returns s0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s0
      const actual: string = AgentModel.normalizePayload('s0');
      expect(actual).assertEqual('s0');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0013
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0013
     * @tc.desc      [ShortString] Verify normalizePayload(s1) returns s1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s1
      const actual: string = AgentModel.normalizePayload('s1');
      expect(actual).assertEqual('s1');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0014
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0014
     * @tc.desc      [ShortString] Verify normalizePayload(s2) returns s2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s2
      const actual: string = AgentModel.normalizePayload('s2');
      expect(actual).assertEqual('s2');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0015
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0015
     * @tc.desc      [ShortString] Verify normalizePayload(s3) returns s3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s3
      const actual: string = AgentModel.normalizePayload('s3');
      expect(actual).assertEqual('s3');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0016
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0016
     * @tc.desc      [ShortString] Verify normalizePayload(s4) returns s4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s4
      const actual: string = AgentModel.normalizePayload('s4');
      expect(actual).assertEqual('s4');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0017
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0017
     * @tc.desc      [ShortString] Verify normalizePayload(s5) returns s5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s5
      const actual: string = AgentModel.normalizePayload('s5');
      expect(actual).assertEqual('s5');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0018
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0018
     * @tc.desc      [ShortString] Verify normalizePayload(s6) returns s6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s6
      const actual: string = AgentModel.normalizePayload('s6');
      expect(actual).assertEqual('s6');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0019
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0019
     * @tc.desc      [ShortString] Verify normalizePayload(s7) returns s7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s7
      const actual: string = AgentModel.normalizePayload('s7');
      expect(actual).assertEqual('s7');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0020
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0020
     * @tc.desc      [ShortString] Verify normalizePayload(s8) returns s8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s8
      const actual: string = AgentModel.normalizePayload('s8');
      expect(actual).assertEqual('s8');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0021
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0021
     * @tc.desc      [ShortString] Verify normalizePayload(s9) returns s9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s9
      const actual: string = AgentModel.normalizePayload('s9');
      expect(actual).assertEqual('s9');
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0022
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0022
     * @tc.desc      [ShortString] Verify normalizePayload(s10) returns s10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s10
      const actual: string = AgentModel.normalizePayload('s10');
      expect(actual).assertEqual('s10');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0023
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0023
     * @tc.desc      [ShortString] Verify normalizePayload(s11) returns s11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s11
      const actual: string = AgentModel.normalizePayload('s11');
      expect(actual).assertEqual('s11');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0024
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0024
     * @tc.desc      [ShortString] Verify normalizePayload(s12) returns s12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s12
      const actual: string = AgentModel.normalizePayload('s12');
      expect(actual).assertEqual('s12');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0025
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0025
     * @tc.desc      [ShortString] Verify normalizePayload(s13) returns s13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s13
      const actual: string = AgentModel.normalizePayload('s13');
      expect(actual).assertEqual('s13');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0026
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0026
     * @tc.desc      [ShortString] Verify normalizePayload(s14) returns s14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s14
      const actual: string = AgentModel.normalizePayload('s14');
      expect(actual).assertEqual('s14');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0027
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0027
     * @tc.desc      [ShortString] Verify normalizePayload(s15) returns s15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s15
      const actual: string = AgentModel.normalizePayload('s15');
      expect(actual).assertEqual('s15');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0028
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0028
     * @tc.desc      [ShortString] Verify normalizePayload(s16) returns s16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s16
      const actual: string = AgentModel.normalizePayload('s16');
      expect(actual).assertEqual('s16');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0029
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0029
     * @tc.desc      [ShortString] Verify normalizePayload(s17) returns s17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s17
      const actual: string = AgentModel.normalizePayload('s17');
      expect(actual).assertEqual('s17');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0030
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0030
     * @tc.desc      [ShortString] Verify normalizePayload(s18) returns s18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: s18
      const actual: string = AgentModel.normalizePayload('s18');
      expect(actual).assertEqual('s18');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0031
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0031
     * @tc.desc      [ShortString] Verify normalizePayload(s19) returns s19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s19
      const actual: string = AgentModel.normalizePayload('s19');
      expect(actual).assertEqual('s19');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0032
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0032
     * @tc.desc      [ShortString] Verify normalizePayload(s20) returns s20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s20
      const actual: string = AgentModel.normalizePayload('s20');
      expect(actual).assertEqual('s20');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0033
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0033
     * @tc.desc      [ShortString] Verify normalizePayload(s21) returns s21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s21
      const actual: string = AgentModel.normalizePayload('s21');
      expect(actual).assertEqual('s21');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0034
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0034
     * @tc.desc      [ShortString] Verify normalizePayload(s22) returns s22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s22
      const actual: string = AgentModel.normalizePayload('s22');
      expect(actual).assertEqual('s22');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0035
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0035
     * @tc.desc      [ShortString] Verify normalizePayload(s23) returns s23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s23
      const actual: string = AgentModel.normalizePayload('s23');
      expect(actual).assertEqual('s23');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0036
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0036
     * @tc.desc      [ShortString] Verify normalizePayload(s24) returns s24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s24
      const actual: string = AgentModel.normalizePayload('s24');
      expect(actual).assertEqual('s24');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0037
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0037
     * @tc.desc      [ShortString] Verify normalizePayload(s25) returns s25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s25
      const actual: string = AgentModel.normalizePayload('s25');
      expect(actual).assertEqual('s25');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0038
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0038
     * @tc.desc      [ShortString] Verify normalizePayload(s26) returns s26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s26
      const actual: string = AgentModel.normalizePayload('s26');
      expect(actual).assertEqual('s26');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0039
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0039
     * @tc.desc      [ShortString] Verify normalizePayload(s27) returns s27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s27
      const actual: string = AgentModel.normalizePayload('s27');
      expect(actual).assertEqual('s27');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0040
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0040
     * @tc.desc      [ShortString] Verify normalizePayload(s28) returns s28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s28
      const actual: string = AgentModel.normalizePayload('s28');
      expect(actual).assertEqual('s28');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0041
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0041
     * @tc.desc      [ShortString] Verify normalizePayload(s29) returns s29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s29
      const actual: string = AgentModel.normalizePayload('s29');
      expect(actual).assertEqual('s29');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0042
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0042
     * @tc.desc      [ShortString] Verify normalizePayload(s30) returns s30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s30
      const actual: string = AgentModel.normalizePayload('s30');
      expect(actual).assertEqual('s30');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0043
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0043
     * @tc.desc      [ShortString] Verify normalizePayload(s31) returns s31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s31
      const actual: string = AgentModel.normalizePayload('s31');
      expect(actual).assertEqual('s31');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0044
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0044
     * @tc.desc      [ShortString] Verify normalizePayload(s32) returns s32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s32
      const actual: string = AgentModel.normalizePayload('s32');
      expect(actual).assertEqual('s32');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0045
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0045
     * @tc.desc      [ShortString] Verify normalizePayload(s33) returns s33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s33
      const actual: string = AgentModel.normalizePayload('s33');
      expect(actual).assertEqual('s33');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0046
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0046
     * @tc.desc      [ShortString] Verify normalizePayload(s34) returns s34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s34
      const actual: string = AgentModel.normalizePayload('s34');
      expect(actual).assertEqual('s34');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0047
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0047
     * @tc.desc      [ShortString] Verify normalizePayload(s35) returns s35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s35
      const actual: string = AgentModel.normalizePayload('s35');
      expect(actual).assertEqual('s35');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0048
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0048
     * @tc.desc      [ShortString] Verify normalizePayload(s36) returns s36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s36
      const actual: string = AgentModel.normalizePayload('s36');
      expect(actual).assertEqual('s36');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0049
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0049
     * @tc.desc      [ShortString] Verify normalizePayload(s37) returns s37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s37
      const actual: string = AgentModel.normalizePayload('s37');
      expect(actual).assertEqual('s37');
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_CORE_0050
     * @tc.name      ConnectAgentExtension_normalizePayload_Core_0050
     * @tc.desc      [ShortString] Verify normalizePayload(s38) returns s38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: ShortString; expected: s38
      const actual: string = AgentModel.normalizePayload('s38');
      expect(actual).assertEqual('s38');
      expect(actual.length).assertEqual(3);
    });

  });
}
