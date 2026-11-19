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

export default function bundleBackupMatrixTest() {
  describe('BundleBackupMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0001
     * @tc.name      testBundleBackup0001
     * @tc.desc      Module declares exactly one backup extension
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0001', 'bundle backup case 1');
      expect(moduleInfo.extensionAbilitiesInfo.length).assertEqual(1);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0002', 'bundle backup case 2');
      expect(extension.name).assertEqual(BACKUP_ABILITY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0003
     * @tc.name      testBundleBackup0003
     * @tc.desc      Backup extension type name is backup
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0003', 'bundle backup case 3');
      expect(extension.extensionAbilityTypeName).assertEqual('backup');
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0004', 'bundle backup case 4');
      expect(extension.exported).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0005
     * @tc.name      testBundleBackup0005
     * @tc.desc      Backup extension is enabled
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0005', 'bundle backup case 5');
      expect(extension.enabled).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0006', 'bundle backup case 6');
      expect(extension.metadata.length).assertEqual(1);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0007
     * @tc.name      testBundleBackup0007
     * @tc.desc      Backup metadata key is ohos.extension.backup
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0007', 'bundle backup case 7');
      expect(extension.metadata[0].name).assertEqual(BACKUP_METADATA);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0008', 'bundle backup case 8');
      expect(extension.metadata[0].resource.indexOf('backup_config') >= 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0009
     * @tc.name      testBundleBackup0009
     * @tc.desc      Backup metadata has an empty literal value
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0009', 'bundle backup case 9');
      expect(extension.metadata[0].value).assertEqual('');
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0010', 'bundle backup case 10');
      expect(extension.skills.length).assertEqual(0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0011
     * @tc.name      testBundleBackup0011
     * @tc.desc      Backup extension has no permissions
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0011', 'bundle backup case 11');
      expect(extension.permissions.length).assertEqual(0);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0012', 'bundle backup case 12');
      expect(extension.moduleName).assertEqual(ENTRY_MODULE);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0013
     * @tc.name      testBundleBackup0013
     * @tc.desc      Backup extension bundle matches the bundle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0013', 'bundle backup case 13');
      expect(extension.bundleName).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0014', 'bundle backup case 14');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0015
     * @tc.name      testBundleBackup0015
     * @tc.desc      Backup metadata resource starts with the profile prefix
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0015', 'bundle backup case 15');
      expect(extension.metadata[0].resource.startsWith('$profile:')).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0016', 'bundle backup case 16');
      expect(extension.metadata[0].resource.split(':').length).assertEqual(2);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0017
     * @tc.name      testBundleBackup0017
     * @tc.desc      Backup metadata resource has no trailing whitespace
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0017', 'bundle backup case 17');
      expect(extension.metadata[0].resource.trim()).assertEqual(extension.metadata[0].resource);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0018', 'bundle backup case 18');
      expect(extension.extensionAbilityTypeName === 'entry').assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0019
     * @tc.name      testBundleBackup0019
     * @tc.desc      Backup extension name ends with Ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0019', 'bundle backup case 19');
      expect(extension.name.endsWith('Ability')).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0020', 'bundle backup case 20');
      expect(extension.name.startsWith('Entry')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0021
     * @tc.name      testBundleBackup0021
     * @tc.desc      Backup extension is the only extension in the module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0021', 'bundle backup case 21');
      const backupExtensions: bundleManager.ExtensionAbilityInfo[] =
        moduleInfo.extensionAbilitiesInfo.filter(
          (item: bundleManager.ExtensionAbilityInfo) => item.name === BACKUP_ABILITY);
      expect(backupExtensions.length).assertEqual(1);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0022', 'bundle backup case 22');
      expect((await entryModule()).extensionAbilitiesInfo.length).assertEqual(moduleInfo.extensionAbilitiesInfo.length);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0023
     * @tc.name      testBundleBackup0023
     * @tc.desc      Backup extension export flag is stable across reads
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0023', 'bundle backup case 23');
      expect((await backupAbility()).exported).assertEqual(extension.exported);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0024', 'bundle backup case 24');
      expect((await backupAbility()).metadata[0].name).assertEqual(extension.metadata[0].name);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0025
     * @tc.name      testBundleBackup0025
     * @tc.desc      Backup extension metadata resource is stable across reads
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0025', 'bundle backup case 25');
      expect((await backupAbility()).metadata[0].resource).assertEqual(extension.metadata[0].resource);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0026', 'bundle backup case 26');
      expect((await backupAbility()).extensionAbilityTypeName).assertEqual(extension.extensionAbilityTypeName);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0027
     * @tc.name      testBundleBackup0027
     * @tc.desc      Backup extension module name is stable across reads
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0027', 'bundle backup case 27');
      expect((await backupAbility()).moduleName).assertEqual(extension.moduleName);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0028', 'bundle backup case 28');
      expect((await backupAbility()).bundleName).assertEqual(extension.bundleName);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0029
     * @tc.name      testBundleBackup0029
     * @tc.desc      Backup extension enabled flag is stable across reads
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0029', 'bundle backup case 29');
      expect((await backupAbility()).enabled).assertEqual(extension.enabled);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0030', 'bundle backup case 30');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0031
     * @tc.name      testBundleBackup0031
     * @tc.desc      Backup metadata resource stays at least 9 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0031', 'bundle backup case 31');
      expect(extension.metadata[0].resource.length >= 9).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0032', 'bundle backup case 32');
      expect(extension.metadata[0].resource.length >= 10).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0033
     * @tc.name      testBundleBackup0033
     * @tc.desc      Backup metadata resource stays at least 11 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0033', 'bundle backup case 33');
      expect(extension.metadata[0].resource.length >= 11).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0034', 'bundle backup case 34');
      expect(extension.metadata[0].resource.length >= 12).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0035
     * @tc.name      testBundleBackup0035
     * @tc.desc      Backup metadata resource stays at least 13 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0035', 'bundle backup case 35');
      expect(extension.metadata[0].resource.length >= 13).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0036', 'bundle backup case 36');
      expect(extension.metadata[0].resource.length >= 14).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0037
     * @tc.name      testBundleBackup0037
     * @tc.desc      Backup metadata resource stays at least 15 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0037', 'bundle backup case 37');
      expect(extension.metadata[0].resource.length >= 15).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0038', 'bundle backup case 38');
      expect(extension.metadata[0].resource.length >= 16).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0039
     * @tc.name      testBundleBackup0039
     * @tc.desc      Backup metadata resource stays at least 17 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBackup0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0039', 'bundle backup case 39');
      expect(extension.metadata[0].resource.length >= 17).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0040', 'bundle backup case 40');
      expect(extension.metadata[0].resource.length >= 18).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0041
     * @tc.name      testBundleBackup0041
     * @tc.desc      Backup metadata resource stays at least 19 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0041', 'bundle backup case 41');
      expect(extension.metadata[0].resource.length >= 19).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0042', 'bundle backup case 42');
      expect(extension.metadata[0].resource.length >= 20).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0043
     * @tc.name      testBundleBackup0043
     * @tc.desc      Backup metadata key stays at least 13 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0043', 'bundle backup case 43');
      expect(extension.metadata[0].name.length >= 13).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0044', 'bundle backup case 44');
      expect(extension.metadata[0].name.length >= 14).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0045
     * @tc.name      testBundleBackup0045
     * @tc.desc      Backup metadata key stays at least 15 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0045', 'bundle backup case 45');
      expect(extension.metadata[0].name.length >= 15).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0046', 'bundle backup case 46');
      expect(extension.metadata[0].name.length >= 16).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0047
     * @tc.name      testBundleBackup0047
     * @tc.desc      Backup metadata key stays at least 17 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0047', 'bundle backup case 47');
      expect(extension.metadata[0].name.length >= 17).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0048', 'bundle backup case 48');
      expect(extension.metadata[0].name.length >= 18).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0049
     * @tc.name      testBundleBackup0049
     * @tc.desc      Backup metadata key stays at least 19 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0049', 'bundle backup case 49');
      expect(extension.metadata[0].name.length >= 19).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0050', 'bundle backup case 50');
      expect(extension.metadata[0].name.length >= 20).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0051
     * @tc.name      testBundleBackup0051
     * @tc.desc      Backup extension name stays at least 13 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0051', 'bundle backup case 51');
      expect(extension.name.length >= 13).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0052', 'bundle backup case 52');
      expect(extension.name.length >= 14).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0053
     * @tc.name      testBundleBackup0053
     * @tc.desc      Backup extension name stays at least 15 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0053', 'bundle backup case 53');
      expect(extension.name.length >= 15).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0054', 'bundle backup case 54');
      expect(extension.name.length >= 16).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0055
     * @tc.name      testBundleBackup0055
     * @tc.desc      Backup extension name stays at least 17 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0055', 'bundle backup case 55');
      expect(extension.name.length >= 17).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0056', 'bundle backup case 56');
      expect(extension.name.length >= 18).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0057
     * @tc.name      testBundleBackup0057
     * @tc.desc      Backup extension type name has length shorter than 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0057', 'bundle backup case 57');
      expect(extension.extensionAbilityTypeName.length <= 9).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0058', 'bundle backup case 58');
      expect(extension.extensionAbilityTypeName.length <= 10).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0059
     * @tc.name      testBundleBackup0059
     * @tc.desc      Backup extension type name has length shorter than 11
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0059', 'bundle backup case 59');
      expect(extension.extensionAbilityTypeName.length <= 11).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0060', 'bundle backup case 60');
      expect(extension.extensionAbilityTypeName.length <= 12).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0061
     * @tc.name      testBundleBackup0061
     * @tc.desc      Backup extension type name has length shorter than 13
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0061', 'bundle backup case 61');
      expect(extension.extensionAbilityTypeName.length <= 13).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0062', 'bundle backup case 62');
      expect(extension.extensionAbilityTypeName.length <= 14).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0063
     * @tc.name      testBundleBackup0063
     * @tc.desc      Backup extension type name has length shorter than 15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0063', 'bundle backup case 63');
      expect(extension.extensionAbilityTypeName.length <= 15).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0064', 'bundle backup case 64');
      expect(extension.extensionAbilityTypeName.length <= 16).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0065
     * @tc.name      testBundleBackup0065
     * @tc.desc      Backup extension type name has length shorter than 17
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0065', 'bundle backup case 65');
      expect(extension.extensionAbilityTypeName.length <= 17).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0066', 'bundle backup case 66');
      expect(extension.extensionAbilityTypeName.length <= 18).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0067
     * @tc.name      testBundleBackup0067
     * @tc.desc      Backup extension module name has length shorter than 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0067', 'bundle backup case 67');
      expect(extension.moduleName.length <= 6).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0068', 'bundle backup case 68');
      expect(extension.moduleName.length <= 7).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0069
     * @tc.name      testBundleBackup0069
     * @tc.desc      Backup extension module name has length shorter than 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0069', 'bundle backup case 69');
      expect(extension.moduleName.length <= 8).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0070', 'bundle backup case 70');
      expect(extension.moduleName.length <= 9).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0071
     * @tc.name      testBundleBackup0071
     * @tc.desc      Backup extension module name has length shorter than 10
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0071', 'bundle backup case 71');
      expect(extension.moduleName.length <= 10).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0072', 'bundle backup case 72');
      expect(extension.moduleName.length <= 11).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0073
     * @tc.name      testBundleBackup0073
     * @tc.desc      Backup extension module name has length shorter than 12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0073', 'bundle backup case 73');
      expect(extension.moduleName.length <= 12).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0074', 'bundle backup case 74');
      expect(extension.moduleName.length <= 13).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEBAK_0075
     * @tc.name      testBundleBackup0075
     * @tc.desc      Backup extension module name has length shorter than 14
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackup0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0075', 'bundle backup case 75');
      expect(extension.moduleName.length <= 14).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = await entryModule();
      const extension: bundleManager.ExtensionAbilityInfo = await backupAbility();
      logCase('testBundleBackup0076', 'bundle backup case 76');
      expect(extension.moduleName.length <= 15).assertTrue();
      }
    });

  });
}
