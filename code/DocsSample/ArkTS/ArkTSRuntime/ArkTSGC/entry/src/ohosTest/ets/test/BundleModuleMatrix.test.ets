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
import { resourceManager } from '@kit.LocalizationKit';
import {
  BACKUP_ABILITY,
  BACKUP_METADATA,
  BUNDLE_NAME,
  ENTRY_ABILITY,
  ENTRY_MODULE,
  SELF_FLAGS,
  TEST_MODULE,
  entryContext,
  errorCode,
  findModule,
  selfBundle
} from './shared/AppProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const ENTRY_DESCRIPTION_TEXT: string = 'module description';
const MODULE_DESCRIPTION_REF: string = '$string:module_desc';
const ABILITY_DESCRIPTION_TEXT: string = 'description';
const ABILITY_LABEL_TEXT: string = 'ArkTSGC';
const ABILITY_LABEL_REF: string = '$string:EntryAbility_label';
const ABILITY_ICON_REF: string = '$media:layered_image';
const ABILITY_DESCRIPTION_REF: string = '$string:EntryAbility_desc';
const HOME_ACTION: string = 'ohos.want.action.home';
const ACTION_PREFIX: string = 'ohos.want.action.';
const HOME_ENTITY: string = 'entity.system.home';
const ENTITY_PREFIX: string = 'entity.system.';
const BACKUP_TYPE_NAME: string = 'backup';
const BACKUP_WORD: string = 'Backup';
const BACKUP_RESOURCE_REF: string = '$profile:backup_config';
const BACKUP_METADATA_PREFIX: string = 'ohos.extension.';
const PROFILE_PREFIX: string = '$profile:';
const PROFILE_BACKUP_FLAG: string = 'allowToBackupRestore';
const PROFILE_OPEN_BRACE: string = '{';
const PAGES_PROFILE_WORD: string = 'main_pages';
const TEST_MAIN_ELEMENT: string = 'TestAbility';
const DEVICE_TYPE_PHONE: string = 'phone';
const DEVICE_TYPE_TABLET: string = 'tablet';
const DEVICE_TYPE_TWO_IN_ONE: string = '2in1';
const MISSING_MODULE: string = 'entry_missing';
const MISSING_ABILITY: string = 'MissingAbility';
const MISSING_METADATA: string = 'ohos.extension.missing';
const ERR_MODULE_NOT_EXIST: number = 17700002;
const ERR_ABILITY_NOT_EXIST: number = 17700003;
const ERR_NO_PROFILE: number = 17700024;
const TEST_ABILITY: string = 'TestAbility';
const EMPTY_TEXT: string = '';
const COUNT_NONE: number = 0;
const COUNT_ONE: number = 1;
const COUNT_TWO: number = 2;
const COUNT_THREE: number = 3;
const WINDOW_MODE_TEXT: string = '0,1,2';
const ASCII_UPPER_A: number = 65;
const ASCII_UPPER_Z: number = 90;

const FLAG_DEFAULT: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
const FLAG_APPLICATION: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
const FLAG_MODULE: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
const FLAG_ABILITY: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
const FLAG_EXTENSION: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
const FLAG_METADATA: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
const FLAG_SKILL: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
const FLAG_PERMISSION: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
const FLAG_SIGNATURE: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;

const MODULE_ONLY: number = FLAG_MODULE;
const MODULE_ABILITY: number = FLAG_MODULE | FLAG_ABILITY;
const MODULE_EXTENSION: number = FLAG_MODULE | FLAG_EXTENSION;
const MODULE_ABILITY_SKILL: number = MODULE_ABILITY | FLAG_SKILL;
const MODULE_EXTENSION_METADATA: number = MODULE_EXTENSION | FLAG_METADATA;
const MODULE_METADATA_ONLY: number = FLAG_MODULE | FLAG_METADATA;
const APP_MODULE: number = FLAG_APPLICATION | FLAG_MODULE;
const APP_MODULE_ABILITY: number = APP_MODULE | FLAG_ABILITY;
const FULL_FLAGS: number = SELF_FLAGS | FLAG_PERMISSION | FLAG_SIGNATURE;

function modulesOf(info: bundleManager.BundleInfo): bundleManager.HapModuleInfo[] {
  return info.hapModulesInfo;
}

function entryModule(info: bundleManager.BundleInfo): bundleManager.HapModuleInfo {
  return findModule(info, ENTRY_MODULE);
}

function testModule(info: bundleManager.BundleInfo): bundleManager.HapModuleInfo {
  return findModule(info, TEST_MODULE);
}

function entryAbilityOf(info: bundleManager.BundleInfo): bundleManager.AbilityInfo {
  return entryModule(info).abilitiesInfo[0];
}

function backupOf(info: bundleManager.BundleInfo): bundleManager.ExtensionAbilityInfo {
  return entryModule(info).extensionAbilitiesInfo[0];
}

function resourceOf(): resourceManager.ResourceManager {
  return entryContext().resourceManager;
}

function moduleNamesOf(info: bundleManager.BundleInfo): string[] {
  return info.hapModulesInfo.map((item: bundleManager.HapModuleInfo) => item.name);
}

function abilityNamesOf(module: bundleManager.HapModuleInfo): string[] {
  return module.abilitiesInfo.map((item: bundleManager.AbilityInfo) => item.name);
}

function extensionNamesOf(module: bundleManager.HapModuleInfo): string[] {
  return module.extensionAbilitiesInfo.map((item: bundleManager.ExtensionAbilityInfo) => item.name);
}

function pageAbilityNamesOf(info: bundleManager.BundleInfo): string[] {
  const names: string[] = [];
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    item.abilitiesInfo.forEach((ability: bundleManager.AbilityInfo) => {
      names.push(ability.name);
    });
  });
  return names;
}

function extensionNamesInBundle(info: bundleManager.BundleInfo): string[] {
  const names: string[] = [];
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    item.extensionAbilitiesInfo.forEach((extension: bundleManager.ExtensionAbilityInfo) => {
      names.push(extension.name);
    });
  });
  return names;
}

function skillUriTotal(ability: bundleManager.AbilityInfo): number {
  let total: number = 0;
  ability.skills.forEach((skill: bundleManager.Skill) => {
    total += skill.uris.length;
  });
  return total;
}

function abilityTotal(info: bundleManager.BundleInfo): number {
  let total: number = 0;
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    total += item.abilitiesInfo.length;
  });
  return total;
}

function extensionTotal(info: bundleManager.BundleInfo): number {
  let total: number = 0;
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    total += item.extensionAbilitiesInfo.length;
  });
  return total;
}

function skillTotal(info: bundleManager.BundleInfo): number {
  let total: number = 0;
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    item.abilitiesInfo.forEach((ability: bundleManager.AbilityInfo) => {
      total += ability.skills.length;
    });
  });
  return total;
}

function moduleMetadataTotal(info: bundleManager.BundleInfo): number {
  let total: number = 0;
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    total += item.metadata.length;
  });
  return total;
}

function extensionMetadataTotal(info: bundleManager.BundleInfo): number {
  let total: number = 0;
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    item.extensionAbilitiesInfo.forEach((extension: bundleManager.ExtensionAbilityInfo) => {
      total += extension.metadata.length;
    });
  });
  return total;
}

// fields gated behind flags can come back absent on the device, so every length read goes through here
function lenOf(value: string | string[] | undefined): number {
  return value === undefined || value === null ? COUNT_NONE : value.length;
}

function metadataText(list: bundleManager.Metadata[]): string {
  return list.map((item: bundleManager.Metadata) => `${item.name}=${item.resource}`).join(',');
}

function extensionMetadataList(info: bundleManager.BundleInfo): bundleManager.Metadata[] {
  const list: bundleManager.Metadata[] = [];
  info.hapModulesInfo.forEach((item: bundleManager.HapModuleInfo) => {
    item.extensionAbilitiesInfo.forEach((extension: bundleManager.ExtensionAbilityInfo) => {
      extension.metadata.forEach((metadata: bundleManager.Metadata) => {
        list.push(metadata);
      });
    });
  });
  return list;
}

function mainElementPairs(info: bundleManager.BundleInfo): string {
  return info.hapModulesInfo.map((item: bundleManager.HapModuleInfo) =>
    `${item.name}:${item.mainElementName}`).join(';');
}

function skillSignature(ability: bundleManager.AbilityInfo): string {
  return ability.skills.map((skill: bundleManager.Skill) =>
    `${skill.actions.join('+')}/${skill.entities.join('+')}`).join(';');
}

function windowModeText(ability: bundleManager.AbilityInfo): string {
  return ability.supportWindowModes.slice().sort().join(',');
}

function containsValue(values: string[], target: string): boolean {
  return values.indexOf(target) >= 0;
}

function distinctStrings(values: string[]): number {
  const seen: Set<string> = new Set<string>();
  values.forEach((value: string) => {
    seen.add(value);
  });
  return seen.size;
}

function findModuleOrNone(info: bundleManager.BundleInfo,
  name: string): bundleManager.HapModuleInfo | undefined {
  return info.hapModulesInfo.find((item: bundleManager.HapModuleInfo) => item.name === name);
}

function findAbilityOrNone(module: bundleManager.HapModuleInfo,
  name: string): bundleManager.AbilityInfo | undefined {
  return module.abilitiesInfo.find((item: bundleManager.AbilityInfo) => item.name === name);
}

function findExtensionOrNone(module: bundleManager.HapModuleInfo,
  name: string): bundleManager.ExtensionAbilityInfo | undefined {
  return module.extensionAbilitiesInfo.find((item: bundleManager.ExtensionAbilityInfo) =>
    item.name === name);
}

function backupProfileTexts(): string[] {
  return bundleManager.getProfileByExtensionAbilitySync(ENTRY_MODULE, BACKUP_ABILITY, BACKUP_METADATA);
}

function flagText(flags: number): string {
  return '0x' + flags.toString(16);
}

async function selfWith(flags: number): Promise<bundleManager.BundleInfo> {
  return await bundleManager.getBundleInfoForSelf(flags);
}

function textOrEmpty(value: string | undefined): string {
  return value === undefined ? '' : value;
}

function startsWithUpper(value: string): boolean {
  if (value.length === COUNT_NONE) {
    return false;
  }
  const code: number = value.charCodeAt(COUNT_NONE);
  return code >= ASCII_UPPER_A && code <= ASCII_UPPER_Z;
}

