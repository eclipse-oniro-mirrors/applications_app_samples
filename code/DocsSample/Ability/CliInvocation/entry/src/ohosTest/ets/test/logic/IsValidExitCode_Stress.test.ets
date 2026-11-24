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

/** Logic checks for isValidExitCode (50 cases). */
export default function isValidExitCodeStressTest(): void {
  describe('IsValidExitCodeStressTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidExitCodeStressTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidExitCodeStressTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0001
     * @tc.name      CliInvocation_isValidExitCode_Stress_0001
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_isValidExitCode_Stress_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(5);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0002
     * @tc.name      CliInvocation_isValidExitCode_Stress_0002
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(1024) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Stress_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(1024);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0003
     * @tc.name      CliInvocation_isValidExitCode_Stress_0003
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-7) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Stress_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-7);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0004
     * @tc.name      CliInvocation_isValidExitCode_Stress_0004
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Stress_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(6);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0005
     * @tc.name      CliInvocation_isValidExitCode_Stress_0005
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(256) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Stress_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(256);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0006
     * @tc.name      CliInvocation_isValidExitCode_Stress_0006
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Stress_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(7);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0007
     * @tc.name      CliInvocation_isValidExitCode_Stress_0007
     * @tc.desc      [Large|expected=true] Verify isValidExitCode(128) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Stress_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(128);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0008
     * @tc.name      CliInvocation_isValidExitCode_Stress_0008
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-6) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Stress_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-6);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0009
     * @tc.name      CliInvocation_isValidExitCode_Stress_0009
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Stress_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(8);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0010
     * @tc.name      CliInvocation_isValidExitCode_Stress_0010
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(4096) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Stress_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(4096);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0011
     * @tc.name      CliInvocation_isValidExitCode_Stress_0011
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(9);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0012
     * @tc.name      CliInvocation_isValidExitCode_Stress_0012
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(50) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(50);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0013
     * @tc.name      CliInvocation_isValidExitCode_Stress_0013
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-5) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-5);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0014
     * @tc.name      CliInvocation_isValidExitCode_Stress_0014
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(10);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0015
     * @tc.name      CliInvocation_isValidExitCode_Stress_0015
     * @tc.desc      [Extreme|expected=false] Verify isValidExitCode(65535) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(65535);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0016
     * @tc.name      CliInvocation_isValidExitCode_Stress_0016
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(11);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0017
     * @tc.name      CliInvocation_isValidExitCode_Stress_0017
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(10000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(10000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0018
     * @tc.name      CliInvocation_isValidExitCode_Stress_0018
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-4) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-4);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0019
     * @tc.name      CliInvocation_isValidExitCode_Stress_0019
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(12);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0020
     * @tc.name      CliInvocation_isValidExitCode_Stress_0020
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(31);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0021
     * @tc.name      CliInvocation_isValidExitCode_Stress_0021
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(13);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0022
     * @tc.name      CliInvocation_isValidExitCode_Stress_0022
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(63) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(63);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0023
     * @tc.name      CliInvocation_isValidExitCode_Stress_0023
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-3) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-3);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0024
     * @tc.name      CliInvocation_isValidExitCode_Stress_0024
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(14);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0025
     * @tc.name      CliInvocation_isValidExitCode_Stress_0025
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(32);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0026
     * @tc.name      CliInvocation_isValidExitCode_Stress_0026
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(15);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0027
     * @tc.name      CliInvocation_isValidExitCode_Stress_0027
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(64) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(64);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0028
     * @tc.name      CliInvocation_isValidExitCode_Stress_0028
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-2) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-2);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0029
     * @tc.name      CliInvocation_isValidExitCode_Stress_0029
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(16);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0030
     * @tc.name      CliInvocation_isValidExitCode_Stress_0030
     * @tc.desc      [Large|expected=true] Verify isValidExitCode(127) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Stress_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(127);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0031
     * @tc.name      CliInvocation_isValidExitCode_Stress_0031
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(17);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0032
     * @tc.name      CliInvocation_isValidExitCode_Stress_0032
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(25);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0033
     * @tc.name      CliInvocation_isValidExitCode_Stress_0033
     * @tc.desc      [Negative|expected=true] Verify isValidExitCode(-1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(-1);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0034
     * @tc.name      CliInvocation_isValidExitCode_Stress_0034
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(18);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0035
     * @tc.name      CliInvocation_isValidExitCode_Stress_0035
     * @tc.desc      [Large|expected=true] Verify isValidExitCode(255) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(255);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0036
     * @tc.name      CliInvocation_isValidExitCode_Stress_0036
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(19);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0037
     * @tc.name      CliInvocation_isValidExitCode_Stress_0037
     * @tc.desc      [Extreme|expected=false] Verify isValidExitCode(100000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(100000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0038
     * @tc.name      CliInvocation_isValidExitCode_Stress_0038
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-10) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-10);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0039
     * @tc.name      CliInvocation_isValidExitCode_Stress_0039
     * @tc.desc      [Zero|expected=true] Verify isValidExitCode(0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(0);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0040
     * @tc.name      CliInvocation_isValidExitCode_Stress_0040
     * @tc.desc      [Extreme|expected=false] Verify isValidExitCode(2147483647) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(2147483647);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0041
     * @tc.name      CliInvocation_isValidExitCode_Stress_0041
     * @tc.desc      [SmallPositive|expected=true] Verify isValidExitCode(1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(1);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0042
     * @tc.name      CliInvocation_isValidExitCode_Stress_0042
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(100) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(100);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0043
     * @tc.name      CliInvocation_isValidExitCode_Stress_0043
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-9) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-9);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0044
     * @tc.name      CliInvocation_isValidExitCode_Stress_0044
     * @tc.desc      [SmallPositive|expected=true] Verify isValidExitCode(2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(2);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0045
     * @tc.name      CliInvocation_isValidExitCode_Stress_0045
     * @tc.desc      [Extreme|expected=false] Verify isValidExitCode(65535) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(65535);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0046
     * @tc.name      CliInvocation_isValidExitCode_Stress_0046
     * @tc.desc      [SmallPositive|expected=true] Verify isValidExitCode(3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(3);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0047
     * @tc.name      CliInvocation_isValidExitCode_Stress_0047
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(1000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(1000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0048
     * @tc.name      CliInvocation_isValidExitCode_Stress_0048
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-8) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-8);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0049
     * @tc.name      CliInvocation_isValidExitCode_Stress_0049
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(4);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_STRESS_0050
     * @tc.name      CliInvocation_isValidExitCode_Stress_0050
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-2147483648) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Stress_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-2147483648);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

  });
}
