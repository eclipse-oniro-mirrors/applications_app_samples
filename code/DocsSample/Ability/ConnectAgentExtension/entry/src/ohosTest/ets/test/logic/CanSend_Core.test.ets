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

/** Logic checks for canSend (50 cases). */
export default function canSendCoreTest(): void {
  describe('CanSendCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}CanSendCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}CanSendCoreTest end`);
    });
    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0001
     * @tc.name      ConnectAgentExtension_canSend_Core_0001
     * @tc.desc      [Negative|expected=false] Verify canSend(-10) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ConnectAgentExtension_canSend_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(-10);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0002
     * @tc.name      ConnectAgentExtension_canSend_Core_0002
     * @tc.desc      [Zero|expected=false] Verify canSend(0) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_canSend_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Zero|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(0);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0003
     * @tc.name      ConnectAgentExtension_canSend_Core_0003
     * @tc.desc      [Extreme|expected=false] Verify canSend(2147483647) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_canSend_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(2147483647);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0004
     * @tc.name      ConnectAgentExtension_canSend_Core_0004
     * @tc.desc      [SmallPositive|expected=false] Verify canSend(1) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_canSend_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(1);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0005
     * @tc.name      ConnectAgentExtension_canSend_Core_0005
     * @tc.desc      [Medium|expected=false] Verify canSend(100) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_canSend_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(100);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0006
     * @tc.name      ConnectAgentExtension_canSend_Core_0006
     * @tc.desc      [Negative|expected=false] Verify canSend(-9) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_canSend_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(-9);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0007
     * @tc.name      ConnectAgentExtension_canSend_Core_0007
     * @tc.desc      [SmallPositive|expected=true] Verify canSend(2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_canSend_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive|expected=true; expected: True
      const actual: boolean = AgentModel.canSend(2);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0008
     * @tc.name      ConnectAgentExtension_canSend_Core_0008
     * @tc.desc      [Extreme|expected=false] Verify canSend(65535) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_canSend_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(65535);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0009
     * @tc.name      ConnectAgentExtension_canSend_Core_0009
     * @tc.desc      [SmallPositive|expected=false] Verify canSend(3) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_canSend_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(3);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0010
     * @tc.name      ConnectAgentExtension_canSend_Core_0010
     * @tc.desc      [Large|expected=false] Verify canSend(1000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ConnectAgentExtension_canSend_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(1000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0011
     * @tc.name      ConnectAgentExtension_canSend_Core_0011
     * @tc.desc      [Negative|expected=false] Verify canSend(-8) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(-8);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0012
     * @tc.name      ConnectAgentExtension_canSend_Core_0012
     * @tc.desc      [Medium|expected=false] Verify canSend(4) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(4);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0013
     * @tc.name      ConnectAgentExtension_canSend_Core_0013
     * @tc.desc      [Negative|expected=false] Verify canSend(-2147483648) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(-2147483648);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0014
     * @tc.name      ConnectAgentExtension_canSend_Core_0014
     * @tc.desc      [Medium|expected=false] Verify canSend(5) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(5);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0015
     * @tc.name      ConnectAgentExtension_canSend_Core_0015
     * @tc.desc      [Large|expected=false] Verify canSend(1024) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(1024);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0016
     * @tc.name      ConnectAgentExtension_canSend_Core_0016
     * @tc.desc      [Negative|expected=false] Verify canSend(-7) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(-7);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0017
     * @tc.name      ConnectAgentExtension_canSend_Core_0017
     * @tc.desc      [Medium|expected=false] Verify canSend(6) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(6);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0018
     * @tc.name      ConnectAgentExtension_canSend_Core_0018
     * @tc.desc      [Large|expected=false] Verify canSend(256) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(256);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0019
     * @tc.name      ConnectAgentExtension_canSend_Core_0019
     * @tc.desc      [Medium|expected=false] Verify canSend(7) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(7);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0020
     * @tc.name      ConnectAgentExtension_canSend_Core_0020
     * @tc.desc      [Large|expected=false] Verify canSend(128) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(128);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0021
     * @tc.name      ConnectAgentExtension_canSend_Core_0021
     * @tc.desc      [Negative|expected=false] Verify canSend(-6) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(-6);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0022
     * @tc.name      ConnectAgentExtension_canSend_Core_0022
     * @tc.desc      [Medium|expected=false] Verify canSend(8) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(8);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0023
     * @tc.name      ConnectAgentExtension_canSend_Core_0023
     * @tc.desc      [Large|expected=false] Verify canSend(4096) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(4096);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0024
     * @tc.name      ConnectAgentExtension_canSend_Core_0024
     * @tc.desc      [Medium|expected=false] Verify canSend(9) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(9);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0025
     * @tc.name      ConnectAgentExtension_canSend_Core_0025
     * @tc.desc      [Medium|expected=false] Verify canSend(50) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(50);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0026
     * @tc.name      ConnectAgentExtension_canSend_Core_0026
     * @tc.desc      [Negative|expected=false] Verify canSend(-5) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(-5);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0027
     * @tc.name      ConnectAgentExtension_canSend_Core_0027
     * @tc.desc      [Medium|expected=false] Verify canSend(10) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(10);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0028
     * @tc.name      ConnectAgentExtension_canSend_Core_0028
     * @tc.desc      [Extreme|expected=false] Verify canSend(65535) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(65535);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0029
     * @tc.name      ConnectAgentExtension_canSend_Core_0029
     * @tc.desc      [Medium|expected=false] Verify canSend(11) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(11);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0030
     * @tc.name      ConnectAgentExtension_canSend_Core_0030
     * @tc.desc      [Large|expected=false] Verify canSend(10000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ConnectAgentExtension_canSend_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(10000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0031
     * @tc.name      ConnectAgentExtension_canSend_Core_0031
     * @tc.desc      [Negative|expected=false] Verify canSend(-4) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(-4);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0032
     * @tc.name      ConnectAgentExtension_canSend_Core_0032
     * @tc.desc      [Medium|expected=false] Verify canSend(12) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(12);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0033
     * @tc.name      ConnectAgentExtension_canSend_Core_0033
     * @tc.desc      [Medium|expected=false] Verify canSend(31) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(31);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0034
     * @tc.name      ConnectAgentExtension_canSend_Core_0034
     * @tc.desc      [Medium|expected=false] Verify canSend(13) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(13);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0035
     * @tc.name      ConnectAgentExtension_canSend_Core_0035
     * @tc.desc      [Medium|expected=false] Verify canSend(63) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(63);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0036
     * @tc.name      ConnectAgentExtension_canSend_Core_0036
     * @tc.desc      [Negative|expected=false] Verify canSend(-3) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(-3);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0037
     * @tc.name      ConnectAgentExtension_canSend_Core_0037
     * @tc.desc      [Medium|expected=false] Verify canSend(14) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(14);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0038
     * @tc.name      ConnectAgentExtension_canSend_Core_0038
     * @tc.desc      [Medium|expected=false] Verify canSend(32) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(32);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0039
     * @tc.name      ConnectAgentExtension_canSend_Core_0039
     * @tc.desc      [Medium|expected=false] Verify canSend(15) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(15);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0040
     * @tc.name      ConnectAgentExtension_canSend_Core_0040
     * @tc.desc      [Medium|expected=false] Verify canSend(64) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(64);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0041
     * @tc.name      ConnectAgentExtension_canSend_Core_0041
     * @tc.desc      [Negative|expected=false] Verify canSend(-2) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(-2);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0042
     * @tc.name      ConnectAgentExtension_canSend_Core_0042
     * @tc.desc      [Medium|expected=false] Verify canSend(16) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(16);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0043
     * @tc.name      ConnectAgentExtension_canSend_Core_0043
     * @tc.desc      [Large|expected=false] Verify canSend(127) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(127);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0044
     * @tc.name      ConnectAgentExtension_canSend_Core_0044
     * @tc.desc      [Medium|expected=false] Verify canSend(17) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(17);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0045
     * @tc.name      ConnectAgentExtension_canSend_Core_0045
     * @tc.desc      [Medium|expected=false] Verify canSend(25) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(25);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0046
     * @tc.name      ConnectAgentExtension_canSend_Core_0046
     * @tc.desc      [Negative|expected=false] Verify canSend(-1) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(-1);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0047
     * @tc.name      ConnectAgentExtension_canSend_Core_0047
     * @tc.desc      [Medium|expected=false] Verify canSend(18) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(18);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0048
     * @tc.name      ConnectAgentExtension_canSend_Core_0048
     * @tc.desc      [Large|expected=false] Verify canSend(255) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(255);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0049
     * @tc.name      ConnectAgentExtension_canSend_Core_0049
     * @tc.desc      [Medium|expected=false] Verify canSend(19) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(19);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CONNECT_AGENT_EXTENSION_CAN_SEND_CORE_0050
     * @tc.name      ConnectAgentExtension_canSend_Core_0050
     * @tc.desc      [Extreme|expected=false] Verify canSend(100000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ConnectAgentExtension_canSend_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = AgentModel.canSend(100000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

  });
}
