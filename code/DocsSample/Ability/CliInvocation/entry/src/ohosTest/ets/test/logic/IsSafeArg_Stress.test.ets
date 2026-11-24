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
export default function isSafeArgStressTest(): void {
  describe('IsSafeArgStressTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsSafeArgStressTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsSafeArgStressTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0001
     * @tc.name      CliInvocation_isSafeArg_Stress_0001
     * @tc.desc      [DelimitedString|expected=true] Verify isSafeArg(--bundlename) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_isSafeArg_Stress_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('--bundlename');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0002
     * @tc.name      CliInvocation_isSafeArg_Stress_0002
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Stress_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0003
     * @tc.name      CliInvocation_isSafeArg_Stress_0003
     * @tc.desc      [ShortString|expected=false] Verify isSafeArg(x;y) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Stress_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = CliModel.isSafeArg('x;y');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0004
     * @tc.name      CliInvocation_isSafeArg_Stress_0004
     * @tc.desc      [ShortString|expected=true] Verify isSafeArg(ok) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Stress_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('ok');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0005
     * @tc.name      CliInvocation_isSafeArg_Stress_0005
     * @tc.desc      [ShortString|expected=false] Verify isSafeArg(a|b) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Stress_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = CliModel.isSafeArg('a|b');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0006
     * @tc.name      CliInvocation_isSafeArg_Stress_0006
     * @tc.desc      [ShortString|expected=false] Verify isSafeArg(a&b) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Stress_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = CliModel.isSafeArg('a&b');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0007
     * @tc.name      CliInvocation_isSafeArg_Stress_0007
     * @tc.desc      [ShortString|expected=false] Verify isSafeArg(a\`b) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Stress_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = CliModel.isSafeArg('a`b');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0008
     * @tc.name      CliInvocation_isSafeArg_Stress_0008
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Stress_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0009
     * @tc.name      CliInvocation_isSafeArg_Stress_0009
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Stress_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0010
     * @tc.name      CliInvocation_isSafeArg_Stress_0010
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Stress_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0011
     * @tc.name      CliInvocation_isSafeArg_Stress_0011
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0012
     * @tc.name      CliInvocation_isSafeArg_Stress_0012
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0013
     * @tc.name      CliInvocation_isSafeArg_Stress_0013
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0014
     * @tc.name      CliInvocation_isSafeArg_Stress_0014
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0015
     * @tc.name      CliInvocation_isSafeArg_Stress_0015
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0016
     * @tc.name      CliInvocation_isSafeArg_Stress_0016
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0017
     * @tc.name      CliInvocation_isSafeArg_Stress_0017
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0018
     * @tc.name      CliInvocation_isSafeArg_Stress_0018
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0019
     * @tc.name      CliInvocation_isSafeArg_Stress_0019
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0020
     * @tc.name      CliInvocation_isSafeArg_Stress_0020
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0021
     * @tc.name      CliInvocation_isSafeArg_Stress_0021
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0022
     * @tc.name      CliInvocation_isSafeArg_Stress_0022
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0023
     * @tc.name      CliInvocation_isSafeArg_Stress_0023
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0024
     * @tc.name      CliInvocation_isSafeArg_Stress_0024
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0025
     * @tc.name      CliInvocation_isSafeArg_Stress_0025
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0026
     * @tc.name      CliInvocation_isSafeArg_Stress_0026
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0027
     * @tc.name      CliInvocation_isSafeArg_Stress_0027
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0028
     * @tc.name      CliInvocation_isSafeArg_Stress_0028
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0029
     * @tc.name      CliInvocation_isSafeArg_Stress_0029
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0030
     * @tc.name      CliInvocation_isSafeArg_Stress_0030
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Stress_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0031
     * @tc.name      CliInvocation_isSafeArg_Stress_0031
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0032
     * @tc.name      CliInvocation_isSafeArg_Stress_0032
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0033
     * @tc.name      CliInvocation_isSafeArg_Stress_0033
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0034
     * @tc.name      CliInvocation_isSafeArg_Stress_0034
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0035
     * @tc.name      CliInvocation_isSafeArg_Stress_0035
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0036
     * @tc.name      CliInvocation_isSafeArg_Stress_0036
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0037
     * @tc.name      CliInvocation_isSafeArg_Stress_0037
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0038
     * @tc.name      CliInvocation_isSafeArg_Stress_0038
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0039
     * @tc.name      CliInvocation_isSafeArg_Stress_0039
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0040
     * @tc.name      CliInvocation_isSafeArg_Stress_0040
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0041
     * @tc.name      CliInvocation_isSafeArg_Stress_0041
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0042
     * @tc.name      CliInvocation_isSafeArg_Stress_0042
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0043
     * @tc.name      CliInvocation_isSafeArg_Stress_0043
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0044
     * @tc.name      CliInvocation_isSafeArg_Stress_0044
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0045
     * @tc.name      CliInvocation_isSafeArg_Stress_0045
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0046
     * @tc.name      CliInvocation_isSafeArg_Stress_0046
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0047
     * @tc.name      CliInvocation_isSafeArg_Stress_0047
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0048
     * @tc.name      CliInvocation_isSafeArg_Stress_0048
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0049
     * @tc.name      CliInvocation_isSafeArg_Stress_0049
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_STRESS_0050
     * @tc.name      CliInvocation_isSafeArg_Stress_0050
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(arg42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Stress_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('arg42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
