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


import { describe, it, expect } from '@ohos/hypium';
import bundleManager from '@ohos.bundle.bundleManager';
import Logger from '../../utils/Logger';
import { BUNDLE, SuiteTag } from '../common/TestConstant';

const TAG: string = SuiteTag.BUNDLE_INFO;

const FULL_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;

async function fullInfo(): Promise<bundleManager.BundleInfo> {
  return await bundleManager.getBundleInfoForSelf(FULL_FLAGS);
}

export default function bundleExtraTest(): void {
  describe('BundleExtraTest', (): void => {

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_0100
     * @tc.name bundleAppId001
     * @tc.desc Verify the installed bundle exposes a non empty application id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bundleAppId_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bundleAppId_001 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      Logger.info(TAG, 'bundleAppId_001, check01=' + JSON.stringify(info.signatureInfo.appId.length > 0));
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      Logger.info(TAG, 'bundleAppId_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_0200
     * @tc.name bundleFingerprint002
     * @tc.desc Verify the installed bundle exposes a non empty fingerprint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bundleFingerprint_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bundleFingerprint_002 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      Logger.info(TAG, 'bundleFingerprint_002, check01=' + JSON.stringify(info.signatureInfo.fingerprint.length > 0));
      expect(info.signatureInfo.fingerprint.length > 0).assertTrue();
      Logger.info(TAG, 'bundleFingerprint_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_0300
     * @tc.name bundleNoPermissionDetails003
     * @tc.desc Verify the sample declares no requested permission details
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bundleNoPermissionDetails_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bundleNoPermissionDetails_003 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      Logger.info(TAG, 'bundleNoPermissionDetails_003, check01=' + JSON.stringify(info.reqPermissionDetails.length));
      expect(info.reqPermissionDetails.length).assertEqual(0);
      Logger.info(TAG, 'bundleNoPermissionDetails_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_0400
     * @tc.name bundleNoPermissionGrants004
     * @tc.desc Verify the sample has no permission grant states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bundleNoPermissionGrants_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bundleNoPermissionGrants_004 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      Logger.info(TAG, 'bundleNoPermissionGrants_004, check01=' + JSON.stringify(info.permissionGrantStates.length));
      expect(info.permissionGrantStates.length).assertEqual(0);
      Logger.info(TAG, 'bundleNoPermissionGrants_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_0500
     * @tc.name appEnabled005
     * @tc.desc Verify the installed application is enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'appEnabled_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'appEnabled_005 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const app: bundleManager.ApplicationInfo = info.appInfo;
      Logger.info(TAG, 'appEnabled_005, check01=' + JSON.stringify(app.enabled));
      expect(app.enabled).assertTrue();
      Logger.info(TAG, 'appEnabled_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_0600
     * @tc.name appAccessTokenId006
     * @tc.desc Verify the application carries a positive access token id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'appAccessTokenId_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'appAccessTokenId_006 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const app: bundleManager.ApplicationInfo = info.appInfo;
      Logger.info(TAG, 'appAccessTokenId_006, check01=' + JSON.stringify(app.accessTokenId > 0));
      expect(app.accessTokenId > 0).assertTrue();
      Logger.info(TAG, 'appAccessTokenId_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_0700
     * @tc.name appCodePath007
     * @tc.desc Verify the application reports a non empty code path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'appCodePath_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'appCodePath_007 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const app: bundleManager.ApplicationInfo = info.appInfo;
      Logger.info(TAG, 'appCodePath_007, check01=' + JSON.stringify(app.codePath.length > 0));
      expect(app.codePath.length > 0).assertTrue();
      Logger.info(TAG, 'appCodePath_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_0800
     * @tc.name appNoPermissions008
     * @tc.desc Verify the application requests no permissions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'appNoPermissions_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'appNoPermissions_008 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const app: bundleManager.ApplicationInfo = info.appInfo;
      Logger.info(TAG, 'appNoPermissions_008, check01=' + JSON.stringify(app.permissions.length));
      expect(app.permissions.length).assertEqual(0);
      Logger.info(TAG, 'appNoPermissions_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_0900
     * @tc.name appLabelId009
     * @tc.desc Verify the application label resource id is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'appLabelId_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'appLabelId_009 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const app: bundleManager.ApplicationInfo = info.appInfo;
      Logger.info(TAG, 'appLabelId_009, check01=' + JSON.stringify(app.labelId > 0));
      expect(app.labelId > 0).assertTrue();
      Logger.info(TAG, 'appLabelId_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_1000
     * @tc.name appIconId010
     * @tc.desc Verify the application icon resource id is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'appIconId_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'appIconId_010 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const app: bundleManager.ApplicationInfo = info.appInfo;
      Logger.info(TAG, 'appIconId_010, check01=' + JSON.stringify(app.iconId > 0));
      expect(app.iconId > 0).assertTrue();
      Logger.info(TAG, 'appIconId_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_1100
     * @tc.name appProcessName011
     * @tc.desc Verify the application process name is non empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'appProcessName_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'appProcessName_011 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const app: bundleManager.ApplicationInfo = info.appInfo;
      Logger.info(TAG, 'appProcessName_011, check01=' + JSON.stringify(app.process.length > 0));
      expect(app.process.length > 0).assertTrue();
      Logger.info(TAG, 'appProcessName_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_1200
     * @tc.name moduleIconId012
     * @tc.desc Verify the entry module icon resource id is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'moduleIconId_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'moduleIconId_012 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      Logger.info(TAG, 'moduleIconId_012, check01=' + JSON.stringify(module.iconId > 0));
      expect(module.iconId > 0).assertTrue();
      Logger.info(TAG, 'moduleIconId_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_1300
     * @tc.name moduleLabelId013
     * @tc.desc Verify the entry module label resource id is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'moduleLabelId_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'moduleLabelId_013 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      Logger.info(TAG, 'moduleLabelId_013, check01=' + JSON.stringify(module.labelId > 0));
      expect(module.labelId > 0).assertTrue();
      Logger.info(TAG, 'moduleLabelId_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_1400
     * @tc.name moduleDescriptionId014
     * @tc.desc Verify the entry module description resource id is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'moduleDescriptionId_014', 0, async (): Promise<void> => {
      Logger.info(TAG, 'moduleDescriptionId_014 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      Logger.info(TAG, 'moduleDescriptionId_014, check01=' + JSON.stringify(module.descriptionId > 0));
      expect(module.descriptionId > 0).assertTrue();
      Logger.info(TAG, 'moduleDescriptionId_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_1500
     * @tc.name moduleNoMetadata015
     * @tc.desc Verify the entry module declares no metadata block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'moduleNoMetadata_015', 0, async (): Promise<void> => {
      Logger.info(TAG, 'moduleNoMetadata_015 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      Logger.info(TAG, 'moduleNoMetadata_015, check01=' + JSON.stringify(module.metadata.length));
      expect(module.metadata.length).assertEqual(0);
      Logger.info(TAG, 'moduleNoMetadata_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_1600
     * @tc.name moduleNoExtensions016
     * @tc.desc Verify the entry module declares no extension abilities
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'moduleNoExtensions_016', 0, async (): Promise<void> => {
      Logger.info(TAG, 'moduleNoExtensions_016 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      Logger.info(TAG, 'moduleNoExtensions_016, check01=' + JSON.stringify(module.extensionAbilitiesInfo.length));
      expect(module.extensionAbilitiesInfo.length).assertEqual(0);
      Logger.info(TAG, 'moduleNoExtensions_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_1700
     * @tc.name moduleNoDependencies017
     * @tc.desc Verify the entry module declares no dependencies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'moduleNoDependencies_017', 0, async (): Promise<void> => {
      Logger.info(TAG, 'moduleNoDependencies_017 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      Logger.info(TAG, 'moduleNoDependencies_017, check01=' + JSON.stringify(module.dependencies.length));
      expect(module.dependencies.length).assertEqual(0);
      Logger.info(TAG, 'moduleNoDependencies_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_1800
     * @tc.name moduleNoPreloads018
     * @tc.desc Verify the entry module declares no preloaded modules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'moduleNoPreloads_018', 0, async (): Promise<void> => {
      Logger.info(TAG, 'moduleNoPreloads_018 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      Logger.info(TAG, 'moduleNoPreloads_018, check01=' + JSON.stringify(module.preloads.length));
      expect(module.preloads.length).assertEqual(0);
      Logger.info(TAG, 'moduleNoPreloads_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_1900
     * @tc.name moduleNameMatches019
     * @tc.desc Verify the entry module name matches the manifest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'moduleNameMatches_019', 0, async (): Promise<void> => {
      Logger.info(TAG, 'moduleNameMatches_019 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      Logger.info(TAG, 'moduleNameMatches_019, check01=' + JSON.stringify(module.name));
      expect(module.name).assertEqual('entry');
      Logger.info(TAG, 'moduleNameMatches_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUNDLE_EXTRA_2000
     * @tc.name abilityNoMetadata020
     * @tc.desc Verify the entry ability declares no metadata block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'abilityNoMetadata_020', 0, async (): Promise<void> => {
      Logger.info(TAG, 'abilityNoMetadata_020 begin');
      const info: bundleManager.BundleInfo = await fullInfo();
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      const ability: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      Logger.info(TAG, 'abilityNoMetadata_020, check01=' + JSON.stringify(ability.metadata.length));
      expect(ability.metadata.length).assertEqual(0);
      Logger.info(TAG, 'abilityNoMetadata_020 end');
    });

  });
}
