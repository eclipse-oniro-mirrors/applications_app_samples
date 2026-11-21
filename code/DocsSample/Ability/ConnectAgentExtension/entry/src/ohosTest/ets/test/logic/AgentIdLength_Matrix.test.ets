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

/** Logic checks for agentIdLength (50 cases). */
export default function agentIdLengthMatrixTest(): void {
  describe('AgentIdLengthMatrixTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}AgentIdLengthMatrixTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}AgentIdLengthMatrixTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0001
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0001
     * @tc.desc      [LongString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: LongString; expected: 64
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(64);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0002
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0002
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 63.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: 63
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(63);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0003
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0003
     * @tc.desc      [LongString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 65.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LongString; expected: 65
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(65);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0004
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0004
     * @tc.desc      [LongString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 128.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LongString; expected: 128
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(128);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0005
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0005
     * @tc.desc      [EmptyString] Verify agentIdLength((empty)) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: EmptyString; expected: 0
      const actual: number = AgentModel.agentIdLength('');
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0006
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0006
     * @tc.desc      [ShortString] Verify agentIdLength(a) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: 1
      const actual: number = AgentModel.agentIdLength('a');
      expect(actual).assertEqual(1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0007
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0007
     * @tc.desc      [ShortString] Verify agentIdLength(aa) returns 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString; expected: 2
      const actual: number = AgentModel.agentIdLength('aa');
      expect(actual).assertEqual(2);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0008
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0008
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaa) returns 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: 10
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaa');
      expect(actual).assertEqual(10);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0009
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0009
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString; expected: 32
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(32);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0010
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0010
     * @tc.desc      [LongString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: LongString; expected: 100
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(100);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0011
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0011
     * @tc.desc      [ShortString] Verify agentIdLength(aaa) returns 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString; expected: 3
      const actual: number = AgentModel.agentIdLength('aaa');
      expect(actual).assertEqual(3);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0012
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0012
     * @tc.desc      [PlainString] Verify agentIdLength(aaaa) returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 4
      const actual: number = AgentModel.agentIdLength('aaaa');
      expect(actual).assertEqual(4);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0013
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0013
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaa) returns 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 5
      const actual: number = AgentModel.agentIdLength('aaaaa');
      expect(actual).assertEqual(5);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0014
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0014
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaa) returns 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 6
      const actual: number = AgentModel.agentIdLength('aaaaaa');
      expect(actual).assertEqual(6);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0015
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0015
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaa) returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 7
      const actual: number = AgentModel.agentIdLength('aaaaaaa');
      expect(actual).assertEqual(7);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0016
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0016
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaa) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 8
      const actual: number = AgentModel.agentIdLength('aaaaaaaa');
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0017
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0017
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaa) returns 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 9
      const actual: number = AgentModel.agentIdLength('aaaaaaaaa');
      expect(actual).assertEqual(9);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0018
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0018
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaa) returns 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 10
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaa');
      expect(actual).assertEqual(10);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0019
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0019
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaa) returns 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 11
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaa');
      expect(actual).assertEqual(11);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0020
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0020
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaa) returns 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 12
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaa');
      expect(actual).assertEqual(12);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0021
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0021
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaa) returns 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 13
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaa');
      expect(actual).assertEqual(13);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0022
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0022
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaa) returns 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 14
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaa');
      expect(actual).assertEqual(14);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0023
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0023
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaa) returns 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 15
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaa');
      expect(actual).assertEqual(15);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0024
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0024
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaa) returns 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 16
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(16);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0025
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0025
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaa) returns 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 17
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(17);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0026
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0026
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaa) returns 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 18
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(18);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0027
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0027
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaa) returns 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 19
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(19);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0028
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0028
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaa) returns 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 20
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(20);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0029
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0029
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaa) returns 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 21
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(21);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0030
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0030
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaa) returns 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString; expected: 22
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(22);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0031
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0031
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaa) returns 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 23
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(23);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0032
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0032
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaa) returns 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 24
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(24);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0033
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0033
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaa) returns 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 25
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(25);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0034
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0034
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaa) returns 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 26
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(26);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0035
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0035
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 27
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(27);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0036
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0036
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 28
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(28);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0037
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0037
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 29
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(29);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0038
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0038
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 30
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(30);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0039
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0039
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 31
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(31);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0040
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0040
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 32
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(32);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0041
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0041
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 33
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(33);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0042
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0042
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 34
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(34);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0043
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0043
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 35
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(35);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0044
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0044
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 36
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(36);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0045
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0045
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 37
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(37);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0046
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0046
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 38
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(38);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0047
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0047
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 39
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(39);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0048
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0048
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 40
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(40);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0049
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0049
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 41
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(41);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_AGENT_ID_LENGTH_MATRIX_0050
     * @tc.name      ConnectAgentExtension_agentIdLength_Matrix_0050
     * @tc.desc      [PlainString] Verify agentIdLength(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_agentIdLength_Matrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString; expected: 42
      const actual: number = AgentModel.agentIdLength('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertEqual(42);
      expect(typeof actual).assertEqual('number');
    });

  });
}
