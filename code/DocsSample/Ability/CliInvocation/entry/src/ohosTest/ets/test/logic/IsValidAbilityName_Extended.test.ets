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
export default function isValidAbilityNameExtendedTest(): void {
  describe('IsValidAbilityNameExtendedTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidAbilityNameExtendedTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidAbilityNameExtendedTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0001
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0001
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_isValidAbilityName_Extended_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0002
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0002
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Extended_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0003
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0003
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Extended_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0004
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0004
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Extended_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0005
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0005
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Extended_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0006
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0006
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Extended_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0007
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0007
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Extended_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0008
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0008
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Extended_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0009
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0009
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Extended_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0010
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0010
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Extended_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0011
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0011
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0012
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0012
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0013
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0013
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0014
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0014
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0015
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0015
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0016
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0016
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0017
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0017
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0018
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0018
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0019
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0019
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0020
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0020
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0021
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0021
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0022
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0022
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0023
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0023
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0024
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0024
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0025
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0025
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0026
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0026
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0027
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0027
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0028
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0028
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0029
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0029
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0030
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0030
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Extended_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0031
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0031
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0032
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0032
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0033
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0033
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0034
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0034
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0035
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0035
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0036
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0036
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0037
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0037
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0038
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0038
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0039
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0039
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0040
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0040
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0041
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0041
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0042
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0042
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0043
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0043
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0044
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0044
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility43');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0045
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0045
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility44) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility44');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0046
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0046
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility45) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility45');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0047
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0047
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility46) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility46');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0048
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0048
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility47) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility47');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0049
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0049
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility48) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility48');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EXTENDED_0050
     * @tc.name      CliInvocation_isValidAbilityName_Extended_0050
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(ServiceAbility49) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Extended_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('ServiceAbility49');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
