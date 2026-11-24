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
export default function isValidAbilityNameEdgeTest(): void {
  describe('IsValidAbilityNameEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidAbilityNameEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidAbilityNameEdgeTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0001
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0001
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility0) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_isValidAbilityName_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility0');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0002
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0002
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility1) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility1');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0003
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0003
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility2) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility2');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0004
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0004
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility3) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility3');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0005
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0005
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility4) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility4');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0006
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0006
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility5) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility5');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0007
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0007
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility6) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility6');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0008
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0008
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility7) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility7');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0009
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0009
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility8) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility8');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0010
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0010
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility9) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_isValidAbilityName_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility9');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0011
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0011
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility10) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility10');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0012
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0012
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility11) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility11');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0013
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0013
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility12) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility12');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0014
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0014
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility13) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility13');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0015
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0015
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility14) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility14');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0016
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0016
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility15) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility15');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0017
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0017
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility16) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility16');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0018
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0018
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility17) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility17');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0019
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0019
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility18) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility18');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0020
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0020
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility19) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility19');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0021
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0021
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility20) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility20');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0022
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0022
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility21) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility21');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0023
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0023
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility22) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility22');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0024
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0024
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility23) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility23');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0025
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0025
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility24) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility24');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0026
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0026
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility25) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility25');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0027
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0027
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility26) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility26');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0028
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0028
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility27) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility27');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0029
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0029
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility28) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility28');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0030
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0030
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility29) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_isValidAbilityName_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility29');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0031
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0031
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility30) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility30');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0032
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0032
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility31) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility31');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0033
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0033
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility32) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility32');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0034
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0034
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility33) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility33');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0035
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0035
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility34) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility34');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0036
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0036
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility35) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility35');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0037
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0037
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility36) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility36');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0038
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0038
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility37) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility37');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0039
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0039
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility38) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility38');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0040
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0040
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility39) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility39');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0041
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0041
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility40) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility40');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0042
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0042
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility41) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility41');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0043
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0043
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility42) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility42');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0044
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0044
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility43) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility43');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0045
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0045
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility44) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility44');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0046
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0046
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility45) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility45');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0047
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0047
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility46) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility46');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0048
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0048
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility47) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility47');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0049
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0049
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility48) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility48');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_IS_VALID_ABILITY_NAME_EDGE_0050
     * @tc.name      CliInvocation_isValidAbilityName_Edge_0050
     * @tc.desc      [PlainString|expected=true] Verify isValidAbilityName(EntryAbility49) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_isValidAbilityName_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = CliModel.isValidAbilityName('EntryAbility49');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
