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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import bundleManager from '@ohos.bundle.bundleManager';
import Logger from '../../utils/Logger';
import {
  ABILITY_NAME,
  BUNDLE,
  BUNDLE_NAME,
  MODULE_NAME,
  SuiteTag
} from '../common/TestConstant';

const TAG: string = SuiteTag.BUNDLE_INFO;

const APPLICATION_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
const MODULE_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
const ABILITY_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
const FULL_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
const SIGNATURE_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;

async function selfBundle(flags: number): Promise<bundleManager.BundleInfo> {
  return await bundleManager.getBundleInfoForSelf(flags);
}

async function entryModule(info: bundleManager.BundleInfo): Promise<bundleManager.HapModuleInfo | null> {
  for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
    if (info.hapModulesInfo[i].name === MODULE_NAME) {
      return info.hapModulesInfo[i];
    }
  }
  return null;
}

async function entryAbility(info: bundleManager.BundleInfo): Promise<bundleManager.AbilityInfo | null> {
  const hap: bundleManager.HapModuleInfo | null = await entryModule(info);
  if (hap === null || hap.abilitiesInfo.length === 0) {
    return null;
  }
  return hap.abilitiesInfo[0];
}

/**
 * Installed manifest contract of the sample. Every assertion reads the metadata
 * of the installed bundle through bundleManager, so the suite proves what was
 * packaged and installed instead of re-reading the source manifest.
 */
