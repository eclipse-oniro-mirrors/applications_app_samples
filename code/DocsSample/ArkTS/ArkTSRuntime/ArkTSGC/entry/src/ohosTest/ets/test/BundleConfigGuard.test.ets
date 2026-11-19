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
import { process } from '@kit.ArkTS';
import {
  BACKUP_ABILITY,
  BACKUP_METADATA,
  BUNDLE_NAME,
  ENTRY_ABILITY,
  ENTRY_MODULE,
  entryContext,
  errorCode,
  findModule,
  selfBundle,
  TEST_MODULE
} from './shared/AppProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const VERSION_CODE: number = 1000000;
const VERSION_NAME: string = '1.0.0';
const TARGET_API: number = 26;
const ERR_ABILITY_NOT_EXIST: number = 17700003;
const ERR_NO_PROFILE: number = 17700024;

class BackupProfile {
  allowToBackupRestore: boolean = false;
}

function resources(): resourceManager.ResourceManager {
  return entryContext().resourceManager;
}

function entryAbility(info: bundleManager.BundleInfo): bundleManager.AbilityInfo {
  return findModule(info, ENTRY_MODULE).abilitiesInfo[0];
}

function backupExtension(info: bundleManager.BundleInfo): bundleManager.ExtensionAbilityInfo {
  return findModule(info, ENTRY_MODULE).extensionAbilitiesInfo[0];
}

function profileErrorCode(moduleName: string, extensionName: string, metadataName: string): number {
  return errorCode(() => {
    bundleManager.getProfileByExtensionAbilitySync(moduleName, extensionName, metadataName);
  });
}

