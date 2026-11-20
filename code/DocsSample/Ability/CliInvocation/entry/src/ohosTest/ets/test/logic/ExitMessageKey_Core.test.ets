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

/** Logic checks for exitMessageKey (50 cases). */
export default function exitMessageKeyCoreTest(): void {
  describe('ExitMessageKeyCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}ExitMessageKeyCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}ExitMessageKeyCoreTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0001
     * @tc.name      CliInvocation_exitMessageKey_Core_0001
     * @tc.desc      [Zero] Verify exitMessageKey(0) returns message_start_success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_exitMessageKey_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero; expected: message_start_success
      const actual: string = CliModel.exitMessageKey(0);
      expect(actual).assertEqual('message_start_success');
      expect(actual.length).assertEqual(21);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0002
     * @tc.name      CliInvocation_exitMessageKey_Core_0002
     * @tc.desc      [Negative] Verify exitMessageKey(-1) returns message_start_failed_fork.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessageKey_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: message_start_failed_fork
      const actual: string = CliModel.exitMessageKey(-1);
      expect(actual).assertEqual('message_start_failed_fork');
      expect(actual.length).assertEqual(25);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0003
     * @tc.name      CliInvocation_exitMessageKey_Core_0003
     * @tc.desc      [Large] Verify exitMessageKey(127) returns message_start_failed_exec.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessageKey_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: message_start_failed_exec
      const actual: string = CliModel.exitMessageKey(127);
      expect(actual).assertEqual('message_start_failed_exec');
      expect(actual.length).assertEqual(25);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0004
     * @tc.name      CliInvocation_exitMessageKey_Core_0004
     * @tc.desc      [Zero] Verify exitMessageKey(0) returns message_start_success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessageKey_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Zero; expected: message_start_success
      const actual: string = CliModel.exitMessageKey(0);
      expect(actual).assertEqual('message_start_success');
      expect(actual.length).assertEqual(21);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0005
     * @tc.name      CliInvocation_exitMessageKey_Core_0005
     * @tc.desc      [SmallPositive] Verify exitMessageKey(1) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessageKey_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(1);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0006
     * @tc.name      CliInvocation_exitMessageKey_Core_0006
     * @tc.desc      [SmallPositive] Verify exitMessageKey(2) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessageKey_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(2);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0007
     * @tc.name      CliInvocation_exitMessageKey_Core_0007
     * @tc.desc      [SmallPositive] Verify exitMessageKey(3) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessageKey_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(3);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0008
     * @tc.name      CliInvocation_exitMessageKey_Core_0008
     * @tc.desc      [Medium] Verify exitMessageKey(4) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessageKey_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(4);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0009
     * @tc.name      CliInvocation_exitMessageKey_Core_0009
     * @tc.desc      [Medium] Verify exitMessageKey(5) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessageKey_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(5);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0010
     * @tc.name      CliInvocation_exitMessageKey_Core_0010
     * @tc.desc      [Medium] Verify exitMessageKey(6) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessageKey_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(6);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0011
     * @tc.name      CliInvocation_exitMessageKey_Core_0011
     * @tc.desc      [Medium] Verify exitMessageKey(7) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(7);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0012
     * @tc.name      CliInvocation_exitMessageKey_Core_0012
     * @tc.desc      [Medium] Verify exitMessageKey(8) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(8);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0013
     * @tc.name      CliInvocation_exitMessageKey_Core_0013
     * @tc.desc      [Medium] Verify exitMessageKey(9) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(9);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0014
     * @tc.name      CliInvocation_exitMessageKey_Core_0014
     * @tc.desc      [Medium] Verify exitMessageKey(10) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(10);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0015
     * @tc.name      CliInvocation_exitMessageKey_Core_0015
     * @tc.desc      [Medium] Verify exitMessageKey(11) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(11);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0016
     * @tc.name      CliInvocation_exitMessageKey_Core_0016
     * @tc.desc      [Medium] Verify exitMessageKey(12) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(12);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0017
     * @tc.name      CliInvocation_exitMessageKey_Core_0017
     * @tc.desc      [Medium] Verify exitMessageKey(13) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(13);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0018
     * @tc.name      CliInvocation_exitMessageKey_Core_0018
     * @tc.desc      [Medium] Verify exitMessageKey(14) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(14);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0019
     * @tc.name      CliInvocation_exitMessageKey_Core_0019
     * @tc.desc      [Medium] Verify exitMessageKey(15) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(15);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0020
     * @tc.name      CliInvocation_exitMessageKey_Core_0020
     * @tc.desc      [Medium] Verify exitMessageKey(16) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(16);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0021
     * @tc.name      CliInvocation_exitMessageKey_Core_0021
     * @tc.desc      [Medium] Verify exitMessageKey(17) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(17);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0022
     * @tc.name      CliInvocation_exitMessageKey_Core_0022
     * @tc.desc      [Medium] Verify exitMessageKey(18) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(18);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0023
     * @tc.name      CliInvocation_exitMessageKey_Core_0023
     * @tc.desc      [Medium] Verify exitMessageKey(19) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(19);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0024
     * @tc.name      CliInvocation_exitMessageKey_Core_0024
     * @tc.desc      [Medium] Verify exitMessageKey(20) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(20);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0025
     * @tc.name      CliInvocation_exitMessageKey_Core_0025
     * @tc.desc      [Medium] Verify exitMessageKey(21) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(21);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0026
     * @tc.name      CliInvocation_exitMessageKey_Core_0026
     * @tc.desc      [Medium] Verify exitMessageKey(22) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(22);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0027
     * @tc.name      CliInvocation_exitMessageKey_Core_0027
     * @tc.desc      [Medium] Verify exitMessageKey(23) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(23);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0028
     * @tc.name      CliInvocation_exitMessageKey_Core_0028
     * @tc.desc      [Medium] Verify exitMessageKey(24) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(24);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0029
     * @tc.name      CliInvocation_exitMessageKey_Core_0029
     * @tc.desc      [Medium] Verify exitMessageKey(25) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(25);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0030
     * @tc.name      CliInvocation_exitMessageKey_Core_0030
     * @tc.desc      [Medium] Verify exitMessageKey(26) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessageKey_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(26);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0031
     * @tc.name      CliInvocation_exitMessageKey_Core_0031
     * @tc.desc      [Medium] Verify exitMessageKey(27) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(27);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0032
     * @tc.name      CliInvocation_exitMessageKey_Core_0032
     * @tc.desc      [Medium] Verify exitMessageKey(28) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(28);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0033
     * @tc.name      CliInvocation_exitMessageKey_Core_0033
     * @tc.desc      [Medium] Verify exitMessageKey(29) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(29);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0034
     * @tc.name      CliInvocation_exitMessageKey_Core_0034
     * @tc.desc      [Medium] Verify exitMessageKey(30) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(30);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0035
     * @tc.name      CliInvocation_exitMessageKey_Core_0035
     * @tc.desc      [Medium] Verify exitMessageKey(31) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(31);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0036
     * @tc.name      CliInvocation_exitMessageKey_Core_0036
     * @tc.desc      [Medium] Verify exitMessageKey(32) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(32);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0037
     * @tc.name      CliInvocation_exitMessageKey_Core_0037
     * @tc.desc      [Medium] Verify exitMessageKey(33) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(33);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0038
     * @tc.name      CliInvocation_exitMessageKey_Core_0038
     * @tc.desc      [Medium] Verify exitMessageKey(34) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(34);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0039
     * @tc.name      CliInvocation_exitMessageKey_Core_0039
     * @tc.desc      [Medium] Verify exitMessageKey(35) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(35);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0040
     * @tc.name      CliInvocation_exitMessageKey_Core_0040
     * @tc.desc      [Medium] Verify exitMessageKey(36) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(36);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0041
     * @tc.name      CliInvocation_exitMessageKey_Core_0041
     * @tc.desc      [Medium] Verify exitMessageKey(37) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(37);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0042
     * @tc.name      CliInvocation_exitMessageKey_Core_0042
     * @tc.desc      [Medium] Verify exitMessageKey(38) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(38);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0043
     * @tc.name      CliInvocation_exitMessageKey_Core_0043
     * @tc.desc      [Medium] Verify exitMessageKey(39) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(39);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0044
     * @tc.name      CliInvocation_exitMessageKey_Core_0044
     * @tc.desc      [Medium] Verify exitMessageKey(40) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(40);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0045
     * @tc.name      CliInvocation_exitMessageKey_Core_0045
     * @tc.desc      [Medium] Verify exitMessageKey(41) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(41);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0046
     * @tc.name      CliInvocation_exitMessageKey_Core_0046
     * @tc.desc      [Medium] Verify exitMessageKey(42) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(42);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0047
     * @tc.name      CliInvocation_exitMessageKey_Core_0047
     * @tc.desc      [Medium] Verify exitMessageKey(43) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(43);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0048
     * @tc.name      CliInvocation_exitMessageKey_Core_0048
     * @tc.desc      [Medium] Verify exitMessageKey(44) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(44);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0049
     * @tc.name      CliInvocation_exitMessageKey_Core_0049
     * @tc.desc      [Medium] Verify exitMessageKey(45) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(45);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_KEY_CORE_0050
     * @tc.name      CliInvocation_exitMessageKey_Core_0050
     * @tc.desc      [Medium] Verify exitMessageKey(46) returns message_start_failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessageKey_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: message_start_failed
      const actual: string = CliModel.exitMessageKey(46);
      expect(actual).assertEqual('message_start_failed');
      expect(actual.length).assertEqual(20);
    });

  });
}
