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

/** Logic checks for stateName (50 cases). */
export default function stateNameEdgeTest(): void {
  describe('StateNameEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}StateNameEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}StateNameEdgeTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0001
     * @tc.name      ConnectAgentExtension_stateName_Edge_0001
     * @tc.desc      [Zero] Verify stateName(0) returns IDLE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_stateName_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero; expected: IDLE
      const actual: string = AgentModel.stateName(0);
      expect(actual).assertEqual('IDLE');
      expect(actual.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0002
     * @tc.name      ConnectAgentExtension_stateName_Edge_0002
     * @tc.desc      [SmallPositive] Verify stateName(1) returns CONNECTING.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_stateName_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: CONNECTING
      const actual: string = AgentModel.stateName(1);
      expect(actual).assertEqual('CONNECTING');
      expect(actual.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0003
     * @tc.name      ConnectAgentExtension_stateName_Edge_0003
     * @tc.desc      [Negative] Verify stateName(-1) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_stateName_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = AgentModel.stateName(-1);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0004
     * @tc.name      ConnectAgentExtension_stateName_Edge_0004
     * @tc.desc      [SmallPositive] Verify stateName(2) returns CONNECTED.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_stateName_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: CONNECTED
      const actual: string = AgentModel.stateName(2);
      expect(actual).assertEqual('CONNECTED');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0005
     * @tc.name      ConnectAgentExtension_stateName_Edge_0005
     * @tc.desc      [Negative] Verify stateName(-2) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_stateName_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = AgentModel.stateName(-2);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0006
     * @tc.name      ConnectAgentExtension_stateName_Edge_0006
     * @tc.desc      [SmallPositive] Verify stateName(3) returns DISCONNECTED.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_stateName_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: DISCONNECTED
      const actual: string = AgentModel.stateName(3);
      expect(actual).assertEqual('DISCONNECTED');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0007
     * @tc.name      ConnectAgentExtension_stateName_Edge_0007
     * @tc.desc      [Negative] Verify stateName(-3) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_stateName_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = AgentModel.stateName(-3);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0008
     * @tc.name      ConnectAgentExtension_stateName_Edge_0008
     * @tc.desc      [Medium] Verify stateName(4) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_stateName_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = AgentModel.stateName(4);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0009
     * @tc.name      ConnectAgentExtension_stateName_Edge_0009
     * @tc.desc      [Negative] Verify stateName(-4) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_stateName_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = AgentModel.stateName(-4);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0010
     * @tc.name      ConnectAgentExtension_stateName_Edge_0010
     * @tc.desc      [Medium] Verify stateName(5) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_stateName_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = AgentModel.stateName(5);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0011
     * @tc.name      ConnectAgentExtension_stateName_Edge_0011
     * @tc.desc      [Negative] Verify stateName(-5) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = AgentModel.stateName(-5);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0012
     * @tc.name      ConnectAgentExtension_stateName_Edge_0012
     * @tc.desc      [Medium] Verify stateName(10) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = AgentModel.stateName(10);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0013
     * @tc.name      ConnectAgentExtension_stateName_Edge_0013
     * @tc.desc      [Negative] Verify stateName(-10) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = AgentModel.stateName(-10);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0014
     * @tc.name      ConnectAgentExtension_stateName_Edge_0014
     * @tc.desc      [Medium] Verify stateName(100) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: UNKNOWN
      const actual: string = AgentModel.stateName(100);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0015
     * @tc.name      ConnectAgentExtension_stateName_Edge_0015
     * @tc.desc      [Negative] Verify stateName(-100) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = AgentModel.stateName(-100);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0016
     * @tc.name      ConnectAgentExtension_stateName_Edge_0016
     * @tc.desc      [Large] Verify stateName(1000) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(1000);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0017
     * @tc.name      ConnectAgentExtension_stateName_Edge_0017
     * @tc.desc      [Negative] Verify stateName(-1000) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = AgentModel.stateName(-1000);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0018
     * @tc.name      ConnectAgentExtension_stateName_Edge_0018
     * @tc.desc      [Large] Verify stateName(1024) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(1024);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0019
     * @tc.name      ConnectAgentExtension_stateName_Edge_0019
     * @tc.desc      [Negative] Verify stateName(-1024) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = AgentModel.stateName(-1024);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0020
     * @tc.name      ConnectAgentExtension_stateName_Edge_0020
     * @tc.desc      [Large] Verify stateName(4096) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(4096);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0021
     * @tc.name      ConnectAgentExtension_stateName_Edge_0021
     * @tc.desc      [Negative] Verify stateName(-4096) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = AgentModel.stateName(-4096);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0022
     * @tc.name      ConnectAgentExtension_stateName_Edge_0022
     * @tc.desc      [Extreme] Verify stateName(65535) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: UNKNOWN
      const actual: string = AgentModel.stateName(65535);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0023
     * @tc.name      ConnectAgentExtension_stateName_Edge_0023
     * @tc.desc      [Negative] Verify stateName(-65535) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = AgentModel.stateName(-65535);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0024
     * @tc.name      ConnectAgentExtension_stateName_Edge_0024
     * @tc.desc      [Extreme] Verify stateName(2147483647) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: UNKNOWN
      const actual: string = AgentModel.stateName(2147483647);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0025
     * @tc.name      ConnectAgentExtension_stateName_Edge_0025
     * @tc.desc      [Negative] Verify stateName(-2147483648) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = AgentModel.stateName(-2147483648);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0026
     * @tc.name      ConnectAgentExtension_stateName_Edge_0026
     * @tc.desc      [Extreme] Verify stateName(2147483646) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: UNKNOWN
      const actual: string = AgentModel.stateName(2147483646);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0027
     * @tc.name      ConnectAgentExtension_stateName_Edge_0027
     * @tc.desc      [Negative] Verify stateName(-2147483647) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: UNKNOWN
      const actual: string = AgentModel.stateName(-2147483647);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0028
     * @tc.name      ConnectAgentExtension_stateName_Edge_0028
     * @tc.desc      [Large] Verify stateName(127) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(127);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0029
     * @tc.name      ConnectAgentExtension_stateName_Edge_0029
     * @tc.desc      [Large] Verify stateName(128) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(128);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0030
     * @tc.name      ConnectAgentExtension_stateName_Edge_0030
     * @tc.desc      [Large] Verify stateName(129) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_stateName_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(129);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0031
     * @tc.name      ConnectAgentExtension_stateName_Edge_0031
     * @tc.desc      [Large] Verify stateName(255) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(255);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0032
     * @tc.name      ConnectAgentExtension_stateName_Edge_0032
     * @tc.desc      [Large] Verify stateName(256) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(256);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0033
     * @tc.name      ConnectAgentExtension_stateName_Edge_0033
     * @tc.desc      [Large] Verify stateName(257) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(257);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0034
     * @tc.name      ConnectAgentExtension_stateName_Edge_0034
     * @tc.desc      [Large] Verify stateName(511) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(511);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0035
     * @tc.name      ConnectAgentExtension_stateName_Edge_0035
     * @tc.desc      [Large] Verify stateName(512) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(512);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0036
     * @tc.name      ConnectAgentExtension_stateName_Edge_0036
     * @tc.desc      [Large] Verify stateName(513) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(513);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0037
     * @tc.name      ConnectAgentExtension_stateName_Edge_0037
     * @tc.desc      [Large] Verify stateName(1023) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(1023);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0038
     * @tc.name      ConnectAgentExtension_stateName_Edge_0038
     * @tc.desc      [Large] Verify stateName(1024) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(1024);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0039
     * @tc.name      ConnectAgentExtension_stateName_Edge_0039
     * @tc.desc      [Large] Verify stateName(1025) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(1025);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0040
     * @tc.name      ConnectAgentExtension_stateName_Edge_0040
     * @tc.desc      [Large] Verify stateName(2047) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(2047);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0041
     * @tc.name      ConnectAgentExtension_stateName_Edge_0041
     * @tc.desc      [Large] Verify stateName(2048) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(2048);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0042
     * @tc.name      ConnectAgentExtension_stateName_Edge_0042
     * @tc.desc      [Large] Verify stateName(2049) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(2049);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0043
     * @tc.name      ConnectAgentExtension_stateName_Edge_0043
     * @tc.desc      [Large] Verify stateName(8191) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(8191);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0044
     * @tc.name      ConnectAgentExtension_stateName_Edge_0044
     * @tc.desc      [Large] Verify stateName(8192) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(8192);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0045
     * @tc.name      ConnectAgentExtension_stateName_Edge_0045
     * @tc.desc      [Large] Verify stateName(8193) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: UNKNOWN
      const actual: string = AgentModel.stateName(8193);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0046
     * @tc.name      ConnectAgentExtension_stateName_Edge_0046
     * @tc.desc      [Extreme] Verify stateName(16383) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: UNKNOWN
      const actual: string = AgentModel.stateName(16383);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0047
     * @tc.name      ConnectAgentExtension_stateName_Edge_0047
     * @tc.desc      [Extreme] Verify stateName(16384) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: UNKNOWN
      const actual: string = AgentModel.stateName(16384);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0048
     * @tc.name      ConnectAgentExtension_stateName_Edge_0048
     * @tc.desc      [Extreme] Verify stateName(16385) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: UNKNOWN
      const actual: string = AgentModel.stateName(16385);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0049
     * @tc.name      ConnectAgentExtension_stateName_Edge_0049
     * @tc.desc      [Extreme] Verify stateName(32767) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: UNKNOWN
      const actual: string = AgentModel.stateName(32767);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_STATE_NAME_EDGE_0050
     * @tc.name      ConnectAgentExtension_stateName_Edge_0050
     * @tc.desc      [Extreme] Verify stateName(32768) returns UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_stateName_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: UNKNOWN
      const actual: string = AgentModel.stateName(32768);
      expect(actual).assertEqual('UNKNOWN');
      expect(actual.length).assertEqual(7);
    });

  });
}
