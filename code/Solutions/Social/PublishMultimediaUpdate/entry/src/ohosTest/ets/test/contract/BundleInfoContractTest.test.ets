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
import { yieldToEventLoop } from '../common/TestYield';
import bundleManager from '@ohos.bundle.bundleManager';
import Logger from '../Logger';
import { ABILITY_NAME, BUNDLE, BUNDLE_NAME, ENTRY_MAIN_ELEMENT, MODULE_NAME, TAG } from '../common/TestConstant';
const FULL_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
/**
 * Installed manifest contract.
 * All assertions read the installed bundle, so a manifest that never reached
 * the device is reported here instead of as a mystery UI failure later.
 */
export default function bundleInfoContractTest() {
  describe('BundleInfoContractTest', () => {
    let full: bundleManager.BundleInfo;
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      full = await bundleManager.getBundleInfoForSelf(FULL_FLAGS);
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_0100
     * @tc.name BundleNameMatches001
     * @tc.desc Verify bundle name matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BundleNameMatches_001', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'BundleNameMatches_001 begin');
      expect(full.name).assertEqual(BUNDLE_NAME);
      Logger.info(TAG, 'BundleNameMatches_001 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_0200
     * @tc.name VersionNameIsOneZero002
     * @tc.desc Verify version name is one zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VersionNameIsOneZero_002', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'VersionNameIsOneZero_002 begin');
      expect(full.versionName).assertEqual('1.0.0');
      Logger.info(TAG, 'VersionNameIsOneZero_002 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_0300
     * @tc.name VersionCodeIsOneMillion003
     * @tc.desc Verify version code is one million
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VersionCodeIsOneMillion_003', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'VersionCodeIsOneMillion_003 begin');
      expect(full.versionCode).assertEqual(1000000);
      Logger.info(TAG, 'VersionCodeIsOneMillion_003 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_0400
     * @tc.name VendorRecorded004
     * @tc.desc Verify vendor recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VendorRecorded_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'VendorRecorded_004 begin');
      const present: boolean = full.vendor.length !== 0;
      Logger.info(TAG, 'present=' + JSON.stringify(present));
      expect(present).assertTrue();
      Logger.info(TAG, 'VendorRecorded_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_0500
     * @tc.name InstallTimeRecorded005
     * @tc.desc Verify install time recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'InstallTimeRecorded_005', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'InstallTimeRecorded_005 begin');
      const installed: boolean = full.installTime !== 0;
      Logger.info(TAG, 'installed=' + JSON.stringify(installed));
      expect(installed).assertTrue();
      Logger.info(TAG, 'InstallTimeRecorded_005 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_0600
     * @tc.name UpdateTimeRecorded006
     * @tc.desc Verify update time recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UpdateTimeRecorded_006', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'UpdateTimeRecorded_006 begin');
      const updated: boolean = full.updateTime !== 0;
      Logger.info(TAG, 'updated=' + JSON.stringify(updated));
      expect(updated).assertTrue();
      Logger.info(TAG, 'UpdateTimeRecorded_006 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_0700
     * @tc.name MinCompatibleRecorded007
     * @tc.desc Verify min compatible recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MinCompatibleRecorded_007', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'MinCompatibleRecorded_007 begin');
      const declared: boolean = full.minCompatibleVersionCode !== 0;
      Logger.info(TAG, 'declared=' + JSON.stringify(declared));
      expect(declared).assertTrue();
      Logger.info(TAG, 'MinCompatibleRecorded_007 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_0800
     * @tc.name TargetVersionRecorded008
     * @tc.desc Verify target version recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TargetVersionRecorded_008', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'TargetVersionRecorded_008 begin');
      const declared: boolean = full.targetVersion !== 0;
      Logger.info(TAG, 'declared=' + JSON.stringify(declared));
      expect(declared).assertTrue();
      Logger.info(TAG, 'TargetVersionRecorded_008 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_0900
     * @tc.name EntryModuleInstalled009
     * @tc.desc Verify entry module installed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EntryModuleInstalled_009', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EntryModuleInstalled_009 begin');
      let found: boolean = false;
      for (let index: number = 0; index < full.hapModulesInfo.length; index++) {
        if (full.hapModulesInfo[index].name === MODULE_NAME) {
          found = true;
        }
      }
      expect(found).assertTrue();
      Logger.info(TAG, 'EntryModuleInstalled_009 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_1000
     * @tc.name EntryModuleTypeIsEntry010
     * @tc.desc Verify entry module type is entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EntryModuleTypeIsEntry_010', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EntryModuleTypeIsEntry_010 begin');
      let type: bundleManager.ModuleType = bundleManager.ModuleType.FEATURE;
      for (let index: number = 0; index < full.hapModulesInfo.length; index++) {
        if (full.hapModulesInfo[index].name === MODULE_NAME) {
          type = full.hapModulesInfo[index].type;
        }
      }
      expect(type).assertEqual(bundleManager.ModuleType.ENTRY);
      Logger.info(TAG, 'EntryModuleTypeIsEntry_010 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_1100
     * @tc.name MainElementIsEntryAbility011
     * @tc.desc Verify main element is entry ability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MainElementIsEntryAbility_011', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'MainElementIsEntryAbility_011 begin');
      let mainElement: string = '';
      for (let index: number = 0; index < full.hapModulesInfo.length; index++) {
        if (full.hapModulesInfo[index].name === MODULE_NAME) {
          mainElement = full.hapModulesInfo[index].mainElementName;
        }
      }
      expect(mainElement).assertEqual(ENTRY_MAIN_ELEMENT);
      Logger.info(TAG, 'MainElementIsEntryAbility_011 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_1200
     * @tc.name EntryDeviceTypesDeclared012
     * @tc.desc Verify entry device types declared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EntryDeviceTypesDeclared_012', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EntryDeviceTypesDeclared_012 begin');
      let declared: boolean = false;
      for (let index: number = 0; index < full.hapModulesInfo.length; index++) {
        if (full.hapModulesInfo[index].name === MODULE_NAME) {
          const types: Array<string> = full.hapModulesInfo[index].deviceTypes;
          if (types.indexOf('default') !== -1) {
            declared = true;
          }
        }
      }
      expect(declared).assertTrue();
      Logger.info(TAG, 'EntryDeviceTypesDeclared_012 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_1300
     * @tc.name EntryNotInstallationFree013
     * @tc.desc Verify entry not installation free
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EntryNotInstallationFree_013', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EntryNotInstallationFree_013 begin');
      let installationFree: boolean = true;
      for (let index: number = 0; index < full.hapModulesInfo.length; index++) {
        if (full.hapModulesInfo[index].name === MODULE_NAME) {
          installationFree = full.hapModulesInfo[index].installationFree;
        }
      }
      expect(installationFree).assertFalse();
      Logger.info(TAG, 'EntryNotInstallationFree_013 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_1400
     * @tc.name EntryAbilityDeclared014
     * @tc.desc Verify entry ability declared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EntryAbilityDeclared_014', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EntryAbilityDeclared_014 begin');
      let found: boolean = false;
      for (let index: number = 0; index < full.hapModulesInfo.length; index++) {
        if (full.hapModulesInfo[index].name === MODULE_NAME) {
          const abilities: Array<bundleManager.AbilityInfo> = full.hapModulesInfo[index].abilitiesInfo;
          for (let inner: number = 0; inner < abilities.length; inner++) {
            if (abilities[inner].name === ABILITY_NAME) {
              found = true;
            }
          }
        }
      }
      expect(found).assertTrue();
      Logger.info(TAG, 'EntryAbilityDeclared_014 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_1500
     * @tc.name EntryAbilityIsEnabled015
     * @tc.desc Verify entry ability is enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EntryAbilityIsEnabled_015', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EntryAbilityIsEnabled_015 begin');
      let enabled: boolean = false;
      for (let index: number = 0; index < full.hapModulesInfo.length; index++) {
        if (full.hapModulesInfo[index].name === MODULE_NAME) {
          const abilities: Array<bundleManager.AbilityInfo> = full.hapModulesInfo[index].abilitiesInfo;
          for (let inner: number = 0; inner < abilities.length; inner++) {
            if (abilities[inner].name === ABILITY_NAME) {
              enabled = abilities[inner].enabled;
            }
          }
        }
      }
      expect(enabled).assertTrue();
      Logger.info(TAG, 'EntryAbilityIsEnabled_015 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_1600
     * @tc.name EntryAbilityBundleMatches016
     * @tc.desc Verify entry ability bundle matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EntryAbilityBundleMatches_016', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EntryAbilityBundleMatches_016 begin');
      let bundleOfAbility: string = '';
      for (let index: number = 0; index < full.hapModulesInfo.length; index++) {
        if (full.hapModulesInfo[index].name === MODULE_NAME) {
          const abilities: Array<bundleManager.AbilityInfo> = full.hapModulesInfo[index].abilitiesInfo;
          for (let inner: number = 0; inner < abilities.length; inner++) {
            if (abilities[inner].name === ABILITY_NAME) {
              bundleOfAbility = abilities[inner].bundleName;
            }
          }
        }
      }
      expect(bundleOfAbility).assertEqual(BUNDLE_NAME);
      Logger.info(TAG, 'EntryAbilityBundleMatches_016 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_1700
     * @tc.name EntryAbilityModuleMatches017
     * @tc.desc Verify entry ability module matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EntryAbilityModuleMatches_017', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EntryAbilityModuleMatches_017 begin');
      let moduleOfAbility: string = '';
      for (let index: number = 0; index < full.hapModulesInfo.length; index++) {
        if (full.hapModulesInfo[index].name === MODULE_NAME) {
          const abilities: Array<bundleManager.AbilityInfo> = full.hapModulesInfo[index].abilitiesInfo;
          for (let inner: number = 0; inner < abilities.length; inner++) {
            if (abilities[inner].name === ABILITY_NAME) {
              moduleOfAbility = abilities[inner].moduleName;
            }
          }
        }
      }
      expect(moduleOfAbility).assertEqual(MODULE_NAME);
      Logger.info(TAG, 'EntryAbilityModuleMatches_017 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_1800
     * @tc.name AppInfoPresent018
     * @tc.desc Verify app info present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AppInfoPresent_018', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AppInfoPresent_018 begin');
      const present: boolean = full.appInfo !== undefined;
      Logger.info(TAG, 'present=' + JSON.stringify(present));
      expect(present).assertTrue();
      Logger.info(TAG, 'AppInfoPresent_018 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_1900
     * @tc.name NameQueryMatchesSelf019
     * @tc.desc Verify the named query reports the same version as the self query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NameQueryMatchesSelf_019', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'NameQueryMatchesSelf_019 begin');
      const byName: bundleManager.BundleInfo = await bundleManager.getBundleInfo(BUNDLE_NAME, bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
      const bySelf: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
      expect(byName.versionCode).assertEqual(bySelf.versionCode);
      Logger.info(TAG, 'NameQueryMatchesSelf_019 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_2000
     * @tc.name UnknownBundleRejects020
     * @tc.desc Verify a query for an unknown bundle is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnknownBundleRejects_020', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'UnknownBundleRejects_020 begin');
      let rejected: boolean = false;
      try {
        await bundleManager.getBundleInfo('com.samples.not.installed', bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
      }
      catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      Logger.info(TAG, 'UnknownBundleRejects_020 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_2100
     * @tc.name AppUidPositive021
     * @tc.desc Verify the application uid is a positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AppUidPositive_021', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AppUidPositive_021 begin');
      expect(full.appInfo.uid !== 0).assertTrue();
      Logger.info(TAG, 'AppUidPositive_021 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_2200
     * @tc.name DistributionTypePresent022
     * @tc.desc Verify the distribution type of the installed package is reported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DistributionTypePresent_022', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DistributionTypePresent_022 begin');
      expect(full.appInfo.appDistributionType.length !== 0).assertTrue();
      Logger.info(TAG, 'DistributionTypePresent_022 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_2300
     * @tc.name NoApplicationPermissions023
     * @tc.desc Verify the application declares no install time permission list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NoApplicationPermissions_023', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'NoApplicationPermissions_023 begin');
      expect(full.appInfo.permissions.length).assertEqual(0);
      Logger.info(TAG, 'NoApplicationPermissions_023 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_2400
     * @tc.name AbilityLaunchTypeKnown024
     * @tc.desc Verify the entry ability launch mode is one of the documented values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AbilityLaunchTypeKnown_024', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AbilityLaunchTypeKnown_024 begin');
      let launchType: number = -1;
      for (let outer: number = 0; outer < full.hapModulesInfo.length; outer++) {
        if (full.hapModulesInfo[outer].name === MODULE_NAME) {
          const abilities: Array<bundleManager.AbilityInfo> = full.hapModulesInfo[outer].abilitiesInfo;
          for (let inner: number = 0; inner < abilities.length; inner++) {
            if (abilities[inner].name === ABILITY_NAME) {
              launchType = abilities[inner].launchType;
            }
          }
        }
      }
      const known: boolean = launchType === 0 || launchType === 1 || launchType === 2;
      expect(known).assertTrue();
      Logger.info(TAG, 'AbilityLaunchTypeKnown_024 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUNDLE_2500
     * @tc.name AbilityEnabled025
     * @tc.desc Verify the entry ability record is enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AbilityEnabled_025', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AbilityEnabled_025 begin');
      let enabled: boolean = false;
      for (let outer: number = 0; outer < full.hapModulesInfo.length; outer++) {
        if (full.hapModulesInfo[outer].name === MODULE_NAME) {
          const abilities: Array<bundleManager.AbilityInfo> = full.hapModulesInfo[outer].abilitiesInfo;
          for (let inner: number = 0; inner < abilities.length; inner++) {
            if (abilities[inner].name === ABILITY_NAME) {
              enabled = abilities[inner].enabled;
            }
          }
        }
      }
      expect(enabled).assertTrue();
      Logger.info(TAG, 'AbilityEnabled_025 end');
      done();
    });
  });
}
