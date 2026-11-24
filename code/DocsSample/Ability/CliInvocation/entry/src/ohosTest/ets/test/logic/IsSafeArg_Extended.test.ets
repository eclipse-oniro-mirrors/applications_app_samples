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
export default function isSafeArgExtendedTest(): void {
  describe('IsSafeArgExtendedTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsSafeArgExtendedTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsSafeArgExtendedTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0001
     * @tc.name      CliInvocation_isSafeArg_Extended_0001
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe0value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_isSafeArg_Extended_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe0value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0002
     * @tc.name      CliInvocation_isSafeArg_Extended_0002
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe1value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Extended_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe1value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0003
     * @tc.name      CliInvocation_isSafeArg_Extended_0003
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe2value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Extended_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe2value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0004
     * @tc.name      CliInvocation_isSafeArg_Extended_0004
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe3value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Extended_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe3value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0005
     * @tc.name      CliInvocation_isSafeArg_Extended_0005
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe4value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Extended_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe4value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0006
     * @tc.name      CliInvocation_isSafeArg_Extended_0006
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe5value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Extended_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe5value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0007
     * @tc.name      CliInvocation_isSafeArg_Extended_0007
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe6value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Extended_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe6value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0008
     * @tc.name      CliInvocation_isSafeArg_Extended_0008
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe7value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Extended_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe7value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0009
     * @tc.name      CliInvocation_isSafeArg_Extended_0009
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe8value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Extended_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe8value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0010
     * @tc.name      CliInvocation_isSafeArg_Extended_0010
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe9value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isSafeArg_Extended_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe9value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0011
     * @tc.name      CliInvocation_isSafeArg_Extended_0011
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe10value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe10value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0012
     * @tc.name      CliInvocation_isSafeArg_Extended_0012
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe11value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe11value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0013
     * @tc.name      CliInvocation_isSafeArg_Extended_0013
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe12value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe12value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0014
     * @tc.name      CliInvocation_isSafeArg_Extended_0014
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe13value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe13value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0015
     * @tc.name      CliInvocation_isSafeArg_Extended_0015
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe14value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe14value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0016
     * @tc.name      CliInvocation_isSafeArg_Extended_0016
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe15value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe15value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0017
     * @tc.name      CliInvocation_isSafeArg_Extended_0017
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe16value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe16value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0018
     * @tc.name      CliInvocation_isSafeArg_Extended_0018
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe17value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe17value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0019
     * @tc.name      CliInvocation_isSafeArg_Extended_0019
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe18value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe18value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0020
     * @tc.name      CliInvocation_isSafeArg_Extended_0020
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe19value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe19value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0021
     * @tc.name      CliInvocation_isSafeArg_Extended_0021
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe20value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe20value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0022
     * @tc.name      CliInvocation_isSafeArg_Extended_0022
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe21value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe21value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0023
     * @tc.name      CliInvocation_isSafeArg_Extended_0023
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe22value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe22value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0024
     * @tc.name      CliInvocation_isSafeArg_Extended_0024
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe23value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe23value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0025
     * @tc.name      CliInvocation_isSafeArg_Extended_0025
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe24value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe24value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0026
     * @tc.name      CliInvocation_isSafeArg_Extended_0026
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe25value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe25value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0027
     * @tc.name      CliInvocation_isSafeArg_Extended_0027
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe26value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe26value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0028
     * @tc.name      CliInvocation_isSafeArg_Extended_0028
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe27value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe27value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0029
     * @tc.name      CliInvocation_isSafeArg_Extended_0029
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe28value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe28value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0030
     * @tc.name      CliInvocation_isSafeArg_Extended_0030
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe29value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isSafeArg_Extended_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe29value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0031
     * @tc.name      CliInvocation_isSafeArg_Extended_0031
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe30value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe30value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0032
     * @tc.name      CliInvocation_isSafeArg_Extended_0032
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe31value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe31value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0033
     * @tc.name      CliInvocation_isSafeArg_Extended_0033
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe32value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe32value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0034
     * @tc.name      CliInvocation_isSafeArg_Extended_0034
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe33value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe33value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0035
     * @tc.name      CliInvocation_isSafeArg_Extended_0035
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe34value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe34value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0036
     * @tc.name      CliInvocation_isSafeArg_Extended_0036
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe35value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe35value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0037
     * @tc.name      CliInvocation_isSafeArg_Extended_0037
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe36value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe36value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0038
     * @tc.name      CliInvocation_isSafeArg_Extended_0038
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe37value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe37value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0039
     * @tc.name      CliInvocation_isSafeArg_Extended_0039
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe38value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe38value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0040
     * @tc.name      CliInvocation_isSafeArg_Extended_0040
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe39value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe39value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0041
     * @tc.name      CliInvocation_isSafeArg_Extended_0041
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe40value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe40value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0042
     * @tc.name      CliInvocation_isSafeArg_Extended_0042
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe41value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe41value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0043
     * @tc.name      CliInvocation_isSafeArg_Extended_0043
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe42value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe42value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0044
     * @tc.name      CliInvocation_isSafeArg_Extended_0044
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe43value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe43value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0045
     * @tc.name      CliInvocation_isSafeArg_Extended_0045
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe44value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe44value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0046
     * @tc.name      CliInvocation_isSafeArg_Extended_0046
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe45value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe45value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0047
     * @tc.name      CliInvocation_isSafeArg_Extended_0047
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe46value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe46value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0048
     * @tc.name      CliInvocation_isSafeArg_Extended_0048
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe47value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe47value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0049
     * @tc.name      CliInvocation_isSafeArg_Extended_0049
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe48value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe48value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_SAFE_ARG_EXTENDED_0050
     * @tc.name      CliInvocation_isSafeArg_Extended_0050
     * @tc.desc      [PlainString|expected=true] Verify isSafeArg(safe49value) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isSafeArg_Extended_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isSafeArg('safe49value');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
