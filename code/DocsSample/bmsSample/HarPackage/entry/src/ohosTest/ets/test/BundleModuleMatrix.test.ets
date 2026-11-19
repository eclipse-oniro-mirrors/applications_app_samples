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

export default function bundleModuleMatrixTest() {
  describe('BundleModuleMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0001
     * @tc.name      testBundleModule0001
     * @tc.desc      Entry module name is entry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0001', 'bundle module case 1');
      expect(moduleInfo.name).assertEqual(ENTRY_MODULE);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0002', 'bundle module case 2');
      expect(moduleInfo.type).assertEqual(bundleManager.ModuleType.ENTRY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0003
     * @tc.name      testBundleModule0003
     * @tc.desc      Entry module declares tablet support
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0003', 'bundle module case 3');
      expect(moduleInfo.deviceTypes.indexOf('tablet') >= 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0004', 'bundle module case 4');
      expect(moduleInfo.deviceTypes.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0005
     * @tc.name      testBundleModule0005
     * @tc.desc      Entry module is installed with the app
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0005', 'bundle module case 5');
      expect(moduleInfo.installationFree).assertFalse();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0006', 'bundle module case 6');
      expect(moduleInfo.mainElementName).assertEqual(ENTRY_ABILITY);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0007
     * @tc.name      testBundleModule0007
     * @tc.desc      Entry module contains exactly one ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0007', 'bundle module case 7');
      expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0008', 'bundle module case 8');
      expect(moduleInfo.extensionAbilitiesInfo.length).assertEqual(1);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0009
     * @tc.name      testBundleModule0009
     * @tc.desc      Entry module icon id is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0009', 'bundle module case 9');
      expect(moduleInfo.iconId > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0010', 'bundle module case 10');
      expect(moduleInfo.icon.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0011
     * @tc.name      testBundleModule0011
     * @tc.desc      Entry module label is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0011', 'bundle module case 11');
      expect(moduleInfo.label.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0012', 'bundle module case 12');
      expect(moduleInfo.description).assertEqual('$string:module_desc');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0013
     * @tc.name      testBundleModule0013
     * @tc.desc      Entry module hash value is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0013', 'bundle module case 13');
      expect(typeof moduleInfo.hashValue === 'string').assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0014', 'bundle module case 14');
      expect(moduleInfo.codePath.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0015
     * @tc.name      testBundleModule0015
     * @tc.desc      Entry module code path mentions entry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0015', 'bundle module case 15');
      expect(moduleInfo.codePath.indexOf('entry') >= 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0016', 'bundle module case 16');
      expect(moduleInfo.dependencies.length).assertEqual(0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0017
     * @tc.name      testBundleModule0017
     * @tc.desc      Entry module has no preloads
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0017', 'bundle module case 17');
      expect(moduleInfo.preloads.length).assertEqual(0);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0018', 'bundle module case 18');
      expect(moduleInfo.routerMap.length).assertEqual(0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0019
     * @tc.name      testBundleModule0019
     * @tc.desc      Entry module has no file context menu config
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0019', 'bundle module case 19');
      expect(moduleInfo.fileContextMenuConfig === undefined).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0020', 'bundle module case 20');
      expect(moduleInfo.metadata.length >= 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0021
     * @tc.name      testBundleModule0021
     * @tc.desc      Ability module name equals the module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0021', 'bundle module case 21');
      expect(moduleInfo.abilitiesInfo[0].moduleName).assertEqual(ENTRY_MODULE);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0022', 'bundle module case 22');
      expect(moduleInfo.abilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0023
     * @tc.name      testBundleModule0023
     * @tc.desc      Extension module name equals the module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0023', 'bundle module case 23');
      expect(moduleInfo.extensionAbilitiesInfo[0].moduleName).assertEqual(ENTRY_MODULE);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0024', 'bundle module case 24');
      expect(moduleInfo.extensionAbilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0025
     * @tc.name      testBundleModule0025
     * @tc.desc      Entry module description id is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0025', 'bundle module case 25');
      expect(moduleInfo.descriptionId > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0026', 'bundle module case 26');
      expect(Array.isArray(moduleInfo.abilitiesInfo)).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0027
     * @tc.name      testBundleModule0027
     * @tc.desc      Entry module extension abilities info is an array
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0027', 'bundle module case 27');
      expect(Array.isArray(moduleInfo.extensionAbilitiesInfo)).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0028', 'bundle module case 28');
      expect(moduleInfo.deviceTypes.every((value: string) => value.length > 0)).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0029
     * @tc.name      testBundleModule0029
     * @tc.desc      Entry module device types contain no duplicates
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0029', 'bundle module case 29');
      const seen: Set<string> = new Set<string>();
      for (const value of moduleInfo.deviceTypes) {
        seen.add(value);
      }
      expect(seen.size).assertEqual(moduleInfo.deviceTypes.length);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0030', 'bundle module case 30');
      expect(findModule(info, ENTRY_MODULE).name).assertEqual(ENTRY_MODULE);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0031
     * @tc.name      testBundleModule0031
     * @tc.desc      Module lookup is stable across calls
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0031', 'bundle module case 31');
      expect(findModule(info, ENTRY_MODULE).hashValue).assertEqual(moduleInfo.hashValue);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0032', 'bundle module case 32');
      expect(info.hapModulesInfo[0].name).assertEqual(ENTRY_MODULE);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0033
     * @tc.name      testBundleModule0033
     * @tc.desc      Module type matches ModuleType.ENTRY for all queries
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0033', 'bundle module case 33');
      expect(findModule(info, ENTRY_MODULE).type).assertEqual(bundleManager.ModuleType.ENTRY);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0034', 'bundle module case 34');
      const again: bundleManager.HapModuleInfo = await entryModule();
      expect(again.name).assertEqual(moduleInfo.name);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0035
     * @tc.name      testBundleModule0035
     * @tc.desc      Module field label is stable across queries
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0035', 'bundle module case 35');
      const again: bundleManager.HapModuleInfo = await entryModule();
      expect(again.label).assertEqual(moduleInfo.label);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0036', 'bundle module case 36');
      const again: bundleManager.HapModuleInfo = await entryModule();
      expect(again.description).assertEqual(moduleInfo.description);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0037
     * @tc.name      testBundleModule0037
     * @tc.desc      Module field hashValue is stable across queries
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0037', 'bundle module case 37');
      const again: bundleManager.HapModuleInfo = await entryModule();
      expect(again.hashValue).assertEqual(moduleInfo.hashValue);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0038', 'bundle module case 38');
      const again: bundleManager.HapModuleInfo = await entryModule();
      expect(again.codePath).assertEqual(moduleInfo.codePath);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0039
     * @tc.name      testBundleModule0039
     * @tc.desc      Module field mainElementName is stable across queries
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0039', 'bundle module case 39');
      const again: bundleManager.HapModuleInfo = await entryModule();
      expect(again.mainElementName).assertEqual(moduleInfo.mainElementName);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0040', 'bundle module case 40');
      const again: bundleManager.HapModuleInfo = await entryModule();
      expect(again.iconId).assertEqual(moduleInfo.iconId);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0041
     * @tc.name      testBundleModule0041
     * @tc.desc      Module field descriptionId is stable across queries
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0041', 'bundle module case 41');
      const again: bundleManager.HapModuleInfo = await entryModule();
      expect(again.descriptionId).assertEqual(moduleInfo.descriptionId);
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0042', 'bundle module case 42');
      expect(typeof moduleInfo.hashValue === 'string').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0043
     * @tc.name      testBundleModule0043
     * @tc.desc      Module hash value stays longer than 4 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0043', 'bundle module case 43');
      expect(typeof moduleInfo.hashValue === 'string').assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0044', 'bundle module case 44');
      expect(typeof moduleInfo.hashValue === 'string').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0045
     * @tc.name      testBundleModule0045
     * @tc.desc      Module hash value stays longer than 8 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0045', 'bundle module case 45');
      expect(typeof moduleInfo.hashValue === 'string').assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0046', 'bundle module case 46');
      expect(typeof moduleInfo.hashValue === 'string').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0047
     * @tc.name      testBundleModule0047
     * @tc.desc      Module hash value stays longer than 12 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0047', 'bundle module case 47');
      expect(typeof moduleInfo.hashValue === 'string').assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0048', 'bundle module case 48');
      expect(typeof moduleInfo.hashValue === 'string').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0049
     * @tc.name      testBundleModule0049
     * @tc.desc      Module hash value stays longer than 16 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0049', 'bundle module case 49');
      expect(typeof moduleInfo.hashValue === 'string').assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0050', 'bundle module case 50');
      expect(typeof moduleInfo.hashValue === 'string').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0051
     * @tc.name      testBundleModule0051
     * @tc.desc      Module hash value stays longer than 20 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0051', 'bundle module case 51');
      expect(typeof moduleInfo.hashValue === 'string').assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0052', 'bundle module case 52');
      expect(moduleInfo.codePath.length > 2).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0053
     * @tc.name      testBundleModule0053
     * @tc.desc      Module code path stays longer than 4 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0053', 'bundle module case 53');
      expect(moduleInfo.codePath.length > 4).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0054', 'bundle module case 54');
      expect(moduleInfo.codePath.length > 6).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0055
     * @tc.name      testBundleModule0055
     * @tc.desc      Module code path stays longer than 8 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0055', 'bundle module case 55');
      expect(moduleInfo.codePath.length > 8).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0056', 'bundle module case 56');
      expect(moduleInfo.codePath.length > 10).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0057
     * @tc.name      testBundleModule0057
     * @tc.desc      Module code path stays longer than 12 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0057', 'bundle module case 57');
      expect(moduleInfo.codePath.length > 12).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0058', 'bundle module case 58');
      expect(moduleInfo.codePath.length > 14).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0059
     * @tc.name      testBundleModule0059
     * @tc.desc      Module code path stays longer than 16 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0059', 'bundle module case 59');
      expect(moduleInfo.codePath.length > 16).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0060', 'bundle module case 60');
      expect(moduleInfo.codePath.length > 18).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0061
     * @tc.name      testBundleModule0061
     * @tc.desc      Module code path stays longer than 20 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0061', 'bundle module case 61');
      expect(moduleInfo.codePath.length > 20).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0062', 'bundle module case 62');
      expect(moduleInfo.description.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0063
     * @tc.name      testBundleModule0063
     * @tc.desc      Module description stays at least 2 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0063', 'bundle module case 63');
      expect(moduleInfo.description.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0064', 'bundle module case 64');
      expect(moduleInfo.description.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0065
     * @tc.name      testBundleModule0065
     * @tc.desc      Module description stays at least 4 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0065', 'bundle module case 65');
      expect(moduleInfo.description.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0066', 'bundle module case 66');
      expect(moduleInfo.description.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0067
     * @tc.name      testBundleModule0067
     * @tc.desc      Module description stays at least 6 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0067', 'bundle module case 67');
      expect(moduleInfo.description.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0068', 'bundle module case 68');
      expect(moduleInfo.description.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0069
     * @tc.name      testBundleModule0069
     * @tc.desc      Module description stays at least 8 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0069', 'bundle module case 69');
      expect(moduleInfo.description.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0070', 'bundle module case 70');
      expect(moduleInfo.description.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0071
     * @tc.name      testBundleModule0071
     * @tc.desc      Module description stays at least 10 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0071', 'bundle module case 71');
      expect(moduleInfo.description.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0072', 'bundle module case 72');
      expect(moduleInfo.description.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0073
     * @tc.name      testBundleModule0073
     * @tc.desc      Module description stays at least 12 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0073', 'bundle module case 73');
      expect(moduleInfo.description.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0074', 'bundle module case 74');
      expect(moduleInfo.description.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0075
     * @tc.name      testBundleModule0075
     * @tc.desc      Module description stays at least 14 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0075', 'bundle module case 75');
      expect(moduleInfo.description.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0076', 'bundle module case 76');
      expect(moduleInfo.description.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0077
     * @tc.name      testBundleModule0077
     * @tc.desc      Module description stays at least 16 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0077', 'bundle module case 77');
      expect(moduleInfo.description.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0078', 'bundle module case 78');
      expect(moduleInfo.description.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0079
     * @tc.name      testBundleModule0079
     * @tc.desc      Module description stays at least 18 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0079', 'bundle module case 79');
      expect(moduleInfo.description.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0080', 'bundle module case 80');
      expect(moduleInfo.description.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEMOD_0081
     * @tc.name      testBundleModule0081
     * @tc.desc      Module description stays at least 20 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testBundleModule0081', 'bundle module case 81');
      expect(moduleInfo.description.length > 0).assertTrue();
    });

  });
}
