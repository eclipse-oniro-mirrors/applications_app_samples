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
export default function normalizePayloadEdgeTest(): void {
  describe('NormalizePayloadEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}NormalizePayloadEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}NormalizePayloadEdgeTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0001
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0001
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload0  ) returns payload0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: WhitespaceString; expected: payload0
      const actual: string = AgentModel.normalizePayload('  payload0  ');
      expect(actual).assertEqual('payload0');
      expect(actual.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0002
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0002
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload1  ) returns payload1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: payload1
      const actual: string = AgentModel.normalizePayload('  payload1  ');
      expect(actual).assertEqual('payload1');
      expect(actual.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0003
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0003
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload2  ) returns payload2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: payload2
      const actual: string = AgentModel.normalizePayload('  payload2  ');
      expect(actual).assertEqual('payload2');
      expect(actual.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0004
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0004
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload3  ) returns payload3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: payload3
      const actual: string = AgentModel.normalizePayload('  payload3  ');
      expect(actual).assertEqual('payload3');
      expect(actual.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0005
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0005
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload4  ) returns payload4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: payload4
      const actual: string = AgentModel.normalizePayload('  payload4  ');
      expect(actual).assertEqual('payload4');
      expect(actual.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0006
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0006
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload5  ) returns payload5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: payload5
      const actual: string = AgentModel.normalizePayload('  payload5  ');
      expect(actual).assertEqual('payload5');
      expect(actual.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0007
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0007
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload6  ) returns payload6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: payload6
      const actual: string = AgentModel.normalizePayload('  payload6  ');
      expect(actual).assertEqual('payload6');
      expect(actual.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0008
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0008
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload7  ) returns payload7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: payload7
      const actual: string = AgentModel.normalizePayload('  payload7  ');
      expect(actual).assertEqual('payload7');
      expect(actual.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0009
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0009
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload8  ) returns payload8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: payload8
      const actual: string = AgentModel.normalizePayload('  payload8  ');
      expect(actual).assertEqual('payload8');
      expect(actual.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0010
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0010
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload9  ) returns payload9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: WhitespaceString; expected: payload9
      const actual: string = AgentModel.normalizePayload('  payload9  ');
      expect(actual).assertEqual('payload9');
      expect(actual.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0011
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0011
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload10  ) returns payload10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload10
      const actual: string = AgentModel.normalizePayload('  payload10  ');
      expect(actual).assertEqual('payload10');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0012
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0012
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload11  ) returns payload11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload11
      const actual: string = AgentModel.normalizePayload('  payload11  ');
      expect(actual).assertEqual('payload11');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0013
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0013
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload12  ) returns payload12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload12
      const actual: string = AgentModel.normalizePayload('  payload12  ');
      expect(actual).assertEqual('payload12');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0014
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0014
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload13  ) returns payload13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload13
      const actual: string = AgentModel.normalizePayload('  payload13  ');
      expect(actual).assertEqual('payload13');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0015
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0015
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload14  ) returns payload14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload14
      const actual: string = AgentModel.normalizePayload('  payload14  ');
      expect(actual).assertEqual('payload14');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0016
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0016
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload15  ) returns payload15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload15
      const actual: string = AgentModel.normalizePayload('  payload15  ');
      expect(actual).assertEqual('payload15');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0017
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0017
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload16  ) returns payload16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload16
      const actual: string = AgentModel.normalizePayload('  payload16  ');
      expect(actual).assertEqual('payload16');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0018
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0018
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload17  ) returns payload17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload17
      const actual: string = AgentModel.normalizePayload('  payload17  ');
      expect(actual).assertEqual('payload17');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0019
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0019
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload18  ) returns payload18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload18
      const actual: string = AgentModel.normalizePayload('  payload18  ');
      expect(actual).assertEqual('payload18');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0020
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0020
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload19  ) returns payload19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload19
      const actual: string = AgentModel.normalizePayload('  payload19  ');
      expect(actual).assertEqual('payload19');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0021
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0021
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload20  ) returns payload20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload20
      const actual: string = AgentModel.normalizePayload('  payload20  ');
      expect(actual).assertEqual('payload20');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0022
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0022
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload21  ) returns payload21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload21
      const actual: string = AgentModel.normalizePayload('  payload21  ');
      expect(actual).assertEqual('payload21');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0023
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0023
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload22  ) returns payload22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload22
      const actual: string = AgentModel.normalizePayload('  payload22  ');
      expect(actual).assertEqual('payload22');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0024
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0024
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload23  ) returns payload23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload23
      const actual: string = AgentModel.normalizePayload('  payload23  ');
      expect(actual).assertEqual('payload23');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0025
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0025
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload24  ) returns payload24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload24
      const actual: string = AgentModel.normalizePayload('  payload24  ');
      expect(actual).assertEqual('payload24');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0026
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0026
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload25  ) returns payload25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload25
      const actual: string = AgentModel.normalizePayload('  payload25  ');
      expect(actual).assertEqual('payload25');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0027
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0027
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload26  ) returns payload26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload26
      const actual: string = AgentModel.normalizePayload('  payload26  ');
      expect(actual).assertEqual('payload26');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0028
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0028
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload27  ) returns payload27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload27
      const actual: string = AgentModel.normalizePayload('  payload27  ');
      expect(actual).assertEqual('payload27');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0029
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0029
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload28  ) returns payload28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload28
      const actual: string = AgentModel.normalizePayload('  payload28  ');
      expect(actual).assertEqual('payload28');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0030
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0030
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload29  ) returns payload29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: WhitespaceString; expected: payload29
      const actual: string = AgentModel.normalizePayload('  payload29  ');
      expect(actual).assertEqual('payload29');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0031
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0031
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload30  ) returns payload30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload30
      const actual: string = AgentModel.normalizePayload('  payload30  ');
      expect(actual).assertEqual('payload30');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0032
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0032
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload31  ) returns payload31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload31
      const actual: string = AgentModel.normalizePayload('  payload31  ');
      expect(actual).assertEqual('payload31');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0033
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0033
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload32  ) returns payload32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload32
      const actual: string = AgentModel.normalizePayload('  payload32  ');
      expect(actual).assertEqual('payload32');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0034
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0034
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload33  ) returns payload33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload33
      const actual: string = AgentModel.normalizePayload('  payload33  ');
      expect(actual).assertEqual('payload33');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0035
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0035
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload34  ) returns payload34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload34
      const actual: string = AgentModel.normalizePayload('  payload34  ');
      expect(actual).assertEqual('payload34');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0036
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0036
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload35  ) returns payload35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload35
      const actual: string = AgentModel.normalizePayload('  payload35  ');
      expect(actual).assertEqual('payload35');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0037
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0037
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload36  ) returns payload36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload36
      const actual: string = AgentModel.normalizePayload('  payload36  ');
      expect(actual).assertEqual('payload36');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0038
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0038
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload37  ) returns payload37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload37
      const actual: string = AgentModel.normalizePayload('  payload37  ');
      expect(actual).assertEqual('payload37');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0039
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0039
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload38  ) returns payload38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload38
      const actual: string = AgentModel.normalizePayload('  payload38  ');
      expect(actual).assertEqual('payload38');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0040
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0040
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload39  ) returns payload39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload39
      const actual: string = AgentModel.normalizePayload('  payload39  ');
      expect(actual).assertEqual('payload39');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0041
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0041
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload40  ) returns payload40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload40
      const actual: string = AgentModel.normalizePayload('  payload40  ');
      expect(actual).assertEqual('payload40');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0042
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0042
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload41  ) returns payload41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload41
      const actual: string = AgentModel.normalizePayload('  payload41  ');
      expect(actual).assertEqual('payload41');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0043
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0043
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload42  ) returns payload42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload42
      const actual: string = AgentModel.normalizePayload('  payload42  ');
      expect(actual).assertEqual('payload42');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0044
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0044
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload43  ) returns payload43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload43
      const actual: string = AgentModel.normalizePayload('  payload43  ');
      expect(actual).assertEqual('payload43');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0045
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0045
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload44  ) returns payload44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload44
      const actual: string = AgentModel.normalizePayload('  payload44  ');
      expect(actual).assertEqual('payload44');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0046
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0046
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload45  ) returns payload45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload45
      const actual: string = AgentModel.normalizePayload('  payload45  ');
      expect(actual).assertEqual('payload45');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0047
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0047
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload46  ) returns payload46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload46
      const actual: string = AgentModel.normalizePayload('  payload46  ');
      expect(actual).assertEqual('payload46');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0048
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0048
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload47  ) returns payload47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload47
      const actual: string = AgentModel.normalizePayload('  payload47  ');
      expect(actual).assertEqual('payload47');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0049
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0049
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload48  ) returns payload48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload48
      const actual: string = AgentModel.normalizePayload('  payload48  ');
      expect(actual).assertEqual('payload48');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_NORMALIZE_PAYLOAD_EDGE_0050
     * @tc.name      ConnectAgentExtension_normalizePayload_Edge_0050
     * @tc.desc      [WhitespaceString] Verify normalizePayload(  payload49  ) returns payload49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_normalizePayload_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: WhitespaceString; expected: payload49
      const actual: string = AgentModel.normalizePayload('  payload49  ');
      expect(actual).assertEqual('payload49');
      expect(actual.length).assertEqual(9);
    });

  });
}
