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

/** Logic checks for isSafeArg (50 cases). */
export default function isSafeArgBoundaryTest(): void {
  describe('IsSafeArgBoundaryTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsSafeArgBoundaryTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsSafeArgBoundaryTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0001
     * @tc.name      CliInvocation_isSafeArg_Boundary_0001
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_isSafeArg_Boundary_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0002
     * @tc.name      CliInvocation_isSafeArg_Boundary_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Boundary_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0003
     * @tc.name      CliInvocation_isSafeArg_Boundary_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Boundary_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0004
     * @tc.name      CliInvocation_isSafeArg_Boundary_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Boundary_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0005
     * @tc.name      CliInvocation_isSafeArg_Boundary_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Boundary_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0006
     * @tc.name      CliInvocation_isSafeArg_Boundary_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Boundary_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0007
     * @tc.name      CliInvocation_isSafeArg_Boundary_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Boundary_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0008
     * @tc.name      CliInvocation_isSafeArg_Boundary_0008
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Boundary_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0009
     * @tc.name      CliInvocation_isSafeArg_Boundary_0009
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Boundary_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0010
     * @tc.name      CliInvocation_isSafeArg_Boundary_0010
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Boundary_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0011
     * @tc.name      CliInvocation_isSafeArg_Boundary_0011
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0012
     * @tc.name      CliInvocation_isSafeArg_Boundary_0012
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0013
     * @tc.name      CliInvocation_isSafeArg_Boundary_0013
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0014
     * @tc.name      CliInvocation_isSafeArg_Boundary_0014
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0015
     * @tc.name      CliInvocation_isSafeArg_Boundary_0015
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0016
     * @tc.name      CliInvocation_isSafeArg_Boundary_0016
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0017
     * @tc.name      CliInvocation_isSafeArg_Boundary_0017
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0018
     * @tc.name      CliInvocation_isSafeArg_Boundary_0018
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0019
     * @tc.name      CliInvocation_isSafeArg_Boundary_0019
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0020
     * @tc.name      CliInvocation_isSafeArg_Boundary_0020
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0021
     * @tc.name      CliInvocation_isSafeArg_Boundary_0021
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0022
     * @tc.name      CliInvocation_isSafeArg_Boundary_0022
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0023
     * @tc.name      CliInvocation_isSafeArg_Boundary_0023
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0024
     * @tc.name      CliInvocation_isSafeArg_Boundary_0024
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0025
     * @tc.name      CliInvocation_isSafeArg_Boundary_0025
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0026
     * @tc.name      CliInvocation_isSafeArg_Boundary_0026
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0027
     * @tc.name      CliInvocation_isSafeArg_Boundary_0027
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0028
     * @tc.name      CliInvocation_isSafeArg_Boundary_0028
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0029
     * @tc.name      CliInvocation_isSafeArg_Boundary_0029
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0030
     * @tc.name      CliInvocation_isSafeArg_Boundary_0030
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Boundary_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0031
     * @tc.name      CliInvocation_isSafeArg_Boundary_0031
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0032
     * @tc.name      CliInvocation_isSafeArg_Boundary_0032
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0033
     * @tc.name      CliInvocation_isSafeArg_Boundary_0033
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0034
     * @tc.name      CliInvocation_isSafeArg_Boundary_0034
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0035
     * @tc.name      CliInvocation_isSafeArg_Boundary_0035
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0036
     * @tc.name      CliInvocation_isSafeArg_Boundary_0036
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0037
     * @tc.name      CliInvocation_isSafeArg_Boundary_0037
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0038
     * @tc.name      CliInvocation_isSafeArg_Boundary_0038
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0039
     * @tc.name      CliInvocation_isSafeArg_Boundary_0039
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0040
     * @tc.name      CliInvocation_isSafeArg_Boundary_0040
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0041
     * @tc.name      CliInvocation_isSafeArg_Boundary_0041
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0042
     * @tc.name      CliInvocation_isSafeArg_Boundary_0042
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0043
     * @tc.name      CliInvocation_isSafeArg_Boundary_0043
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0044
     * @tc.name      CliInvocation_isSafeArg_Boundary_0044
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-43');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0045
     * @tc.name      CliInvocation_isSafeArg_Boundary_0045
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-44) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-44');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0046
     * @tc.name      CliInvocation_isSafeArg_Boundary_0046
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-45) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-45');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0047
     * @tc.name      CliInvocation_isSafeArg_Boundary_0047
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-46) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-46');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0048
     * @tc.name      CliInvocation_isSafeArg_Boundary_0048
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-47) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-47');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0049
     * @tc.name      CliInvocation_isSafeArg_Boundary_0049
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-48) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-48');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_BOUNDARY_0050
     * @tc.name      CliInvocation_isSafeArg_Boundary_0050
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(safe-49) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Boundary_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe-49');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
