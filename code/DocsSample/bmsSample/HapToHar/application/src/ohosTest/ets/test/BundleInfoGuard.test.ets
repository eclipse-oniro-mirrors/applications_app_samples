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

import { describe, beforeAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  BUNDLE_NAME,
  ENTRY_MODULE,
  TEST_MODULE,
  ENTRY_ABILITY,
  HAR_MODULE_NAMES,
  HAR_ABILITY_NAMES,
  selfBundle,
  findModule,
  allAbilityNames
} from './shared/AppProbe';
import { paceTurn } from './shared/TestPace';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_HapToHar]';
const HOME_ENTITY: string = 'entity.system.home';
const HOME_ACTION: string = 'ohos.want.action.home';

let info: bundleManager.BundleInfo;

function entryModule(): bundleManager.HapModuleInfo {
  return findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
}

function entryAbility(): bundleManager.AbilityInfo {
  return entryModule().abilitiesInfo[0];
}

export default function bundleInfoGuardTest() {
  describe('BundleInfoGuard', () => {
    beforeAll(async () => {
      info = await selfBundle();
    });

    beforeEach(async () => {
      await paceTurn();
      hilog.info(DOMAIN, TAG, '%{public}s', 'BundleInfoGuard case begin');
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_0100
     * @tc.name      testBundleInfoIdentity0001
     * @tc.desc      Read the installed bundle and check its name and version against AppScope
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInfoIdentity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(info.name).assertEqual(BUNDLE_NAME);
      expect(info.versionCode).assertEqual(1000000);
      expect(info.versionName).assertEqual('1.0.0');
      const major: number = parseInt(info.versionName.split('.')[0], 10);
      expect(Math.floor(info.versionCode / 1000000)).assertEqual(major);
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_0200
     * @tc.name      testBundleInfoModuleSet0001
     * @tc.desc      Check the installed modules are the application HAP and its test HAP only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInfoModuleSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const names: string[] = info.hapModulesInfo.map((item: bundleManager.HapModuleInfo) => item.name).sort();
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual(ENTRY_MODULE);
      expect(names[1]).assertEqual(TEST_MODULE);
      expect(new Set<string>(names).size).assertEqual(names.length);
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_0300
     * @tc.name      testBundleInfoHarModuleAbsent0001
     * @tc.desc      Check that the module converted to a HAR is not installed as a HAP module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInfoHarModuleAbsent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (const harName of HAR_MODULE_NAMES) {
        expect(findModule(info, harName) === undefined).assertTrue();
      }
      const entries: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (item: bundleManager.HapModuleInfo): boolean => item.type === bundleManager.ModuleType.ENTRY);
      expect(entries.length).assertEqual(1);
      expect(findModule(info, ENTRY_MODULE) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_0400
     * @tc.name      testBundleInfoEntryModuleShape0001
     * @tc.desc      Check the application module is an entry module started from ApplicationAbility on default devices
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInfoEntryModuleShape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const hap: bundleManager.HapModuleInfo = entryModule();
      expect(hap.type).assertEqual(bundleManager.ModuleType.ENTRY);
      expect(hap.mainElementName).assertEqual(ENTRY_ABILITY);
      expect(hap.deviceTypes.length).assertEqual(1);
      expect(hap.deviceTypes[0]).assertEqual('default');
      expect(hap.installationFree).assertFalse();
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_0500
     * @tc.name      testBundleInfoEntryNoDependency0001
     * @tc.desc      Check the application module declares no module dependency, so the HAR is not linked in
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInfoEntryNoDependency0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const hap: bundleManager.HapModuleInfo = entryModule();
      expect(hap.dependencies.length).assertEqual(0);
      expect(hap.preloads.length).assertEqual(0);
      const depNames: string[] = hap.dependencies.map((item: bundleManager.Dependency) => item.moduleName);
      expect(depNames.indexOf('har')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_0600
     * @tc.name      testBundleInfoTestModuleShape0001
     * @tc.desc      Check the test module is installed as a feature module next to the application module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInfoTestModuleShape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const hap: bundleManager.HapModuleInfo = findModule(info, TEST_MODULE) as bundleManager.HapModuleInfo;
      expect(hap.type).assertEqual(bundleManager.ModuleType.FEATURE);
      expect(hap.type !== entryModule().type).assertTrue();
      expect(hap.installationFree).assertFalse();
      expect(hap.deviceTypes.indexOf('default') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_0700
     * @tc.name      testBundleInfoSingleAbility0001
     * @tc.desc      Check the application module holds exactly one exported ApplicationAbility
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleInfoSingleAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const hap: bundleManager.HapModuleInfo = entryModule();
      expect(hap.abilitiesInfo.length).assertEqual(1);
      const ability: bundleManager.AbilityInfo = entryAbility();
      expect(ability.name).assertEqual(ENTRY_ABILITY);
      expect(ability.moduleName).assertEqual(ENTRY_MODULE);
      expect(ability.bundleName).assertEqual(BUNDLE_NAME);
      expect(ability.exported).assertTrue();
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_0800
     * @tc.name      testBundleInfoAbilityDefaults0001
     * @tc.desc      Check fields left unset in module.json5 fall back to their defaults for ApplicationAbility
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInfoAbilityDefaults0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: bundleManager.AbilityInfo = entryAbility();
      expect(ability.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
      expect(ability.permissions.length).assertEqual(0);
      expect(ability.enabled).assertTrue();
      expect(ability.orientation).assertEqual(bundleManager.DisplayOrientation.UNSPECIFIED);
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_0900
     * @tc.name      testBundleInfoHomeSkill0001
     * @tc.desc      Check ApplicationAbility carries one skill with the home entity and the home action only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInfoHomeSkill0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const skills: bundleManager.Skill[] = entryAbility().skills;
      expect(skills.length).assertEqual(1);
      expect(skills[0].entities.length).assertEqual(1);
      expect(skills[0].entities[0]).assertEqual(HOME_ENTITY);
      expect(skills[0].actions.length).assertEqual(1);
      expect(skills[0].actions[0]).assertEqual(HOME_ACTION);
      expect(skills[0].uris.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_1000
     * @tc.name      testBundleInfoHarAbilityAbsent0001
     * @tc.desc      Check the abilities that only live in the HAR source are not installed anywhere in the bundle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInfoHarAbilityAbsent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const names: string[] = allAbilityNames(info);
      for (const harAbility of HAR_ABILITY_NAMES) {
        expect(names.indexOf(harAbility)).assertEqual(-1);
      }
      expect(names.indexOf(ENTRY_ABILITY) >= 0).assertTrue();
      expect(names.filter((name: string) => name === ENTRY_ABILITY).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_1100
     * @tc.name      testBundleInfoNoExtension0001
     * @tc.desc      Check no extension ability, including the HAR backup extension, is installed in any module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInfoNoExtension0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let extensionCount: number = 0;
      for (const hap of info.hapModulesInfo) {
        extensionCount += hap.extensionAbilitiesInfo.length;
      }
      expect(extensionCount).assertEqual(0);
      expect(entryModule().extensionAbilitiesInfo.length).assertEqual(0);
      expect(info.hapModulesInfo.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_1200
     * @tc.name      testBundleInfoNoPermission0001
     * @tc.desc      Check the bundle requests no permission and holds no grant state
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInfoNoPermission0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length).assertEqual(0);
      expect(info.permissionGrantStates.length).assertEqual(0);
      expect(info.appInfo.permissions.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_1300
     * @tc.name      testBundleInfoAppType0001
     * @tc.desc      Check the bundle installs as a normal third party app rather than an atomic service
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleInfoAppType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      expect(info.appInfo.systemApp).assertFalse();
      expect(info.appInfo.removable).assertTrue();
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_1400
     * @tc.name      testBundleInfoSignature0001
     * @tc.desc      Check the signature info binds the appId to the bundle name and exposes a SHA-256 fingerprint
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInfoSignature0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const appId: string = info.signatureInfo.appId;
      expect(appId.startsWith(BUNDLE_NAME + '_')).assertTrue();
      expect(appId.length > BUNDLE_NAME.length + 1).assertTrue();
      expect(/^[0-9A-Fa-f]{64}$/.test(info.signatureInfo.fingerprint)).assertTrue();
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_BUNDLEINFO_1500
     * @tc.name      testBundleInfoIconShared0001
     * @tc.desc      Check the app icon and the ApplicationAbility icon resolve to the same layered_image resource
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleInfoIconShared0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability: bundleManager.AbilityInfo = entryAbility();
      expect(ability.iconId !== 0).assertTrue();
      expect(ability.iconId).assertEqual(info.appInfo.iconId);
      expect(info.appInfo.iconResource.id).assertEqual(info.appInfo.iconId);
      expect(info.appInfo.iconResource.moduleName).assertEqual(ENTRY_MODULE);
    });
  });
}