export default function bundleConfigTest(): void {
  describe('LottieBundleConfigTest', (): void => {
    let full: bundleManager.BundleInfo;

    beforeAll(async (): Promise<void> => {
      full = await selfBundle(FULL_FLAGS);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_0100
     * @tc.name bundleIdentity001
     * @tc.desc Verify the installed bundle name matches the sample bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'bundleIdentity_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bundleIdentity_001 begin');
      const check01: string = full.name;
      Logger.info(TAG, 'bundleIdentity_001, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(BUNDLE_NAME);
      Logger.info(TAG, 'bundleIdentity_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_0200
     * @tc.name versionMetadata002
     * @tc.desc Verify version code, version name and vendor declared in the project
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'versionMetadata_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'versionMetadata_002 begin');
      const check01: number = full.versionCode;
      Logger.info(TAG, 'versionMetadata_002, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(1000000);
      const check02: string = full.versionName;
      Logger.info(TAG, 'versionMetadata_002, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual('1.0.0');
      const check03: string = full.vendor;
      Logger.info(TAG, 'versionMetadata_002, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual('samples');
      Logger.info(TAG, 'versionMetadata_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_0300
     * @tc.name compatibilityVersions003
     * @tc.desc Verify the installed bundle reports positive compatibility versions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'compatibilityVersions_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'compatibilityVersions_003 begin');
      const check01: boolean = full.minCompatibleVersionCode > 0;
      Logger.info(TAG, 'compatibilityVersions_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = full.targetVersion > 0;
      Logger.info(TAG, 'compatibilityVersions_003, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'compatibilityVersions_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_0400
     * @tc.name appInfoLabelAndIcon004
     * @tc.desc Verify the application label and icon are declared and resolvable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'appInfoLabelAndIcon_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'appInfoLabelAndIcon_004 begin');
      const check01: boolean = full.appInfo !== undefined;
      Logger.info(TAG, 'appInfoLabelAndIcon_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (full.appInfo === undefined) {
        return;
      }
      const check02: string = full.appInfo.label;
      Logger.info(TAG, 'appInfoLabelAndIcon_004, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual('$string:app_name');
      const check03: boolean = full.appInfo.labelId > 0;
      Logger.info(TAG, 'appInfoLabelAndIcon_004, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = full.appInfo.icon.length > 0;
      Logger.info(TAG, 'appInfoLabelAndIcon_004, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const check05: boolean = full.appInfo.iconId > 0;
      Logger.info(TAG, 'appInfoLabelAndIcon_004, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      Logger.info(TAG, 'appInfoLabelAndIcon_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_0500
     * @tc.name appInfoIdentityAndState005
     * @tc.desc Verify the application name, uid and token are populated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'appInfoIdentityAndState_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'appInfoIdentityAndState_005 begin');
      const check01: boolean = full.appInfo !== undefined;
      Logger.info(TAG, 'appInfoIdentityAndState_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (full.appInfo === undefined) {
        return;
      }
      const check02: string = full.appInfo.name;
      Logger.info(TAG, 'appInfoIdentityAndState_005, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(BUNDLE_NAME);
      const check03: boolean = full.appInfo.uid > 0;
      Logger.info(TAG, 'appInfoIdentityAndState_005, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = full.appInfo.accessTokenId > 0;
      Logger.info(TAG, 'appInfoIdentityAndState_005, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const check05: boolean = full.appInfo.enabled;
      Logger.info(TAG, 'appInfoIdentityAndState_005, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      const check06: boolean = full.appInfo.systemApp;
      Logger.info(TAG, 'appInfoIdentityAndState_005, check06=' + JSON.stringify(check06));
      expect(check06).assertFalse();
      Logger.info(TAG, 'appInfoIdentityAndState_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_0600
     * @tc.name installationTimestamps006
     * @tc.desc Verify install and update timestamps are populated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'installationTimestamps_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'installationTimestamps_006 begin');
      const check01: boolean = full.installTime > 0;
      Logger.info(TAG, 'installationTimestamps_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = full.updateTime > 0;
      Logger.info(TAG, 'installationTimestamps_006, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'installationTimestamps_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_0700
     * @tc.name entryModulePresent007
     * @tc.desc Verify the installed bundle contains the entry module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'entryModulePresent_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'entryModulePresent_007 begin');
      const check01: boolean = full.hapModulesInfo.length >= 1;
      Logger.info(TAG, 'entryModulePresent_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const hap: bundleManager.HapModuleInfo | null = await entryModule(full);
      const check02: boolean = hap !== null;
      Logger.info(TAG, 'entryModulePresent_007, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'entryModulePresent_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_0800
     * @tc.name moduleMainElement008
     * @tc.desc Verify the entry module declares EntryAbility as its main element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'moduleMainElement_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'moduleMainElement_008 begin');
      const hap: bundleManager.HapModuleInfo | null = await entryModule(full);
      const check01: boolean = hap !== null;
      Logger.info(TAG, 'moduleMainElement_008, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (hap === null) {
        return;
      }
      const check02: string = hap.name;
      Logger.info(TAG, 'moduleMainElement_008, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(MODULE_NAME);
      const check03: string = hap.mainElementName;
      Logger.info(TAG, 'moduleMainElement_008, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(ABILITY_NAME);
      Logger.info(TAG, 'moduleMainElement_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_0900
     * @tc.name moduleDeviceTypes009
     * @tc.desc Verify the entry module supports the default and tablet device types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'moduleDeviceTypes_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'moduleDeviceTypes_009 begin');
      const hap: bundleManager.HapModuleInfo | null = await entryModule(full);
      const check01: boolean = hap !== null;
      Logger.info(TAG, 'moduleDeviceTypes_009, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (hap === null) {
        return;
      }
      const check02: boolean = hap.deviceTypes.indexOf('default') >= 0;
      Logger.info(TAG, 'moduleDeviceTypes_009, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = hap.deviceTypes.indexOf('tablet') >= 0;
      Logger.info(TAG, 'moduleDeviceTypes_009, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'moduleDeviceTypes_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_1000
     * @tc.name moduleTypeAndInstallMode010
     * @tc.desc Verify the entry module is an entry module that is not installation free
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'moduleTypeAndInstallMode_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'moduleTypeAndInstallMode_010 begin');
      const hap: bundleManager.HapModuleInfo | null = await entryModule(full);
      const check01: boolean = hap !== null;
      Logger.info(TAG, 'moduleTypeAndInstallMode_010, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (hap === null) {
        return;
      }
      const check02: number = hap.type;
      Logger.info(TAG, 'moduleTypeAndInstallMode_010, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(bundleManager.ModuleType.ENTRY);
      const check03: boolean = hap.installationFree;
      Logger.info(TAG, 'moduleTypeAndInstallMode_010, check03=' + JSON.stringify(check03));
      expect(check03).assertFalse();
      Logger.info(TAG, 'moduleTypeAndInstallMode_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_1100
     * @tc.name moduleDescription011
     * @tc.desc Verify the entry module description comes from the module string resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'moduleDescription_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'moduleDescription_011 begin');
      const hap: bundleManager.HapModuleInfo | null = await entryModule(full);
      const check01: boolean = hap !== null;
      Logger.info(TAG, 'moduleDescription_011, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (hap === null) {
        return;
      }
      const check02: string = hap.description;
      Logger.info(TAG, 'moduleDescription_011, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual('$string:module_desc');
      const check03: boolean = hap.descriptionId > 0;
      Logger.info(TAG, 'moduleDescription_011, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'moduleDescription_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_1200
     * @tc.name singleAbilityDeclared012
     * @tc.desc Verify the entry module declares exactly one ability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'singleAbilityDeclared_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'singleAbilityDeclared_012 begin');
      const hap: bundleManager.HapModuleInfo | null = await entryModule(full);
      const check01: boolean = hap !== null;
      Logger.info(TAG, 'singleAbilityDeclared_012, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (hap === null) {
        return;
      }
      const check02: number = hap.abilitiesInfo.length;
      Logger.info(TAG, 'singleAbilityDeclared_012, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(1);
      Logger.info(TAG, 'singleAbilityDeclared_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_1300
     * @tc.name abilityIdentityFields013
     * @tc.desc Verify the declared ability carries bundle, module and ability identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'abilityIdentityFields_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'abilityIdentityFields_013 begin');
      const ability: bundleManager.AbilityInfo | null = await entryAbility(full);
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'abilityIdentityFields_013, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      const check02: string = ability.bundleName;
      Logger.info(TAG, 'abilityIdentityFields_013, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(BUNDLE_NAME);
      const check03: string = ability.moduleName;
      Logger.info(TAG, 'abilityIdentityFields_013, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(MODULE_NAME);
      const check04: string = ability.name;
      Logger.info(TAG, 'abilityIdentityFields_013, check04=' + JSON.stringify(check04));
      expect(check04).assertEqual(ABILITY_NAME);
      Logger.info(TAG, 'abilityIdentityFields_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_1400
     * @tc.name abilityLabelAndDescription014
     * @tc.desc Verify the ability label and description come from the module string resources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'abilityLabelAndDescription_014', 0, async (): Promise<void> => {
      Logger.info(TAG, 'abilityLabelAndDescription_014 begin');
      const ability: bundleManager.AbilityInfo | null = await entryAbility(full);
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'abilityLabelAndDescription_014, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      const check02: string = ability.label;
      Logger.info(TAG, 'abilityLabelAndDescription_014, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual('$string:EntryAbility_label');
      const check03: string = ability.description;
      Logger.info(TAG, 'abilityLabelAndDescription_014, check03=' + JSON.stringify(check03));
      expect(check03.length > 0).assertTrue();
      const check04: boolean = ability.labelId > 0;
      Logger.info(TAG, 'abilityLabelAndDescription_014, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const check05: boolean = ability.descriptionId > 0;
      Logger.info(TAG, 'abilityLabelAndDescription_014, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      Logger.info(TAG, 'abilityLabelAndDescription_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_1500
     * @tc.name abilityTypeAndLaunchMode015
     * @tc.desc Verify the ability is a page ability with singleton launch mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'abilityTypeAndLaunchMode_015', 0, async (): Promise<void> => {
      Logger.info(TAG, 'abilityTypeAndLaunchMode_015 begin');
      const ability: bundleManager.AbilityInfo | null = await entryAbility(full);
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'abilityTypeAndLaunchMode_015, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      const check03: number = ability.launchType;
      Logger.info(TAG, 'abilityTypeAndLaunchMode_015, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(bundleManager.LaunchType.SINGLETON);
      const check04: number = ability.orientation;
      Logger.info(TAG, 'abilityTypeAndLaunchMode_015, check04=' + JSON.stringify(check04));
      expect(check04).assertEqual(bundleManager.DisplayOrientation.UNSPECIFIED);
      Logger.info(TAG, 'abilityTypeAndLaunchMode_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_1600
     * @tc.name abilityDeviceAndExportState016
     * @tc.desc Verify the ability is exported, enabled and supports both declared device types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'abilityDeviceAndExportState_016', 0, async (): Promise<void> => {
      Logger.info(TAG, 'abilityDeviceAndExportState_016 begin');
      const ability: bundleManager.AbilityInfo | null = await entryAbility(full);
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'abilityDeviceAndExportState_016, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      const check02: boolean = ability.exported;
      Logger.info(TAG, 'abilityDeviceAndExportState_016, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = ability.enabled;
      Logger.info(TAG, 'abilityDeviceAndExportState_016, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = ability.deviceTypes.indexOf('default') >= 0;
      Logger.info(TAG, 'abilityDeviceAndExportState_016, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const check05: boolean = ability.deviceTypes.indexOf('tablet') >= 0;
      Logger.info(TAG, 'abilityDeviceAndExportState_016, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      Logger.info(TAG, 'abilityDeviceAndExportState_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_1700
     * @tc.name abilityProcessAndIcon017
     * @tc.desc Verify the ability declares a process name, an icon and no permissions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'abilityProcessAndIcon_017', 0, async (): Promise<void> => {
      Logger.info(TAG, 'abilityProcessAndIcon_017 begin');
      const ability: bundleManager.AbilityInfo | null = await entryAbility(full);
      const check01: boolean = ability !== null;
      Logger.info(TAG, 'abilityProcessAndIcon_017, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (ability === null) {
        return;
      }
      const check03: boolean = ability.icon.length > 0;
      Logger.info(TAG, 'abilityProcessAndIcon_017, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = ability.iconId > 0;
      Logger.info(TAG, 'abilityProcessAndIcon_017, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const check05: number = ability.permissions.length;
      Logger.info(TAG, 'abilityProcessAndIcon_017, check05=' + JSON.stringify(check05));
      expect(check05).assertEqual(0);
      Logger.info(TAG, 'abilityProcessAndIcon_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_1800
     * @tc.name defaultFlagsReturnSummary018
     * @tc.desc Verify the default flags return a summary without module or application details
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'defaultFlagsReturnSummary_018', 0, async (): Promise<void> => {
      Logger.info(TAG, 'defaultFlagsReturnSummary_018 begin');
      const summary: bundleManager.BundleInfo = await selfBundle(0);
      const check01: string = summary.name;
      Logger.info(TAG, 'defaultFlagsReturnSummary_018, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(BUNDLE_NAME);
      const check02: number = summary.hapModulesInfo.length;
      Logger.info(TAG, 'defaultFlagsReturnSummary_018, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(0);
      const check03: number = summary.reqPermissionDetails.length;
      Logger.info(TAG, 'defaultFlagsReturnSummary_018, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(0);
      Logger.info(TAG, 'defaultFlagsReturnSummary_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_1900
     * @tc.name applicationFlagOnly019
     * @tc.desc Verify the application flag requests only the application detail block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'applicationFlagOnly_019', 0, async (): Promise<void> => {
      Logger.info(TAG, 'applicationFlagOnly_019 begin');
      const info: bundleManager.BundleInfo = await selfBundle(APPLICATION_FLAGS);
      const check01: boolean = info.appInfo !== undefined;
      Logger.info(TAG, 'applicationFlagOnly_019, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: number = info.hapModulesInfo.length;
      Logger.info(TAG, 'applicationFlagOnly_019, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(0);
      Logger.info(TAG, 'applicationFlagOnly_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_2000
     * @tc.name moduleFlagOnly020
     * @tc.desc Verify the module flag returns module details without the application block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'moduleFlagOnly_020', 0, async (): Promise<void> => {
      Logger.info(TAG, 'moduleFlagOnly_020 begin');
      const info: bundleManager.BundleInfo = await selfBundle(MODULE_FLAGS);
      const check01: boolean = info.hapModulesInfo.length >= 1;
      Logger.info(TAG, 'moduleFlagOnly_020, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const hap: bundleManager.HapModuleInfo | null = await entryModule(info);
      const check02: boolean = hap !== null;
      Logger.info(TAG, 'moduleFlagOnly_020, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'moduleFlagOnly_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_2100
     * @tc.name abilityFlagRequiresModule021
     * @tc.desc Verify the ability detail is returned when combined with the module flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'abilityFlagRequiresModule_021', 0, async (): Promise<void> => {
      Logger.info(TAG, 'abilityFlagRequiresModule_021 begin');
      const info: bundleManager.BundleInfo = await selfBundle(ABILITY_FLAGS);
      const check01: boolean = info.hapModulesInfo.length >= 1;
      Logger.info(TAG, 'abilityFlagRequiresModule_021, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const ability: bundleManager.AbilityInfo | null = await entryAbility(info);
      const check02: boolean = ability !== null;
      Logger.info(TAG, 'abilityFlagRequiresModule_021, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      if (ability !== null) {
        const check03: string = ability.name;
        Logger.info(TAG, 'abilityFlagRequiresModule_021, check03=' + JSON.stringify(check03));
        expect(check03).assertEqual(ABILITY_NAME);
      }
      Logger.info(TAG, 'abilityFlagRequiresModule_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_2200
     * @tc.name signatureInfoPresent022
     * @tc.desc Verify the installed bundle exposes a signature identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'signatureInfoPresent_022', 0, async (): Promise<void> => {
      Logger.info(TAG, 'signatureInfoPresent_022 begin');
      const info: bundleManager.BundleInfo = await selfBundle(SIGNATURE_FLAGS);
      const check01: boolean = info.signatureInfo.appId.length > 0;
      Logger.info(TAG, 'signatureInfoPresent_022, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = info.signatureInfo.fingerprint.length > 0;
      Logger.info(TAG, 'signatureInfoPresent_022, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'signatureInfoPresent_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_2300
     * @tc.name noRequestedPermissions023
     * @tc.desc Verify the sample requests no runtime permissions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'noRequestedPermissions_023', 0, async (): Promise<void> => {
      Logger.info(TAG, 'noRequestedPermissions_023 begin');
      const check01: number = full.reqPermissionDetails.length;
      Logger.info(TAG, 'noRequestedPermissions_023, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(0);
      const check02: number = full.permissionGrantStates.length;
      Logger.info(TAG, 'noRequestedPermissions_023, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(0);
      Logger.info(TAG, 'noRequestedPermissions_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_2400
     * @tc.name moduleListContainsEntry024
     * @tc.desc Verify the installed module list contains exactly the entry module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'moduleListContainsEntry_024', 0, async (): Promise<void> => {
      Logger.info(TAG, 'moduleListContainsEntry_024 begin');
      let entryCount: number = 0;
      for (let i: number = 0; i < full.hapModulesInfo.length; i++) {
        if (full.hapModulesInfo[i].name === MODULE_NAME) {
          entryCount++;
        }
      }
      const check01: number = entryCount;
      Logger.info(TAG, 'moduleListContainsEntry_024, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(1);
      Logger.info(TAG, 'moduleListContainsEntry_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_2500
     * @tc.name repeatedBundleQueriesAreStable025
     * @tc.desc Verify repeated manifest queries return the same identity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'repeatedBundleQueriesAreStable_025', 0, async (): Promise<void> => {
      Logger.info(TAG, 'repeatedBundleQueriesAreStable_025 begin');
      const first: bundleManager.BundleInfo = await selfBundle(FULL_FLAGS);
      const second: bundleManager.BundleInfo = await selfBundle(FULL_FLAGS);
      const check01: string = first.name;
      Logger.info(TAG, 'repeatedBundleQueriesAreStable_025, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(second.name);
      const check02: number = first.versionCode;
      Logger.info(TAG, 'repeatedBundleQueriesAreStable_025, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(second.versionCode);
      const check03: string = first.versionName;
      Logger.info(TAG, 'repeatedBundleQueriesAreStable_025, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(second.versionName);
      const check04: number = first.appInfo.uid;
      Logger.info(TAG, 'repeatedBundleQueriesAreStable_025, check04=' + JSON.stringify(check04));
      expect(check04).assertEqual(second.appInfo.uid);
      Logger.info(TAG, 'repeatedBundleQueriesAreStable_025 end');
    });
  });
}