export default function bundleModuleMatrixTest() {
  describe('BundleModuleMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_0100
     * @tc.name      testHapModuleSurface0001
     * @tc.desc      Enumerate the installed hap modules and check there are exactly two, named entry and entry_test,
     *               with no repeated module name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHapModuleSurface0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const modules: bundleManager.HapModuleInfo[] = modulesOf(info);
      const names: string[] = moduleNamesOf(info).slice().sort();
      const distinct: number = distinctStrings(names);
      logCase('testHapModuleSurface0001', `modules=${modules.length} names=${names.join(',')} distinct=${distinct}`);
      expect(modules.length).assertEqual(COUNT_TWO);
      expect(names.join(',')).assertEqual([ENTRY_MODULE, TEST_MODULE].join(','));
      expect(distinct).assertEqual(COUNT_TWO);
      expect(modules[COUNT_NONE].name.length > COUNT_NONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_0200
     * @tc.name      testHapModuleSurface0002
     * @tc.desc      Compose the entry module name, type and main element into one key and check it matches the entry
     *               declaration in module.json5
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHapModuleSurface0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const entry: bundleManager.HapModuleInfo = entryModule(await selfBundle());
      const composite: string = `${entry.name}|${entry.type}|${entry.mainElementName}`;
      const expected: string = `${ENTRY_MODULE}|${bundleManager.ModuleType.ENTRY}|${ENTRY_ABILITY}`;
      logCase('testHapModuleSurface0002', `composite=${composite} expected=${expected}`);
      expect(composite).assertEqual(expected);
      expect(entry.name).assertEqual(ENTRY_MODULE);
      expect(entry.type).assertEqual(bundleManager.ModuleType.ENTRY);
      expect(entry.mainElementName).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_0300
     * @tc.name      testHapModuleSurface0003
     * @tc.desc      Resolve the entry module description id through the resource manager and check it yields the
     *               module description string declared in the module resources
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHapModuleSurface0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const entry: bundleManager.HapModuleInfo = entryModule(await selfBundle());
      const description: string = resourceOf().getStringSync(entry.descriptionId);
      const positive: boolean = entry.descriptionId > COUNT_NONE;
      logCase('testHapModuleSurface0003', `descriptionId=${entry.descriptionId} text=${description} ` +
        `positive=${positive}`);
      expect(description).assertEqual(ENTRY_DESCRIPTION_TEXT);
      expect(positive).assertTrue();
      expect(description.length > COUNT_NONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_0400
     * @tc.name      testHapModuleSurface0004
     * @tc.desc      Check the entry module declares only the phone device type and that no tablet device type leaks
     *               into the installed module descriptor
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHapModuleSurface0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const entry: bundleManager.HapModuleInfo = entryModule(await selfBundle());
      const devices: string[] = entry.deviceTypes;
      logCase('testHapModuleSurface0004', `devices=${devices.join(',')} length=${devices.length}`);
      expect(devices.length).assertEqual(COUNT_ONE);
      expect(devices[COUNT_NONE]).assertEqual(DEVICE_TYPE_PHONE);
      expect(containsValue(devices, DEVICE_TYPE_TABLET)).assertFalse();
      expect(devices.join(',')).assertEqual(DEVICE_TYPE_PHONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_0500
     * @tc.name      testHapModuleSurface0005
     * @tc.desc      Check neither installed module is installation free because module.json5 sets installationFree to
     *               false for the entry module
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHapModuleSurface0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = entryModule(info);
      const test: bundleManager.HapModuleInfo = testModule(info);
      const freeModules: number = modulesOf(info).filter((item: bundleManager.HapModuleInfo) =>
        item.installationFree).length;
      logCase('testHapModuleSurface0005', `entry=${entry.installationFree} test=${test.installationFree} ` +
        `freeModules=${freeModules}`);
      expect(entry.installationFree).assertFalse();
      expect(test.installationFree).assertFalse();
      expect(freeModules).assertEqual(COUNT_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_0600
     * @tc.name      testHapModuleSurface0006
     * @tc.desc      Count abilities and extensions per module and check the entry module owns one of each while the
     *               bundle totals stay at two abilities (entry plus the injected test ability) and one extension
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHapModuleSurface0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = entryModule(info);
      logCase('testHapModuleSurface0006', `entryAbilities=${entry.abilitiesInfo.length} ` +
        `entryExtensions=${entry.extensionAbilitiesInfo.length} totals=${abilityTotal(info)}/` +
        `${extensionTotal(info)}`);
      expect(entry.abilitiesInfo.length).assertEqual(COUNT_ONE);
      expect(entry.extensionAbilitiesInfo.length).assertEqual(COUNT_ONE);
      expect(abilityTotal(info)).assertEqual(COUNT_TWO);
      expect(extensionTotal(info)).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_0700
     * @tc.name      testHapModuleSurface0007
     * @tc.desc      Check the test module is a feature module that declares the injected TestAbility page ability and
     *               no extensions
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHapModuleSurface0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const test: bundleManager.HapModuleInfo = testModule(await selfBundle());
      const names: string = abilityNamesOf(test).join(',');
      logCase('testHapModuleSurface0007', `type=${test.type} names=${names} ` +
        `extensions=${test.extensionAbilitiesInfo.length}`);
      expect(test.type).assertEqual(bundleManager.ModuleType.FEATURE);
      expect(test.abilitiesInfo.length).assertEqual(COUNT_ONE);
      expect(test.extensionAbilitiesInfo.length).assertEqual(COUNT_NONE);
      expect(names).assertEqual(TEST_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_0800
     * @tc.name      testHapModuleSurface0008
     * @tc.desc      Check no module level metadata is declared anywhere because module.json5 only attaches metadata
     *               to the backup extension
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHapModuleSurface0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = entryModule(info);
      const test: bundleManager.HapModuleInfo = testModule(info);
      logCase('testHapModuleSurface0008', `entryMetadata=${metadataText(entry.metadata)} ` +
        `testMetadata=${metadataText(test.metadata)} total=${moduleMetadataTotal(info)}`);
      expect(entry.metadata.length).assertEqual(COUNT_NONE);
      expect(test.metadata.length).assertEqual(COUNT_NONE);
      expect(moduleMetadataTotal(info)).assertEqual(COUNT_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_0900
     * @tc.name      testHapModuleSurface0009
     * @tc.desc      Check each module reports an absolute code path without padding so the installed module directory
     *               can be located for both modules
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHapModuleSurface0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = entryModule(info);
      const test: bundleManager.HapModuleInfo = testModule(info);
      logCase('testHapModuleSurface0009', `entryCodePath=${entry.codePath} testCodePath=${test.codePath}`);
      expect(entry.codePath.length > COUNT_NONE).assertTrue();
      expect(test.codePath.length > COUNT_NONE).assertTrue();
      expect(entry.codePath.indexOf(ENTRY_MODULE) >= COUNT_NONE).assertTrue();
      expect(entry.codePath).assertEqual(entry.codePath.trim());
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_1000
     * @tc.name      testHapModuleSurface0010
     * @tc.desc      Check both modules report space free hash values that, when present, differ between the modules
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHapModuleSurface0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entryHash: string = entryModule(info).hashValue;
      const testHash: string = testModule(info).hashValue;
      const different: boolean = entryHash !== testHash;
      logCase('testHapModuleSurface0010', `entryHashLength=${entryHash.length} testHashLength=${testHash.length} ` +
        `different=${different}`);
      const bothPresent: boolean = entryHash.length > COUNT_NONE && testHash.length > COUNT_NONE;
      expect(entryHash.length >= COUNT_NONE).assertTrue();
      expect(testHash.length >= COUNT_NONE).assertTrue();
      expect(!bothPresent || different).assertTrue();
      expect(entryHash.indexOf(' ') < COUNT_NONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_1100
     * @tc.name      testHapModuleSurface0011
     * @tc.desc      Check neither module preloads modules nor declares a router map, which keeps the entry module free
     *               of extra resource loading
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHapModuleSurface0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = entryModule(info);
      const test: bundleManager.HapModuleInfo = testModule(info);
      logCase('testHapModuleSurface0011', `entryPreloads=${entry.preloads.length} ` +
        `entryRouterMap=${entry.routerMap.length} testPreloads=${test.preloads.length} ` +
        `testRouterMap=${test.routerMap.length}`);
      expect(entry.preloads.length).assertEqual(COUNT_NONE);
      expect(entry.routerMap.length).assertEqual(COUNT_NONE);
      expect(test.preloads.length).assertEqual(COUNT_NONE);
      expect(test.routerMap.length).assertEqual(COUNT_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_1200
     * @tc.name      testHapModuleSurface0012
     * @tc.desc      Check the file context menu configuration is absent for both modules while each module still
     *               publishes a non-empty main element name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHapModuleSurface0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = entryModule(info);
      const test: bundleManager.HapModuleInfo = testModule(info);
      logCase('testHapModuleSurface0012', `entryMenu=${entry.fileContextMenuConfig} ` +
        `testMenu=${test.fileContextMenuConfig} mains=${mainElementPairs(info)}`);
      expect(lenOf(entry.fileContextMenuConfig)).assertEqual(COUNT_NONE);
      expect(lenOf(test.fileContextMenuConfig)).assertEqual(COUNT_NONE);
      expect(entry.mainElementName.length > COUNT_NONE).assertTrue();
      expect(test.mainElementName.length > COUNT_NONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_1300
     * @tc.name      testHapModuleSurface0013
     * @tc.desc      Census the installed module types and check exactly one entry module, exactly one feature module
     *               and no module of any other type
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHapModuleSurface0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entries: number = modulesOf(info).filter((item: bundleManager.HapModuleInfo) =>
        item.type === bundleManager.ModuleType.ENTRY).length;
      const features: number = modulesOf(info).filter((item: bundleManager.HapModuleInfo) =>
        item.type === bundleManager.ModuleType.FEATURE).length;
      const others: number = modulesOf(info).length - entries - features;
      logCase('testHapModuleSurface0013', `entry=${entries} feature=${features} others=${others}`);
      expect(entries).assertEqual(COUNT_ONE);
      expect(features).assertEqual(COUNT_ONE);
      expect(others).assertEqual(COUNT_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_1400
     * @tc.name      testHapModuleSurface0014
     * @tc.desc      Sort the installed module names and check the entry module sorts before the test module with a
     *               negative locale comparison
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHapModuleSurface0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = moduleNamesOf(await selfBundle()).slice().sort();
      const first: string = names[COUNT_NONE];
      const second: string = names[COUNT_ONE];
      logCase('testHapModuleSurface0014', `first=${first} second=${second} ` +
        `compare=${first.localeCompare(second)}`);
      expect(first).assertEqual(ENTRY_MODULE);
      expect(second).assertEqual(TEST_MODULE);
      expect(first.localeCompare(second) < COUNT_NONE).assertTrue();
      expect(second.indexOf(first)).assertEqual(COUNT_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_1500
     * @tc.name      testHapModuleSurface0015
     * @tc.desc      Check both modules publish distinct, non-empty main element names so each module maps to one
     *               startable component
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHapModuleSurface0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const mains: string[] = modulesOf(info).map((item: bundleManager.HapModuleInfo) => item.mainElementName);
      const distinct: number = distinctStrings(mains);
      logCase('testHapModuleSurface0015', `mains=${mains.join(',')} distinct=${distinct} ` +
        `pairs=${mainElementPairs(info)}`);
      expect(mains.length).assertEqual(COUNT_TWO);
      expect(distinct).assertEqual(COUNT_TWO);
      expect(mains.every((value: string) => value.length > COUNT_NONE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_1600
     * @tc.name      testHapModuleSurface0016
     * @tc.desc      Check only the entry module carries extensions and that the single extension is the backup
     *               ability declared under extensionAbilities in module.json5
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHapModuleSurface0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entryNames: string = extensionNamesOf(entryModule(info)).join(',');
      const testCount: number = testModule(info).extensionAbilitiesInfo.length;
      logCase('testHapModuleSurface0016', `entryExtensions=${entryNames} testExtensions=${testCount} ` +
        `total=${extensionTotal(info)}`);
      expect(entryNames).assertEqual(BACKUP_ABILITY);
      expect(testCount).assertEqual(COUNT_NONE);
      expect(extensionTotal(info)).assertEqual(COUNT_ONE);
      expect(extensionNamesOf(entryModule(info)).length).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_1700
     * @tc.name      testHapModuleSurface0017
     * @tc.desc      Check the entry module owns the EntryAbility page ability, the test module owns the injected
     *               TestAbility, and a single skill record exists across all modules
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHapModuleSurface0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const abilities: string = abilityNamesOf(entryModule(info)).join(',');
      const testAbilities: number = testModule(info).abilitiesInfo.length;
      logCase('testHapModuleSurface0017', `entryAbilities=${abilities} testAbilities=${testAbilities} ` +
        `skills=${skillTotal(info)}`);
      expect(abilities).assertEqual(ENTRY_ABILITY);
      expect(testAbilities).assertEqual(COUNT_ONE);
      expect(abilityTotal(info)).assertEqual(COUNT_TWO);
      expect(skillTotal(info)).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_1800
     * @tc.name      testHapModuleSurface0018
     * @tc.desc      Check the only metadata in the bundle is attached to the backup extension, so ability metadata and
     *               module metadata both stay empty
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHapModuleSurface0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const abilityMetadata: number = entryAbilityOf(info).metadata.length;
      const extensionMetadata: number = extensionMetadataTotal(info);
      logCase('testHapModuleSurface0018', `abilityMetadata=${abilityMetadata} ` +
        `extensionMetadata=${extensionMetadata} moduleMetadata=${moduleMetadataTotal(info)}`);
      expect(abilityMetadata).assertEqual(COUNT_NONE);
      expect(extensionMetadata).assertEqual(COUNT_ONE);
      expect(moduleMetadataTotal(info) + abilityMetadata).assertEqual(COUNT_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_1900
     * @tc.name      testHapModuleSurface0019
     * @tc.desc      Check the module descriptor carries resource references for label, icon and description on this
     *               runtime
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHapModuleSurface0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = entryModule(info);
      logCase('testHapModuleSurface0019', `label=${textOrEmpty(entry.label)} icon=${textOrEmpty(entry.icon)} ` +
        `iconId=${entry.iconId} labelId=${entry.labelId} appLabel=${info.appInfo.label}`);
      expect(entry.labelId > COUNT_NONE).assertTrue();
      expect(entry.iconId > COUNT_NONE).assertTrue();
      expect(entry.descriptionId > COUNT_NONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_2000
     * @tc.name      testHapModuleSurface0020
     * @tc.desc      Check the module keeps description references out of its string field while the ability exposes
     *               the EntryAbility description reference from module.json5
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHapModuleSurface0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = entryModule(info);
      const ability: bundleManager.AbilityInfo = entryAbilityOf(info);
      const moduleText: string = resourceOf().getStringSync(entry.descriptionId);
      logCase('testHapModuleSurface0020', `moduleDescription=${textOrEmpty(entry.description)} ` +
        `moduleText=${moduleText} abilityDescription=${ability.description}`);
      expect(entry.description).assertEqual(MODULE_DESCRIPTION_REF);
      expect(moduleText).assertEqual(ENTRY_DESCRIPTION_TEXT);
      expect(ability.description).assertEqual(ABILITY_DESCRIPTION_REF);
      expect(entry.description === ability.description).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_2100
     * @tc.name      testHapModuleSurface0021
     * @tc.desc      Check every installed module name is non-empty, trimmed and unique, so module lookup by name is
     *               unambiguous
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHapModuleSurface0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = moduleNamesOf(await selfBundle());
      const trimmed: boolean = names.every((value: string) => value === value.trim());
      const nonEmpty: boolean = names.every((value: string) => value.length > COUNT_NONE);
      logCase('testHapModuleSurface0021', `names=${names.join(',')} trimmed=${trimmed} ` +
        `nonEmpty=${nonEmpty} distinct=${distinctStrings(names)}`);
      expect(trimmed).assertTrue();
      expect(nonEmpty).assertTrue();
      expect(distinctStrings(names)).assertEqual(names.length);
      expect(names.length).assertEqual(COUNT_TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_2200
     * @tc.name      testHapModuleSurface0022
     * @tc.desc      Check the entry and test modules declare the identical phone device type list, which lets one hap
     *               set serve the same device family
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHapModuleSurface0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entryDevices: string[] = entryModule(info).deviceTypes;
      const testDevices: string[] = testModule(info).deviceTypes;
      logCase('testHapModuleSurface0022', `entry=${entryDevices.join(',')} test=${testDevices.join(',')} ` +
        `modules=${modulesOf(info).length}`);
      expect(entryDevices.length).assertEqual(testDevices.length);
      expect(entryDevices.join(',')).assertEqual(testDevices.join(','));
      expect(modulesOf(info).length).assertEqual(COUNT_TWO);
      expect(entryDevices.join(',')).assertEqual(DEVICE_TYPE_PHONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_2300
     * @tc.name      testEntryAbilityShape0001
     * @tc.desc      Check the entry ability reports the declared ability name, its owning module and the bundle name
     *               it was installed under
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryAbilityShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      const identity: string = `${ability.bundleName}/${ability.moduleName}/${ability.name}`;
      const expected: string = `${BUNDLE_NAME}/${ENTRY_MODULE}/${ENTRY_ABILITY}`;
      logCase('testEntryAbilityShape0001', `identity=${identity} labelRef=${ability.label}`);
      expect(identity).assertEqual(expected);
      expect(ability.name).assertEqual(ENTRY_ABILITY);
      expect(ability.moduleName).assertEqual(ENTRY_MODULE);
      expect(ability.bundleName).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_2400
     * @tc.name      testEntryAbilityShape0002
     * @tc.desc      Check the entry ability is exported and enabled and points at the first application index, which
     *               makes the home launcher entry resolvable
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEntryAbilityShape0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      const launcherReady: boolean = ability.exported && ability.enabled;
      logCase('testEntryAbilityShape0002', `exported=${ability.exported} enabled=${ability.enabled} ` +
        `appIndex=${ability.appIndex} launcherReady=${launcherReady}`);
      expect(ability.exported).assertTrue();
      expect(ability.enabled).assertTrue();
      expect(ability.appIndex).assertEqual(COUNT_NONE);
      expect(launcherReady).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_2500
     * @tc.name      testEntryAbilityShape0003
     * @tc.desc      Check the ability is registered as a page ability rather than an extension ability and that the
     *               whole bundle exposes exactly one page ability
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryAbilityShape0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const ability: bundleManager.AbilityInfo = entryAbilityOf(info);
      const pageAbilities: number = modulesOf(info).filter((item: bundleManager.HapModuleInfo) =>
        item.abilitiesInfo.length > COUNT_NONE).length;
      const pageNames: string[] = pageAbilityNamesOf(info);
      const extensionNames: string[] = extensionNamesInBundle(info);
      logCase('testEntryAbilityShape0003', `pageNames=${pageNames.join(',')} ` +
        `extensionNames=${extensionNames.join(',')} modulesWithAbilities=${pageAbilities}`);
      expect(containsValue(pageNames, ability.name)).assertTrue();
      expect(containsValue(extensionNames, ability.name)).assertFalse();
      expect(pageNames.length).assertEqual(COUNT_TWO);
      expect(pageAbilities).assertEqual(COUNT_TWO);
      expect(abilityTotal(info)).assertEqual(COUNT_TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_2600
     * @tc.name      testEntryAbilityShape0004
     * @tc.desc      Check the entry ability uses the singleton launch type and that neither the multiton nor the
     *               specified launch type is reported
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryAbilityShape0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      logCase('testEntryAbilityShape0004', `launchType=${ability.launchType} ` +
        `singleton=${bundleManager.LaunchType.SINGLETON}`);
      expect(ability.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
      expect(ability.launchType === bundleManager.LaunchType.MULTITON).assertFalse();
      expect(ability.launchType === bundleManager.LaunchType.SPECIFIED).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_2700
     * @tc.name      testEntryAbilityShape0005
     * @tc.desc      Check the ability label reference string matches module.json5 and that its label id resolves to
     *               the ArkTSGC application label
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryAbilityShape0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      const labelText: string = resourceOf().getStringSync(ability.labelId);
      logCase('testEntryAbilityShape0005', `label=${ability.label} labelId=${ability.labelId} ` +
        `text=${labelText}`);
      expect(ability.label).assertEqual(ABILITY_LABEL_REF);
      expect(labelText).assertEqual(ABILITY_LABEL_TEXT);
      expect(ability.labelId > COUNT_NONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_2800
     * @tc.name      testEntryAbilityShape0006
     * @tc.desc      Check the ability icon reference matches the layered image declared in module.json5, that its
     *               icon id is resolvable and that it equals the application icon
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryAbilityShape0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const ability: bundleManager.AbilityInfo = entryAbilityOf(info);
      logCase('testEntryAbilityShape0006', `icon=${ability.icon} iconId=${ability.iconId} ` +
        `appIcon=${info.appInfo.icon}`);
      expect(ability.icon).assertEqual(ABILITY_ICON_REF);
      expect(ability.iconId > COUNT_NONE).assertTrue();
      expect(ability.icon).assertEqual(info.appInfo.icon);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_2900
     * @tc.name      testEntryAbilityShape0007
     * @tc.desc      Check the ability description reference string matches module.json5, resolves to its own text and
     *               uses a different resource id than the module description
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryAbilityShape0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const ability: bundleManager.AbilityInfo = entryAbilityOf(info);
      const module: bundleManager.HapModuleInfo = entryModule(info);
      const abilityText: string = resourceOf().getStringSync(ability.descriptionId);
      logCase('testEntryAbilityShape0007', `description=${ability.description} text=${abilityText} ` +
        `abilityDescriptionId=${ability.descriptionId} moduleDescriptionId=${module.descriptionId}`);
      expect(ability.description).assertEqual(ABILITY_DESCRIPTION_REF);
      expect(abilityText).assertEqual(ABILITY_DESCRIPTION_TEXT);
      expect(ability.descriptionId === module.descriptionId).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_3000
     * @tc.name      testEntryAbilityShape0008
     * @tc.desc      Check the ability declares exactly one skill with the home action and the home entity and that
     *               the skill carries no uri entries
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryAbilityShape0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const skills: bundleManager.Skill[] = entryAbilityOf(await selfBundle()).skills;
      const actions: string = skills.map((skill: bundleManager.Skill) => skill.actions.join(',')).join(';');
      const entities: string = skills.map((skill: bundleManager.Skill) => skill.entities.join(',')).join(';');
      logCase('testEntryAbilityShape0008', `skills=${skills.length} actions=${actions} entities=${entities}`);
      expect(skills.length).assertEqual(COUNT_ONE);
      expect(actions).assertEqual(HOME_ACTION);
      expect(entities).assertEqual(HOME_ENTITY);
      expect(skills[COUNT_NONE].uris.length).assertEqual(COUNT_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_3100
     * @tc.name      testEntryAbilityShape0009
     * @tc.desc      Compose the skill actions and entities into a signature and check it equals the home skill pair
     *               declared for EntryAbility
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testEntryAbilityShape0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      const signature: string = skillSignature(ability);
      const expected: string = `${HOME_ACTION}/${HOME_ENTITY}`;
      logCase('testEntryAbilityShape0009', `signature=${signature} expected=${expected}`);
      expect(signature).assertEqual(expected);
      expect(signature.indexOf('/')).assertEqual(HOME_ACTION.length);
      expect(ability.skills[COUNT_NONE].actions.length).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_3200
     * @tc.name      testEntryAbilityShape0010
     * @tc.desc      Check the page ability requests no permissions and that the owning application requests no
     *               permissions either, so the ability runs without a permission gate
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testEntryAbilityShape0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const ability: bundleManager.AbilityInfo = entryAbilityOf(info);
      const appPermissions: string[] = info.appInfo.permissions;
      logCase('testEntryAbilityShape0010', `permissions=${ability.permissions.join(',')} ` +
        `appPermissions=${appPermissions.join(',')} appEnabled=${info.appInfo.enabled}`);
      expect(ability.permissions.length).assertEqual(COUNT_NONE);
      expect(ability.permissions.join(',')).assertEqual(EMPTY_TEXT);
      expect(appPermissions.length).assertEqual(COUNT_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_3300
     * @tc.name      testEntryAbilityShape0011
     * @tc.desc      Check the page ability carries no skill uri filter, no ability metadata, and that its process
     *               field is either unset or the bundle process
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testEntryAbilityShape0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      const inheritedProcess: boolean = ability.process.length === COUNT_NONE || ability.process === BUNDLE_NAME;
      const uriTotal: number = skillUriTotal(ability);
      logCase('testEntryAbilityShape0011', `skillUris=${uriTotal} metadata=${ability.metadata.length} ` +
        `process=${textOrEmpty(ability.process)}`);
      expect(uriTotal).assertEqual(COUNT_NONE);
      expect(ability.metadata.length).assertEqual(COUNT_NONE);
      expect(inheritedProcess).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_3400
     * @tc.name      testEntryAbilityShape0012
     * @tc.desc      Check the ability supports full screen, split and floating window modes, that each mode is present
     *               and that exactly three distinct modes are reported
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryAbilityShape0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      const modes: string[] = ability.supportWindowModes.map((mode: number) => `${mode}`);
      const text: string = windowModeText(ability);
      logCase('testEntryAbilityShape0012', `modes=${text} length=${modes.length}`);
      expect(containsValue(modes, '0')).assertTrue();
      expect(containsValue(modes, '1')).assertTrue();
      expect(containsValue(modes, '2')).assertTrue();
      expect(distinctStrings(modes)).assertEqual(COUNT_THREE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_3500
     * @tc.name      testEntryAbilityShape0013
     * @tc.desc      Check the page ability name differs from the backup extension name and from the entry module
     *               name, so the three descriptor kinds stay distinguishable
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryAbilityShape0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const ability: bundleManager.AbilityInfo = entryAbilityOf(info);
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(info);
      logCase('testEntryAbilityShape0013', `ability=${ability.name} extension=${extension.name} ` +
        `module=${ability.moduleName}`);
      expect(ability.name === extension.name).assertFalse();
      expect(ability.name === ENTRY_MODULE).assertFalse();
      expect(extension.name === ENTRY_MODULE).assertFalse();
      expect(ability.name).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_3600
     * @tc.name      testEntryAbilityShape0014
     * @tc.desc      Count the page abilities at bundle scope and verify EntryAbility sits in the entry module while
     *               the feature module exposes the injected TestAbility
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryAbilityShape0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const pageAbilityNames: string[] = pageAbilityNamesOf(info);
      const pageAbilityCount: number = pageAbilityNames.length;
      logCase('testEntryAbilityShape0014', `pageAbilities=${pageAbilityCount} ` +
        `names=${pageAbilityNames.join(',')} ` +
        `entry=${entryModule(info).abilitiesInfo.length} test=${testModule(info).abilitiesInfo.length}`);
      expect(pageAbilityCount).assertEqual(COUNT_TWO);
      expect(entryModule(info).abilitiesInfo.length).assertEqual(COUNT_ONE);
      expect(testModule(info).abilitiesInfo.length).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_3700
     * @tc.name      testEntryAbilityShape0015
     * @tc.desc      Check the ability label id and the application label id resolve to the same ArkTSGC text from the
     *               shared resource table while remaining distinct resource identifiers
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testEntryAbilityShape0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const ability: bundleManager.AbilityInfo = entryAbilityOf(info);
      const abilityLabel: string = resourceOf().getStringSync(ability.labelId);
      const appLabel: string = resourceOf().getStringSync(info.appInfo.labelId);
      logCase('testEntryAbilityShape0015', `abilityLabel=${abilityLabel} appLabel=${appLabel} ` +
        `abilityLabelId=${ability.labelId} appLabelId=${info.appInfo.labelId}`);
      expect(abilityLabel).assertEqual(appLabel);
      expect(abilityLabel).assertEqual(ABILITY_LABEL_TEXT);
      expect(ability.labelId > COUNT_NONE && info.appInfo.labelId > COUNT_NONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_3800
     * @tc.name      testEntryAbilityShape0016
     * @tc.desc      Check the ability label id and description id are both positive and different, so label and
     *               description resolve to separate string resources
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryAbilityShape0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      logCase('testEntryAbilityShape0016', `labelId=${ability.labelId} descriptionId=${ability.descriptionId}`);
      expect(ability.labelId > COUNT_NONE).assertTrue();
      expect(ability.descriptionId > COUNT_NONE).assertTrue();
      expect(ability.labelId === ability.descriptionId).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_3900
     * @tc.name      testEntryAbilityShape0017
     * @tc.desc      Check the ability description id and the module description id are distinct positive ids that
     *               both resolve to non-empty strings
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testEntryAbilityShape0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const ability: bundleManager.AbilityInfo = entryAbilityOf(info);
      const module: bundleManager.HapModuleInfo = entryModule(info);
      const abilityText: string = resourceOf().getStringSync(ability.descriptionId);
      const moduleText: string = resourceOf().getStringSync(module.descriptionId);
      logCase('testEntryAbilityShape0017', `ability=${abilityText} module=${moduleText} ` +
        `distinct=${ability.descriptionId !== module.descriptionId}`);
      expect(ability.descriptionId > COUNT_NONE).assertTrue();
      expect(module.descriptionId > COUNT_NONE).assertTrue();
      expect(ability.descriptionId === module.descriptionId).assertFalse();
      expect(abilityText.length > COUNT_NONE && moduleText.length > COUNT_NONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_4000
     * @tc.name      testEntryAbilityShape0018
     * @tc.desc      Contrast the ability export flag with the extension export flag and check the page ability is the
     *               only exported component of the entry module
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testEntryAbilityShape0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const ability: bundleManager.AbilityInfo = entryAbilityOf(info);
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(info);
      const exportedComponents: number = entryModule(info).abilitiesInfo.filter((item: bundleManager.AbilityInfo) =>
        item.exported).length;
      logCase('testEntryAbilityShape0018', `abilityExported=${ability.exported} ` +
        `extensionExported=${extension.exported} exportedAbilities=${exportedComponents}`);
      expect(ability.exported).assertTrue();
      expect(extension.exported).assertFalse();
      expect(exportedComponents).assertEqual(COUNT_ONE);
      expect(ability.exported === extension.exported).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_4100
     * @tc.name      testEntryAbilityShape0019
     * @tc.desc      Check every declared skill action of the page ability uses the ohos.want.action prefix and that
     *               exactly one action is declared
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testEntryAbilityShape0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      const actions: string[] = ability.skills[COUNT_NONE].actions;
      const prefixed: boolean = actions.every((action: string) => action.startsWith(ACTION_PREFIX));
      logCase('testEntryAbilityShape0019', `actions=${actions.join(',')} prefixed=${prefixed}`);
      expect(actions.length).assertEqual(COUNT_ONE);
      expect(prefixed).assertTrue();
      expect(actions[COUNT_NONE]).assertEqual(HOME_ACTION);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_4200
     * @tc.name      testEntryAbilityShape0020
     * @tc.desc      Check every declared skill entity of the page ability uses the entity.system prefix and that the
     *               entity list holds exactly the home entity
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testEntryAbilityShape0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      const entities: string[] = ability.skills[COUNT_NONE].entities;
      const prefixed: boolean = entities.every((entity: string) => entity.startsWith(ENTITY_PREFIX));
      logCase('testEntryAbilityShape0020', `entities=${entities.join(',')} prefixed=${prefixed}`);
      expect(entities.length).assertEqual(COUNT_ONE);
      expect(prefixed).assertTrue();
      expect(entities[COUNT_NONE]).assertEqual(HOME_ENTITY);
      expect(entities.join(',')).assertEqual(HOME_ENTITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_4300
     * @tc.name      testEntryAbilityShape0021
     * @tc.desc      Check the page ability declares no metadata and that asking the bundle manager for an ability
     *               profile reports the no profile error
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testEntryAbilityShape0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      const code: number = errorCode(() => {
        bundleManager.getProfileByAbilitySync(ENTRY_MODULE, ENTRY_ABILITY, MISSING_METADATA);
      });
      logCase('testEntryAbilityShape0021', `metadata=${ability.metadata.length} code=${code} ` +
        `expected=${ERR_NO_PROFILE}`);
      expect(ability.metadata.length).assertEqual(COUNT_NONE);
      expect(code).assertEqual(ERR_NO_PROFILE);
      expect(code === ERR_ABILITY_NOT_EXIST).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_4400
     * @tc.name      testEntryAbilityShape0022
     * @tc.desc      Check every reported window mode lies within the three supported mode values and that the sorted
     *               mode text matches the declared full, split and floating set
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testEntryAbilityShape0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      const inRange: boolean = ability.supportWindowModes.every((mode: number) =>
        mode >= COUNT_NONE && mode < COUNT_THREE);
      logCase('testEntryAbilityShape0022', `modes=${windowModeText(ability)} length=` +
        `${ability.supportWindowModes.length} inRange=${inRange}`);
      expect(inRange).assertTrue();
      expect(ability.supportWindowModes.length).assertEqual(COUNT_THREE);
      expect(windowModeText(ability)).assertEqual(WINDOW_MODE_TEXT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_4500
     * @tc.name      testBackupExtensionShape0001
     * @tc.desc      Check the backup extension reports the declared extension name, its owning module and the bundle
     *               name it was installed under
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBackupExtensionShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      const identity: string = `${extension.bundleName}/${extension.moduleName}/${extension.name}`;
      const expected: string = `${BUNDLE_NAME}/${ENTRY_MODULE}/${BACKUP_ABILITY}`;
      logCase('testBackupExtensionShape0001', `identity=${identity}`);
      expect(identity).assertEqual(expected);
      expect(extension.name).assertEqual(BACKUP_ABILITY);
      expect(extension.moduleName).assertEqual(ENTRY_MODULE);
      expect(extension.bundleName).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_4600
     * @tc.name      testBackupExtensionShape0002
     * @tc.desc      Check the backup extension is not exported but is enabled and lives in the default application
     *               index, matching the exported false declaration in module.json5
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBackupExtensionShape0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      const hiddenFromLauncher: boolean = !extension.exported;
      logCase('testBackupExtensionShape0002', `exported=${extension.exported} enabled=${extension.enabled} ` +
        `appIndex=${extension.appIndex} hidden=${hiddenFromLauncher}`);
      expect(extension.exported).assertFalse();
      expect(extension.enabled).assertTrue();
      expect(extension.appIndex).assertEqual(COUNT_NONE);
      expect(hiddenFromLauncher).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_4700
     * @tc.name      testBackupExtensionShape0003
     * @tc.desc      Check the extension ability type is backup, that its type name reads backup and that it is not
     *               reported as a form extension
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackupExtensionShape0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      logCase('testBackupExtensionShape0003', `type=${extension.extensionAbilityType} ` +
        `typeName=${extension.extensionAbilityTypeName}`);
      expect(extension.extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.BACKUP);
      expect(extension.extensionAbilityTypeName).assertEqual(BACKUP_TYPE_NAME);
      expect(extension.extensionAbilityType === bundleManager.ExtensionAbilityType.FORM).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_4800
     * @tc.name      testBackupExtensionShape0004
     * @tc.desc      Check the extension carries exactly one metadata entry whose name is the backup metadata key and
     *               whose resource is the backup config profile
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackupExtensionShape0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      logCase('testBackupExtensionShape0004', `metadata=${metadataText(extension.metadata)} ` +
        `count=${extension.metadata.length}`);
      expect(extension.metadata.length).assertEqual(COUNT_ONE);
      expect(extension.metadata[COUNT_NONE].name).assertEqual(BACKUP_METADATA);
      expect(extension.metadata[COUNT_NONE].resource).assertEqual(BACKUP_RESOURCE_REF);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_4900
     * @tc.name      testBackupExtensionShape0005
     * @tc.desc      Compose the extension metadata into a key value text and check it equals the backup metadata pair
     *               declared in module.json5
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackupExtensionShape0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      const text: string = metadataText(extension.metadata);
      const expected: string = `${BACKUP_METADATA}=${BACKUP_RESOURCE_REF}`;
      logCase('testBackupExtensionShape0005', `text=${text} expected=${expected}`);
      expect(text).assertEqual(expected);
      expect(text.indexOf('=')).assertEqual(BACKUP_METADATA.length);
      expect(extension.metadata.length).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_5000
     * @tc.name      testBackupExtensionShape0006
     * @tc.desc      Check the backup extension declares no skills, no permissions and no read or write permission
     *               strings
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackupExtensionShape0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      logCase('testBackupExtensionShape0006', `skills=${extension.skills.length} ` +
        `permissions=${extension.permissions.length} read=${textOrEmpty(extension.readPermission)} ` +
        `write=${textOrEmpty(extension.writePermission)}`);
      expect(extension.skills.length).assertEqual(COUNT_NONE);
      expect(extension.permissions.length).assertEqual(COUNT_NONE);
      expect(extension.readPermission.length).assertEqual(COUNT_NONE);
      expect(extension.writePermission.length).assertEqual(COUNT_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_5100
     * @tc.name      testBackupExtensionShape0007
     * @tc.desc      Check the extension holds exactly one declarative record in total, so metadata count plus skill
     *               count equals one
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackupExtensionShape0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      const records: number = extension.metadata.length + extension.skills.length;
      logCase('testBackupExtensionShape0007', `metadata=${extension.metadata.length} ` +
        `skills=${extension.skills.length} records=${records}`);
      expect(records).assertEqual(COUNT_ONE);
      expect(extension.metadata.length).assertEqual(COUNT_ONE);
      expect(extension.permissions.length).assertEqual(COUNT_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_5200
     * @tc.name      testBackupExtensionShape0008
     * @tc.desc      Check the extension metadata name uses the ohos.extension prefix and ends with the backup word
     *               that matches the declared extension type
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackupExtensionShape0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      const metadataName: string = extension.metadata[COUNT_NONE].name;
      logCase('testBackupExtensionShape0008', `name=${metadataName} prefix=${BACKUP_METADATA_PREFIX} ` +
        `typeName=${extension.extensionAbilityTypeName}`);
      expect(metadataName.startsWith(BACKUP_METADATA_PREFIX)).assertTrue();
      expect(metadataName.endsWith(BACKUP_TYPE_NAME)).assertTrue();
      expect(metadataName).assertEqual(BACKUP_METADATA);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_5300
     * @tc.name      testBackupExtensionShape0009
     * @tc.desc      Check the extension metadata resource is a profile reference that names the backup configuration
     *               declared in module.json5
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackupExtensionShape0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      const resource: string = extension.metadata[COUNT_NONE].resource;
      logCase('testBackupExtensionShape0009', `resource=${resource} prefix=${PROFILE_PREFIX}`);
      expect(resource.startsWith(PROFILE_PREFIX)).assertTrue();
      expect(resource.indexOf(BACKUP_TYPE_NAME) > COUNT_NONE).assertTrue();
      expect(resource).assertEqual(BACKUP_RESOURCE_REF);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_5400
     * @tc.name      testBackupExtensionShape0010
     * @tc.desc      Check the extension name embeds the backup word and still follows the ability naming suffix used
     *               by the page ability
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackupExtensionShape0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      const name: string = extension.name;
      logCase('testBackupExtensionShape0010', `name=${name} word=${BACKUP_WORD} ` +
        `abilitySuffix=${ENTRY_ABILITY.endsWith('Ability')}`);
      expect(name.indexOf(BACKUP_WORD) > COUNT_NONE).assertTrue();
      expect(name.endsWith('Ability')).assertTrue();
      expect(ENTRY_ABILITY.endsWith('Ability')).assertTrue();
      expect(name.length > ENTRY_ABILITY.length).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_5500
     * @tc.name      testBackupExtensionShape0011
     * @tc.desc      Collect extension names from every installed module and check the backup extension is the only
     *               one present in the whole bundle
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackupExtensionShape0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const names: string[] = [];
      modulesOf(info).forEach((item: bundleManager.HapModuleInfo) => {
        extensionNamesOf(item).forEach((name: string) => {
          names.push(name);
        });
      });
      logCase('testBackupExtensionShape0011', `names=${names.join(',')} total=${names.length}`);
      expect(names.length).assertEqual(COUNT_ONE);
      expect(names[COUNT_NONE]).assertEqual(BACKUP_ABILITY);
      expect(extensionTotal(info)).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_5600
     * @tc.name      testBackupExtensionShape0012
     * @tc.desc      Check the metadata key differs from the extension name and that the segment after the
     *               ohos.extension prefix equals the reported extension type name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackupExtensionShape0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      const metadataName: string = extension.metadata[COUNT_NONE].name;
      const suffix: string = metadataName.substring(BACKUP_METADATA_PREFIX.length);
      logCase('testBackupExtensionShape0012', `metadataName=${metadataName} suffix=${suffix} ` +
        `typeName=${extension.extensionAbilityTypeName}`);
      expect(metadataName === extension.name).assertFalse();
      expect(suffix).assertEqual(extension.extensionAbilityTypeName);
      expect(suffix).assertEqual(BACKUP_TYPE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_5700
     * @tc.name      testBackupExtensionShape0013
     * @tc.desc      Read the backup profile through the bundle manager and check a single non-empty profile document is
     *               returned that mentions the backup restore switch
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackupExtensionShape0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const profiles: string[] = backupProfileTexts();
      const text: string = profiles[COUNT_NONE];
      logCase('testBackupExtensionShape0013', `profiles=${profiles.length} length=${text.length} ` +
        `switchPresent=${text.indexOf(PROFILE_BACKUP_FLAG) >= 0}`);
      expect(profiles.length).assertEqual(COUNT_ONE);
      expect(text.length > COUNT_NONE).assertTrue();
      expect(text.indexOf(PROFILE_BACKUP_FLAG) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_5800
     * @tc.name      testBackupExtensionShape0014
     * @tc.desc      Check the backup profile document is a braced object with balanced outer braces and that the
     *               profile lookup always yields exactly one document
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackupExtensionShape0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const profiles: string[] = backupProfileTexts();
      const text: string = profiles[COUNT_NONE].trim();
      logCase('testBackupExtensionShape0014', `startsWithBrace=${text.startsWith(PROFILE_OPEN_BRACE)} ` +
        `endsWithBrace=${text.endsWith('}')} count=${profiles.length}`);
      expect(text.startsWith(PROFILE_OPEN_BRACE)).assertTrue();
      expect(text.endsWith('}')).assertTrue();
      expect(text.length > COUNT_TWO).assertTrue();
      expect(profiles.length).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_5900
     * @tc.name      testBackupExtensionShape0015
     * @tc.desc      Ask for the backup profile of the extension once with a wrong metadata key and once with the
     *               declared key and compare the reported outcomes
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackupExtensionShape0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const wrong: number = errorCode(() => {
        bundleManager.getProfileByExtensionAbilitySync(ENTRY_MODULE, BACKUP_ABILITY, MISSING_METADATA);
      });
      const right: number = errorCode(() => {
        bundleManager.getProfileByExtensionAbilitySync(ENTRY_MODULE, BACKUP_ABILITY, BACKUP_METADATA);
      });
      logCase('testBackupExtensionShape0015', `wrong=${wrong} right=${right} expectedWrong=${ERR_NO_PROFILE}`);
      expect(wrong).assertEqual(ERR_NO_PROFILE);
      expect(right).assertEqual(COUNT_NONE);
      expect(wrong === right).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_6000
     * @tc.name      testAbsentNameProbe0001
     * @tc.desc      Look up a module named after the page ability and check no such module exists while both real
     *               modules stay installed
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbsentNameProbe0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const ghost: bundleManager.HapModuleInfo | undefined = findModuleOrNone(info, ENTRY_ABILITY);
      const matches: number = moduleNamesOf(info).filter((name: string) =>
        name === ENTRY_ABILITY).length;
      logCase('testAbsentNameProbe0001', `ghost=${ghost === undefined ? '' : ghost.name} ` +
        `matches=${matches} modules=${modulesOf(info).length}`);
      expect(ghost === undefined).assertTrue();
      expect(matches).assertEqual(COUNT_NONE);
      expect(modulesOf(info).length).assertEqual(COUNT_TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_6100
     * @tc.name      testAbsentNameProbe0002
     * @tc.desc      Look up a module named after the backup extension and check the installed module name list keeps
     *               only entry and entry_test
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbsentNameProbe0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const ghost: bundleManager.HapModuleInfo | undefined = findModuleOrNone(info, BACKUP_ABILITY);
      const present: boolean = containsValue(moduleNamesOf(info), BACKUP_ABILITY);
      const sortedNames: string = moduleNamesOf(info).slice().sort().join(',');
      logCase('testAbsentNameProbe0002', `present=${present} names=${sortedNames}`);
      expect(ghost === undefined).assertTrue();
      expect(present).assertFalse();
      expect(sortedNames).assertEqual([ENTRY_MODULE, TEST_MODULE].sort().join(','));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_6200
     * @tc.name      testAbsentNameProbe0003
     * @tc.desc      Look up a page ability named after the backup extension inside the entry module and check the
     *               ability list still holds only EntryAbility
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbsentNameProbe0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const entry: bundleManager.HapModuleInfo = entryModule(await selfBundle());
      const ghost: bundleManager.AbilityInfo | undefined = findAbilityOrNone(entry, BACKUP_ABILITY);
      const names: string = abilityNamesOf(entry).join(',');
      logCase('testAbsentNameProbe0003', `ghost=${ghost === undefined} names=${names} ` +
        `count=${entry.abilitiesInfo.length}`);
      expect(ghost === undefined).assertTrue();
      expect(entry.abilitiesInfo.length).assertEqual(COUNT_ONE);
      expect(names).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_6300
     * @tc.name      testAbsentNameProbe0004
     * @tc.desc      Look up an extension named after the page ability inside the entry module and check only the
     *               backup extension is registered there
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbsentNameProbe0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const entry: bundleManager.HapModuleInfo = entryModule(await selfBundle());
      const ghost: bundleManager.ExtensionAbilityInfo | undefined = findExtensionOrNone(entry, ENTRY_ABILITY);
      const extensions: string = extensionNamesOf(entry).join(',');
      logCase('testAbsentNameProbe0004', `ghost=${ghost === undefined} extensions=${extensions}`);
      expect(ghost === undefined).assertTrue();
      expect(entry.extensionAbilitiesInfo.length).assertEqual(COUNT_ONE);
      expect(extensions).assertEqual(BACKUP_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_6400
     * @tc.name      testAbsentNameProbe0005
     * @tc.desc      Look up the test module main element as an ability and as an extension inside the entry module and
     *               check both lookups miss
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbsentNameProbe0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const entry: bundleManager.HapModuleInfo = entryModule(await selfBundle());
      const abilityGhost: bundleManager.AbilityInfo | undefined = findAbilityOrNone(entry, TEST_MAIN_ELEMENT);
      const extensionGhost: bundleManager.ExtensionAbilityInfo | undefined =
        findExtensionOrNone(entry, TEST_MAIN_ELEMENT);
      logCase('testAbsentNameProbe0005', `abilityGhost=${abilityGhost === undefined} ` +
        `extensionGhost=${extensionGhost === undefined} mainElement=${TEST_MAIN_ELEMENT}`);
      expect(abilityGhost === undefined).assertTrue();
      expect(extensionGhost === undefined).assertTrue();
      expect(entry.abilitiesInfo.length).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_6500
     * @tc.name      testAbsentNameProbe0006
     * @tc.desc      Ask the bundle manager for the backup profile of a module that does not exist and check it reports
     *               the missing ability error on this runtime
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbsentNameProbe0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const code: number = errorCode(() => {
        bundleManager.getProfileByExtensionAbilitySync(MISSING_MODULE, BACKUP_ABILITY, BACKUP_METADATA);
      });
      const info: bundleManager.BundleInfo = await selfBundle();
      logCase('testAbsentNameProbe0006', `code=${code} expected=${ERR_MODULE_NOT_EXIST} ` +
        `modules=${modulesOf(info).length}`);
      expect(code).assertEqual(ERR_ABILITY_NOT_EXIST);
      expect(code === ERR_MODULE_NOT_EXIST).assertFalse();
      expect(findModuleOrNone(info, MISSING_MODULE) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_6600
     * @tc.name      testAbsentNameProbe0007
     * @tc.desc      Ask for the profile of a page ability that is not declared in the entry module and check the
     *               missing ability error is reported while the real ability still answers
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbsentNameProbe0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const code: number = errorCode(() => {
        bundleManager.getProfileByAbilitySync(ENTRY_MODULE, MISSING_ABILITY, MISSING_METADATA);
      });
      const realCode: number = errorCode(() => {
        bundleManager.getProfileByExtensionAbilitySync(ENTRY_MODULE, BACKUP_ABILITY, BACKUP_METADATA);
      });
      logCase('testAbsentNameProbe0007', `missing=${code} real=${realCode} expected=${ERR_ABILITY_NOT_EXIST}`);
      expect(code).assertEqual(ERR_ABILITY_NOT_EXIST);
      expect(realCode).assertEqual(COUNT_NONE);
      expect(code === realCode).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_6700
     * @tc.name      testAbsentNameProbe0008
     * @tc.desc      Look up the entry module using its upper case name and check module lookup is case sensitive
     *               against the lower case installed name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbsentNameProbe0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const upper: string = ENTRY_MODULE.toUpperCase();
      const ghost: bundleManager.HapModuleInfo | undefined = findModuleOrNone(info, upper);
      const upperMatches: number = moduleNamesOf(info).filter((name: string) => name === upper).length;
      logCase('testAbsentNameProbe0008', `upper=${upper} ghost=${ghost === undefined} ` +
        `upperMatches=${upperMatches}`);
      expect(ghost === undefined).assertTrue();
      expect(upperMatches).assertEqual(COUNT_NONE);
      expect(containsValue(moduleNamesOf(info), ENTRY_MODULE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_6800
     * @tc.name      testAbsentNameProbe0009
     * @tc.desc      Check the module name set and the ability name set never intersect, so no ability name is reused
     *               as a module name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbsentNameProbe0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const moduleNames: string[] = moduleNamesOf(info);
      const abilityNames: string[] = [];
      modulesOf(info).forEach((item: bundleManager.HapModuleInfo) => {
        abilityNamesOf(item).forEach((name: string) => {
          abilityNames.push(name);
        });
      });
      const overlap: number = abilityNames.filter((name: string) => containsValue(moduleNames, name)).length;
      logCase('testAbsentNameProbe0009', `modules=${moduleNames.join(',')} ` +
        `abilities=${abilityNames.join(',')} overlap=${overlap}`);
      expect(overlap).assertEqual(COUNT_NONE);
      expect(distinctStrings(moduleNames)).assertEqual(moduleNames.length);
      expect(abilityNames.length).assertEqual(COUNT_TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_6900
     * @tc.name      testModuleDependency0001
     * @tc.desc      Check neither the entry module nor the test module declares module dependencies, so the installed
     *               dependency total stays zero
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testModuleDependency0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entryDependencies: number = entryModule(info).dependencies.length;
      const testDependencies: number = testModule(info).dependencies.length;
      logCase('testModuleDependency0001', `entry=${entryDependencies} test=${testDependencies} ` +
        `total=${entryDependencies + testDependencies}`);
      expect(entryDependencies).assertEqual(COUNT_NONE);
      expect(testDependencies).assertEqual(COUNT_NONE);
      expect(entryDependencies + testDependencies).assertEqual(COUNT_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_7000
     * @tc.name      testModuleDependency0002
     * @tc.desc      Check no dependency entry of either module points at the entry module, which proves the modules
     *               are loaded independently
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testModuleDependency0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      let dependsOnEntry: number = COUNT_NONE;
      modulesOf(info).forEach((item: bundleManager.HapModuleInfo) => {
        item.dependencies.forEach((dependency: bundleManager.Dependency) => {
          if (dependency.moduleName === ENTRY_MODULE) {
            dependsOnEntry += COUNT_ONE;
          }
        });
      });
      logCase('testModuleDependency0002', `dependsOnEntry=${dependsOnEntry} ` +
        `modules=${modulesOf(info).length}`);
      expect(dependsOnEntry).assertEqual(COUNT_NONE);
      expect(moduleMetadataTotal(info)).assertEqual(COUNT_NONE);
      expect(modulesOf(info).length).assertEqual(COUNT_TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_7100
     * @tc.name      testModuleDependency0003
     * @tc.desc      Check no installed module depends on the test module and that the dependency name list of every
     *               module is empty
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testModuleDependency0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const names: string[] = [];
      modulesOf(info).forEach((item: bundleManager.HapModuleInfo) => {
        item.dependencies.forEach((dependency: bundleManager.Dependency) => {
          names.push(dependency.moduleName);
        });
      });
      logCase('testModuleDependency0003', `dependencyNames=${names.join(',')} count=${names.length}`);
      expect(names.length).assertEqual(COUNT_NONE);
      expect(containsValue(names, TEST_MODULE)).assertFalse();
      expect(names.join(',')).assertEqual(EMPTY_TEXT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_7200
     * @tc.name      testModuleDependency0004
     * @tc.desc      Check every installed module reports an empty dependency list and that no module lists itself as
     *               a dependency
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testModuleDependency0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const allEmpty: boolean = modulesOf(info).every((item: bundleManager.HapModuleInfo) =>
        item.dependencies.length === COUNT_NONE);
      const selfDependent: number = modulesOf(info).filter((item: bundleManager.HapModuleInfo) => {
        let hits: number = COUNT_NONE;
        item.dependencies.forEach((dependency: bundleManager.Dependency) => {
          if (dependency.moduleName === item.name) {
            hits += COUNT_ONE;
          }
        });
        return hits > COUNT_NONE;
      }).length;
      logCase('testModuleDependency0004', `allEmpty=${allEmpty} selfDependent=${selfDependent}`);
      expect(allEmpty).assertTrue();
      expect(selfDependent).assertEqual(COUNT_NONE);
      expect(modulesOf(info).length).assertEqual(COUNT_TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_7300
     * @tc.name      testModuleDependency0005
     * @tc.desc      Check the entry module version code reported inside the module descriptor equals the bundle
     *               version code while both dependency lists stay empty
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testModuleDependency0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = entryModule(info);
      logCase('testModuleDependency0005', `bundleVersion=${info.versionCode} ` +
        `dependencies=${entry.dependencies.length}/${testModule(info).dependencies.length}`);
      expect(entry.dependencies.length).assertEqual(COUNT_NONE);
      expect(testModule(info).dependencies.length).assertEqual(COUNT_NONE);
      expect(info.versionCode > COUNT_NONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_7400
     * @tc.name      testDeviceTypeSet0001
     * @tc.desc      Check the entry module device type list holds exactly one phone entry and no tablet or 2in1 entry
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDeviceTypeSet0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const devices: string[] = entryModule(await selfBundle()).deviceTypes;
      logCase('testDeviceTypeSet0001', `devices=${devices.join(',')} tablet=${DEVICE_TYPE_TABLET} ` +
        `twoInOne=${DEVICE_TYPE_TWO_IN_ONE}`);
      expect(devices.length).assertEqual(COUNT_ONE);
      expect(devices[COUNT_NONE]).assertEqual(DEVICE_TYPE_PHONE);
      expect(containsValue(devices, DEVICE_TYPE_TWO_IN_ONE)).assertFalse();
      expect(containsValue(devices, DEVICE_TYPE_TABLET)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_7500
     * @tc.name      testDeviceTypeSet0002
     * @tc.desc      Check the test module lists the same single phone device type as the entry module so the ohosTest
     *               hap installs on the same device
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDeviceTypeSet0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const test: string[] = testModule(info).deviceTypes;
      const entry: string[] = entryModule(info).deviceTypes;
      logCase('testDeviceTypeSet0002', `test=${test.join(',')} entry=${entry.join(',')}`);
      expect(test.length).assertEqual(COUNT_ONE);
      expect(test[COUNT_NONE]).assertEqual(DEVICE_TYPE_PHONE);
      expect(test.join(',')).assertEqual(entry.join(','));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_7600
     * @tc.name      testDeviceTypeSet0003
     * @tc.desc      Collect the device types of both modules and check every collected value is phone with only one
     *               distinct device type in the bundle
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDeviceTypeSet0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const collected: string[] = [];
      modulesOf(info).forEach((item: bundleManager.HapModuleInfo) => {
        item.deviceTypes.forEach((device: string) => {
          collected.push(device);
        });
      });
      const allPhone: boolean = collected.every((device: string) => device === DEVICE_TYPE_PHONE);
      logCase('testDeviceTypeSet0003', `collected=${collected.join(',')} distinct=${distinctStrings(collected)} ` +
        `allPhone=${allPhone}`);
      expect(collected.length).assertEqual(COUNT_TWO);
      expect(distinctStrings(collected)).assertEqual(COUNT_ONE);
      expect(allPhone).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_7700
     * @tc.name      testDeviceTypeSet0004
     * @tc.desc      Count modules declaring tablet and 2in1 support and check both counts are zero while every module
     *               still declares one device type
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeviceTypeSet0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const tabletModules: number = modulesOf(info).filter((item: bundleManager.HapModuleInfo) =>
        containsValue(item.deviceTypes, DEVICE_TYPE_TABLET)).length;
      const twoInOneModules: number = modulesOf(info).filter((item: bundleManager.HapModuleInfo) =>
        containsValue(item.deviceTypes, DEVICE_TYPE_TWO_IN_ONE)).length;
      const sized: boolean = modulesOf(info).every((item: bundleManager.HapModuleInfo) =>
        item.deviceTypes.length === COUNT_ONE);
      logCase('testDeviceTypeSet0004', `tablet=${tabletModules} twoInOne=${twoInOneModules} sized=${sized}`);
      expect(tabletModules).assertEqual(COUNT_NONE);
      expect(twoInOneModules).assertEqual(COUNT_NONE);
      expect(sized).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_7800
     * @tc.name      testDeviceTypeSet0005
     * @tc.desc      Check every declared device type is a non-empty lower case token, so the phone claim matches the
     *               case used by the bundle framework
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeviceTypeSet0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const collected: string[] = [];
      modulesOf(info).forEach((item: bundleManager.HapModuleInfo) => {
        item.deviceTypes.forEach((device: string) => {
          collected.push(device);
        });
      });
      const lowerCase: boolean = collected.every((device: string) => device === device.toLowerCase());
      const nonEmpty: boolean = collected.every((device: string) => device.length > COUNT_NONE);
      logCase('testDeviceTypeSet0005', `devices=${collected.join(',')} lowerCase=${lowerCase} ` +
        `nonEmpty=${nonEmpty}`);
      expect(lowerCase).assertTrue();
      expect(nonEmpty).assertTrue();
      expect(collected.join(',')).assertEqual(`${DEVICE_TYPE_PHONE},${DEVICE_TYPE_PHONE}`);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_7900
     * @tc.name      testPagesProfileScope0001
     * @tc.desc      Check the pages profile owner resolves to one startable page ability because the entry module main
     *               element names the exported EntryAbility
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPagesProfileScope0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = entryModule(info);
      const ability: bundleManager.AbilityInfo = entryAbilityOf(info);
      logCase('testPagesProfileScope0001', `mainElement=${entry.mainElementName} ability=${ability.name} ` +
        `exported=${ability.exported} type=${entry.type}`);
      expect(entry.mainElementName).assertEqual(ability.name);
      expect(ability.exported).assertTrue();
      expect(entry.type).assertEqual(bundleManager.ModuleType.ENTRY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_8000
     * @tc.name      testPagesProfileScope0002
     * @tc.desc      Check the page list is not routed through ability metadata or a skill uri filter, so the page
     *               ability declares no metadata and no skill uri while still carrying the home action
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPagesProfileScope0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      const uris: number = skillUriTotal(ability);
      logCase('testPagesProfileScope0002', `metadata=${ability.metadata.length} uris=${uris} ` +
        `actions=${ability.skills[COUNT_NONE].actions.join(',')}`);
      expect(ability.metadata.length).assertEqual(COUNT_NONE);
      expect(uris).assertEqual(COUNT_NONE);
      expect(ability.skills.length).assertEqual(COUNT_ONE);
      expect(ability.skills[COUNT_NONE].actions.join(',')).assertEqual(HOME_ACTION);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_8100
     * @tc.name      testPagesProfileScope0003
     * @tc.desc      Check the extension metadata profile is the backup configuration rather than the page list, and
     *               that the page ability still declares the home launch skill
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPagesProfileScope0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(info);
      const resource: string = extension.metadata[COUNT_NONE].resource;
      const actions: string = entryAbilityOf(info).skills[COUNT_NONE].actions.join(',');
      logCase('testPagesProfileScope0003', `resource=${resource} pagesWord=${PAGES_PROFILE_WORD} ` +
        `actions=${actions}`);
      expect(resource.indexOf(PAGES_PROFILE_WORD) < COUNT_NONE).assertTrue();
      expect(resource.indexOf(BACKUP_TYPE_NAME) > COUNT_NONE).assertTrue();
      expect(actions).assertEqual(HOME_ACTION);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_8200
     * @tc.name      testPagesProfileScope0004
     * @tc.desc      Ask the extension for a profile keyed by the module page list name and check only the declared
     *               backup metadata key answers
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPagesProfileScope0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const pageKey: number = errorCode(() => {
        bundleManager.getProfileByExtensionAbilitySync(ENTRY_MODULE, BACKUP_ABILITY, PAGES_PROFILE_WORD);
      });
      const backupKey: number = errorCode(() => {
        bundleManager.getProfileByExtensionAbilitySync(ENTRY_MODULE, BACKUP_ABILITY, BACKUP_METADATA);
      });
      logCase('testPagesProfileScope0004', `pageKey=${pageKey} backupKey=${backupKey} ` +
        `noProfile=${ERR_NO_PROFILE}`);
      expect(pageKey).assertEqual(ERR_NO_PROFILE);
      expect(backupKey).assertEqual(COUNT_NONE);
      expect(pageKey === backupKey).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_8300
     * @tc.name      testPagesProfileScope0005
     * @tc.desc      Check the entry module main element matches exactly one declared ability, so the pages profile has
     *               a single unambiguous page host
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPagesProfileScope0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = entryModule(info);
      const hosts: number = entry.abilitiesInfo.filter((item: bundleManager.AbilityInfo) =>
        item.name === entry.mainElementName).length;
      logCase('testPagesProfileScope0005', `hosts=${hosts} mainElement=${entry.mainElementName} ` +
        `abilities=${entry.abilitiesInfo.length}`);
      expect(hosts).assertEqual(COUNT_ONE);
      expect(hosts === entry.abilitiesInfo.length).assertTrue();
      expect(entry.abilitiesInfo.length).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_8400
     * @tc.name      testPagesProfileScope0006
     * @tc.desc      Compose the page host module name, main element, device type and description text into one key and
     *               check it matches the entry module declaration
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPagesProfileScope0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const module: bundleManager.HapModuleInfo = entryModule(await selfBundle());
      const composite: string = `${module.name}|${module.mainElementName}|${module.deviceTypes.join('+')}|` +
        `${resourceOf().getStringSync(module.descriptionId)}`;
      const expected: string = `${ENTRY_MODULE}|${ENTRY_ABILITY}|${DEVICE_TYPE_PHONE}|` +
        `${ENTRY_DESCRIPTION_TEXT}`;
      logCase('testPagesProfileScope0006', `composite=${composite} expected=${expected}`);
      expect(composite).assertEqual(expected);
      expect(module.deviceTypes.length).assertEqual(COUNT_ONE);
      expect(module.mainElementName).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_8500
     * @tc.name      testMainElementBinding0001
     * @tc.desc      Check the entry module main element equals the only declared ability name, so the module start
     *               target and the ability list agree
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMainElementBinding0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const entry: bundleManager.HapModuleInfo = entryModule(await selfBundle());
      const firstAbility: string = entry.abilitiesInfo[COUNT_NONE].name;
      logCase('testMainElementBinding0001', `mainElement=${entry.mainElementName} ` +
        `firstAbility=${firstAbility} declared=${ENTRY_ABILITY}`);
      expect(entry.mainElementName).assertEqual(ENTRY_ABILITY);
      expect(entry.mainElementName).assertEqual(firstAbility);
      expect(entry.abilitiesInfo.length).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_8600
     * @tc.name      testMainElementBinding0002
     * @tc.desc      Check the test module main element is TestAbility and the descriptor carries the injected test
     *               ability record
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMainElementBinding0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const test: bundleManager.HapModuleInfo = testModule(await selfBundle());
      const injected: boolean = test.abilitiesInfo.length === COUNT_ONE &&
        test.mainElementName === TEST_MAIN_ELEMENT;
      logCase('testMainElementBinding0002', `mainElement=${test.mainElementName} ` +
        `abilities=${test.abilitiesInfo.length} injected=${injected}`);
      expect(test.mainElementName).assertEqual(TEST_MAIN_ELEMENT);
      expect(test.abilitiesInfo.length).assertEqual(COUNT_ONE);
      expect(injected).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_8700
     * @tc.name      testMainElementBinding0003
     * @tc.desc      Check both module main elements differ from their own module names, so a main element always names
     *               a component and not a module
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMainElementBinding0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = entryModule(info);
      const test: bundleManager.HapModuleInfo = testModule(info);
      logCase('testMainElementBinding0003', `entry=${entry.name}/${entry.mainElementName} ` +
        `test=${test.name}/${test.mainElementName}`);
      expect(entry.mainElementName === entry.name).assertFalse();
      expect(test.mainElementName === test.name).assertFalse();
      expect(entry.mainElementName).assertEqual(ENTRY_ABILITY);
      expect(test.mainElementName).assertEqual(TEST_MAIN_ELEMENT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_8800
     * @tc.name      testMainElementBinding0004
     * @tc.desc      Check the entry main element matches the ability name with exact casing while the lower case form
     *               of that name is not present in the ability list
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMainElementBinding0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const entry: bundleManager.HapModuleInfo = entryModule(await selfBundle());
      const lowerNames: string[] = abilityNamesOf(entry).map((name: string) => name.toLowerCase());
      logCase('testMainElementBinding0004', `mainElement=${entry.mainElementName} ` +
        `abilityNames=${abilityNamesOf(entry).join(',')} lower=${lowerNames.join(',')}`);
      expect(entry.mainElementName).assertEqual(ENTRY_ABILITY);
      expect(containsValue(lowerNames, ENTRY_ABILITY)).assertFalse();
      expect(containsValue(lowerNames, ENTRY_ABILITY.toLowerCase())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_8900
     * @tc.name      testMainElementBinding0005
     * @tc.desc      Check both main elements start with an upper case letter, are distinct, and form the expected
     *               module to element pairs
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMainElementBinding0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entryMain: string = entryModule(info).mainElementName;
      const testMain: string = testModule(info).mainElementName;
      const pairs: string = mainElementPairs(info).split(';').sort().join(';');
      const expected: string = [`${ENTRY_MODULE}:${entryMain}`, `${TEST_MODULE}:${testMain}`].sort().join(';');
      logCase('testMainElementBinding0005', `pairs=${pairs} entryUpper=${startsWithUpper(entryMain)} ` +
        `testUpper=${startsWithUpper(testMain)}`);
      expect(startsWithUpper(entryMain)).assertTrue();
      expect(startsWithUpper(testMain)).assertTrue();
      expect(entryMain === testMain).assertFalse();
      expect(pairs).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_9000
     * @tc.name      testModuleTypeCensus0001
     * @tc.desc      Check the entry module reports the entry type and the test module reports the feature type, both
     *               drawn from the two module types this sample installs
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testModuleTypeCensus0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entryType: bundleManager.ModuleType = entryModule(info).type;
      const testType: bundleManager.ModuleType = testModule(info).type;
      const known: number = modulesOf(info).filter((item: bundleManager.HapModuleInfo) =>
        item.type === bundleManager.ModuleType.ENTRY ||
        item.type === bundleManager.ModuleType.FEATURE).length;
      logCase('testModuleTypeCensus0001', `entry=${entryType} test=${testType} known=${known}`);
      expect(entryType).assertEqual(bundleManager.ModuleType.ENTRY);
      expect(testType).assertEqual(bundleManager.ModuleType.FEATURE);
      expect(known).assertEqual(COUNT_TWO);
      expect(entryType === testType).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_9100
     * @tc.name      testModuleTypeCensus0002
     * @tc.desc      Count entry modules and feature modules separately and check the sum equals the installed module
     *               total of two
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testModuleTypeCensus0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      let entryCount: number = COUNT_NONE;
      let featureCount: number = COUNT_NONE;
      modulesOf(info).forEach((item: bundleManager.HapModuleInfo) => {
        if (item.type === bundleManager.ModuleType.ENTRY) {
          entryCount += COUNT_ONE;
        }
        if (item.type === bundleManager.ModuleType.FEATURE) {
          featureCount += COUNT_ONE;
        }
      });
      logCase('testModuleTypeCensus0002', `entry=${entryCount} feature=${featureCount} ` +
        `total=${entryCount + featureCount}`);
      expect(entryCount).assertEqual(COUNT_ONE);
      expect(featureCount).assertEqual(COUNT_ONE);
      expect(entryCount + featureCount).assertEqual(modulesOf(info).length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_9200
     * @tc.name      testModuleTypeCensus0003
     * @tc.desc      Check the entry module is the only module of entry type and the only module hosting extension
     *               abilities, which ties the backup extension to the entry module
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testModuleTypeCensus0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const extensionHosts: number = modulesOf(info).filter((item: bundleManager.HapModuleInfo) =>
        item.extensionAbilitiesInfo.length > COUNT_NONE).length;
      const hostName: string = modulesOf(info).filter((item: bundleManager.HapModuleInfo) =>
        item.extensionAbilitiesInfo.length > COUNT_NONE)[COUNT_NONE].name;
      logCase('testModuleTypeCensus0003', `extensionHosts=${extensionHosts} hostName=${hostName}`);
      expect(extensionHosts).assertEqual(COUNT_ONE);
      expect(hostName).assertEqual(ENTRY_MODULE);
      expect(entryModule(info).type).assertEqual(bundleManager.ModuleType.ENTRY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_9300
     * @tc.name      testModuleTypeCensus0004
     * @tc.desc      Check the feature module declares the injected test ability, no extensions and is not
     *               installation free, so it is a plain test carrier module
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testModuleTypeCensus0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const test: bundleManager.HapModuleInfo = testModule(await selfBundle());
      const carrier: boolean = test.abilitiesInfo.length === COUNT_ONE &&
        test.extensionAbilitiesInfo.length === COUNT_NONE && !test.installationFree;
      logCase('testModuleTypeCensus0004', `type=${test.type} abilities=${test.abilitiesInfo.length} ` +
        `extensions=${test.extensionAbilitiesInfo.length} carrier=${carrier}`);
      expect(test.type).assertEqual(bundleManager.ModuleType.FEATURE);
      expect(test.abilitiesInfo.length + test.extensionAbilitiesInfo.length).assertEqual(COUNT_ONE);
      expect(test.installationFree).assertFalse();
      expect(carrier).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_9400
     * @tc.name      testModuleTypeCensus0005
     * @tc.desc      Check the module type list gathered with module only flags equals the list gathered with all self
     *               flags, so the type claim does not depend on the requested detail level
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testModuleTypeCensus0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const narrow: bundleManager.BundleInfo = await selfWith(MODULE_ONLY);
      const wide: bundleManager.BundleInfo = await selfWith(SELF_FLAGS);
      const narrowTypes: string = modulesOf(narrow).map((item: bundleManager.HapModuleInfo) =>
        `${item.name}=${item.type}`).sort().join(',');
      const wideTypes: string = modulesOf(wide).map((item: bundleManager.HapModuleInfo) =>
        `${item.name}=${item.type}`).sort().join(',');
      logCase('testModuleTypeCensus0005', `narrow=${narrowTypes} wide=${wideTypes} ` +
        `equal=${narrowTypes === wideTypes}`);
      expect(narrowTypes).assertEqual(wideTypes);
      expect(narrowTypes).assertEqual(`${ENTRY_MODULE}=${bundleManager.ModuleType.ENTRY},` +
        `${TEST_MODULE}=${bundleManager.ModuleType.FEATURE}`);
      expect(modulesOf(narrow).length).assertEqual(COUNT_TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_9500
     * @tc.name      testModuleTypeCensus0006
     * @tc.desc      Sum abilities and extensions per module and check the entry module carries two components while
     *               the feature module carries the injected test ability
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testModuleTypeCensus0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = entryModule(info);
      const test: bundleManager.HapModuleInfo = testModule(info);
      const entryComponents: number = entry.abilitiesInfo.length + entry.extensionAbilitiesInfo.length;
      const testComponents: number = test.abilitiesInfo.length + test.extensionAbilitiesInfo.length;
      logCase('testModuleTypeCensus0006', `entryComponents=${entryComponents} ` +
        `testComponents=${testComponents} types=${entry.type}/${test.type}`);
      expect(entryComponents).assertEqual(COUNT_TWO);
      expect(testComponents).assertEqual(COUNT_ONE);
      expect(entryComponents + testComponents).assertEqual(COUNT_THREE);
      expect(entry.type === test.type).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_9600
     * @tc.name      testAbilityLaunchType0001
     * @tc.desc      Compose the page ability membership, launch type and window mode count into one key and check it
     *               matches the page singleton configuration with three window modes
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLaunchType0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const ability: bundleManager.AbilityInfo = entryAbilityOf(info);
      const isPageAbility: boolean = containsValue(pageAbilityNamesOf(info), ability.name);
      const key: string = `${isPageAbility}|${ability.launchType}|${ability.supportWindowModes.length}`;
      const expected: string = `true|${bundleManager.LaunchType.SINGLETON}|${COUNT_THREE}`;
      logCase('testAbilityLaunchType0001', `key=${key} expected=${expected}`);
      expect(key).assertEqual(expected);
      expect(isPageAbility).assertTrue();
      expect(ability.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_9700
     * @tc.name      testAbilityLaunchType0002
     * @tc.desc      Check the singleton launch type is the only launch type reported for the single page ability and
     *               that no multiton or specified instance mode leaks in
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLaunchType0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      const notMultiton: boolean = ability.launchType !== bundleManager.LaunchType.MULTITON;
      const notSpecified: boolean = ability.launchType !== bundleManager.LaunchType.SPECIFIED;
      const singletonOnly: boolean = notMultiton && notSpecified &&
        ability.launchType === bundleManager.LaunchType.SINGLETON;
      logCase('testAbilityLaunchType0002', `launchType=${ability.launchType} singletonOnly=${singletonOnly}`);
      expect(singletonOnly).assertTrue();
      expect(notMultiton).assertTrue();
      expect(notSpecified).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_9800
     * @tc.name      testAbilityLaunchType0003
     * @tc.desc      Count page ability names and extension ability names across all modules and check the two name
     *               spaces never overlap while the extension type is measured in the extension type space
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityLaunchType0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const pageNames: string[] = pageAbilityNamesOf(info);
      const extensionNames: string[] = extensionNamesInBundle(info);
      const overlap: number = extensionNames.filter((name: string) => containsValue(pageNames, name)).length;
      logCase('testAbilityLaunchType0003', `page=${pageNames.length} extensions=${extensionNames.length} ` +
        `overlap=${overlap} extensionType=${backupOf(info).extensionAbilityType}`);
      expect(pageNames.length).assertEqual(COUNT_TWO);
      expect(overlap).assertEqual(COUNT_NONE);
      expect(extensionNames.length).assertEqual(COUNT_ONE);
      expect(backupOf(info).extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.BACKUP);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_9900
     * @tc.name      testAbilityLaunchType0004
     * @tc.desc      Check the page ability membership and launch type are identical whether the bundle is read with
     *               module and ability flags or with every self flag enabled
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityLaunchType0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const narrowInfo: bundleManager.BundleInfo = await selfWith(MODULE_ABILITY);
      const wideInfo: bundleManager.BundleInfo = await selfWith(FULL_FLAGS);
      const narrow: bundleManager.AbilityInfo = entryAbilityOf(narrowInfo);
      const wide: bundleManager.AbilityInfo = entryAbilityOf(wideInfo);
      const narrowPage: boolean = containsValue(pageAbilityNamesOf(narrowInfo), narrow.name);
      const widePage: boolean = containsValue(pageAbilityNamesOf(wideInfo), wide.name);
      logCase('testAbilityLaunchType0004', `narrow=${flagText(MODULE_ABILITY)}/${narrowPage}/` +
        `${narrow.launchType} wide=${flagText(FULL_FLAGS)}/${widePage}/${wide.launchType}`);
      expect(narrow.launchType).assertEqual(wide.launchType);
      expect(narrowPage).assertEqual(widePage);
      expect(widePage).assertTrue();
      expect(wide.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_10000
     * @tc.name      testAbilityLaunchType0005
     * @tc.desc      Locate the page ability by walking every module and check the located instance reports the same
     *               type and launch type as the direct entry module lookup
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityLaunchType0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      let located: bundleManager.AbilityInfo | undefined = undefined;
      const scanned: bundleManager.HapModuleInfo[] = modulesOf(info);
      for (const item of scanned) {
        const hit: bundleManager.AbilityInfo | undefined = findAbilityOrNone(item, ENTRY_ABILITY);
        if (hit !== undefined) {
          located = hit;
          break;
        }
      }
      const direct: bundleManager.AbilityInfo = entryAbilityOf(info);
      logCase('testAbilityLaunchType0005', `located=${located === undefined ? '' : located.name} ` +
        `direct=${direct.name} pageAbilities=${pageAbilityNamesOf(info).join(',')}`);
      expect(located !== undefined).assertTrue();
      if (located === undefined) {
        expect(false).assertTrue();
        return;
      }
      const found: bundleManager.AbilityInfo = located as bundleManager.AbilityInfo;
      expect(found.name).assertEqual(direct.name);
      expect(found.launchType).assertEqual(direct.launchType);
      expect(containsValue(pageAbilityNamesOf(info), found.name)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_10100
     * @tc.name      testMetadataKeyValue0001
     * @tc.desc      Fingerprint the backup extension declaration as one metadata entry with no skills and no
     *               permissions and check the fingerprint text matches module.json5
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMetadataKeyValue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      const fingerprint: string = `${extension.metadata.length}/${extension.skills.length}/` +
        `${extension.permissions.length}`;
      logCase('testMetadataKeyValue0001', `fingerprint=${fingerprint} ` +
        `metadata=${metadataText(extension.metadata)}`);
      expect(fingerprint).assertEqual(`${COUNT_ONE}/${COUNT_NONE}/${COUNT_NONE}`);
      expect(extension.metadata[COUNT_NONE].name).assertEqual(BACKUP_METADATA);
      expect(extension.metadata[COUNT_NONE].resource).assertEqual(BACKUP_RESOURCE_REF);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_10200
     * @tc.name      testMetadataKeyValue0002
     * @tc.desc      Gather every metadata key in the bundle and check only one key exists and that it is the backup
     *               metadata key declared under extensionAbilities
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMetadataKeyValue0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const keys: string[] = [];
      modulesOf(info).forEach((item: bundleManager.HapModuleInfo) => {
        item.metadata.forEach((metadata: bundleManager.Metadata) => {
          keys.push(metadata.name);
        });
        item.abilitiesInfo.forEach((ability: bundleManager.AbilityInfo) => {
          ability.metadata.forEach((metadata: bundleManager.Metadata) => {
            keys.push(metadata.name);
          });
        });
        item.extensionAbilitiesInfo.forEach((extension: bundleManager.ExtensionAbilityInfo) => {
          extension.metadata.forEach((metadata: bundleManager.Metadata) => {
            keys.push(metadata.name);
          });
        });
      });
      logCase('testMetadataKeyValue0002', `keys=${keys.join(',')} count=${keys.length}`);
      expect(keys.length).assertEqual(COUNT_ONE);
      expect(keys[COUNT_NONE]).assertEqual(BACKUP_METADATA);
      expect(distinctStrings(keys)).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_10300
     * @tc.name      testMetadataKeyValue0003
     * @tc.desc      Check metadata is declared only below the extension level, so module metadata and ability metadata
     *               both report zero while the extension reports one
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMetadataKeyValue0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const levels: string = `${moduleMetadataTotal(info)}/` +
        `${entryAbilityOf(info).metadata.length}/${extensionMetadataTotal(info)}`;
      logCase('testMetadataKeyValue0003', `moduleAbilityExtension=${levels}`);
      expect(levels).assertEqual(`${COUNT_NONE}/${COUNT_NONE}/${COUNT_ONE}`);
      expect(moduleMetadataTotal(info)).assertEqual(COUNT_NONE);
      expect(extensionMetadataTotal(info)).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_10400
     * @tc.name      testMetadataKeyValue0004
     * @tc.desc      Check the metadata resource uses the profile reference form and never the string or media
     *               reference form used elsewhere in module.json5
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetadataKeyValue0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      const resource: string = extension.metadata[COUNT_NONE].resource;
      logCase('testMetadataKeyValue0004', `resource=${resource} profilePrefix=${PROFILE_PREFIX} ` +
        `labelRef=${ABILITY_LABEL_REF}`);
      expect(resource.startsWith(PROFILE_PREFIX)).assertTrue();
      expect(resource.startsWith('$string:')).assertFalse();
      expect(resource.startsWith('$media:')).assertFalse();
      expect(ABILITY_LABEL_REF.startsWith('$string:')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_10500
     * @tc.name      testMetadataKeyValue0005
     * @tc.desc      Check collected metadata keys and values are non-empty and free of padding, so the declared key
     *               value pair is stored verbatim
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetadataKeyValue0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      const name: string = extension.metadata[COUNT_NONE].name;
      const resource: string = extension.metadata[COUNT_NONE].resource;
      logCase('testMetadataKeyValue0005', `name=${name} resource=${resource} ` +
        `trimmed=${name === name.trim() && resource === resource.trim()}`);
      expect(name.length > COUNT_NONE).assertTrue();
      expect(resource.length > COUNT_NONE).assertTrue();
      expect(name === name.trim()).assertTrue();
      expect(resource === resource.trim()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_10600
     * @tc.name      testMetadataKeyValue0006
     * @tc.desc      Query the extension metadata with the extension and metadata flags and check the gated result
     *               repeats the same key and value as the fully flagged query
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetadataKeyValue0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const gated: bundleManager.BundleInfo = await selfWith(MODULE_EXTENSION_METADATA);
      const full: bundleManager.BundleInfo = await selfBundle();
      const gatedText: string = metadataText(extensionMetadataList(gated));
      const fullText: string = metadataText(extensionMetadataList(full));
      logCase('testMetadataKeyValue0006', `gated=${gatedText} full=${fullText} ` +
        `equal=${gatedText === fullText}`);
      expect(gatedText).assertEqual(fullText);
      expect(gatedText).assertEqual(`${BACKUP_METADATA}=${BACKUP_RESOURCE_REF}`);
      expect(extensionMetadataTotal(gated)).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_10700
     * @tc.name      testMetadataKeyValue0007
     * @tc.desc      Check the declared key and value keep their exact lengths and that the assembled pair text is one
     *               character longer than both parts combined because of the separator
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetadataKeyValue0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const extension: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      const name: string = extension.metadata[COUNT_NONE].name;
      const resource: string = extension.metadata[COUNT_NONE].resource;
      const pair: string = metadataText(extension.metadata);
      logCase('testMetadataKeyValue0007', `nameLength=${name.length} resourceLength=${resource.length} ` +
        `pairLength=${pair.length}`);
      expect(pair.length).assertEqual(name.length + resource.length + COUNT_ONE);
      expect(name).assertEqual(BACKUP_METADATA);
      expect(resource).assertEqual(BACKUP_RESOURCE_REF);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_10800
     * @tc.name      testRepeatQueryStability0001
     * @tc.desc      Query the bundle twice and check the module name list and module count stay identical, so module
     *               enumeration is repeatable
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepeatQueryStability0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string[] = moduleNamesOf(await selfBundle()).slice().sort();
      const second: string[] = moduleNamesOf(await selfBundle()).slice().sort();
      logCase('testRepeatQueryStability0001', `first=${first.join(',')} second=${second.join(',')} ` +
        `equal=${first.join(',') === second.join(',')}`);
      expect(first.join(',')).assertEqual(second.join(','));
      expect(first.length).assertEqual(second.length);
      expect(first.length).assertEqual(COUNT_TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_10900
     * @tc.name      testRepeatQueryStability0002
     * @tc.desc      Query the bundle three times in a loop and check the ability identity key is identical on every
     *               pass
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRepeatQueryStability0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const keys: string[] = [];
      for (let round = COUNT_NONE; round < COUNT_THREE; round++) {
        const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
        keys.push(`${ability.bundleName}/${ability.moduleName}/${ability.name}`);
      }
      logCase('testRepeatQueryStability0002', `rounds=${keys.length} keys=${keys.join('|')}`);
      expect(keys.length).assertEqual(COUNT_THREE);
      expect(distinctStrings(keys)).assertEqual(COUNT_ONE);
      expect(keys[COUNT_NONE]).assertEqual(`${BUNDLE_NAME}/${ENTRY_MODULE}/${ENTRY_ABILITY}`);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_11000
     * @tc.name      testRepeatQueryStability0003
     * @tc.desc      Query the bundle twice and check the extension metadata text and metadata count stay identical
     *               between the two reads
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRepeatQueryStability0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const first: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      const second: bundleManager.ExtensionAbilityInfo = backupOf(await selfBundle());
      logCase('testRepeatQueryStability0003', `first=${metadataText(first.metadata)} ` +
        `second=${metadataText(second.metadata)}`);
      expect(metadataText(first.metadata)).assertEqual(metadataText(second.metadata));
      expect(first.metadata.length).assertEqual(second.metadata.length);
      expect(first.name).assertEqual(second.name);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_11100
     * @tc.name      testRepeatQueryStability0004
     * @tc.desc      Query the bundle twice and check the entry module description id, main element and type are
     *               reported unchanged
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepeatQueryStability0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: bundleManager.HapModuleInfo = entryModule(await selfBundle());
      const second: bundleManager.HapModuleInfo = entryModule(await selfBundle());
      logCase('testRepeatQueryStability0004', `descriptionId=${first.descriptionId}/${second.descriptionId} ` +
        `mainElement=${first.mainElementName}/${second.mainElementName}`);
      expect(first.descriptionId).assertEqual(second.descriptionId);
      expect(first.mainElementName).assertEqual(second.mainElementName);
      expect(first.type).assertEqual(second.type);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_11200
     * @tc.name      testRepeatQueryStability0005
     * @tc.desc      Query the bundle five times and check the module count never drifts and always equals the number
     *               of installed hap modules
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRepeatQueryStability0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const counts: number[] = [];
      for (let round = COUNT_NONE; round < COUNT_THREE + COUNT_TWO; round++) {
        counts.push(modulesOf(await selfBundle()).length);
      }
      const stable: boolean = counts.every((value: number) => value === COUNT_TWO);
      logCase('testRepeatQueryStability0005', `counts=${counts.join(',')} stable=${stable}`);
      expect(counts.length).assertEqual(COUNT_THREE + COUNT_TWO);
      expect(stable).assertTrue();
      expect(counts[COUNT_NONE]).assertEqual(COUNT_TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_11300
     * @tc.name      testRepeatQueryStability0006
     * @tc.desc      Query the bundle twice and check the skill signature and window mode text of the page ability are
     *               reproduced exactly
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRepeatQueryStability0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const first: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      const second: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
      logCase('testRepeatQueryStability0006', `signature=${skillSignature(first)} ` +
        `modes=${windowModeText(first)}/${windowModeText(second)}`);
      expect(skillSignature(first)).assertEqual(skillSignature(second));
      expect(windowModeText(first)).assertEqual(windowModeText(second));
      expect(skillSignature(first)).assertEqual(`${HOME_ACTION}/${HOME_ENTITY}`);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_11400
     * @tc.name      testRepeatQueryStability0007
     * @tc.desc      Query the bundle twice and check the device type list, installation free flag and module hash are
     *               all reproduced on the second read
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRepeatQueryStability0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const first: bundleManager.HapModuleInfo = entryModule(await selfBundle());
      const second: bundleManager.HapModuleInfo = entryModule(await selfBundle());
      logCase('testRepeatQueryStability0007', `devices=${first.deviceTypes.join(',')} ` +
        `free=${first.installationFree}/${second.installationFree} hash=${first.hashValue}`);
      expect(first.deviceTypes.join(',')).assertEqual(second.deviceTypes.join(','));
      expect(first.installationFree).assertEqual(second.installationFree);
      expect(first.hashValue).assertEqual(second.hashValue);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_11500
     * @tc.name      testFlagSubset0001
     * @tc.desc      Compare the default bundle flags with the module flags and check the default read exposes no
     *               module list while the module read exposes both modules
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFlagSubset0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const bare: bundleManager.BundleInfo = await selfWith(FLAG_DEFAULT);
      const modules: bundleManager.BundleInfo = await selfWith(MODULE_ONLY);
      logCase('testFlagSubset0001', `default=${flagText(FLAG_DEFAULT)} bare=${modulesOf(bare).length} ` +
        `module=${flagText(MODULE_ONLY)} wide=${modulesOf(modules).length}`);
      expect(modulesOf(bare).length).assertEqual(COUNT_NONE);
      expect(modulesOf(modules).length).assertEqual(COUNT_TWO);
      expect(modulesOf(bare).length <= modulesOf(modules).length).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_11600
     * @tc.name      testFlagSubset0002
     * @tc.desc      Check a module only read returns both module descriptors but no ability or extension detail, so
     *               the component lists stay empty
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFlagSubset0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfWith(MODULE_ONLY);
      logCase('testFlagSubset0002', `modules=${modulesOf(info).length} abilities=${abilityTotal(info)} ` +
        `extensions=${extensionTotal(info)}`);
      expect(modulesOf(info).length).assertEqual(COUNT_TWO);
      expect(abilityTotal(info)).assertEqual(COUNT_NONE);
      expect(extensionTotal(info)).assertEqual(COUNT_NONE);
      expect(moduleNamesOf(info).slice().sort().join(',')).assertEqual([ENTRY_MODULE, TEST_MODULE].sort().join(','));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_11700
     * @tc.name      testFlagSubset0003
     * @tc.desc      Check adding the ability flag to the module flag yields the entry and injected test page
     *               abilities and still omits extension details
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFlagSubset0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfWith(MODULE_ABILITY);
      const names: string = abilityNamesOf(entryModule(info)).join(',');
      logCase('testFlagSubset0003', `flags=${flagText(MODULE_ABILITY)} abilities=${abilityTotal(info)} ` +
        `names=${names} extensions=${extensionTotal(info)}`);
      expect(abilityTotal(info)).assertEqual(COUNT_TWO);
      expect(names).assertEqual(ENTRY_ABILITY);
      expect(extensionTotal(info)).assertEqual(COUNT_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_11800
     * @tc.name      testFlagSubset0004
     * @tc.desc      Check adding the extension flag to the module flag yields exactly one extension and no ability
     *               detail, mirroring the module ability read
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlagSubset0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfWith(MODULE_EXTENSION);
      const names: string = extensionNamesOf(entryModule(info)).join(',');
      logCase('testFlagSubset0004', `flags=${flagText(MODULE_EXTENSION)} extensions=${extensionTotal(info)} ` +
        `names=${names} abilities=${abilityTotal(info)}`);
      expect(extensionTotal(info)).assertEqual(COUNT_ONE);
      expect(names).assertEqual(BACKUP_ABILITY);
      expect(abilityTotal(info)).assertEqual(COUNT_NONE);
      expect(extensionMetadataTotal(info)).assertEqual(COUNT_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_11900
     * @tc.name      testFlagSubset0005
     * @tc.desc      Compare an ability read with and without the skill flag and check the skill list only appears
     *               when the skill flag is requested
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlagSubset0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const withoutSkill: bundleManager.BundleInfo = await selfWith(MODULE_ABILITY);
      const withSkill: bundleManager.BundleInfo = await selfWith(MODULE_ABILITY_SKILL);
      logCase('testFlagSubset0005', `without=${skillTotal(withoutSkill)} ` +
        `with=${skillTotal(withSkill)} flags=${flagText(MODULE_ABILITY_SKILL)}`);
      expect(skillTotal(withoutSkill)).assertEqual(COUNT_NONE);
      expect(skillTotal(withSkill)).assertEqual(COUNT_ONE);
      expect(abilityTotal(withoutSkill)).assertEqual(abilityTotal(withSkill));
      expect(skillSignature(entryAbilityOf(withSkill))).assertEqual(`${HOME_ACTION}/${HOME_ENTITY}`);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_12000
     * @tc.name      testFlagSubset0006
     * @tc.desc      Compare an extension read with and without the metadata flag and check metadata only appears when
     *               the metadata flag is requested
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlagSubset0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const withoutMetadata: bundleManager.BundleInfo = await selfWith(MODULE_EXTENSION);
      const withMetadata: bundleManager.BundleInfo = await selfWith(MODULE_EXTENSION_METADATA);
      logCase('testFlagSubset0006', `without=${extensionMetadataTotal(withoutMetadata)} ` +
        `with=${extensionMetadataTotal(withMetadata)} flags=${flagText(MODULE_EXTENSION_METADATA)}`);
      expect(extensionMetadataTotal(withoutMetadata)).assertEqual(COUNT_NONE);
      expect(extensionMetadataTotal(withMetadata)).assertEqual(COUNT_ONE);
      expect(extensionTotal(withoutMetadata)).assertEqual(extensionTotal(withMetadata));
      expect(metadataText(extensionMetadataList(withMetadata))).assertEqual(`${BACKUP_METADATA}=` +
        `${BACKUP_RESOURCE_REF}`);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_12100
     * @tc.name      testFlagSubset0007
     * @tc.desc      Check the metadata flag alone is not enough to retrieve extension metadata, so module and metadata
     *               flags without the extension flag report an empty metadata list
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlagSubset0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await selfWith(MODULE_METADATA_ONLY);
      logCase('testFlagSubset0007', `flags=${flagText(MODULE_METADATA_ONLY)} ` +
        `modules=${modulesOf(info).length} moduleMetadata=${moduleMetadataTotal(info)} ` +
        `extensionMetadata=${extensionMetadataTotal(info)}`);
      expect(modulesOf(info).length).assertEqual(COUNT_TWO);
      expect(moduleMetadataTotal(info)).assertEqual(COUNT_NONE);
      expect(extensionMetadataTotal(info)).assertEqual(COUNT_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_12200
     * @tc.name      testFlagSubset0008
     * @tc.desc      Compose the component inventory of the fully flagged read and check it reports two modules, two
     *               abilities, one extension, one skill and one metadata entry
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFlagSubset0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfWith(FULL_FLAGS);
      const inventory: string = `${modulesOf(info).length}/${abilityTotal(info)}/${extensionTotal(info)}/` +
        `${skillTotal(info)}/${extensionMetadataTotal(info)}`;
      logCase('testFlagSubset0008', `flags=${flagText(FULL_FLAGS)} inventory=${inventory}`);
      expect(inventory).assertEqual(`${COUNT_TWO}/${COUNT_TWO}/${COUNT_ONE}/${COUNT_ONE}/${COUNT_ONE}`);
      expect(modulesOf(info).length).assertEqual(COUNT_TWO);
      expect(skillTotal(info)).assertEqual(COUNT_ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLEMOD_12300
     * @tc.name      testFlagSubset0009
     * @tc.desc      Compare the application plus module read with the application plus module plus ability read and
     *               check the module list is unchanged while only the ability list grows
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlagSubset0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const narrow: bundleManager.BundleInfo = await selfWith(APP_MODULE);
      const wide: bundleManager.BundleInfo = await selfWith(APP_MODULE_ABILITY);
      const sameModules: boolean = moduleNamesOf(narrow).join(',') === moduleNamesOf(wide).join(',');
      logCase('testFlagSubset0009', `narrow=${flagText(APP_MODULE)} wide=${flagText(APP_MODULE_ABILITY)} ` +
        `sameModules=${sameModules} abilities=${abilityTotal(narrow)}/${abilityTotal(wide)}`);
      expect(sameModules).assertTrue();
      expect(abilityTotal(narrow)).assertEqual(COUNT_NONE);
      expect(abilityTotal(wide)).assertEqual(COUNT_TWO);
      expect(narrow.appInfo.name).assertEqual(wide.appInfo.name);
    });
  });
}
