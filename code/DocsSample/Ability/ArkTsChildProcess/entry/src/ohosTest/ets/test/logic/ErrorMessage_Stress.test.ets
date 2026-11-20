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
export default function errorMessageStressTest(): void {
  describe('ErrorMessageStressTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}ErrorMessageStressTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}ErrorMessageStressTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0001
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0001
     * @tc.desc      [Medium] Verify errorMessage(5) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_errorMessage_Stress_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(5);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0002
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0002
     * @tc.desc      [Large] Verify errorMessage(1024) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Stress_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(1024);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0003
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0003
     * @tc.desc      [Negative] Verify errorMessage(-7) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Stress_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(-7);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0004
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0004
     * @tc.desc      [Medium] Verify errorMessage(6) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Stress_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(6);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0005
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0005
     * @tc.desc      [Large] Verify errorMessage(256) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Stress_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(256);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0006
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0006
     * @tc.desc      [Medium] Verify errorMessage(7) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Stress_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(7);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0007
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0007
     * @tc.desc      [Large] Verify errorMessage(128) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Stress_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(128);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0008
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0008
     * @tc.desc      [Negative] Verify errorMessage(-6) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Stress_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(-6);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0009
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0009
     * @tc.desc      [Medium] Verify errorMessage(8) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Stress_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(8);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0010
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0010
     * @tc.desc      [Large] Verify errorMessage(4096) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_errorMessage_Stress_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(4096);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0011
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0011
     * @tc.desc      [Medium] Verify errorMessage(9) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(9);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0012
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0012
     * @tc.desc      [Medium] Verify errorMessage(50) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(50);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0013
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0013
     * @tc.desc      [Negative] Verify errorMessage(-5) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(-5);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0014
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0014
     * @tc.desc      [Medium] Verify errorMessage(10) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(10);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0015
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0015
     * @tc.desc      [Extreme] Verify errorMessage(65535) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(65535);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0016
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0016
     * @tc.desc      [Medium] Verify errorMessage(11) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(11);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0017
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0017
     * @tc.desc      [Large] Verify errorMessage(10000) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(10000);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0018
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0018
     * @tc.desc      [Negative] Verify errorMessage(-4) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(-4);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0019
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0019
     * @tc.desc      [Medium] Verify errorMessage(12) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(12);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0020
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0020
     * @tc.desc      [Medium] Verify errorMessage(31) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(31);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0021
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0021
     * @tc.desc      [Medium] Verify errorMessage(13) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(13);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0022
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0022
     * @tc.desc      [Medium] Verify errorMessage(63) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(63);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0023
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0023
     * @tc.desc      [Negative] Verify errorMessage(-3) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(-3);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0024
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0024
     * @tc.desc      [Medium] Verify errorMessage(14) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(14);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0025
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0025
     * @tc.desc      [Medium] Verify errorMessage(32) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(32);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0026
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0026
     * @tc.desc      [Medium] Verify errorMessage(15) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(15);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0027
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0027
     * @tc.desc      [Medium] Verify errorMessage(64) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(64);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0028
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0028
     * @tc.desc      [Negative] Verify errorMessage(-2) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(-2);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0029
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0029
     * @tc.desc      [Medium] Verify errorMessage(16) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(16);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0030
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0030
     * @tc.desc      [Large] Verify errorMessage(127) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_errorMessage_Stress_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(127);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0031
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0031
     * @tc.desc      [Medium] Verify errorMessage(17) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(17);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0032
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0032
     * @tc.desc      [Medium] Verify errorMessage(25) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(25);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0033
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0033
     * @tc.desc      [Negative] Verify errorMessage(-1) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(-1);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0034
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0034
     * @tc.desc      [Medium] Verify errorMessage(18) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(18);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0035
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0035
     * @tc.desc      [Large] Verify errorMessage(255) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(255);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0036
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0036
     * @tc.desc      [Medium] Verify errorMessage(19) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(19);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0037
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0037
     * @tc.desc      [Extreme] Verify errorMessage(100000) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(100000);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0038
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0038
     * @tc.desc      [Negative] Verify errorMessage(-10) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(-10);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0039
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0039
     * @tc.desc      [Zero] Verify errorMessage(0) returns success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero; expected: success
      const actual: string = ChildProcessModel.errorMessage(0);
      expect(actual).assertEqual('success');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0040
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0040
     * @tc.desc      [Extreme] Verify errorMessage(2147483647) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(2147483647);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0041
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0041
     * @tc.desc      [SmallPositive] Verify errorMessage(1) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(1);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0042
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0042
     * @tc.desc      [Medium] Verify errorMessage(100) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(100);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0043
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0043
     * @tc.desc      [Negative] Verify errorMessage(-9) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(-9);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0044
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0044
     * @tc.desc      [SmallPositive] Verify errorMessage(2) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(2);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0045
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0045
     * @tc.desc      [Extreme] Verify errorMessage(65535) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(65535);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0046
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0046
     * @tc.desc      [SmallPositive] Verify errorMessage(3) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(3);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0047
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0047
     * @tc.desc      [Large] Verify errorMessage(1000) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(1000);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0048
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0048
     * @tc.desc      [Negative] Verify errorMessage(-8) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(-8);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0049
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0049
     * @tc.desc      [Medium] Verify errorMessage(4) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(4);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_ERROR_MESSAGE_STRESS_0050
     * @tc.name      ArkTsChildProcess_errorMessage_Stress_0050
     * @tc.desc      [Negative] Verify errorMessage(-2147483648) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_errorMessage_Stress_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: unknown error
      const actual: string = ChildProcessModel.errorMessage(-2147483648);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

  });
}
