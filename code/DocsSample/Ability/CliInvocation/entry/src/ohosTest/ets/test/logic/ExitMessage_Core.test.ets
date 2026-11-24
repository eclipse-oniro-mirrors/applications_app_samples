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
import { CliModel } from '../Shared/CliFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_cliinvocation]';
const BUNDLE: string = 'CliInvocation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for exitMessage (50 cases). */
export default function exitMessageCoreTest(): void {
  describe('ExitMessageCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}ExitMessageCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}ExitMessageCoreTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0001
     * @tc.name      CliInvocation_exitMessage_Core_0001
     * @tc.desc      [Zero+Zero] Verify exitMessage(0, 0) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_exitMessage_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero+Zero; expected: start success
      const actual: string = CliModel.exitMessage(0, 0);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0002
     * @tc.name      CliInvocation_exitMessage_Core_0002
     * @tc.desc      [SmallPositive+SmallPositive] Verify exitMessage(1, 1) returns start failed, ret = 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+SmallPositive; expected: start failed, ret = 1
      const actual: string = CliModel.exitMessage(1, 1);
      expect(actual).assertEqual('start failed, ret = 1');
      expect(actual.length).assertEqual(21);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0003
     * @tc.name      CliInvocation_exitMessage_Core_0003
     * @tc.desc      [SmallPositive+SmallPositive] Verify exitMessage(2, 2) returns start failed, ret = 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+SmallPositive; expected: start failed, ret = 2
      const actual: string = CliModel.exitMessage(2, 2);
      expect(actual).assertEqual('start failed, ret = 2');
      expect(actual.length).assertEqual(21);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0004
     * @tc.name      CliInvocation_exitMessage_Core_0004
     * @tc.desc      [Zero+SmallPositive] Verify exitMessage(0, 3) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Zero+SmallPositive; expected: start success
      const actual: string = CliModel.exitMessage(0, 3);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0005
     * @tc.name      CliInvocation_exitMessage_Core_0005
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 4) returns start failed, ret = 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 4
      const actual: string = CliModel.exitMessage(1, 4);
      expect(actual).assertEqual('start failed, ret = 4');
      expect(actual.length).assertEqual(21);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0006
     * @tc.name      CliInvocation_exitMessage_Core_0006
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 5) returns start failed, ret = 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 5
      const actual: string = CliModel.exitMessage(2, 5);
      expect(actual).assertEqual('start failed, ret = 5');
      expect(actual.length).assertEqual(21);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0007
     * @tc.name      CliInvocation_exitMessage_Core_0007
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 6) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 6);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0008
     * @tc.name      CliInvocation_exitMessage_Core_0008
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 7) returns start failed, ret = 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 7
      const actual: string = CliModel.exitMessage(1, 7);
      expect(actual).assertEqual('start failed, ret = 7');
      expect(actual.length).assertEqual(21);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0009
     * @tc.name      CliInvocation_exitMessage_Core_0009
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 8) returns start failed, ret = 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 8
      const actual: string = CliModel.exitMessage(2, 8);
      expect(actual).assertEqual('start failed, ret = 8');
      expect(actual.length).assertEqual(21);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0010
     * @tc.name      CliInvocation_exitMessage_Core_0010
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 9) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 9);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0011
     * @tc.name      CliInvocation_exitMessage_Core_0011
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 10) returns start failed, ret = 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 10
      const actual: string = CliModel.exitMessage(1, 10);
      expect(actual).assertEqual('start failed, ret = 10');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0012
     * @tc.name      CliInvocation_exitMessage_Core_0012
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 11) returns start failed, ret = 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 11
      const actual: string = CliModel.exitMessage(2, 11);
      expect(actual).assertEqual('start failed, ret = 11');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0013
     * @tc.name      CliInvocation_exitMessage_Core_0013
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 12) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 12);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0014
     * @tc.name      CliInvocation_exitMessage_Core_0014
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 13) returns start failed, ret = 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 13
      const actual: string = CliModel.exitMessage(1, 13);
      expect(actual).assertEqual('start failed, ret = 13');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0015
     * @tc.name      CliInvocation_exitMessage_Core_0015
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 14) returns start failed, ret = 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 14
      const actual: string = CliModel.exitMessage(2, 14);
      expect(actual).assertEqual('start failed, ret = 14');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0016
     * @tc.name      CliInvocation_exitMessage_Core_0016
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 15) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 15);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0017
     * @tc.name      CliInvocation_exitMessage_Core_0017
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 16) returns start failed, ret = 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 16
      const actual: string = CliModel.exitMessage(1, 16);
      expect(actual).assertEqual('start failed, ret = 16');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0018
     * @tc.name      CliInvocation_exitMessage_Core_0018
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 17) returns start failed, ret = 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 17
      const actual: string = CliModel.exitMessage(2, 17);
      expect(actual).assertEqual('start failed, ret = 17');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0019
     * @tc.name      CliInvocation_exitMessage_Core_0019
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 18) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 18);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0020
     * @tc.name      CliInvocation_exitMessage_Core_0020
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 19) returns start failed, ret = 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 19
      const actual: string = CliModel.exitMessage(1, 19);
      expect(actual).assertEqual('start failed, ret = 19');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0021
     * @tc.name      CliInvocation_exitMessage_Core_0021
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 20) returns start failed, ret = 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 20
      const actual: string = CliModel.exitMessage(2, 20);
      expect(actual).assertEqual('start failed, ret = 20');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0022
     * @tc.name      CliInvocation_exitMessage_Core_0022
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 21) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 21);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0023
     * @tc.name      CliInvocation_exitMessage_Core_0023
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 22) returns start failed, ret = 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 22
      const actual: string = CliModel.exitMessage(1, 22);
      expect(actual).assertEqual('start failed, ret = 22');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0024
     * @tc.name      CliInvocation_exitMessage_Core_0024
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 23) returns start failed, ret = 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 23
      const actual: string = CliModel.exitMessage(2, 23);
      expect(actual).assertEqual('start failed, ret = 23');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0025
     * @tc.name      CliInvocation_exitMessage_Core_0025
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 24) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 24);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0026
     * @tc.name      CliInvocation_exitMessage_Core_0026
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 25) returns start failed, ret = 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 25
      const actual: string = CliModel.exitMessage(1, 25);
      expect(actual).assertEqual('start failed, ret = 25');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0027
     * @tc.name      CliInvocation_exitMessage_Core_0027
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 26) returns start failed, ret = 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 26
      const actual: string = CliModel.exitMessage(2, 26);
      expect(actual).assertEqual('start failed, ret = 26');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0028
     * @tc.name      CliInvocation_exitMessage_Core_0028
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 27) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 27);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0029
     * @tc.name      CliInvocation_exitMessage_Core_0029
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 28) returns start failed, ret = 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 28
      const actual: string = CliModel.exitMessage(1, 28);
      expect(actual).assertEqual('start failed, ret = 28');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0030
     * @tc.name      CliInvocation_exitMessage_Core_0030
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 29) returns start failed, ret = 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 29
      const actual: string = CliModel.exitMessage(2, 29);
      expect(actual).assertEqual('start failed, ret = 29');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0031
     * @tc.name      CliInvocation_exitMessage_Core_0031
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 30) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 30);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0032
     * @tc.name      CliInvocation_exitMessage_Core_0032
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 31) returns start failed, ret = 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 31
      const actual: string = CliModel.exitMessage(1, 31);
      expect(actual).assertEqual('start failed, ret = 31');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0033
     * @tc.name      CliInvocation_exitMessage_Core_0033
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 32) returns start failed, ret = 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 32
      const actual: string = CliModel.exitMessage(2, 32);
      expect(actual).assertEqual('start failed, ret = 32');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0034
     * @tc.name      CliInvocation_exitMessage_Core_0034
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 33) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 33);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0035
     * @tc.name      CliInvocation_exitMessage_Core_0035
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 34) returns start failed, ret = 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 34
      const actual: string = CliModel.exitMessage(1, 34);
      expect(actual).assertEqual('start failed, ret = 34');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0036
     * @tc.name      CliInvocation_exitMessage_Core_0036
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 35) returns start failed, ret = 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 35
      const actual: string = CliModel.exitMessage(2, 35);
      expect(actual).assertEqual('start failed, ret = 35');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0037
     * @tc.name      CliInvocation_exitMessage_Core_0037
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 36) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 36);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0038
     * @tc.name      CliInvocation_exitMessage_Core_0038
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 37) returns start failed, ret = 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 37
      const actual: string = CliModel.exitMessage(1, 37);
      expect(actual).assertEqual('start failed, ret = 37');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0039
     * @tc.name      CliInvocation_exitMessage_Core_0039
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 38) returns start failed, ret = 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 38
      const actual: string = CliModel.exitMessage(2, 38);
      expect(actual).assertEqual('start failed, ret = 38');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0040
     * @tc.name      CliInvocation_exitMessage_Core_0040
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 39) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 39);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0041
     * @tc.name      CliInvocation_exitMessage_Core_0041
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 40) returns start failed, ret = 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 40
      const actual: string = CliModel.exitMessage(1, 40);
      expect(actual).assertEqual('start failed, ret = 40');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0042
     * @tc.name      CliInvocation_exitMessage_Core_0042
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 41) returns start failed, ret = 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 41
      const actual: string = CliModel.exitMessage(2, 41);
      expect(actual).assertEqual('start failed, ret = 41');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0043
     * @tc.name      CliInvocation_exitMessage_Core_0043
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 42) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 42);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0044
     * @tc.name      CliInvocation_exitMessage_Core_0044
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 43) returns start failed, ret = 43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 43
      const actual: string = CliModel.exitMessage(1, 43);
      expect(actual).assertEqual('start failed, ret = 43');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0045
     * @tc.name      CliInvocation_exitMessage_Core_0045
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 44) returns start failed, ret = 44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 44
      const actual: string = CliModel.exitMessage(2, 44);
      expect(actual).assertEqual('start failed, ret = 44');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0046
     * @tc.name      CliInvocation_exitMessage_Core_0046
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 45) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 45);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0047
     * @tc.name      CliInvocation_exitMessage_Core_0047
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 46) returns start failed, ret = 46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 46
      const actual: string = CliModel.exitMessage(1, 46);
      expect(actual).assertEqual('start failed, ret = 46');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0048
     * @tc.name      CliInvocation_exitMessage_Core_0048
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 47) returns start failed, ret = 47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 47
      const actual: string = CliModel.exitMessage(2, 47);
      expect(actual).assertEqual('start failed, ret = 47');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0049
     * @tc.name      CliInvocation_exitMessage_Core_0049
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 48) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 48);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_CORE_0050
     * @tc.name      CliInvocation_exitMessage_Core_0050
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 49) returns start failed, ret = 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 49
      const actual: string = CliModel.exitMessage(1, 49);
      expect(actual).assertEqual('start failed, ret = 49');
      expect(actual.length).assertEqual(22);
    });

  });
}