export default function bundleConfigGuardTest() {
  describe('BundleConfigGuard', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLECONFIG_0100
     * @tc.name      testBundleBasics0001
     * @tc.desc      Read the own bundle info and check name, version code, version name and minimum compatible version
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleBasics0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      logCase('testBundleBasics0001', `name=${info.name} versionCode=${info.versionCode} ` +
        `versionName=${info.versionName} minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.name).assertEqual(BUNDLE_NAME);
      expect(info.versionCode).assertEqual(VERSION_CODE);
      expect(info.versionName).assertEqual(VERSION_NAME);
      expect(info.minCompatibleVersionCode).assertEqual(info.versionCode);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLECONFIG_0200
     * @tc.name      testBundleTargetVersion0001
     * @tc.desc      Check the target version encodes SDK 26.0.0 with API level 26 as configured in build-profile.json5
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleTargetVersion0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      logCase('testBundleTargetVersion0001', `targetVersion=${info.targetVersion} targetApi=${TARGET_API}`);
      expect(info.targetVersion % 1000).assertEqual(TARGET_API);
      expect(Math.floor(info.targetVersion / 10000000)).assertEqual(TARGET_API);
      expect(info.targetVersion).assertEqual(TARGET_API * 10000000 + TARGET_API);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLECONFIG_0300
     * @tc.name      testBundleAppInfo0001
     * @tc.desc      Check the application info label, icon, process, uid and flags match app.json5 and the running
     *               process
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAppInfo0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const app: bundleManager.ApplicationInfo = (await selfBundle()).appInfo;
      logCase('testBundleAppInfo0001', `name=${app.name} label=${app.label} icon=${app.icon} process=${app.process} ` +
        `uid=${app.uid} removable=${app.removable} systemApp=${app.systemApp} enabled=${app.enabled} ` +
        `bundleType=${app.bundleType}`);
      expect(app.name).assertEqual(BUNDLE_NAME);
      expect(app.label).assertEqual('$string:app_name');
      expect(app.icon).assertEqual('$media:layered_image');
      expect(app.process).assertEqual(BUNDLE_NAME);
      expect(app.uid).assertEqual(process.uid);
      expect(app.removable && !app.systemApp && app.enabled).assertTrue();
      expect(app.bundleType).assertEqual(bundleManager.BundleType.APP);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLECONFIG_0400
     * @tc.name      testBundleAppLabel0001
     * @tc.desc      Resolve the application label and ability label ids through the resource manager and check both say
     *               ArkTSGC
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleAppLabel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const ability: bundleManager.AbilityInfo = entryAbility(info);
      logCase('testBundleAppLabel0001', `appLabelId=${info.appInfo.labelId} abilityLabelId=${ability.labelId} ` +
        `labelBundle=${info.appInfo.labelResource.bundleName} labelResourceId=${info.appInfo.labelResource.id}`);
      expect(resources().getStringSync(info.appInfo.labelId)).assertEqual('ArkTSGC');
      expect(resources().getStringSync(ability.labelId)).assertEqual('ArkTSGC');
      expect(info.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
      expect(info.appInfo.labelResource.id).assertEqual(info.appInfo.labelId);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLECONFIG_0500
     * @tc.name      testBundleEntryModule0001
     * @tc.desc      Check the entry module type, main element, device types, install mode and description text
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleEntryModule0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const entry: bundleManager.HapModuleInfo = findModule(await selfBundle(), ENTRY_MODULE);
      logCase('testBundleEntryModule0001', `type=${entry.type} mainElement=${entry.mainElementName} ` +
        `deviceTypes=${entry.deviceTypes.join(',')} installationFree=${entry.installationFree} ` +
        `descriptionId=${entry.descriptionId}`);
      expect(entry.type).assertEqual(bundleManager.ModuleType.ENTRY);
      expect(entry.mainElementName).assertEqual(ENTRY_ABILITY);
      expect(entry.deviceTypes.join(',')).assertEqual('phone');
      expect(entry.installationFree).assertFalse();
      expect(resources().getStringSync(entry.descriptionId)).assertEqual('module description');
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLECONFIG_0600
     * @tc.name      testBundleEntryAbility0001
     * @tc.desc      Check EntryAbility is the only page ability, exported, visible, singleton, with all three window
     *               modes
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleEntryAbility0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const entry: bundleManager.HapModuleInfo = findModule(await selfBundle(), ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = entry.abilitiesInfo[0];
      logCase('testBundleEntryAbility0001', `abilities=${entry.abilitiesInfo.length} name=${ability.name} ` +
        `module=${ability.moduleName} exported=${ability.exported} launchType=${ability.launchType} ` +
        `windowModes=${ability.supportWindowModes.join(',')} descriptionId=${ability.descriptionId}`);
      expect(entry.abilitiesInfo.length).assertEqual(1);
      expect(ability.name).assertEqual(ENTRY_ABILITY);
      expect(ability.moduleName).assertEqual(ENTRY_MODULE);
      expect(ability.exported).assertTrue();
      expect(ability.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
      expect(ability.supportWindowModes.slice().sort().join(',')).assertEqual('0,1,2');
      expect(resources().getStringSync(ability.descriptionId)).assertEqual('description');
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLECONFIG_0700
     * @tc.name      testBundleHomeSkill0001
     * @tc.desc      Check EntryAbility declares exactly one skill with the home action and the home entity and no uris
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleHomeSkill0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const skills: bundleManager.Skill[] = entryAbility(await selfBundle()).skills;
      logCase('testBundleHomeSkill0001', `skills=${skills.length} ` +
        `actions=${skills.map((skill: bundleManager.Skill) => skill.actions.join(',')).join(';')} ` +
        `entities=${skills.map((skill: bundleManager.Skill) => skill.entities.join(',')).join(';')} ` +
        `uris=${skills.map((skill: bundleManager.Skill) => skill.uris.length).join(';')}`);
      expect(skills.length).assertEqual(1);
      expect(skills[0].actions.join(',')).assertEqual('ohos.want.action.home');
      expect(skills[0].entities.join(',')).assertEqual('entity.system.home');
      expect(skills[0].uris.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLECONFIG_0800
     * @tc.name      testBundleBackupExtension0001
     * @tc.desc      Check EntryBackupAbility is the only extension, of backup type, not exported, with one backup
     *               metadata entry
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackupExtension0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const entry: bundleManager.HapModuleInfo = findModule(await selfBundle(), ENTRY_MODULE);
      const backup: bundleManager.ExtensionAbilityInfo = entry.extensionAbilitiesInfo[0];
      logCase('testBundleBackupExtension0001', `extensions=${entry.extensionAbilitiesInfo.length} ` +
        `name=${backup.name} type=${backup.extensionAbilityType} typeName=${backup.extensionAbilityTypeName} ` +
        `exported=${backup.exported} metadataCount=${backup.metadata.length} ` +
        `metadata=${backup.metadata.map((m: bundleManager.Metadata) => m.name + '=' + m.resource).join(',')}`);
      expect(entry.extensionAbilitiesInfo.length).assertEqual(1);
      expect(backup.name).assertEqual(BACKUP_ABILITY);
      expect(backup.extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.BACKUP);
      expect(backup.extensionAbilityTypeName).assertEqual('backup');
      expect(backup.exported).assertFalse();
      expect(backup.metadata.length).assertEqual(1);
      expect(backup.metadata[0].name).assertEqual(BACKUP_METADATA);
      expect(backup.metadata[0].resource).assertEqual('$profile:backup_config');
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLECONFIG_0900
     * @tc.name      testBundleBackupProfile0001
     * @tc.desc      Read the backup profile through the bundle manager and check it parses to allowToBackupRestore true
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleBackupProfile0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const profiles: string[] =
        bundleManager.getProfileByExtensionAbilitySync(ENTRY_MODULE, BACKUP_ABILITY, BACKUP_METADATA);
      const parsed: BackupProfile = JSON.parse(profiles[0]) as BackupProfile;
      logCase('testBundleBackupProfile0001', `profiles=${profiles.length} ` +
        `allowToBackupRestore=${parsed.allowToBackupRestore}`);
      expect(profiles.length).assertEqual(1);
      expect(parsed.allowToBackupRestore).assertTrue();
      expect(Object.keys(parsed).join(',')).assertEqual('allowToBackupRestore');
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLECONFIG_1000
     * @tc.name      testBundleProfileErrors0001
     * @tc.desc      Ask for the backup profile with a wrong module, a wrong extension and a page ability and check each
     *               is reported as a missing extension
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleProfileErrors0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const codes: number[] = [
        profileErrorCode('entry_missing', BACKUP_ABILITY, BACKUP_METADATA),
        profileErrorCode(ENTRY_MODULE, 'MissingBackupAbility', BACKUP_METADATA),
        profileErrorCode(ENTRY_MODULE, ENTRY_ABILITY, BACKUP_METADATA),
        profileErrorCode(ENTRY_MODULE, BACKUP_ABILITY.toLowerCase(), BACKUP_METADATA)
      ];
      logCase('testBundleProfileErrors0001', `codes=${codes.join(',')} expected=${ERR_ABILITY_NOT_EXIST}`);
      expect(codes.join(',')).assertEqual([ERR_ABILITY_NOT_EXIST, ERR_ABILITY_NOT_EXIST, ERR_ABILITY_NOT_EXIST,
        ERR_ABILITY_NOT_EXIST].join(','));
      expect(profileErrorCode(ENTRY_MODULE, BACKUP_ABILITY, BACKUP_METADATA)).assertEqual(0);
      expect(profileErrorCode(TEST_MODULE, BACKUP_ABILITY, BACKUP_METADATA)).assertEqual(ERR_ABILITY_NOT_EXIST);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLECONFIG_1100
     * @tc.name      testBundleAbilityProfile0001
     * @tc.desc      Ask for a profile of EntryAbility, which declares no metadata, and check the no profile error is
     *               raised
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBundleAbilityProfile0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const metadataCount: number = entryAbility(await selfBundle()).metadata.length;
      const code: number = errorCode(() => {
        bundleManager.getProfileByAbilitySync(ENTRY_MODULE, ENTRY_ABILITY, BACKUP_METADATA);
      });
      logCase('testBundleAbilityProfile0001', `metadataCount=${metadataCount} code=${code} expected=${ERR_NO_PROFILE}`);
      expect(metadataCount).assertEqual(0);
      expect(code).assertEqual(ERR_NO_PROFILE);
      expect(profileErrorCode(ENTRY_MODULE, BACKUP_ABILITY, 'ohos.extension.missing')).assertEqual(ERR_NO_PROFILE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_BUNDLECONFIG_1200
     * @tc.name      testBundleModuleList0001
     * @tc.desc      Check the installed modules are entry and entry_test with the right types and the test module main
     *               element
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModuleList0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const names: string[] = info.hapModulesInfo.map((item: bundleManager.HapModuleInfo) => item.name).sort();
      const test: bundleManager.HapModuleInfo = findModule(info, TEST_MODULE);
      logCase('testBundleModuleList0001', `names=${names.join(',')} testType=${test.type} ` +
        `testMainElement=${test.mainElementName} testExtensions=${test.extensionAbilitiesInfo.length}`);
      expect(names.join(',')).assertEqual([ENTRY_MODULE, TEST_MODULE].join(','));
      expect(test.type).assertEqual(bundleManager.ModuleType.FEATURE);
      expect(test.mainElementName).assertEqual('TestAbility');
      expect(test.extensionAbilitiesInfo.length).assertEqual(0);
    });
  });
}
