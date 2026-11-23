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

import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { UIAbility, contextConstant } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { selfBundle, findModule, moduleNames, hasModule, entryResources, libraryResources, errorCode,
  PngOracle, launchHome, stopHome } from './shared/Probe';
import { ENTRY_MODULE, LIBRARY_MODULE, ERR_RES_NAME_INVALID, ERR_RES_ID_INVALID } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function abilityFactsMatrixTest() {
  describe('abilityFactsMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_ABL_0001
   * @tc.name      testAbilityFacts0001
   * @tc.desc      Launch entry ability
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAbilityFacts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAbilityFacts0001', 'launch entry ability');
    const ability: UIAbility = await launchHome();
    expect(ability !== undefined).assertTrue();
    expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_ABL_0002
   * @tc.name      testAbilityFacts0002
   * @tc.desc      Ability module name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAbilityFacts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAbilityFacts0002', 'ability module name');
    const ability: UIAbility = await launchHome();
    expect(ability.context.abilityInfo.moduleName).assertEqual('entry');
    expect(ability.context.abilityInfo.bundleName).assertEqual('ohos.app.hap.myapplication');
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_ABL_0003
   * @tc.name      testAbilityFacts0003
   * @tc.desc      Ability label id
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAbilityFacts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAbilityFacts0003', 'ability label id');
    const ability: UIAbility = await launchHome();
    expect(ability.context.abilityInfo.labelId > 0).assertTrue();
    expect(ability.context.abilityInfo.iconId > 0).assertTrue();
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_ABL_0004
   * @tc.name      testAbilityFacts0004
   * @tc.desc      Ability export state
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAbilityFacts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAbilityFacts0004', 'ability export state');
    const ability: UIAbility = await launchHome();
    expect(ability.context.abilityInfo.exported).assertTrue();
    expect(ability.context.abilityInfo.enabled).assertTrue();
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_ABL_0005
   * @tc.name      testAbilityFacts0005
   * @tc.desc      Ability launch type
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAbilityFacts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAbilityFacts0005', 'ability launch type');
    const ability: UIAbility = await launchHome();
    expect(ability.context.abilityInfo.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_ABL_0006
   * @tc.name      testAbilityFacts0006
   * @tc.desc      Ability context files dir
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAbilityFacts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAbilityFacts0006', 'ability context files dir');
    const ability: UIAbility = await launchHome();
    expect(ability.context.filesDir.startsWith('/data')).assertTrue();
    expect(ability.context.filesDir.includes('files')).assertTrue();
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_ABL_0007
   * @tc.name      testAbilityFacts0007
   * @tc.desc      Ability context bundle name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAbilityFacts0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAbilityFacts0007', 'ability context bundle name');
    const ability: UIAbility = await launchHome();
    expect(ability.context.abilityInfo.bundleName).assertEqual('ohos.app.hap.myapplication');
    expect(ability.context.abilityInfo.bundleName.length).assertEqual(26);
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_ABL_0008
   * @tc.name      testAbilityFacts0008
   * @tc.desc      Ability context module name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAbilityFacts0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAbilityFacts0008', 'ability context module name');
    const ability: UIAbility = await launchHome();
    expect(ability.context.abilityInfo.moduleName).assertEqual('entry');
    expect(ability.context.abilityInfo.moduleName.length).assertEqual(5);
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_ABL_0009
   * @tc.name      testAbilityFacts0009
   * @tc.desc      Ability font scale
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAbilityFacts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAbilityFacts0009', 'ability font scale');
    const ability: UIAbility = await launchHome();
    const scale: number = ability.context.config.fontSizeScale ?? 1;
    expect(scale > 0).assertTrue();
    expect(scale <= 3).assertTrue();
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_ABL_0010
   * @tc.name      testAbilityFacts0010
   * @tc.desc      Ability resource manager
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAbilityFacts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAbilityFacts0010', 'ability resource manager');
    const ability: UIAbility = await launchHome();
    expect(ability.context.resourceManager.getStringByNameSync('module_desc')).assertEqual('module description');
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_ABL_0011
   * @tc.name      testAbilityFacts0011
   * @tc.desc      Ability label resource
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAbilityFacts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAbilityFacts0011', 'ability label resource');
    const ability: UIAbility = await launchHome();
    expect(ability.context.resourceManager.getStringByNameSync('EntryAbility_label')).assertEqual('label');
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_ABL_0012
   * @tc.name      testAbilityFacts0012
   * @tc.desc      Ability window density
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAbilityFacts0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAbilityFacts0012', 'ability window density');
    const ability: UIAbility = await launchHome();
    expect(ability.context.config.screenDensity !== undefined).assertTrue();
    expect(ability.context.config.language !== undefined).assertTrue();
    await stopHome();
  });

  });
}
