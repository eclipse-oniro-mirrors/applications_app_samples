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

/** Logic checks for isValidAbilityName (50 cases). */
export default function isValidAbilityNameCoreTest(): void {
  describe('IsValidAbilityNameCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidAbilityNameCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidAbilityNameCoreTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0001
     * @tc.name      CliInvocation_isValidAbilityName_Core_0001
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_isValidAbilityName_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0002
     * @tc.name      CliInvocation_isValidAbilityName_Core_0002
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0003
     * @tc.name      CliInvocation_isValidAbilityName_Core_0003
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0004
     * @tc.name      CliInvocation_isValidAbilityName_Core_0004
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0005
     * @tc.name      CliInvocation_isValidAbilityName_Core_0005
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0006
     * @tc.name      CliInvocation_isValidAbilityName_Core_0006
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0007
     * @tc.name      CliInvocation_isValidAbilityName_Core_0007
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0008
     * @tc.name      CliInvocation_isValidAbilityName_Core_0008
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0009
     * @tc.name      CliInvocation_isValidAbilityName_Core_0009
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0010
     * @tc.name      CliInvocation_isValidAbilityName_Core_0010
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0011
     * @tc.name      CliInvocation_isValidAbilityName_Core_0011
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0012
     * @tc.name      CliInvocation_isValidAbilityName_Core_0012
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0013
     * @tc.name      CliInvocation_isValidAbilityName_Core_0013
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0014
     * @tc.name      CliInvocation_isValidAbilityName_Core_0014
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0015
     * @tc.name      CliInvocation_isValidAbilityName_Core_0015
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0016
     * @tc.name      CliInvocation_isValidAbilityName_Core_0016
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0017
     * @tc.name      CliInvocation_isValidAbilityName_Core_0017
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0018
     * @tc.name      CliInvocation_isValidAbilityName_Core_0018
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0019
     * @tc.name      CliInvocation_isValidAbilityName_Core_0019
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0020
     * @tc.name      CliInvocation_isValidAbilityName_Core_0020
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0021
     * @tc.name      CliInvocation_isValidAbilityName_Core_0021
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0022
     * @tc.name      CliInvocation_isValidAbilityName_Core_0022
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0023
     * @tc.name      CliInvocation_isValidAbilityName_Core_0023
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0024
     * @tc.name      CliInvocation_isValidAbilityName_Core_0024
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0025
     * @tc.name      CliInvocation_isValidAbilityName_Core_0025
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0026
     * @tc.name      CliInvocation_isValidAbilityName_Core_0026
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0027
     * @tc.name      CliInvocation_isValidAbilityName_Core_0027
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0028
     * @tc.name      CliInvocation_isValidAbilityName_Core_0028
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0029
     * @tc.name      CliInvocation_isValidAbilityName_Core_0029
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0030
     * @tc.name      CliInvocation_isValidAbilityName_Core_0030
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0031
     * @tc.name      CliInvocation_isValidAbilityName_Core_0031
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0032
     * @tc.name      CliInvocation_isValidAbilityName_Core_0032
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0033
     * @tc.name      CliInvocation_isValidAbilityName_Core_0033
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0034
     * @tc.name      CliInvocation_isValidAbilityName_Core_0034
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0035
     * @tc.name      CliInvocation_isValidAbilityName_Core_0035
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0036
     * @tc.name      CliInvocation_isValidAbilityName_Core_0036
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0037
     * @tc.name      CliInvocation_isValidAbilityName_Core_0037
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0038
     * @tc.name      CliInvocation_isValidAbilityName_Core_0038
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0039
     * @tc.name      CliInvocation_isValidAbilityName_Core_0039
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0040
     * @tc.name      CliInvocation_isValidAbilityName_Core_0040
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0041
     * @tc.name      CliInvocation_isValidAbilityName_Core_0041
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0042
     * @tc.name      CliInvocation_isValidAbilityName_Core_0042
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0043
     * @tc.name      CliInvocation_isValidAbilityName_Core_0043
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0044
     * @tc.name      CliInvocation_isValidAbilityName_Core_0044
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability43');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0045
     * @tc.name      CliInvocation_isValidAbilityName_Core_0045
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability44) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability44');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0046
     * @tc.name      CliInvocation_isValidAbilityName_Core_0046
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability45) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability45');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0047
     * @tc.name      CliInvocation_isValidAbilityName_Core_0047
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability46) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability46');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0048
     * @tc.name      CliInvocation_isValidAbilityName_Core_0048
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability47) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability47');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0049
     * @tc.name      CliInvocation_isValidAbilityName_Core_0049
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability48) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability48');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_CORE_0050
     * @tc.name      CliInvocation_isValidAbilityName_Core_0050
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(Ability49) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('Ability49');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
