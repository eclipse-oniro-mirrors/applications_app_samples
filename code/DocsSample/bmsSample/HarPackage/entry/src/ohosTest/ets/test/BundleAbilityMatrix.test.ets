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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager, common, contextConstant } from '@kit.AbilityKit';
import {
  APP_NAME,
  BUNDLE_NAME,
  BACKUP_ABILITY,
  BACKUP_METADATA,
  ENTRY_ABILITY,
  ENTRY_MODULE,
  SELF_FLAGS,
  TEST_MODULE,
  VENDOR,
  VERSION_CODE,
  VERSION_NAME,
  entryContext,
  findModule,
  selfBundle
} from './shared/HarProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

let bundleCache: bundleManager.BundleInfo | null = null;

async function bundle(): Promise<bundleManager.BundleInfo> {
  const cached: bundleManager.BundleInfo | null = bundleCache;
  if (cached !== null) {
    return cached;
  }
  const loaded: bundleManager.BundleInfo = await selfBundle();
  bundleCache = loaded;
  return loaded;
}

async function entryModule(): Promise<bundleManager.HapModuleInfo> {
  return findModule(await bundle(), ENTRY_MODULE);
}

async function entryAbility(): Promise<bundleManager.AbilityInfo> {
  return (await entryModule()).abilitiesInfo[0];
}

async function backupAbility(): Promise<bundleManager.ExtensionAbilityInfo> {
  return (await entryModule()).extensionAbilitiesInfo[0];
}

