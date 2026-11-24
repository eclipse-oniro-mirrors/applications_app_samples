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
export default function isValidExitCodeEdgeTest(): void {
  describe('IsValidExitCodeEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidExitCodeEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidExitCodeEdgeTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0001
     * @tc.name      CliInvocation_isValidExitCode_Edge_0001
     * @tc.desc      [Zero|expected=true] Verify isValidExitCode(0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_isValidExitCode_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(0);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0002
     * @tc.name      CliInvocation_isValidExitCode_Edge_0002
     * @tc.desc      [SmallPositive|expected=true] Verify isValidExitCode(1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(1);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0003
     * @tc.name      CliInvocation_isValidExitCode_Edge_0003
     * @tc.desc      [Negative|expected=true] Verify isValidExitCode(-1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(-1);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0004
     * @tc.name      CliInvocation_isValidExitCode_Edge_0004
     * @tc.desc      [SmallPositive|expected=true] Verify isValidExitCode(2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(2);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0005
     * @tc.name      CliInvocation_isValidExitCode_Edge_0005
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-2) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-2);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0006
     * @tc.name      CliInvocation_isValidExitCode_Edge_0006
     * @tc.desc      [SmallPositive|expected=true] Verify isValidExitCode(3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(3);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0007
     * @tc.name      CliInvocation_isValidExitCode_Edge_0007
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-3) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-3);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0008
     * @tc.name      CliInvocation_isValidExitCode_Edge_0008
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(4);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0009
     * @tc.name      CliInvocation_isValidExitCode_Edge_0009
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-4) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-4);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0010
     * @tc.name      CliInvocation_isValidExitCode_Edge_0010
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidExitCode_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(5);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0011
     * @tc.name      CliInvocation_isValidExitCode_Edge_0011
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-5) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-5);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0012
     * @tc.name      CliInvocation_isValidExitCode_Edge_0012
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(10);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0013
     * @tc.name      CliInvocation_isValidExitCode_Edge_0013
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-10) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-10);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0014
     * @tc.name      CliInvocation_isValidExitCode_Edge_0014
     * @tc.desc      [Medium|expected=true] Verify isValidExitCode(100) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(100);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0015
     * @tc.name      CliInvocation_isValidExitCode_Edge_0015
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-100) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-100);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0016
     * @tc.name      CliInvocation_isValidExitCode_Edge_0016
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(1000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(1000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0017
     * @tc.name      CliInvocation_isValidExitCode_Edge_0017
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-1000) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-1000);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0018
     * @tc.name      CliInvocation_isValidExitCode_Edge_0018
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(1024) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(1024);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0019
     * @tc.name      CliInvocation_isValidExitCode_Edge_0019
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-1024) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-1024);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0020
     * @tc.name      CliInvocation_isValidExitCode_Edge_0020
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(4096) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(4096);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0021
     * @tc.name      CliInvocation_isValidExitCode_Edge_0021
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-4096) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-4096);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0022
     * @tc.name      CliInvocation_isValidExitCode_Edge_0022
     * @tc.desc      [Extreme|expected=false] Verify isValidExitCode(65535) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(65535);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0023
     * @tc.name      CliInvocation_isValidExitCode_Edge_0023
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-65535) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-65535);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0024
     * @tc.name      CliInvocation_isValidExitCode_Edge_0024
     * @tc.desc      [Extreme|expected=false] Verify isValidExitCode(2147483647) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(2147483647);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0025
     * @tc.name      CliInvocation_isValidExitCode_Edge_0025
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-2147483648) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-2147483648);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0026
     * @tc.name      CliInvocation_isValidExitCode_Edge_0026
     * @tc.desc      [Extreme|expected=false] Verify isValidExitCode(2147483646) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(2147483646);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0027
     * @tc.name      CliInvocation_isValidExitCode_Edge_0027
     * @tc.desc      [Negative|expected=false] Verify isValidExitCode(-2147483647) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(-2147483647);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0028
     * @tc.name      CliInvocation_isValidExitCode_Edge_0028
     * @tc.desc      [Large|expected=true] Verify isValidExitCode(127) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(127);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0029
     * @tc.name      CliInvocation_isValidExitCode_Edge_0029
     * @tc.desc      [Large|expected=true] Verify isValidExitCode(128) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(128);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0030
     * @tc.name      CliInvocation_isValidExitCode_Edge_0030
     * @tc.desc      [Large|expected=true] Verify isValidExitCode(129) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidExitCode_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(129);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0031
     * @tc.name      CliInvocation_isValidExitCode_Edge_0031
     * @tc.desc      [Large|expected=true] Verify isValidExitCode(255) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=true; expected: True
      const actual: boolean = CliModel.isValidExitCode(255);
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0032
     * @tc.name      CliInvocation_isValidExitCode_Edge_0032
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(256) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(256);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0033
     * @tc.name      CliInvocation_isValidExitCode_Edge_0033
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(257) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(257);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0034
     * @tc.name      CliInvocation_isValidExitCode_Edge_0034
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(511) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(511);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0035
     * @tc.name      CliInvocation_isValidExitCode_Edge_0035
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(512) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(512);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0036
     * @tc.name      CliInvocation_isValidExitCode_Edge_0036
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(513) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(513);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0037
     * @tc.name      CliInvocation_isValidExitCode_Edge_0037
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(1023) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(1023);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0038
     * @tc.name      CliInvocation_isValidExitCode_Edge_0038
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(1024) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(1024);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0039
     * @tc.name      CliInvocation_isValidExitCode_Edge_0039
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(1025) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(1025);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0040
     * @tc.name      CliInvocation_isValidExitCode_Edge_0040
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(2047) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(2047);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0041
     * @tc.name      CliInvocation_isValidExitCode_Edge_0041
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(2048) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(2048);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0042
     * @tc.name      CliInvocation_isValidExitCode_Edge_0042
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(2049) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(2049);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0043
     * @tc.name      CliInvocation_isValidExitCode_Edge_0043
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(8191) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(8191);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0044
     * @tc.name      CliInvocation_isValidExitCode_Edge_0044
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(8192) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(8192);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0045
     * @tc.name      CliInvocation_isValidExitCode_Edge_0045
     * @tc.desc      [Large|expected=false] Verify isValidExitCode(8193) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(8193);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0046
     * @tc.name      CliInvocation_isValidExitCode_Edge_0046
     * @tc.desc      [Extreme|expected=false] Verify isValidExitCode(16383) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(16383);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0047
     * @tc.name      CliInvocation_isValidExitCode_Edge_0047
     * @tc.desc      [Extreme|expected=false] Verify isValidExitCode(16384) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(16384);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0048
     * @tc.name      CliInvocation_isValidExitCode_Edge_0048
     * @tc.desc      [Extreme|expected=false] Verify isValidExitCode(16385) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(16385);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0049
     * @tc.name      CliInvocation_isValidExitCode_Edge_0049
     * @tc.desc      [Extreme|expected=false] Verify isValidExitCode(32767) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(32767);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_EXIT_CODE_EDGE_0050
     * @tc.name      CliInvocation_isValidExitCode_Edge_0050
     * @tc.desc      [Extreme|expected=false] Verify isValidExitCode(32768) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidExitCode_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme|expected=false; expected: False
      const actual: boolean = CliModel.isValidExitCode(32768);
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

  });
}
