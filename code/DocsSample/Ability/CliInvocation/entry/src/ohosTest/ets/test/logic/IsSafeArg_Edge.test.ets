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
export default function isSafeArgEdgeTest(): void {
  describe('IsSafeArgEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsSafeArgEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsSafeArgEdgeTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0001
     * @tc.name      CliInvocation_isSafeArg_Edge_0001
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_isSafeArg_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0002
     * @tc.name      CliInvocation_isSafeArg_Edge_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0003
     * @tc.name      CliInvocation_isSafeArg_Edge_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0004
     * @tc.name      CliInvocation_isSafeArg_Edge_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0005
     * @tc.name      CliInvocation_isSafeArg_Edge_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0006
     * @tc.name      CliInvocation_isSafeArg_Edge_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0007
     * @tc.name      CliInvocation_isSafeArg_Edge_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0008
     * @tc.name      CliInvocation_isSafeArg_Edge_0008
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0009
     * @tc.name      CliInvocation_isSafeArg_Edge_0009
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0010
     * @tc.name      CliInvocation_isSafeArg_Edge_0010
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0011
     * @tc.name      CliInvocation_isSafeArg_Edge_0011
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0012
     * @tc.name      CliInvocation_isSafeArg_Edge_0012
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0013
     * @tc.name      CliInvocation_isSafeArg_Edge_0013
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0014
     * @tc.name      CliInvocation_isSafeArg_Edge_0014
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0015
     * @tc.name      CliInvocation_isSafeArg_Edge_0015
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0016
     * @tc.name      CliInvocation_isSafeArg_Edge_0016
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0017
     * @tc.name      CliInvocation_isSafeArg_Edge_0017
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0018
     * @tc.name      CliInvocation_isSafeArg_Edge_0018
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0019
     * @tc.name      CliInvocation_isSafeArg_Edge_0019
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0020
     * @tc.name      CliInvocation_isSafeArg_Edge_0020
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0021
     * @tc.name      CliInvocation_isSafeArg_Edge_0021
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0022
     * @tc.name      CliInvocation_isSafeArg_Edge_0022
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0023
     * @tc.name      CliInvocation_isSafeArg_Edge_0023
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0024
     * @tc.name      CliInvocation_isSafeArg_Edge_0024
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0025
     * @tc.name      CliInvocation_isSafeArg_Edge_0025
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0026
     * @tc.name      CliInvocation_isSafeArg_Edge_0026
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0027
     * @tc.name      CliInvocation_isSafeArg_Edge_0027
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0028
     * @tc.name      CliInvocation_isSafeArg_Edge_0028
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0029
     * @tc.name      CliInvocation_isSafeArg_Edge_0029
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0030
     * @tc.name      CliInvocation_isSafeArg_Edge_0030
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0031
     * @tc.name      CliInvocation_isSafeArg_Edge_0031
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0032
     * @tc.name      CliInvocation_isSafeArg_Edge_0032
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0033
     * @tc.name      CliInvocation_isSafeArg_Edge_0033
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0034
     * @tc.name      CliInvocation_isSafeArg_Edge_0034
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0035
     * @tc.name      CliInvocation_isSafeArg_Edge_0035
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0036
     * @tc.name      CliInvocation_isSafeArg_Edge_0036
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0037
     * @tc.name      CliInvocation_isSafeArg_Edge_0037
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0038
     * @tc.name      CliInvocation_isSafeArg_Edge_0038
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0039
     * @tc.name      CliInvocation_isSafeArg_Edge_0039
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0040
     * @tc.name      CliInvocation_isSafeArg_Edge_0040
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0041
     * @tc.name      CliInvocation_isSafeArg_Edge_0041
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0042
     * @tc.name      CliInvocation_isSafeArg_Edge_0042
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0043
     * @tc.name      CliInvocation_isSafeArg_Edge_0043
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0044
     * @tc.name      CliInvocation_isSafeArg_Edge_0044
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-43');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0045
     * @tc.name      CliInvocation_isSafeArg_Edge_0045
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-44) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-44');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0046
     * @tc.name      CliInvocation_isSafeArg_Edge_0046
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-45) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-45');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0047
     * @tc.name      CliInvocation_isSafeArg_Edge_0047
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-46) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-46');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0048
     * @tc.name      CliInvocation_isSafeArg_Edge_0048
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-47) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-47');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0049
     * @tc.name      CliInvocation_isSafeArg_Edge_0049
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-48) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-48');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EDGE_0050
     * @tc.name      CliInvocation_isSafeArg_Edge_0050
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--opt-49) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--opt-49');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