export default function bundleAbilityMatrixTest() {
  describe('BundleAbilityMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0001
     * @tc.name      testBundleAbility0001
     * @tc.desc      Entry ability name is EntryAbility
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0001', 'bundle ability case 1');
      expect(ability.name).assertEqual(ENTRY_ABILITY);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0002', 'bundle ability case 2');
      expect(ability.moduleName).assertEqual(ENTRY_MODULE);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0003
     * @tc.name      testBundleAbility0003
     * @tc.desc      Entry ability belongs to the application bundle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0003', 'bundle ability case 3');
      expect(ability.bundleName).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0004', 'bundle ability case 4');
      expect(ability.exported).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0005
     * @tc.name      testBundleAbility0005
     * @tc.desc      Entry ability is enabled
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0005', 'bundle ability case 5');
      expect(ability.enabled).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0006', 'bundle ability case 6');
      expect(ability.label).assertEqual('$string:EntryAbility_label');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0007
     * @tc.name      testBundleAbility0007
     * @tc.desc      Entry ability description is description
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0007', 'bundle ability case 7');
      expect(ability.description).assertEqual('$string:EntryAbility_desc');
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0008', 'bundle ability case 8');
      expect(ability.labelId > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0009
     * @tc.name      testBundleAbility0009
     * @tc.desc      Entry ability description id is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0009', 'bundle ability case 9');
      expect(ability.descriptionId > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0010', 'bundle ability case 10');
      expect(ability.iconId > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0011
     * @tc.name      testBundleAbility0011
     * @tc.desc      Entry ability icon reference is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0011', 'bundle ability case 11');
      expect(ability.icon.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0012', 'bundle ability case 12');
      expect(ability.skills.length).assertEqual(1);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0013
     * @tc.name      testBundleAbility0013
     * @tc.desc      Entry ability skill has home action
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0013', 'bundle ability case 13');
      expect(ability.skills[0].actions.indexOf('ohos.want.action.home') >= 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0014', 'bundle ability case 14');
      expect(ability.skills[0].entities.indexOf('entity.system.home') >= 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0015
     * @tc.name      testBundleAbility0015
     * @tc.desc      Entry ability skill action count is one
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0015', 'bundle ability case 15');
      expect(ability.skills[0].actions.length).assertEqual(1);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0016', 'bundle ability case 16');
      expect(ability.skills[0].entities.length).assertEqual(1);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0017
     * @tc.name      testBundleAbility0017
     * @tc.desc      Entry ability has an empty uri list
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0017', 'bundle ability case 17');
      expect(ability.skills[0].uris.length).assertEqual(0);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0018', 'bundle ability case 18');
      expect(ability.skills[0].domainVerify).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0019
     * @tc.name      testBundleAbility0019
     * @tc.desc      Entry ability metadata array is empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0019', 'bundle ability case 19');
      expect(ability.metadata.length).assertEqual(0);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0020', 'bundle ability case 20');
      expect(ability.permissions.length).assertEqual(0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0021
     * @tc.name      testBundleAbility0021
     * @tc.desc      Entry ability device types contain tablet
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0021', 'bundle ability case 21');
      expect(ability.deviceTypes.indexOf('tablet') >= 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0022', 'bundle ability case 22');
      expect(ability.launchType >= 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0023
     * @tc.name      testBundleAbility0023
     * @tc.desc      Entry ability orientation is not negative
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0023', 'bundle ability case 23');
      expect(ability.orientation >= 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0024', 'bundle ability case 24');
      expect(Array.isArray(ability.supportWindowModes)).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0025
     * @tc.name      testBundleAbility0025
     * @tc.desc      Entry ability application info matches the bundle app info
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0025', 'bundle ability case 25');
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0026', 'bundle ability case 26');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0027
     * @tc.name      testBundleAbility0027
     * @tc.desc      Backup ability name is EntryBackupAbility
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0027', 'bundle ability case 27');
      expect(extension.name).assertEqual(BACKUP_ABILITY);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0028', 'bundle ability case 28');
      expect(extension.moduleName).assertEqual(ENTRY_MODULE);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0029
     * @tc.name      testBundleAbility0029
     * @tc.desc      Backup ability belongs to the application bundle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0029', 'bundle ability case 29');
      expect(extension.bundleName).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0030', 'bundle ability case 30');
      expect(extension.exported).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0031
     * @tc.name      testBundleAbility0031
     * @tc.desc      Backup ability is enabled
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0031', 'bundle ability case 31');
      expect(extension.enabled).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0032', 'bundle ability case 32');
      expect(extension.extensionAbilityTypeName).assertEqual('backup');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0033
     * @tc.name      testBundleAbility0033
     * @tc.desc      Backup ability declares one metadata entry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0033', 'bundle ability case 33');
      expect(extension.metadata.length).assertEqual(1);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0034', 'bundle ability case 34');
      expect(extension.metadata[0].name).assertEqual(BACKUP_METADATA);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0035
     * @tc.name      testBundleAbility0035
     * @tc.desc      Backup ability metadata resource references the backup profile
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0035', 'bundle ability case 35');
      expect(extension.metadata[0].resource.indexOf('backup_config') >= 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0036', 'bundle ability case 36');
      expect(extension.metadata[0].value).assertEqual('');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0037
     * @tc.name      testBundleAbility0037
     * @tc.desc      Backup ability has no skills
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0037', 'bundle ability case 37');
      expect(extension.skills.length).assertEqual(0);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0038', 'bundle ability case 38');
      expect(extension.permissions.length).assertEqual(0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0039
     * @tc.name      testBundleAbility0039
     * @tc.desc      Backup ability application uid matches the bundle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleAbility0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0039', 'bundle ability case 39');
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0040', 'bundle ability case 40');
      expect(extension.metadata[0].valueId === undefined || extension.metadata[0].valueId >= 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0041
     * @tc.name      testBundleAbility0041
     * @tc.desc      Ability names are unique inside the module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0041', 'bundle ability case 41');
      const names: string[] = moduleInfo.abilitiesInfo.map((item: bundleManager.AbilityInfo) => item.name);
      expect(names.filter((value: string) => value === ENTRY_ABILITY).length).assertEqual(1);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0042', 'bundle ability case 42');
      const backupExtensions: bundleManager.ExtensionAbilityInfo[] =
        moduleInfo.extensionAbilitiesInfo.filter(
          (item: bundleManager.ExtensionAbilityInfo) => item.name === BACKUP_ABILITY);
      expect(backupExtensions.length).assertEqual(1);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0043
     * @tc.name      testBundleAbility0043
     * @tc.desc      Ability name differs from extension name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0043', 'bundle ability case 43');
      expect(ability.name === extension.name).assertFalse();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0044', 'bundle ability case 44');
      expect(ability.moduleName).assertEqual(extension.moduleName);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0045
     * @tc.name      testBundleAbility0045
     * @tc.desc      Ability and extension share the same bundle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0045', 'bundle ability case 45');
      expect(ability.bundleName).assertEqual(extension.bundleName);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0046', 'bundle ability case 46');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0047
     * @tc.name      testBundleAbility0047
     * @tc.desc      Extension type name is lower case
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0047', 'bundle ability case 47');
      expect(extension.extensionAbilityTypeName === extension.extensionAbilityTypeName.toLowerCase()).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0048', 'bundle ability case 48');
      expect(extension.metadata[0].name.split('.').length).assertEqual(3);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0049
     * @tc.name      testBundleAbility0049
     * @tc.desc      Extension metadata name ends with backup
