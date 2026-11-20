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
import { ChildProcessModel } from '../Shared/ChildProcessFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_arktschildprocess]';
const BUNDLE: string = 'ArkTsChildProcess_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for errorMessage (50 cases). */
export default function errorMessageCoreTest(): void {
  describe('ErrorMessageCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}ErrorMessageCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}ErrorMessageCoreTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0001
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0001
     * @tc.desc      [Zero] Verify errorMessage(0) returns success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_errorMessage_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero; expected: success
      const actual: string = ChildProcessModel.errorMessage(0);
      expect(actual).assertEqual('success');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0002
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0002
     * @tc.desc      [Large] Verify errorMessage(401) returns invalid parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: invalid parameter
      const actual: string = ChildProcessModel.errorMessage(401);
      expect(actual).assertEqual('invalid parameter');
      expect(actual.length).assertEqual(17);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0003
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0003
     * @tc.desc      [Extreme] Verify errorMessage(16000001) returns start child process failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Extreme; expected: start child process failed
      const actual: string = ChildProcessModel.errorMessage(16000001);
      expect(actual).assertEqual('start child process failed');
      expect(actual.length).assertEqual(26);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0004
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0004
     * @tc.desc      [Extreme] Verify errorMessage(16000002) returns child process already running.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Extreme; expected: child process already running
      const actual: string = ChildProcessModel.errorMessage(16000002);
      expect(actual).assertEqual('child process already running');
      expect(actual.length).assertEqual(29);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0005
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0005
     * @tc.desc      [Extreme] Verify errorMessage(16000003) returns operation not supported.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Extreme; expected: operation not supported
      const actual: string = ChildProcessModel.errorMessage(16000003);
      expect(actual).assertEqual('operation not supported');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0006
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0006
     * @tc.desc      [Zero] Verify errorMessage(0) returns success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Zero; expected: success
      const actual: string = ChildProcessModel.errorMessage(0);
      expect(actual).assertEqual('success');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0007
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0007
     * @tc.desc      [SmallPositive] Verify errorMessage(1) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(1);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0008
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0008
     * @tc.desc      [SmallPositive] Verify errorMessage(2) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(2);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0009
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0009
     * @tc.desc      [SmallPositive] Verify errorMessage(3) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(3);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0010
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0010
     * @tc.desc      [Medium] Verify errorMessage(4) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(4);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0011
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0011
     * @tc.desc      [Medium] Verify errorMessage(5) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(5);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0012
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0012
     * @tc.desc      [Medium] Verify errorMessage(6) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(6);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0013
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0013
     * @tc.desc      [Medium] Verify errorMessage(7) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(7);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0014
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0014
     * @tc.desc      [Medium] Verify errorMessage(8) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(8);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0015
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0015
     * @tc.desc      [Medium] Verify errorMessage(9) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(9);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0016
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0016
     * @tc.desc      [Medium] Verify errorMessage(10) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(10);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0017
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0017
     * @tc.desc      [Medium] Verify errorMessage(11) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(11);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0018
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0018
     * @tc.desc      [Medium] Verify errorMessage(12) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(12);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0019
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0019
     * @tc.desc      [Medium] Verify errorMessage(13) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(13);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0020
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0020
     * @tc.desc      [Medium] Verify errorMessage(14) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(14);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0021
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0021
     * @tc.desc      [Medium] Verify errorMessage(15) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(15);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0022
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0022
     * @tc.desc      [Medium] Verify errorMessage(16) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(16);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0023
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0023
     * @tc.desc      [Medium] Verify errorMessage(17) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(17);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0024
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0024
     * @tc.desc      [Medium] Verify errorMessage(18) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(18);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0025
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0025
     * @tc.desc      [Medium] Verify errorMessage(19) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(19);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0026
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0026
     * @tc.desc      [Medium] Verify errorMessage(20) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(20);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0027
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0027
     * @tc.desc      [Medium] Verify errorMessage(21) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(21);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0028
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0028
     * @tc.desc      [Medium] Verify errorMessage(22) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(22);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0029
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0029
     * @tc.desc      [Medium] Verify errorMessage(23) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(23);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0030
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0030
     * @tc.desc      [Medium] Verify errorMessage(24) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(24);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0031
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0031
     * @tc.desc      [Medium] Verify errorMessage(25) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(25);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0032
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0032
     * @tc.desc      [Medium] Verify errorMessage(26) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(26);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0033
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0033
     * @tc.desc      [Medium] Verify errorMessage(27) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(27);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0034
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0034
     * @tc.desc      [Medium] Verify errorMessage(28) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(28);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0035
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0035
     * @tc.desc      [Medium] Verify errorMessage(29) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(29);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0036
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0036
     * @tc.desc      [Medium] Verify errorMessage(30) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(30);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0037
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0037
     * @tc.desc      [Medium] Verify errorMessage(31) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(31);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0038
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0038
     * @tc.desc      [Medium] Verify errorMessage(32) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(32);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0039
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0039
     * @tc.desc      [Medium] Verify errorMessage(33) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(33);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0040
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0040
     * @tc.desc      [Medium] Verify errorMessage(34) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(34);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0041
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0041
     * @tc.desc      [Medium] Verify errorMessage(35) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(35);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0042
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0042
     * @tc.desc      [Medium] Verify errorMessage(36) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(36);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0043
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0043
     * @tc.desc      [Medium] Verify errorMessage(37) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(37);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0044
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0044
     * @tc.desc      [Medium] Verify errorMessage(38) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(38);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0045
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0045
     * @tc.desc      [Medium] Verify errorMessage(39) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(39);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0046
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0046
     * @tc.desc      [Medium] Verify errorMessage(40) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(40);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0047
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0047
     * @tc.desc      [Medium] Verify errorMessage(41) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(41);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0048
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0048
     * @tc.desc      [Medium] Verify errorMessage(42) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(42);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0049
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0049
     * @tc.desc      [Medium] Verify errorMessage(43) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(43);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_CORE_0050
     * @tc.name      ArkTsChildProcess_errorMessage_Core_0050
     * @tc.desc      [Medium] Verify errorMessage(44) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(44);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

  });
}
