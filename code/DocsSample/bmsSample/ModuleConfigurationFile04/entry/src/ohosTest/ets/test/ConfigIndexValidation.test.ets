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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ConfigIndex } from '../harness/ConfigIndex';
import { TestLog } from '../harness/TestLog';
import { ConfigFactory } from '../harness/ConfigFactory';
export default function ConfigIndexValidationTest(): void {
  describe('ConfigIndexValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4500
     * @tc.name      testConfigIndexHasEntryModule
     * @tc.desc      Checks that the entry module is indexed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexHasEntryModule',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexHasEntryModule', 'case begin', 'hasentrymodule config index check');
      TestLog.step('testConfigIndexHasEntryModule', 'hasentrymodule config index check');
      const actual: boolean = index.hasModule('entry');
      TestLog.text('testConfigIndexHasEntryModule', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testConfigIndexHasEntryModule', 'case end', 'hasentrymodule config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4501
     * @tc.name      testConfigIndexHasFeatureModule
     * @tc.desc      Checks that the feature module is indexed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexHasFeatureModule',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexHasFeatureModule', 'case begin', 'hasfeaturemodule config index check');
      TestLog.step('testConfigIndexHasFeatureModule', 'hasfeaturemodule config index check');
      const actual: boolean = index.hasModule('feature');
      TestLog.text('testConfigIndexHasFeatureModule', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testConfigIndexHasFeatureModule', 'case end', 'hasfeaturemodule config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4502
     * @tc.name      testConfigIndexHasGhostModule
     * @tc.desc      Checks that an undeclared module is not indexed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexHasGhostModule',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexHasGhostModule', 'case begin', 'hasghostmodule config index check');
      TestLog.step('testConfigIndexHasGhostModule', 'hasghostmodule config index check');
      const actual: boolean = index.hasModule('ghost');
      TestLog.text('testConfigIndexHasGhostModule', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testConfigIndexHasGhostModule', 'case end', 'hasghostmodule config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4503
     * @tc.name      testConfigIndexHasEntryAbility
     * @tc.desc      Checks that the entry ability is indexed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexHasEntryAbility',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexHasEntryAbility', 'case begin', 'hasentryability config index check');
      TestLog.step('testConfigIndexHasEntryAbility', 'hasentryability config index check');
      const actual: boolean = index.hasAbility('entry', 'EntryAbility');
      TestLog.text('testConfigIndexHasEntryAbility', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testConfigIndexHasEntryAbility', 'case end', 'hasentryability config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4504
     * @tc.name      testConfigIndexHasAbilityInWrongModule
     * @tc.desc      Checks that an ability is not indexed in another module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexHasAbilityInWrongModule',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexHasAbilityInWrongModule', 
        'case begin', 'hasabilityinwrongmodule config index check');
      TestLog.step('testConfigIndexHasAbilityInWrongModule', 'hasabilityinwrongmodule config index check');
      const actual: boolean = index.hasAbility('entry', 'FeatureAbility');
      TestLog.text('testConfigIndexHasAbilityInWrongModule', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testConfigIndexHasAbilityInWrongModule', 'case end', 'hasabilityinwrongmodule config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4505
     * @tc.name      testConfigIndexHasAbilityInGhostModule
     * @tc.desc      Checks that an ability is not indexed in an undeclared module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexHasAbilityInGhostModule',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexHasAbilityInGhostModule', 
        'case begin', 'hasabilityinghostmodule config index check');
      TestLog.step('testConfigIndexHasAbilityInGhostModule', 'hasabilityinghostmodule config index check');
      const actual: boolean = index.hasAbility('ghost', 'EntryAbility');
      TestLog.text('testConfigIndexHasAbilityInGhostModule', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testConfigIndexHasAbilityInGhostModule', 'case end', 'hasabilityinghostmodule config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4506
     * @tc.name      testConfigIndexFindGhostModule
     * @tc.desc      Checks that an undeclared module lookup returns null.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexFindGhostModule',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexFindGhostModule', 'case begin', 'findghostmodule config index check');
      TestLog.step('testConfigIndexFindGhostModule', 'findghostmodule config index check');
      const actual: boolean = index.findModule('ghost') === null;
      TestLog.text('testConfigIndexFindGhostModule', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testConfigIndexFindGhostModule', 'case end', 'findghostmodule config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4507
     * @tc.name      testConfigIndexFindGhostAbility
     * @tc.desc      Checks that an undeclared ability lookup returns null.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexFindGhostAbility',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexFindGhostAbility', 'case begin', 'findghostability config index check');
      TestLog.step('testConfigIndexFindGhostAbility', 'findghostability config index check');
      const actual: boolean = index.findAbility('entry', 'GhostAbility') === null;
      TestLog.text('testConfigIndexFindGhostAbility', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testConfigIndexFindGhostAbility', 'case end', 'findghostability config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4508
     * @tc.name      testConfigIndexFindAbilityInGhostModule
     * @tc.desc      Checks that an ability lookup in an undeclared module returns null.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexFindAbilityInGhostModule',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexFindAbilityInGhostModule', 
        'case begin', 'findabilityinghostmodule config index check');
      TestLog.step('testConfigIndexFindAbilityInGhostModule', 'findabilityinghostmodule config index check');
      const actual: boolean = index.findAbility('ghost', 'EntryAbility') === null;
      TestLog.text('testConfigIndexFindAbilityInGhostModule', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testConfigIndexFindAbilityInGhostModule', 
        'case end', 'findabilityinghostmodule config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4509
     * @tc.name      testConfigIndexFindModuleOfAbility
     * @tc.desc      Checks that the owning module of the feature ability is found.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexFindModuleOfAbility',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexFindModuleOfAbility', 'case begin', 'findmoduleofability config index check');
      TestLog.step('testConfigIndexFindModuleOfAbility', 'findmoduleofability config index check');
      const actual: boolean = index.findModuleOfAbility('FeatureAbility') !== null;
      TestLog.text('testConfigIndexFindModuleOfAbility', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testConfigIndexFindModuleOfAbility', 'case end', 'findmoduleofability config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4510
     * @tc.name      testConfigIndexFindModuleOfGhostAbility
     * @tc.desc      Checks that an unknown ability has no owning module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexFindModuleOfGhostAbility',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexFindModuleOfGhostAbility', 
        'case begin', 'findmoduleofghostability config index check');
      TestLog.step('testConfigIndexFindModuleOfGhostAbility', 'findmoduleofghostability config index check');
      const actual: boolean = index.findModuleOfAbility('GhostAbility') === null;
      TestLog.text('testConfigIndexFindModuleOfGhostAbility', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testConfigIndexFindModuleOfGhostAbility', 
        'case end', 'findmoduleofghostability config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4511
     * @tc.name      testConfigIndexModuleCount
     * @tc.desc      Checks that the index exposes both modules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexModuleCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexModuleCount', 'case begin', 'modulecount config index check');
      TestLog.step('testConfigIndexModuleCount', 'modulecount config index check');
      const actual: number = index.modules().length;
      TestLog.text('testConfigIndexModuleCount', 'actual value', String(actual));
      expect(actual).assertEqual(2);
      TestLog.text('testConfigIndexModuleCount', 'case end', 'modulecount config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4512
     * @tc.name      testConfigIndexEntryModuleCount
     * @tc.desc      Checks that the index exposes one entry module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexEntryModuleCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexEntryModuleCount', 'case begin', 'entrymodulecount config index check');
      TestLog.step('testConfigIndexEntryModuleCount', 'entrymodulecount config index check');
      const actual: number = index.entryModules().length;
      TestLog.text('testConfigIndexEntryModuleCount', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testConfigIndexEntryModuleCount', 'case end', 'entrymodulecount config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4513
     * @tc.name      testConfigIndexFeatureModuleCount
     * @tc.desc      Checks that the index exposes one feature module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexFeatureModuleCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexFeatureModuleCount', 'case begin', 'featuremodulecount config index check');
      TestLog.step('testConfigIndexFeatureModuleCount', 'featuremodulecount config index check');
      const actual: number = index.featureModules().length;
      TestLog.text('testConfigIndexFeatureModuleCount', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testConfigIndexFeatureModuleCount', 'case end', 'featuremodulecount config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4514
     * @tc.name      testConfigIndexModulesOfFeatureType
     * @tc.desc      Checks that the feature type query returns one module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexModulesOfFeatureType',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexModulesOfFeatureType', 'case begin', 'modulesoffeaturetype config index check');
      TestLog.step('testConfigIndexModulesOfFeatureType', 'modulesoffeaturetype config index check');
      const actual: number = index.modulesOfType('feature').length;
      TestLog.text('testConfigIndexModulesOfFeatureType', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testConfigIndexModulesOfFeatureType', 'case end', 'modulesoffeaturetype config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4515
     * @tc.name      testConfigIndexModulesOfSharedType
     * @tc.desc      Checks that the shared type query returns no module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexModulesOfSharedType',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexModulesOfSharedType', 'case begin', 'modulesofsharedtype config index check');
      TestLog.step('testConfigIndexModulesOfSharedType', 'modulesofsharedtype config index check');
      const actual: number = index.modulesOfType('shared').length;
      TestLog.text('testConfigIndexModulesOfSharedType', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testConfigIndexModulesOfSharedType', 'case end', 'modulesofsharedtype config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4516
     * @tc.name      testConfigIndexModuleNames
     * @tc.desc      Checks that the module names are exposed in declaration order.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexModuleNames',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexModuleNames', 'case begin', 'modulenames config index check');
      TestLog.step('testConfigIndexModuleNames', 'modulenames config index check');
      const actual: string = index.moduleNames()[0];
      TestLog.text('testConfigIndexModuleNames', 'actual value', String(actual));
      expect(actual).assertEqual('entry');
      TestLog.text('testConfigIndexModuleNames', 'case end', 'modulenames config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4517
     * @tc.name      testConfigIndexSortedModuleNames
     * @tc.desc      Checks that the sorted module names start with entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexSortedModuleNames',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexSortedModuleNames', 'case begin', 'sortedmodulenames config index check');
      TestLog.step('testConfigIndexSortedModuleNames', 'sortedmodulenames config index check');
      const actual: string = index.sortedModuleNames()[0];
      TestLog.text('testConfigIndexSortedModuleNames', 'actual value', String(actual));
      expect(actual).assertEqual('entry');
      TestLog.text('testConfigIndexSortedModuleNames', 'case end', 'sortedmodulenames config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4518
     * @tc.name      testConfigIndexAbilityNames
     * @tc.desc      Checks that the entry module ability names are exposed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexAbilityNames',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexAbilityNames', 'case begin', 'abilitynames config index check');
      TestLog.step('testConfigIndexAbilityNames', 'abilitynames config index check');
      const actual: number = index.abilityNames('entry').length;
      TestLog.text('testConfigIndexAbilityNames', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testConfigIndexAbilityNames', 'case end', 'abilitynames config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4519
     * @tc.name      testConfigIndexAbilityNamesGhost
     * @tc.desc      Checks that an undeclared module has no ability names.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexAbilityNamesGhost',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexAbilityNamesGhost', 'case begin', 'abilitynamesghost config index check');
      TestLog.step('testConfigIndexAbilityNamesGhost', 'abilitynamesghost config index check');
      const actual: number = index.abilityNames('ghost').length;
      TestLog.text('testConfigIndexAbilityNamesGhost', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testConfigIndexAbilityNamesGhost', 'case end', 'abilitynamesghost config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4520
     * @tc.name      testConfigIndexAbilityCount
     * @tc.desc      Checks that the entry module declares one ability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexAbilityCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexAbilityCount', 'case begin', 'abilitycount config index check');
      TestLog.step('testConfigIndexAbilityCount', 'abilitycount config index check');
      const actual: number = index.abilityCount('entry');
      TestLog.text('testConfigIndexAbilityCount', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testConfigIndexAbilityCount', 'case end', 'abilitycount config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4521
     * @tc.name      testConfigIndexAbilityCountGhost
     * @tc.desc      Checks that an undeclared module declares no ability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexAbilityCountGhost',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexAbilityCountGhost', 'case begin', 'abilitycountghost config index check');
      TestLog.step('testConfigIndexAbilityCountGhost', 'abilitycountghost config index check');
      const actual: number = index.abilityCount('ghost');
      TestLog.text('testConfigIndexAbilityCountGhost', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testConfigIndexAbilityCountGhost', 'case end', 'abilitycountghost config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4522
     * @tc.name      testConfigIndexTotalAbilityCount
     * @tc.desc      Checks that the bundle declares two abilities.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexTotalAbilityCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexTotalAbilityCount', 'case begin', 'totalabilitycount config index check');
      TestLog.step('testConfigIndexTotalAbilityCount', 'totalabilitycount config index check');
      const actual: number = index.totalAbilityCount();
      TestLog.text('testConfigIndexTotalAbilityCount', 'actual value', String(actual));
      expect(actual).assertEqual(2);
      TestLog.text('testConfigIndexTotalAbilityCount', 'case end', 'totalabilitycount config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4523
     * @tc.name      testConfigIndexTotalSkillCount
     * @tc.desc      Checks that the bundle declares two skills.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexTotalSkillCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexTotalSkillCount', 'case begin', 'totalskillcount config index check');
      TestLog.step('testConfigIndexTotalSkillCount', 'totalskillcount config index check');
      const actual: number = index.totalSkillCount();
      TestLog.text('testConfigIndexTotalSkillCount', 'actual value', String(actual));
      expect(actual).assertEqual(2);
      TestLog.text('testConfigIndexTotalSkillCount', 'case end', 'totalskillcount config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4524
     * @tc.name      testConfigIndexModulesWithTablet
     * @tc.desc      Checks that both modules declare the tablet device type.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexModulesWithTablet',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexModulesWithTablet', 'case begin', 'moduleswithtablet config index check');
      TestLog.step('testConfigIndexModulesWithTablet', 'moduleswithtablet config index check');
      const actual: number = index.modulesWithDeviceType('tablet').length;
      TestLog.text('testConfigIndexModulesWithTablet', 'actual value', String(actual));
      expect(actual).assertEqual(2);
      TestLog.text('testConfigIndexModulesWithTablet', 'case end', 'moduleswithtablet config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4525
     * @tc.name      testConfigIndexModulesWithCar
     * @tc.desc      Checks that no module declares the car device type.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexModulesWithCar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexModulesWithCar', 'case begin', 'moduleswithcar config index check');
      TestLog.step('testConfigIndexModulesWithCar', 'moduleswithcar config index check');
      const actual: number = index.modulesWithDeviceType('car').length;
      TestLog.text('testConfigIndexModulesWithCar', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testConfigIndexModulesWithCar', 'case end', 'moduleswithcar config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4526
     * @tc.name      testConfigIndexDeviceTypeUnionSize
     * @tc.desc      Checks that the device type union declares two types.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexDeviceTypeUnionSize',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexDeviceTypeUnionSize', 'case begin', 'devicetypeunionsize config index check');
      TestLog.step('testConfigIndexDeviceTypeUnionSize', 'devicetypeunionsize config index check');
      const actual: number = index.deviceTypeUnion().length;
      TestLog.text('testConfigIndexDeviceTypeUnionSize', 'actual value', String(actual));
      expect(actual).assertEqual(2);
      TestLog.text('testConfigIndexDeviceTypeUnionSize', 'case end', 'devicetypeunionsize config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4527
     * @tc.name      testConfigIndexPreloadTargets
     * @tc.desc      Checks that the entry module declares one preload.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexPreloadTargets',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexPreloadTargets', 'case begin', 'preloadtargets config index check');
      TestLog.step('testConfigIndexPreloadTargets', 'preloadtargets config index check');
      const actual: number = index.preloadTargets().length;
      TestLog.text('testConfigIndexPreloadTargets', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testConfigIndexPreloadTargets', 'case end', 'preloadtargets config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4528
     * @tc.name      testConfigIndexResolvedPreloads
     * @tc.desc      Checks that the declared preload resolves to the feature module.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexResolvedPreloads',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexResolvedPreloads', 'case begin', 'resolvedpreloads config index check');
      TestLog.step('testConfigIndexResolvedPreloads', 'resolvedpreloads config index check');
      const actual: number = index.resolvedPreloadTargets().length;
      TestLog.text('testConfigIndexResolvedPreloads', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testConfigIndexResolvedPreloads', 'case end', 'resolvedpreloads config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4529
     * @tc.name      testConfigIndexMissingPreloads
     * @tc.desc      Checks that every declared preload resolves.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexMissingPreloads',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexMissingPreloads', 'case begin', 'missingpreloads config index check');
      TestLog.step('testConfigIndexMissingPreloads', 'missingpreloads config index check');
      const actual: number = index.missingPreloadTargets().length;
      TestLog.text('testConfigIndexMissingPreloads', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testConfigIndexMissingPreloads', 'case end', 'missingpreloads config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4530
     * @tc.name      testConfigIndexResourceRefsPresent
     * @tc.desc      Checks that the entry module resource references are collected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexResourceRefsPresent',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexResourceRefsPresent', 'case begin', 'resourcerefspresent config index check');
      TestLog.step('testConfigIndexResourceRefsPresent', 'resourcerefspresent config index check');
      const actual: boolean = index.moduleResourceRefs('entry').length > 0;
      TestLog.text('testConfigIndexResourceRefsPresent', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testConfigIndexResourceRefsPresent', 'case end', 'resourcerefspresent config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4531
     * @tc.name      testConfigIndexResourceRefsGhost
     * @tc.desc      Checks that an undeclared module has no resource references.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexResourceRefsGhost',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexResourceRefsGhost', 'case begin', 'resourcerefsghost config index check');
      TestLog.step('testConfigIndexResourceRefsGhost', 'resourcerefsghost config index check');
      const actual: number = index.moduleResourceRefs('ghost').length;
      TestLog.text('testConfigIndexResourceRefsGhost', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testConfigIndexResourceRefsGhost', 'case end', 'resourcerefsghost config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4532
     * @tc.name      testConfigIndexTotalExtensions
     * @tc.desc      Checks that the sample bundle declares no extension abilities.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexTotalExtensions',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexTotalExtensions', 'case begin', 'totalextensions config index check');
      TestLog.step('testConfigIndexTotalExtensions', 'totalextensions config index check');
      const actual: number = index.totalExtensionCount();
      TestLog.text('testConfigIndexTotalExtensions', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testConfigIndexTotalExtensions', 'case end', 'totalextensions config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4533
     * @tc.name      testConfigIndexEmptyIndexModules
     * @tc.desc      Checks that an empty snapshot has no modules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexEmptyIndexModules',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexEmptyIndexModules', 'case begin', 'emptyindexmodules config index check');
      TestLog.step('testConfigIndexEmptyIndexModules', 'emptyindexmodules config index check');
      const actual: number = new ConfigIndex(ConfigFactory.snapshotWith([])).modules().length;
      TestLog.text('testConfigIndexEmptyIndexModules', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testConfigIndexEmptyIndexModules', 'case end', 'emptyindexmodules config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4534
     * @tc.name      testConfigIndexEmptyIndexDeviceUnion
     * @tc.desc      Checks that an empty snapshot has no device types.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexEmptyIndexDeviceUnion',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexEmptyIndexDeviceUnion', 'case begin', 'emptyindexdeviceunion config index check');
      TestLog.step('testConfigIndexEmptyIndexDeviceUnion', 'emptyindexdeviceunion config index check');
      const actual: number = new ConfigIndex(ConfigFactory.snapshotWith([])).deviceTypeUnion().length;
      TestLog.text('testConfigIndexEmptyIndexDeviceUnion', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testConfigIndexEmptyIndexDeviceUnion', 'case end', 'emptyindexdeviceunion config index check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4535
     * @tc.name      testConfigIndexEmptyIndexPreloads
     * @tc.desc      Checks that an empty snapshot has no preloads.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testConfigIndexEmptyIndexPreloads',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      TestLog.text('testConfigIndexEmptyIndexPreloads', 'case begin', 'emptyindexpreloads config index check');
      TestLog.step('testConfigIndexEmptyIndexPreloads', 'emptyindexpreloads config index check');
      const actual: number = new ConfigIndex(ConfigFactory.snapshotWith([])).preloadTargets().length;
      TestLog.text('testConfigIndexEmptyIndexPreloads', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testConfigIndexEmptyIndexPreloads', 'case end', 'emptyindexpreloads config index check');
    })

  })
}
