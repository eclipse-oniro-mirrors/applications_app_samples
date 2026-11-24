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
export default function eventNameCoreTest(): void {
  describe('EventNameCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}EventNameCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}EventNameCoreTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0001
     * @tc.name      ConnectAgentExtension_eventName_Core_0001
     * @tc.desc      [Negative] Verify eventName(-10) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_eventName_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-10);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0002
     * @tc.name      ConnectAgentExtension_eventName_Core_0002
     * @tc.desc      [Zero] Verify eventName(0) returns onData.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Zero; expected: onData
      const actual: string = AgentModel.eventName(0);
      expect(actual).assertEqual('onData');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0003
     * @tc.name      ConnectAgentExtension_eventName_Core_0003
     * @tc.desc      [Extreme] Verify eventName(2147483647) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Extreme; expected: unknown
      const actual: string = AgentModel.eventName(2147483647);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0004
     * @tc.name      ConnectAgentExtension_eventName_Core_0004
     * @tc.desc      [SmallPositive] Verify eventName(1) returns onAuth.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: onAuth
      const actual: string = AgentModel.eventName(1);
      expect(actual).assertEqual('onAuth');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0005
     * @tc.name      ConnectAgentExtension_eventName_Core_0005
     * @tc.desc      [Medium] Verify eventName(100) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(100);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0006
     * @tc.name      ConnectAgentExtension_eventName_Core_0006
     * @tc.desc      [Negative] Verify eventName(-9) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-9);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0007
     * @tc.name      ConnectAgentExtension_eventName_Core_0007
     * @tc.desc      [SmallPositive] Verify eventName(2) returns onDisconnect.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: onDisconnect
      const actual: string = AgentModel.eventName(2);
      expect(actual).assertEqual('onDisconnect');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0008
     * @tc.name      ConnectAgentExtension_eventName_Core_0008
     * @tc.desc      [Extreme] Verify eventName(65535) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Extreme; expected: unknown
      const actual: string = AgentModel.eventName(65535);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0009
     * @tc.name      ConnectAgentExtension_eventName_Core_0009
     * @tc.desc      [SmallPositive] Verify eventName(3) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: unknown
      const actual: string = AgentModel.eventName(3);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0010
     * @tc.name      ConnectAgentExtension_eventName_Core_0010
     * @tc.desc      [Large] Verify eventName(1000) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_eventName_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(1000);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0011
     * @tc.name      ConnectAgentExtension_eventName_Core_0011
     * @tc.desc      [Negative] Verify eventName(-8) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-8);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0012
     * @tc.name      ConnectAgentExtension_eventName_Core_0012
     * @tc.desc      [Medium] Verify eventName(4) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(4);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0013
     * @tc.name      ConnectAgentExtension_eventName_Core_0013
     * @tc.desc      [Negative] Verify eventName(-2147483648) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-2147483648);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0014
     * @tc.name      ConnectAgentExtension_eventName_Core_0014
     * @tc.desc      [Medium] Verify eventName(5) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(5);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0015
     * @tc.name      ConnectAgentExtension_eventName_Core_0015
     * @tc.desc      [Large] Verify eventName(1024) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(1024);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0016
     * @tc.name      ConnectAgentExtension_eventName_Core_0016
     * @tc.desc      [Negative] Verify eventName(-7) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-7);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0017
     * @tc.name      ConnectAgentExtension_eventName_Core_0017
     * @tc.desc      [Medium] Verify eventName(6) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(6);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0018
     * @tc.name      ConnectAgentExtension_eventName_Core_0018
     * @tc.desc      [Large] Verify eventName(256) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(256);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0019
     * @tc.name      ConnectAgentExtension_eventName_Core_0019
     * @tc.desc      [Medium] Verify eventName(7) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(7);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0020
     * @tc.name      ConnectAgentExtension_eventName_Core_0020
     * @tc.desc      [Large] Verify eventName(128) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(128);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0021
     * @tc.name      ConnectAgentExtension_eventName_Core_0021
     * @tc.desc      [Negative] Verify eventName(-6) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-6);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0022
     * @tc.name      ConnectAgentExtension_eventName_Core_0022
     * @tc.desc      [Medium] Verify eventName(8) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(8);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0023
     * @tc.name      ConnectAgentExtension_eventName_Core_0023
     * @tc.desc      [Large] Verify eventName(4096) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(4096);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0024
     * @tc.name      ConnectAgentExtension_eventName_Core_0024
     * @tc.desc      [Medium] Verify eventName(9) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(9);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0025
     * @tc.name      ConnectAgentExtension_eventName_Core_0025
     * @tc.desc      [Medium] Verify eventName(50) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(50);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0026
     * @tc.name      ConnectAgentExtension_eventName_Core_0026
     * @tc.desc      [Negative] Verify eventName(-5) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-5);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0027
     * @tc.name      ConnectAgentExtension_eventName_Core_0027
     * @tc.desc      [Medium] Verify eventName(10) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(10);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0028
     * @tc.name      ConnectAgentExtension_eventName_Core_0028
     * @tc.desc      [Extreme] Verify eventName(65535) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: unknown
      const actual: string = AgentModel.eventName(65535);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0029
     * @tc.name      ConnectAgentExtension_eventName_Core_0029
     * @tc.desc      [Medium] Verify eventName(11) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(11);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0030
     * @tc.name      ConnectAgentExtension_eventName_Core_0030
     * @tc.desc      [Large] Verify eventName(10000) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_eventName_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(10000);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0031
     * @tc.name      ConnectAgentExtension_eventName_Core_0031
     * @tc.desc      [Negative] Verify eventName(-4) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-4);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0032
     * @tc.name      ConnectAgentExtension_eventName_Core_0032
     * @tc.desc      [Medium] Verify eventName(12) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(12);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0033
     * @tc.name      ConnectAgentExtension_eventName_Core_0033
     * @tc.desc      [Medium] Verify eventName(31) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(31);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0034
     * @tc.name      ConnectAgentExtension_eventName_Core_0034
     * @tc.desc      [Medium] Verify eventName(13) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(13);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0035
     * @tc.name      ConnectAgentExtension_eventName_Core_0035
     * @tc.desc      [Medium] Verify eventName(63) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(63);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0036
     * @tc.name      ConnectAgentExtension_eventName_Core_0036
     * @tc.desc      [Negative] Verify eventName(-3) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-3);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0037
     * @tc.name      ConnectAgentExtension_eventName_Core_0037
     * @tc.desc      [Medium] Verify eventName(14) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(14);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0038
     * @tc.name      ConnectAgentExtension_eventName_Core_0038
     * @tc.desc      [Medium] Verify eventName(32) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(32);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0039
     * @tc.name      ConnectAgentExtension_eventName_Core_0039
     * @tc.desc      [Medium] Verify eventName(15) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(15);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0040
     * @tc.name      ConnectAgentExtension_eventName_Core_0040
     * @tc.desc      [Medium] Verify eventName(64) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(64);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0041
     * @tc.name      ConnectAgentExtension_eventName_Core_0041
     * @tc.desc      [Negative] Verify eventName(-2) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-2);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0042
     * @tc.name      ConnectAgentExtension_eventName_Core_0042
     * @tc.desc      [Medium] Verify eventName(16) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(16);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0043
     * @tc.name      ConnectAgentExtension_eventName_Core_0043
     * @tc.desc      [Large] Verify eventName(127) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(127);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0044
     * @tc.name      ConnectAgentExtension_eventName_Core_0044
     * @tc.desc      [Medium] Verify eventName(17) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(17);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0045
     * @tc.name      ConnectAgentExtension_eventName_Core_0045
     * @tc.desc      [Medium] Verify eventName(25) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(25);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0046
     * @tc.name      ConnectAgentExtension_eventName_Core_0046
     * @tc.desc      [Negative] Verify eventName(-1) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: unknown
      const actual: string = AgentModel.eventName(-1);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0047
     * @tc.name      ConnectAgentExtension_eventName_Core_0047
     * @tc.desc      [Medium] Verify eventName(18) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(18);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0048
     * @tc.name      ConnectAgentExtension_eventName_Core_0048
     * @tc.desc      [Large] Verify eventName(255) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown
      const actual: string = AgentModel.eventName(255);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0049
     * @tc.name      ConnectAgentExtension_eventName_Core_0049
     * @tc.desc      [Medium] Verify eventName(19) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown
      const actual: string = AgentModel.eventName(19);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_EVENT_NAME_CORE_0050
     * @tc.name      ConnectAgentExtension_eventName_Core_0050
     * @tc.desc      [Extreme] Verify eventName(100000) returns unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_eventName_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: unknown
      const actual: string = AgentModel.eventName(100000);
      expect(actual).assertEqual('unknown');
      expect(actual.length).assertEqual(7);
    });

  });
}
