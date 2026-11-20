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

/** Logic checks for isValidName (50 cases). */
export default function isValidNameStressTest(): void {
  describe('IsValidNameStressTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidNameStressTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidNameStressTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0001
     * @tc.name      CliInvocation_isValidName_Stress_0001
     * @tc.desc      [ShortString|expected=false] Verify isValidName(ab) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_isValidName_Stress_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = CliModel.isValidName('ab');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0002
     * @tc.name      CliInvocation_isValidName_Stress_0002
     * @tc.desc      [ShortString|expected=true] Verify isValidName(abc) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Stress_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('abc');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0003
     * @tc.name      CliInvocation_isValidName_Stress_0003
     * @tc.desc      [ShortString|expected=false] Verify isValidName(a b) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Stress_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = CliModel.isValidName('a b');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0004
     * @tc.name      CliInvocation_isValidName_Stress_0004
     * @tc.desc      [ShortString|expected=false] Verify isValidName(a\\tb) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Stress_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = CliModel.isValidName('a\tb');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0005
     * @tc.name      CliInvocation_isValidName_Stress_0005
     * @tc.desc      [ShortString|expected=false] Verify isValidName(a\\nb) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Stress_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = CliModel.isValidName('a\nb');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0006
     * @tc.name      CliInvocation_isValidName_Stress_0006
     * @tc.desc      [EmptyString|expected=false] Verify isValidName((empty)) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Stress_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: EmptyString|expected=false; expected: False
      const actual: boolean = CliModel.isValidName('');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0007
     * @tc.name      CliInvocation_isValidName_Stress_0007
     * @tc.desc      [ShortString|expected=false] Verify isValidName(  ) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Stress_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = CliModel.isValidName('  ');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0008
     * @tc.name      CliInvocation_isValidName_Stress_0008
     * @tc.desc      [ShortString|expected=false] Verify isValidName(a) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Stress_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=false; expected: False
      const actual: boolean = CliModel.isValidName('a');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0009
     * @tc.name      CliInvocation_isValidName_Stress_0009
     * @tc.desc      [PlainString|expected=true] Verify isValidName(abcd) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Stress_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('abcd');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0010
     * @tc.name      CliInvocation_isValidName_Stress_0010
     * @tc.desc      [ShortString|expected=true] Verify isValidName(a-b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidName_Stress_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('a-b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0011
     * @tc.name      CliInvocation_isValidName_Stress_0011
     * @tc.desc      [ShortString|expected=true] Verify isValidName(a_b) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('a_b');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0012
     * @tc.name      CliInvocation_isValidName_Stress_0012
     * @tc.desc      [ShortString|expected=true] Verify isValidName(123) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('123');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0013
     * @tc.name      CliInvocation_isValidName_Stress_0013
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0014
     * @tc.name      CliInvocation_isValidName_Stress_0014
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0015
     * @tc.name      CliInvocation_isValidName_Stress_0015
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0016
     * @tc.name      CliInvocation_isValidName_Stress_0016
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0017
     * @tc.name      CliInvocation_isValidName_Stress_0017
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0018
     * @tc.name      CliInvocation_isValidName_Stress_0018
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0019
     * @tc.name      CliInvocation_isValidName_Stress_0019
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0020
     * @tc.name      CliInvocation_isValidName_Stress_0020
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0021
     * @tc.name      CliInvocation_isValidName_Stress_0021
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0022
     * @tc.name      CliInvocation_isValidName_Stress_0022
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0023
     * @tc.name      CliInvocation_isValidName_Stress_0023
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0024
     * @tc.name      CliInvocation_isValidName_Stress_0024
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0025
     * @tc.name      CliInvocation_isValidName_Stress_0025
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0026
     * @tc.name      CliInvocation_isValidName_Stress_0026
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0027
     * @tc.name      CliInvocation_isValidName_Stress_0027
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0028
     * @tc.name      CliInvocation_isValidName_Stress_0028
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0029
     * @tc.name      CliInvocation_isValidName_Stress_0029
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0030
     * @tc.name      CliInvocation_isValidName_Stress_0030
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidName_Stress_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0031
     * @tc.name      CliInvocation_isValidName_Stress_0031
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0032
     * @tc.name      CliInvocation_isValidName_Stress_0032
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0033
     * @tc.name      CliInvocation_isValidName_Stress_0033
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0034
     * @tc.name      CliInvocation_isValidName_Stress_0034
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0035
     * @tc.name      CliInvocation_isValidName_Stress_0035
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0036
     * @tc.name      CliInvocation_isValidName_Stress_0036
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0037
     * @tc.name      CliInvocation_isValidName_Stress_0037
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0038
     * @tc.name      CliInvocation_isValidName_Stress_0038
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0039
     * @tc.name      CliInvocation_isValidName_Stress_0039
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0040
     * @tc.name      CliInvocation_isValidName_Stress_0040
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0041
     * @tc.name      CliInvocation_isValidName_Stress_0041
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0042
     * @tc.name      CliInvocation_isValidName_Stress_0042
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0043
     * @tc.name      CliInvocation_isValidName_Stress_0043
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0044
     * @tc.name      CliInvocation_isValidName_Stress_0044
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0045
     * @tc.name      CliInvocation_isValidName_Stress_0045
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0046
     * @tc.name      CliInvocation_isValidName_Stress_0046
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0047
     * @tc.name      CliInvocation_isValidName_Stress_0047
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0048
     * @tc.name      CliInvocation_isValidName_Stress_0048
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0049
     * @tc.name      CliInvocation_isValidName_Stress_0049
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_NAME_STRESS_0050
     * @tc.name      CliInvocation_isValidName_Stress_0050
     * @tc.desc      [PlainString|expected=true] Verify isValidName(item37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidName_Stress_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidName('item37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
