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