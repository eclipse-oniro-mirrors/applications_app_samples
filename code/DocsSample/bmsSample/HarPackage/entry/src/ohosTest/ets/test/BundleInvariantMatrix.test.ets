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
import { bundleManager } from '@kit.AbilityKit';
import {
  APP_NAME,
  BUNDLE_NAME,
  ENTRY_ABILITY,
  ENTRY_MODULE,
  VENDOR,
  VERSION_CODE,
  findModule,
  selfBundle
} from './shared/HarProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

let cachedInfo: bundleManager.BundleInfo | null = null;

async function loadInfo(): Promise<bundleManager.BundleInfo> {
  const cached: bundleManager.BundleInfo | null = cachedInfo;
  if (cached !== null) {
    return cached;
  }
  const loaded: bundleManager.BundleInfo = await selfBundle();
  cachedInfo = loaded;
  return loaded;
}

async function entryModuleInfo(): Promise<bundleManager.HapModuleInfo> {
  return findModule(await loadInfo(), ENTRY_MODULE);
}

export default function bundleInvariantMatrixTest() {
  describe('BundleInvariantMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0001
     * @tc.name      testBundleInvariant0001
     * @tc.desc      Bundle invariant 1 checks that default app index is zero and module code path is readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0001', 'appIndex|module.codePath');
      expect(info.appIndex).assertEqual(0);
      expect(mod.codePath.indexOf('..') < 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0002', 'signature.fingerprint|ability.labelId');
      expect(info.signatureInfo.fingerprint.length > 0).assertTrue();
      expect(mod.abilitiesInfo[0].labelId > 0).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0003
     * @tc.name      testBundleInvariant0003
     * @tc.desc      Bundle invariant 3 checks that application label id is valid and module code path is readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0003', 'app.labelId|module.codePath');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(mod.codePath.indexOf('..') < 0).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0004', 'bundle.versionName|ability.labelId');
      expect(info.versionName.length > 0).assertTrue();
      expect(mod.abilitiesInfo[0].labelId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0005
     * @tc.name      testBundleInvariant0005
     * @tc.desc      Bundle invariant 5 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0005', 'app.descriptionId|ability.exported');
      expect(info.appInfo.descriptionId >= 0).assertTrue();
      expect(mod.abilitiesInfo[0].exported).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0006', 'targetVersion|module.abilities');
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.abilitiesInfo.length >= 1).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0007
     * @tc.name      testBundleInvariant0007
     * @tc.desc      Bundle invariant 7 checks that at least one module is reported and EntryAbility is exported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0007', 'hapModules|ability.exported');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(mod.abilitiesInfo[0].exported).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0008', 'app.process|module.abilities');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(mod.abilitiesInfo.length >= 1).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0009
     * @tc.name      testBundleInvariant0009
     * @tc.desc      Bundle invariant 9 checks that default app index is zero and module label id is valid
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0009', 'appIndex|module.labelId');
      expect(info.appIndex).assertEqual(0);
      expect(mod.labelId > 0).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0010', 'installTime|module.type');
      expect(info.installTime > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0011
     * @tc.name      testBundleInvariant0011
     * @tc.desc      Bundle invariant 11 checks that application label id is valid and module label id is valid
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0011', 'app.labelId|module.labelId');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(mod.labelId > 0).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0012', 'bundle.vendor|module.type');
      expect(info.vendor).assertEqual(VENDOR);
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0013
     * @tc.name      testBundleInvariant0013
     * @tc.desc      Bundle invariant 13 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0013', 'app.descriptionId|ability.iconId');
      expect(info.appInfo.descriptionId >= 0).assertTrue();
      expect(mod.abilitiesInfo[0].iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0014', 'targetVersion|module.hash');
      expect(info.targetVersion > 0).assertTrue();
      expect(typeof mod.hashValue === 'string').assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0015
     * @tc.name      testBundleInvariant0015
     * @tc.desc      Bundle invariant 15 checks that at least one module is reported and EntryAbility icon id is valid
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0015', 'hapModules|ability.iconId');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(mod.abilitiesInfo[0].iconId > 0).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0016', 'app.process|module.hash');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(typeof mod.hashValue === 'string').assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0017
     * @tc.name      testBundleInvariant0017
     * @tc.desc      Bundle invariant 17 checks that default app index is zero and first ability is EntryAbility
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0017', 'appIndex|ability.name');
      expect(info.appIndex).assertEqual(0);
      expect(mod.abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0018', 'installTime|module.deviceTypes');
      expect(info.installTime > 0).assertTrue();
      expect(mod.deviceTypes.length >= 1).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0019
     * @tc.name      testBundleInvariant0019
     * @tc.desc      Bundle invariant 19 checks that application label id is valid and first ability is EntryAbility
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0019', 'app.labelId|ability.name');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(mod.abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0020', 'bundle.vendor|module.deviceTypes');
      expect(info.vendor).assertEqual(VENDOR);
      expect(mod.deviceTypes.length >= 1).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0021
     * @tc.name      testBundleInvariant0021
     * @tc.desc      Bundle invariant 21 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0021', 'app.descriptionId|ability.deviceTypes');
      expect(info.appInfo.descriptionId >= 0).assertTrue();
      expect(mod.abilitiesInfo[0].deviceTypes.length >= 1).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0022', 'targetVersion|module.installationFree');
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.installationFree).assertFalse();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0023
     * @tc.name      testBundleInvariant0023
     * @tc.desc      Bundle invariant 23 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0023', 'hapModules|ability.deviceTypes');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(mod.abilitiesInfo[0].deviceTypes.length >= 1).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0024', 'app.process|module.installationFree');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(mod.installationFree).assertFalse();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0025
     * @tc.name      testBundleInvariant0025
     * @tc.desc      Bundle invariant 25 checks that default app index is zero and EntryAbility is enabled
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0025', 'appIndex|ability.enabled');
      expect(info.appIndex).assertEqual(0);
      expect(mod.abilitiesInfo[0].enabled).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0026', 'installTime|module.extensions');
      expect(info.installTime > 0).assertTrue();
      expect(mod.extensionAbilitiesInfo.length >= 1).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0027
     * @tc.name      testBundleInvariant0027
     * @tc.desc      Bundle invariant 27 checks that application label id is valid and EntryAbility is enabled
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0027', 'app.labelId|ability.enabled');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(mod.abilitiesInfo[0].enabled).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0028', 'bundle.vendor|module.extensions');
      expect(info.vendor).assertEqual(VENDOR);
      expect(mod.extensionAbilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0029
     * @tc.name      testBundleInvariant0029
     * @tc.desc      Bundle invariant 29 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0029', 'targetVersion|module.descriptionId');
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.descriptionId > 0).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0030', 'signature.appId|module.name');
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      expect(mod.name).assertEqual(ENTRY_MODULE);
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0031
     * @tc.name      testBundleInvariant0031
     * @tc.desc      Bundle invariant 31 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0031', 'app.process|module.descriptionId');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(mod.descriptionId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0032', 'bundle.versionCode|module.name');
      expect(info.versionCode >= 1).assertTrue();
      expect(mod.name).assertEqual(ENTRY_MODULE);
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0033
     * @tc.name      testBundleInvariant0033
     * @tc.desc      Bundle invariant 33 checks that default app index is zero and EntryAbility label id is valid
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0033', 'appIndex|ability.labelId');
      expect(info.appIndex).assertEqual(0);
      expect(mod.abilitiesInfo[0].labelId > 0).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0034', 'installTime|module.codePath');
      expect(info.installTime > 0).assertTrue();
      expect(mod.codePath.indexOf('..') < 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0035
     * @tc.name      testBundleInvariant0035
     * @tc.desc      Bundle invariant 35 checks that application label id is valid and EntryAbility label id is valid
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0035', 'app.labelId|ability.labelId');
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(mod.abilitiesInfo[0].labelId > 0).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0036', 'bundle.vendor|module.codePath');
      expect(info.vendor).assertEqual(VENDOR);
      expect(mod.codePath.indexOf('..') < 0).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0037
     * @tc.name      testBundleInvariant0037
     * @tc.desc      Bundle invariant 37 checks that target version covers the minimum and EntryAbility is exported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0037', 'targetVersion|ability.exported');
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.abilitiesInfo[0].exported).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0038', 'signature.appId|module.abilities');
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      expect(mod.abilitiesInfo.length >= 1).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0039
     * @tc.name      testBundleInvariant0039
     * @tc.desc      Bundle invariant 39 checks that application process name is present and EntryAbility is exported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0039', 'app.process|ability.exported');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(mod.abilitiesInfo[0].exported).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0040', 'bundle.versionCode|module.abilities');
      expect(info.versionCode >= 1).assertTrue();
      expect(mod.abilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0041
     * @tc.name      testBundleInvariant0041
     * @tc.desc      Bundle invariant 41 checks that debug flag is a boolean and entry module has ENTRY type
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0041', 'app.debug|module.type');
      expect(typeof info.appInfo.debug).assertEqual('boolean');
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0042', 'installTime|module.labelId');
      expect(info.installTime > 0).assertTrue();
      expect(mod.labelId > 0).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0043
     * @tc.name      testBundleInvariant0043
     * @tc.desc      Bundle invariant 43 checks that application icon id is valid and entry module has ENTRY type
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0043', 'app.iconId|module.type');
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0044', 'bundle.vendor|module.labelId');
      expect(info.vendor).assertEqual(VENDOR);
      expect(mod.labelId > 0).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0045
     * @tc.name      testBundleInvariant0045
     * @tc.desc      Bundle invariant 45 checks that target version covers the minimum and EntryAbility icon id is valid
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0045', 'targetVersion|ability.iconId');
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.abilitiesInfo[0].iconId > 0).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0046', 'signature.appId|module.hash');
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      expect(typeof mod.hashValue === 'string').assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0047
     * @tc.name      testBundleInvariant0047
     * @tc.desc      Bundle invariant 47 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0047', 'app.process|ability.iconId');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(mod.abilitiesInfo[0].iconId > 0).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0048', 'bundle.versionCode|module.hash');
      expect(info.versionCode >= 1).assertTrue();
      expect(typeof mod.hashValue === 'string').assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0049
     * @tc.name      testBundleInvariant0049
     * @tc.desc      Bundle invariant 49 checks that debug flag is a boolean and entry module declares device types
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0049', 'app.debug|module.deviceTypes');
      expect(typeof info.appInfo.debug).assertEqual('boolean');
      expect(mod.deviceTypes.length >= 1).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0050', 'installTime|ability.name');
      expect(info.installTime > 0).assertTrue();
      expect(mod.abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0051
     * @tc.name      testBundleInvariant0051
     * @tc.desc      Bundle invariant 51 checks that application icon id is valid and entry module declares device types
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0051', 'app.iconId|module.deviceTypes');
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(mod.deviceTypes.length >= 1).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0052', 'bundle.vendor|ability.name');
      expect(info.vendor).assertEqual(VENDOR);
      expect(mod.abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0053
     * @tc.name      testBundleInvariant0053
     * @tc.desc      Bundle invariant 53 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0053', 'targetVersion|ability.deviceTypes');
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.abilitiesInfo[0].deviceTypes.length >= 1).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0054', 'signature.appId|module.installationFree');
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      expect(mod.installationFree).assertFalse();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0055
     * @tc.name      testBundleInvariant0055
     * @tc.desc      Bundle invariant 55 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0055', 'app.process|ability.deviceTypes');
      expect(info.appInfo.process.length > 0).assertTrue();
      expect(mod.abilitiesInfo[0].deviceTypes.length >= 1).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0056', 'bundle.versionCode|module.installationFree');
      expect(info.versionCode >= 1).assertTrue();
      expect(mod.installationFree).assertFalse();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0057
     * @tc.name      testBundleInvariant0057
     * @tc.desc      Bundle invariant 57 checks that debug flag is a boolean and entry module exposes extensions
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0057', 'app.debug|module.extensions');
      expect(typeof info.appInfo.debug).assertEqual('boolean');
      expect(mod.extensionAbilitiesInfo.length >= 1).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0058', 'installTime|ability.enabled');
      expect(info.installTime > 0).assertTrue();
      expect(mod.abilitiesInfo[0].enabled).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0059
     * @tc.name      testBundleInvariant0059
     * @tc.desc      Bundle invariant 59 checks that application icon id is valid and entry module exposes extensions
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0059', 'app.iconId|module.extensions');
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(mod.extensionAbilitiesInfo.length >= 1).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0060', 'bundle.vendor|ability.enabled');
      expect(info.vendor).assertEqual(VENDOR);
      expect(mod.abilitiesInfo[0].enabled).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0061
     * @tc.name      testBundleInvariant0061
     * @tc.desc      Bundle invariant 61 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0061', 'minCompatible|module.name');
      expect(info.minCompatibleVersionCode >= 1).assertTrue();
      expect(mod.name).assertEqual(ENTRY_MODULE);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0062', 'signature.appId|module.descriptionId');
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      expect(mod.descriptionId > 0).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0063
     * @tc.name      testBundleInvariant0063
     * @tc.desc      Bundle invariant 63 checks that application uid is positive and entry module name matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0063', 'app.uid|module.name');
      expect(info.appInfo.uid > 0).assertTrue();
      expect(mod.name).assertEqual(ENTRY_MODULE);
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0064', 'bundle.versionCode|module.descriptionId');
      expect(info.versionCode >= 1).assertTrue();
      expect(mod.descriptionId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0065
     * @tc.name      testBundleInvariant0065
     * @tc.desc      Bundle invariant 65 checks that debug flag is a boolean and module code path is readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0065', 'app.debug|module.codePath');
      expect(typeof info.appInfo.debug).assertEqual('boolean');
      expect(mod.codePath.indexOf('..') < 0).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0066', 'installTime|ability.labelId');
      expect(info.installTime > 0).assertTrue();
      expect(mod.abilitiesInfo[0].labelId > 0).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0067
     * @tc.name      testBundleInvariant0067
     * @tc.desc      Bundle invariant 67 checks that application icon id is valid and module code path is readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0067', 'app.iconId|module.codePath');
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(mod.codePath.indexOf('..') < 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0068', 'bundle.vendor|ability.labelId');
      expect(info.vendor).assertEqual(VENDOR);
      expect(mod.abilitiesInfo[0].labelId > 0).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0069
     * @tc.name      testBundleInvariant0069
     * @tc.desc      Bundle invariant 69 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0069', 'minCompatible|module.abilities');
      expect(info.minCompatibleVersionCode >= 1).assertTrue();
      expect(mod.abilitiesInfo.length >= 1).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0070', 'signature.appId|ability.exported');
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      expect(mod.abilitiesInfo[0].exported).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0071
     * @tc.name      testBundleInvariant0071
     * @tc.desc      Bundle invariant 71 checks that application uid is positive and entry module exposes abilities
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0071', 'app.uid|module.abilities');
      expect(info.appInfo.uid > 0).assertTrue();
      expect(mod.abilitiesInfo.length >= 1).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0072', 'bundle.versionCode|ability.exported');
      expect(info.versionCode >= 1).assertTrue();
      expect(mod.abilitiesInfo[0].exported).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0073
     * @tc.name      testBundleInvariant0073
     * @tc.desc      Bundle invariant 73 checks that debug flag is a boolean and module label id is valid
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0073', 'app.debug|module.labelId');
      expect(typeof info.appInfo.debug).assertEqual('boolean');
      expect(mod.labelId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0074', 'updateTime|module.type');
      expect(info.updateTime >= info.installTime).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0075
     * @tc.name      testBundleInvariant0075
     * @tc.desc      Bundle invariant 75 checks that application icon id is valid and module label id is valid
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0075', 'app.iconId|module.labelId');
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(mod.labelId > 0).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0076', 'app.name|module.type');
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0077
     * @tc.name      testBundleInvariant0077
     * @tc.desc      Bundle invariant 77 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0077', 'minCompatible|module.hash');
      expect(info.minCompatibleVersionCode >= 1).assertTrue();
      expect(typeof mod.hashValue === 'string').assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0078', 'signature.appId|ability.iconId');
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      expect(mod.abilitiesInfo[0].iconId > 0).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0079
     * @tc.name      testBundleInvariant0079
     * @tc.desc      Bundle invariant 79 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0079', 'app.uid|module.hash');
      expect(info.appInfo.uid > 0).assertTrue();
      expect(typeof mod.hashValue === 'string').assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0080', 'bundle.versionCode|ability.iconId');
      expect(info.versionCode >= 1).assertTrue();
      expect(mod.abilitiesInfo[0].iconId > 0).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0081
     * @tc.name      testBundleInvariant0081
     * @tc.desc      Bundle invariant 81 checks that debug flag is a boolean and first ability is EntryAbility
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0081', 'app.debug|ability.name');
      expect(typeof info.appInfo.debug).assertEqual('boolean');
      expect(mod.abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0082', 'updateTime|module.deviceTypes');
      expect(info.updateTime >= info.installTime).assertTrue();
      expect(mod.deviceTypes.length >= 1).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0083
     * @tc.name      testBundleInvariant0083
     * @tc.desc      Bundle invariant 83 checks that application icon id is valid and first ability is EntryAbility
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0083', 'app.iconId|ability.name');
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(mod.abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0084', 'app.name|module.deviceTypes');
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      expect(mod.deviceTypes.length >= 1).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0085
     * @tc.name      testBundleInvariant0085
     * @tc.desc      Bundle invariant 85 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0085', 'minCompatible|module.installationFree');
      expect(info.minCompatibleVersionCode >= 1).assertTrue();
      expect(mod.installationFree).assertFalse();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0086', 'signature.appId|ability.deviceTypes');
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      expect(mod.abilitiesInfo[0].deviceTypes.length >= 1).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0087
     * @tc.name      testBundleInvariant0087
     * @tc.desc      Bundle invariant 87 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0087', 'app.uid|module.installationFree');
      expect(info.appInfo.uid > 0).assertTrue();
      expect(mod.installationFree).assertFalse();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0088', 'bundle.versionCode|ability.deviceTypes');
      expect(info.versionCode >= 1).assertTrue();
      expect(mod.abilitiesInfo[0].deviceTypes.length >= 1).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0089
     * @tc.name      testBundleInvariant0089
     * @tc.desc      Bundle invariant 89 checks that debug flag is a boolean and EntryAbility is enabled
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0089', 'app.debug|ability.enabled');
      expect(typeof info.appInfo.debug).assertEqual('boolean');
      expect(mod.abilitiesInfo[0].enabled).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0090', 'updateTime|module.extensions');
      expect(info.updateTime >= info.installTime).assertTrue();
      expect(mod.extensionAbilitiesInfo.length >= 1).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0091
     * @tc.name      testBundleInvariant0091
     * @tc.desc      Bundle invariant 91 checks that application icon id is valid and EntryAbility is enabled
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0091', 'app.iconId|ability.enabled');
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(mod.abilitiesInfo[0].enabled).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0092', 'app.name|module.extensions');
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      expect(mod.extensionAbilitiesInfo.length >= 1).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0093
     * @tc.name      testBundleInvariant0093
     * @tc.desc      Bundle invariant 93 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0093', 'minCompatible|module.descriptionId');
      expect(info.minCompatibleVersionCode >= 1).assertTrue();
      expect(mod.descriptionId > 0).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0094', 'signature.fingerprint|module.name');
      expect(info.signatureInfo.fingerprint.length > 0).assertTrue();
      expect(mod.name).assertEqual(ENTRY_MODULE);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0095
     * @tc.name      testBundleInvariant0095
     * @tc.desc      Bundle invariant 95 checks that application uid is positive and module description id is valid
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0095', 'app.uid|module.descriptionId');
      expect(info.appInfo.uid > 0).assertTrue();
      expect(mod.descriptionId > 0).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0096', 'bundle.versionName|module.name');
      expect(info.versionName.length > 0).assertTrue();
      expect(mod.name).assertEqual(ENTRY_MODULE);
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0097
     * @tc.name      testBundleInvariant0097
     * @tc.desc      Bundle invariant 97 checks that debug flag is a boolean and EntryAbility label id is valid
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0097', 'app.debug|ability.labelId');
      expect(typeof info.appInfo.debug).assertEqual('boolean');
      expect(mod.abilitiesInfo[0].labelId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0098', 'updateTime|module.codePath');
      expect(info.updateTime >= info.installTime).assertTrue();
      expect(mod.codePath.indexOf('..') < 0).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0099
     * @tc.name      testBundleInvariant0099
     * @tc.desc      Bundle invariant 99 checks that application icon id is valid and EntryAbility label id is valid
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0099', 'app.iconId|ability.labelId');
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(mod.abilitiesInfo[0].labelId > 0).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0100', 'app.name|module.codePath');
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      expect(mod.codePath.indexOf('..') < 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0101
     * @tc.name      testBundleInvariant0101
     * @tc.desc      Bundle invariant 101 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0101', 'minCompatible|ability.exported');
      expect(info.minCompatibleVersionCode >= 1).assertTrue();
      expect(mod.abilitiesInfo[0].exported).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0102', 'signature.fingerprint|module.abilities');
      expect(info.signatureInfo.fingerprint.length > 0).assertTrue();
      expect(mod.abilitiesInfo.length >= 1).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0103
     * @tc.name      testBundleInvariant0103
     * @tc.desc      Bundle invariant 103 checks that application uid is positive and EntryAbility is exported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0103', 'app.uid|ability.exported');
      expect(info.appInfo.uid > 0).assertTrue();
      expect(mod.abilitiesInfo[0].exported).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0104', 'bundle.versionName|module.abilities');
      expect(info.versionName.length > 0).assertTrue();
      expect(mod.abilitiesInfo.length >= 1).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0105
     * @tc.name      testBundleInvariant0105
     * @tc.desc      Bundle invariant 105 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0105', 'app.descriptionId|module.type');
      expect(info.appInfo.descriptionId >= 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0106', 'updateTime|module.labelId');
      expect(info.updateTime >= info.installTime).assertTrue();
      expect(mod.labelId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0107
     * @tc.name      testBundleInvariant0107
     * @tc.desc      Bundle invariant 107 checks that at least one module is reported and entry module has ENTRY type
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0107', 'hapModules|module.type');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0108', 'app.name|module.labelId');
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      expect(mod.labelId > 0).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0109
     * @tc.name      testBundleInvariant0109
     * @tc.desc      Bundle invariant 109 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0109', 'minCompatible|ability.iconId');
      expect(info.minCompatibleVersionCode >= 1).assertTrue();
      expect(mod.abilitiesInfo[0].iconId > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0110', 'signature.fingerprint|module.hash');
      expect(info.signatureInfo.fingerprint.length > 0).assertTrue();
      expect(typeof mod.hashValue === 'string').assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0111
     * @tc.name      testBundleInvariant0111
     * @tc.desc      Bundle invariant 111 checks that application uid is positive and EntryAbility icon id is valid
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0111', 'app.uid|ability.iconId');
      expect(info.appInfo.uid > 0).assertTrue();
      expect(mod.abilitiesInfo[0].iconId > 0).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0112', 'bundle.versionName|module.hash');
      expect(info.versionName.length > 0).assertTrue();
      expect(typeof mod.hashValue === 'string').assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0113
     * @tc.name      testBundleInvariant0113
     * @tc.desc      Bundle invariant 113 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0113', 'app.descriptionId|module.deviceTypes');
      expect(info.appInfo.descriptionId >= 0).assertTrue();
      expect(mod.deviceTypes.length >= 1).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0114', 'updateTime|ability.name');
      expect(info.updateTime >= info.installTime).assertTrue();
      expect(mod.abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0115
     * @tc.name      testBundleInvariant0115
     * @tc.desc      Bundle invariant 115 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0115', 'hapModules|module.deviceTypes');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(mod.deviceTypes.length >= 1).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0116', 'app.name|ability.name');
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      expect(mod.abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0117
     * @tc.name      testBundleInvariant0117
     * @tc.desc      Bundle invariant 117 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0117', 'minCompatible|ability.deviceTypes');
      expect(info.minCompatibleVersionCode >= 1).assertTrue();
      expect(mod.abilitiesInfo[0].deviceTypes.length >= 1).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0118', 'signature.fingerprint|module.installationFree');
      expect(info.signatureInfo.fingerprint.length > 0).assertTrue();
      expect(mod.installationFree).assertFalse();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0119
     * @tc.name      testBundleInvariant0119
     * @tc.desc      Bundle invariant 119 checks that application uid is positive and EntryAbility declares device types
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0119', 'app.uid|ability.deviceTypes');
      expect(info.appInfo.uid > 0).assertTrue();
      expect(mod.abilitiesInfo[0].deviceTypes.length >= 1).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0120', 'bundle.versionName|module.installationFree');
      expect(info.versionName.length > 0).assertTrue();
      expect(mod.installationFree).assertFalse();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0121
     * @tc.name      testBundleInvariant0121
     * @tc.desc      Bundle invariant 121 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInvariant0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0121', 'app.descriptionId|module.extensions');
      expect(info.appInfo.descriptionId >= 0).assertTrue();
      expect(mod.extensionAbilitiesInfo.length >= 1).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0122', 'updateTime|ability.enabled');
      expect(info.updateTime >= info.installTime).assertTrue();
      expect(mod.abilitiesInfo[0].enabled).assertTrue();
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0123
     * @tc.name      testBundleInvariant0123
     * @tc.desc      Bundle invariant 123 cross-checks bundle and module fields
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInvariant0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0123', 'hapModules|module.extensions');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(mod.extensionAbilitiesInfo.length >= 1).assertTrue();
      expect(info.targetVersion > 0).assertTrue();
      expect(mod.type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0124', 'app.name|ability.enabled');
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      expect(mod.abilitiesInfo[0].enabled).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      expect(mod.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEINV_0125
     * @tc.name      testBundleInvariant0125
     * @tc.desc      Bundle invariant 125 checks that default app index is zero and entry module name matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInvariant0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await loadInfo();
      const mod: bundleManager.HapModuleInfo = await entryModuleInfo();
      logCase('testBundleInvariant0125', 'appIndex|module.name');
      expect(info.appIndex).assertEqual(0);
      expect(mod.name).assertEqual(ENTRY_MODULE);
      expect(info.signatureInfo.appId.includes(BUNDLE_NAME)).assertTrue();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      {
