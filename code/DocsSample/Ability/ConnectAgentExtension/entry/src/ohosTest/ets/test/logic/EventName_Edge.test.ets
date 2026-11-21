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

/** Logic checks for eventName (50 cases). */
export default function eventNameEdgeTest(): void {
  describe('EventNameEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}EventNameEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}EventNameEdgeTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0001
     * @tc.name      ConnectAgentExtension_eventName_Edge_0001
     * @tc.desc      [Zero] Verify eventName(0) returns onData.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_eventName_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero; expected: onData
      const actual: string = AgentModel.eventName(0);
      expect(actual).assertEqual('onData');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0002
     * @tc.name      ConnectAgentExtension_eventName_Edge_0002
     * @tc.desc      [SmallPositive] Verify eventName(1) returns onAuth.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: onAuth
      const actual: string = AgentModel.eventName(1);
      expect(actual).assertEqual('onAuth');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0003
     * @tc.name      ConnectAgentExtension_eventName_Edge_0003
     * @tc.desc      [Negative] Verify eventName(-1) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-1);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0004
     * @tc.name      ConnectAgentExtension_eventName_Edge_0004
     * @tc.desc      [SmallPositive] Verify eventName(2) returns onDisconnect.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: onDisconnect
      const actual: string = AgentModel.eventName(2);
      expect(actual).assertEqual('onDisconnect');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0005
     * @tc.name      ConnectAgentExtension_eventName_Edge_0005
     * @tc.desc      [Negative] Verify eventName(-2) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-2);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0006
     * @tc.name      ConnectAgentExtension_eventName_Edge_0006
     * @tc.desc      [SmallPositive] Verify eventName(3) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: unknown
      const actual: string = AgentModel.eventName(3);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0007
     * @tc.name      ConnectAgentExtension_eventName_Edge_0007
     * @tc.desc      [Negative] Verify eventName(-3) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-3);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0008
     * @tc.name      ConnectAgentExtension_eventName_Edge_0008
     * @tc.desc      [Medium] Verify eventName(4) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(4);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0009
     * @tc.name      ConnectAgentExtension_eventName_Edge_0009
     * @tc.desc      [Negative] Verify eventName(-4) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-4);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0010
     * @tc.name      ConnectAgentExtension_eventName_Edge_0010
     * @tc.desc      [Medium] Verify eventName(5) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(5);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0011
     * @tc.name      ConnectAgentExtension_eventName_Edge_0011
     * @tc.desc      [Negative] Verify eventName(-5) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-5);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0012
     * @tc.name      ConnectAgentExtension_eventName_Edge_0012
     * @tc.desc      [Medium] Verify eventName(10) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(10);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0013
     * @tc.name      ConnectAgentExtension_eventName_Edge_0013
     * @tc.desc      [Negative] Verify eventName(-10) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-10);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0014
     * @tc.name      ConnectAgentExtension_eventName_Edge_0014
     * @tc.desc      [Medium] Verify eventName(100) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(100);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0015
     * @tc.name      ConnectAgentExtension_eventName_Edge_0015
     * @tc.desc      [Negative] Verify eventName(-100) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-100);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0016
     * @tc.name      ConnectAgentExtension_eventName_Edge_0016
     * @tc.desc      [Large] Verify eventName(1000) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(1000);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0017
     * @tc.name      ConnectAgentExtension_eventName_Edge_0017
     * @tc.desc      [Negative] Verify eventName(-1000) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-1000);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0018
     * @tc.name      ConnectAgentExtension_eventName_Edge_0018
     * @tc.desc      [Large] Verify eventName(1024) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(1024);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0019
     * @tc.name      ConnectAgentExtension_eventName_Edge_0019
     * @tc.desc      [Negative] Verify eventName(-1024) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-1024);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0020
     * @tc.name      ConnectAgentExtension_eventName_Edge_0020
     * @tc.desc      [Large] Verify eventName(4096) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(4096);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0021
     * @tc.name      ConnectAgentExtension_eventName_Edge_0021
     * @tc.desc      [Negative] Verify eventName(-4096) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-4096);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0022
     * @tc.name      ConnectAgentExtension_eventName_Edge_0022
     * @tc.desc      [Extreme] Verify eventName(65535) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: unknown
      const actual: string = AgentModel.eventName(65535);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0023
     * @tc.name      ConnectAgentExtension_eventName_Edge_0023
     * @tc.desc      [Negative] Verify eventName(-65535) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-65535);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0024
     * @tc.name      ConnectAgentExtension_eventName_Edge_0024
     * @tc.desc      [Extreme] Verify eventName(2147483647) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: unknown
      const actual: string = AgentModel.eventName(2147483647);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0025
     * @tc.name      ConnectAgentExtension_eventName_Edge_0025
     * @tc.desc      [Negative] Verify eventName(-2147483648) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-2147483648);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0026
     * @tc.name      ConnectAgentExtension_eventName_Edge_0026
     * @tc.desc      [Extreme] Verify eventName(2147483646) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: unknown
      const actual: string = AgentModel.eventName(2147483646);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0027
     * @tc.name      ConnectAgentExtension_eventName_Edge_0027
     * @tc.desc      [Negative] Verify eventName(-2147483647) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-2147483647);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0028
     * @tc.name      ConnectAgentExtension_eventName_Edge_0028
     * @tc.desc      [Large] Verify eventName(127) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(127);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0029
     * @tc.name      ConnectAgentExtension_eventName_Edge_0029
     * @tc.desc      [Large] Verify eventName(128) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(128);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0030
     * @tc.name      ConnectAgentExtension_eventName_Edge_0030
     * @tc.desc      [Large] Verify eventName(129) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(129);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0031
     * @tc.name      ConnectAgentExtension_eventName_Edge_0031
     * @tc.desc      [Large] Verify eventName(255) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(255);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0032
     * @tc.name      ConnectAgentExtension_eventName_Edge_0032
     * @tc.desc      [Large] Verify eventName(256) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(256);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0033
     * @tc.name      ConnectAgentExtension_eventName_Edge_0033
     * @tc.desc      [Large] Verify eventName(257) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(257);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0034
     * @tc.name      ConnectAgentExtension_eventName_Edge_0034
     * @tc.desc      [Large] Verify eventName(511) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(511);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0035
     * @tc.name      ConnectAgentExtension_eventName_Edge_0035
     * @tc.desc      [Large] Verify eventName(512) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(512);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0036
     * @tc.name      ConnectAgentExtension_eventName_Edge_0036
     * @tc.desc      [Large] Verify eventName(513) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(513);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0037
     * @tc.name      ConnectAgentExtension_eventName_Edge_0037
     * @tc.desc      [Large] Verify eventName(1023) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(1023);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0038
     * @tc.name      ConnectAgentExtension_eventName_Edge_0038
     * @tc.desc      [Large] Verify eventName(1024) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(1024);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0039
     * @tc.name      ConnectAgentExtension_eventName_Edge_0039
     * @tc.desc      [Large] Verify eventName(1025) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(1025);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0040
     * @tc.name      ConnectAgentExtension_eventName_Edge_0040
     * @tc.desc      [Large] Verify eventName(2047) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(2047);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0041
     * @tc.name      ConnectAgentExtension_eventName_Edge_0041
     * @tc.desc      [Large] Verify eventName(2048) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(2048);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0042
     * @tc.name      ConnectAgentExtension_eventName_Edge_0042
     * @tc.desc      [Large] Verify eventName(2049) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(2049);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0043
     * @tc.name      ConnectAgentExtension_eventName_Edge_0043
     * @tc.desc      [Large] Verify eventName(8191) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(8191);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0044
     * @tc.name      ConnectAgentExtension_eventName_Edge_0044
     * @tc.desc      [Large] Verify eventName(8192) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(8192);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0045
     * @tc.name      ConnectAgentExtension_eventName_Edge_0045
     * @tc.desc      [Large] Verify eventName(8193) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(8193);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0046
     * @tc.name      ConnectAgentExtension_eventName_Edge_0046
     * @tc.desc      [Extreme] Verify eventName(16383) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: unknown
      const actual: string = AgentModel.eventName(16383);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0047
     * @tc.name      ConnectAgentExtension_eventName_Edge_0047
     * @tc.desc      [Extreme] Verify eventName(16384) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: unknown
      const actual: string = AgentModel.eventName(16384);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0048
     * @tc.name      ConnectAgentExtension_eventName_Edge_0048
     * @tc.desc      [Extreme] Verify eventName(16385) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: unknown
      const actual: string = AgentModel.eventName(16385);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0049
     * @tc.name      ConnectAgentExtension_eventName_Edge_0049
     * @tc.desc      [Extreme] Verify eventName(32767) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: unknown
      const actual: string = AgentModel.eventName(32767);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_EDGE_0050
     * @tc.name      ConnectAgentExtension_eventName_Edge_0050
     * @tc.desc      [Extreme] Verify eventName(32768) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: unknown
      const actual: string = AgentModel.eventName(32768);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

  });
}
