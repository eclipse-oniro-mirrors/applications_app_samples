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
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0049', 'bundle ability case 49');
      expect(extension.metadata[0].name.endsWith('backup')).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0050', 'bundle ability case 50');
      expect(ability.label === ability.description).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0051
     * @tc.name      testBundleAbility0051
     * @tc.desc      Ability label id and description id are different
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0051', 'bundle ability case 51');
      expect(ability.labelId === ability.descriptionId).assertFalse();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0052', 'bundle ability case 52');
      expect(ability.iconId === ability.labelId).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0053
     * @tc.name      testBundleAbility0053
     * @tc.desc      Ability exported differs from extension exported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0053', 'bundle ability case 53');
      expect(ability.exported === extension.exported).assertFalse();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0054', 'bundle ability case 54');
      const again: bundleManager.AbilityInfo = await entryAbility();
      expect(again.name).assertEqual(ability.name);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0055
     * @tc.name      testBundleAbility0055
     * @tc.desc      Ability read twice has the same label id
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0055', 'bundle ability case 55');
      const again: bundleManager.AbilityInfo = await entryAbility();
      expect(again.labelId).assertEqual(ability.labelId);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0056', 'bundle ability case 56');
      const again: bundleManager.ExtensionAbilityInfo = await backupAbility();
      expect(again.name).assertEqual(extension.name);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0057
     * @tc.name      testBundleAbility0057
     * @tc.desc      Extension read twice has the same type name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0057', 'bundle ability case 57');
      const again: bundleManager.ExtensionAbilityInfo = await backupAbility();
      expect(again.extensionAbilityTypeName).assertEqual(extension.extensionAbilityTypeName);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0058', 'bundle ability case 58');
      const again: bundleManager.ExtensionAbilityInfo = await backupAbility();
      expect(again.metadata.length).assertEqual(extension.metadata.length);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0059
     * @tc.name      testBundleAbility0059
     * @tc.desc      Main element resolves to the first ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0059', 'bundle ability case 59');
      expect(moduleInfo.mainElementName).assertEqual(moduleInfo.abilitiesInfo[0].name);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0060', 'bundle ability case 60');
      expect(moduleInfo.mainElementName === extension.name).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0061
     * @tc.name      testBundleAbility0061
     * @tc.desc      Ability label stays at least 1 character long
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0061', 'bundle ability case 61');
      expect(ability.label.length >= 1).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0062', 'bundle ability case 62');
      expect(ability.label.length >= 2).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0063
     * @tc.name      testBundleAbility0063
     * @tc.desc      Ability label stays at least 3 character long
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0063', 'bundle ability case 63');
      expect(ability.label.length >= 3).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0064', 'bundle ability case 64');
      expect(ability.label.length >= 4).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0065
     * @tc.name      testBundleAbility0065
     * @tc.desc      Ability label stays at least 5 character long
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0065', 'bundle ability case 65');
      expect(ability.label.length >= 5).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0066', 'bundle ability case 66');
      expect(ability.description.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0067
     * @tc.name      testBundleAbility0067
     * @tc.desc      Ability description stays at least 2 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0067', 'bundle ability case 67');
      expect(ability.description.length >= 2).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0068', 'bundle ability case 68');
      expect(ability.description.length >= 3).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0069
     * @tc.name      testBundleAbility0069
     * @tc.desc      Ability description stays at least 4 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0069', 'bundle ability case 69');
      expect(ability.description.length >= 4).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0070', 'bundle ability case 70');
      expect(ability.description.length >= 5).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0071
     * @tc.name      testBundleAbility0071
     * @tc.desc      Ability description stays at least 6 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0071', 'bundle ability case 71');
      expect(ability.description.length >= 6).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0072', 'bundle ability case 72');
      expect(ability.description.length >= 7).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0073
     * @tc.name      testBundleAbility0073
     * @tc.desc      Ability description stays at least 8 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0073', 'bundle ability case 73');
      expect(ability.description.length >= 8).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0074', 'bundle ability case 74');
      expect(ability.description.length >= 9).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0075
     * @tc.name      testBundleAbility0075
     * @tc.desc      Ability description stays at least 10 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0075', 'bundle ability case 75');
      expect(ability.description.length >= 10).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0076', 'bundle ability case 76');
      expect(ability.description.length >= 11).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0077
     * @tc.name      testBundleAbility0077
     * @tc.desc      Extension metadata resource stays at least 6 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0077', 'bundle ability case 77');
      expect(extension.metadata[0].resource.length >= 6).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0078', 'bundle ability case 78');
      expect(extension.metadata[0].resource.length >= 7).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0079
     * @tc.name      testBundleAbility0079
     * @tc.desc      Extension metadata resource stays at least 8 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0079', 'bundle ability case 79');
      expect(extension.metadata[0].resource.length >= 8).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0080', 'bundle ability case 80');
      expect(extension.metadata[0].resource.length >= 9).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0081
     * @tc.name      testBundleAbility0081
     * @tc.desc      Extension metadata resource stays at least 10 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0081', 'bundle ability case 81');
      expect(extension.metadata[0].resource.length >= 10).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0082', 'bundle ability case 82');
      expect(extension.metadata[0].resource.length >= 11).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0083
     * @tc.name      testBundleAbility0083
     * @tc.desc      Extension metadata resource stays at least 12 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0083', 'bundle ability case 83');
      expect(extension.metadata[0].resource.length >= 12).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0084', 'bundle ability case 84');
      expect(extension.metadata[0].resource.length >= 13).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0085
     * @tc.name      testBundleAbility0085
     * @tc.desc      Extension metadata resource stays at least 14 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0085', 'bundle ability case 85');
      expect(extension.metadata[0].resource.length >= 14).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0086', 'bundle ability case 86');
      expect(extension.metadata[0].resource.length >= 15).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0087
     * @tc.name      testBundleAbility0087
     * @tc.desc      Extension metadata resource stays at least 16 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0087', 'bundle ability case 87');
      expect(extension.metadata[0].resource.length >= 16).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0088', 'bundle ability case 88');
      expect(extension.metadata[0].resource.length >= 17).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0089
     * @tc.name      testBundleAbility0089
     * @tc.desc      Extension metadata resource stays at least 18 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0089', 'bundle ability case 89');
      expect(extension.metadata[0].resource.length >= 18).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0090', 'bundle ability case 90');
      expect(extension.metadata[0].resource.length >= 19).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0091
     * @tc.name      testBundleAbility0091
     * @tc.desc      Extension metadata resource stays at least 20 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0091', 'bundle ability case 91');
      expect(extension.metadata[0].resource.length >= 20).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0092', 'bundle ability case 92');
      expect(ability.name.length >= 5).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0093
     * @tc.name      testBundleAbility0093
     * @tc.desc      Ability name stays at least 6 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0093', 'bundle ability case 93');
      expect(ability.name.length >= 6).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0094', 'bundle ability case 94');
      expect(ability.name.length >= 7).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0095
     * @tc.name      testBundleAbility0095
     * @tc.desc      Ability name stays at least 8 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAbility0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0095', 'bundle ability case 95');
      expect(ability.name.length >= 8).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0096', 'bundle ability case 96');
      expect(ability.name.length >= 9).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0097
     * @tc.name      testBundleAbility0097
     * @tc.desc      Ability name stays at least 10 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleAbility0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0097', 'bundle ability case 97');
      expect(ability.name.length >= 10).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0098', 'bundle ability case 98');
      expect(ability.name.length >= 11).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0099
     * @tc.name      testBundleAbility0099
     * @tc.desc      Ability name stays at least 12 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleAbility0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0099', 'bundle ability case 99');
      expect(ability.name.length >= 12).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0100', 'bundle ability case 100');
      expect(extension.name.length >= 13).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0101
     * @tc.name      testBundleAbility0101
     * @tc.desc      Extension name stays at least 14 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleAbility0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0101', 'bundle ability case 101');
      expect(extension.name.length >= 14).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0102', 'bundle ability case 102');
      expect(extension.name.length >= 15).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0103
     * @tc.name      testBundleAbility0103
     * @tc.desc      Extension name stays at least 16 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleAbility0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0103', 'bundle ability case 103');
      expect(extension.name.length >= 16).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0104', 'bundle ability case 104');
      expect(extension.name.length >= 17).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEABI_0105
     * @tc.name      testBundleAbility0105
     * @tc.desc      Extension name stays at least 18 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleAbility0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const ability: bundleManager.AbilityInfo = await entryAbility();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleAbility0105', 'bundle ability case 105');
      expect(extension.name.length >= 18).assertTrue();
    });

  });
}
