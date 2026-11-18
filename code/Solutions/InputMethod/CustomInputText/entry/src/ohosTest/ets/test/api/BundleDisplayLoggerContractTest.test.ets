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

import { describe, expect, it } from '@ohos/hypium';
import { yieldToEventLoop } from '../common/YieldHelper';
import bundleManager from '@ohos.bundle.bundleManager';
import display from '@ohos.display';
import common from '@ohos.app.ability.common';
import resourceManager from '@ohos.resourceManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { logger as mainLogger } from '../../../../main/ets/utils/Logger';
import { TestLogger } from '../common/TestLogger';
import {
  BUNDLE_NAME, CASE_PREFIX, ENTRY_ABILITY, TAG_API, TAG_LOGGER, TEST_MODULE
} from '../common/TestConstant';

const FLAG_APP: number = 1;
const FLAG_HAP: number = 2;
const FLAG_APP_HAP: number = 3;

/**
 * Configuration contract of the installed sample: bundleManager identity,
 * display metrics used by the caret math and the two logging facades.
 */
export default function bundleDisplayLoggerContractTest(): void {
  describe('CustomInputTextBundleDisplayLoggerContractTest', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0010
     * @tc.name bundleNameMatchesConstant001
     * @tc.desc Verify the installed bundle reports the sample bundle name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'bundleNameMatchesConstant_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'bundleNameMatchesConstant001');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.name));
      expect(info.name).assertEqual('com.samples.customtextinput');
      TestLogger.end(TAG_API, 'bundleNameMatchesConstant001');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0020
     * @tc.name bundleNameNotEmpty002
     * @tc.desc Verify the installed bundle name is a non-empty string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'bundleNameNotEmpty_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'bundleNameNotEmpty002');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', info.name);
      expect(info.name.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'bundleNameNotEmpty002');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0030
     * @tc.name bundleNameContainsSampleWord003
     * @tc.desc Verify the bundle name still contains the customtextinput segment
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'bundleNameContainsSampleWord_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'bundleNameContainsSampleWord003');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', info.name);
      expect(info.name.indexOf('customtextinput') >= 0).assertTrue();
      TestLogger.end(TAG_API, 'bundleNameContainsSampleWord003');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0040
     * @tc.name bundleVendorIsSamples004
     * @tc.desc Verify the manifest vendor survives installation as samples
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'bundleVendorIsSamples_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'bundleVendorIsSamples004');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.vendor));
      expect(info.vendor).assertEqual('samples');
      TestLogger.end(TAG_API, 'bundleVendorIsSamples004');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0050
     * @tc.name bundleVendorNotEmpty005
     * @tc.desc Verify the installed vendor string is not empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'bundleVendorNotEmpty_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'bundleVendorNotEmpty005');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', info.vendor);
      expect(info.vendor.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'bundleVendorNotEmpty005');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0060
     * @tc.name versionCodeIsManifestValue006
     * @tc.desc Verify versionCode keeps the 1000000 declared in AppScope/app.json5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'versionCodeIsManifestValue_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'versionCodeIsManifestValue006');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.versionCode));
      expect(info.versionCode).assertEqual(1000000);
      TestLogger.end(TAG_API, 'versionCodeIsManifestValue006');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0070
     * @tc.name versionCodePositive007
     * @tc.desc Verify the installed versionCode is positive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'versionCodePositive_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'versionCodePositive007');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.versionCode));
      expect(info.versionCode > 0).assertTrue();
      TestLogger.end(TAG_API, 'versionCodePositive007');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0080
     * @tc.name versionCodeFitsInt008
     * @tc.desc Verify versionCode stays within the signed 32-bit range
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'versionCodeFitsInt_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'versionCodeFitsInt008');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.versionCode <= 2147483647));
      expect(info.versionCode <= 2147483647).assertTrue();
      TestLogger.end(TAG_API, 'versionCodeFitsInt008');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0090
     * @tc.name versionNameIsManifestValue009
     * @tc.desc Verify versionName keeps the 1.0.0 declared in AppScope/app.json5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'versionNameIsManifestValue_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'versionNameIsManifestValue009');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.versionName));
      expect(info.versionName).assertEqual('1.0.0');
      TestLogger.end(TAG_API, 'versionNameIsManifestValue009');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0100
     * @tc.name versionNameNotEmpty010
     * @tc.desc Verify the installed versionName is a non-empty string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'versionNameNotEmpty_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'versionNameNotEmpty010');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', info.versionName);
      expect(info.versionName.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'versionNameNotEmpty010');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0110
     * @tc.name targetVersionPositive011
     * @tc.desc Verify the target SDK version is recorded on the installed bundle
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'targetVersionPositive_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'targetVersionPositive011');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.targetVersion));
      expect(info.targetVersion > 0).assertTrue();
      TestLogger.end(TAG_API, 'targetVersionPositive011');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0120
     * @tc.name minCompatibleVersionPositive012
     * @tc.desc Verify the minimum compatible SDK version is recorded
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'minCompatibleVersionPositive_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'minCompatibleVersionPositive012');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.minCompatibleVersionCode));
      expect(info.minCompatibleVersionCode > 0).assertTrue();
      TestLogger.end(TAG_API, 'minCompatibleVersionPositive012');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0130
     * @tc.name minCompatibleNotAboveVersionCode013
     * @tc.desc The minimum compatible version code never exceeds the bundle version code
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'minCompatibleNotAboveVersionCode_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'minCompatibleNotAboveVersionCode013');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.minCompatibleVersionCode <= info.versionCode));
      expect(info.minCompatibleVersionCode <= info.versionCode).assertTrue();
      TestLogger.end(TAG_API, 'minCompatibleNotAboveVersionCode013');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0140
     * @tc.name installTimePositive014
     * @tc.desc Verify the install timestamp is a positive epoch value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'installTimePositive_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'installTimePositive014');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.installTime));
      expect(info.installTime > 0).assertTrue();
      TestLogger.end(TAG_API, 'installTimePositive014');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0150
     * @tc.name updateTimePositive015
     * @tc.desc Verify the update timestamp is a positive epoch value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'updateTimePositive_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'updateTimePositive015');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.updateTime));
      expect(info.updateTime > 0).assertTrue();
      TestLogger.end(TAG_API, 'updateTimePositive015');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0160
     * @tc.name updateTimeNotBeforeInstall016
     * @tc.desc Verify the update timestamp is not earlier than the install timestamp
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'updateTimeNotBeforeInstall_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'updateTimeNotBeforeInstall016');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.updateTime >= info.installTime));
      expect(info.updateTime >= info.installTime).assertTrue();
      TestLogger.end(TAG_API, 'updateTimeNotBeforeInstall016');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0170
     * @tc.name signatureInfoPresent017
     * @tc.desc Verify signing information is attached to the installed bundle
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'signatureInfoPresent_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'signatureInfoPresent017');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.signatureInfo !== undefined));
      expect(info.signatureInfo !== undefined).assertTrue();
      TestLogger.end(TAG_API, 'signatureInfoPresent017');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0180
     * @tc.name signatureAppIdIsString018
     * @tc.desc Verify the signature appId is exposed as a string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'signatureAppIdIsString_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'signatureAppIdIsString018');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(129);
      TestLogger.value(TAG_API, 'observed type', typeof info.signatureInfo.appId);
      expect(typeof info.signatureInfo.appId).assertEqual('string');
      TestLogger.end(TAG_API, 'signatureAppIdIsString018');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0190
     * @tc.name permissionGrantStatesPresent019
     * @tc.desc Verify the permission grant state list is exposed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'permissionGrantStatesPresent_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'permissionGrantStatesPresent019');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.permissionGrantStates !== undefined));
      expect(info.permissionGrantStates !== undefined).assertTrue();
      TestLogger.end(TAG_API, 'permissionGrantStatesPresent019');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0200
     * @tc.name requestedPermissionsPresent020
     * @tc.desc Verify the requested permission detail list is exposed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'requestedPermissionsPresent_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'requestedPermissionsPresent020');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.reqPermissionDetails !== undefined));
      expect(info.reqPermissionDetails !== undefined).assertTrue();
      TestLogger.end(TAG_API, 'requestedPermissionsPresent020');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0210
     * @tc.name defaultFlagStillNamesBundle021
     * @tc.desc Verify the empty flag set still returns the bundle identity
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'defaultFlagStillNamesBundle_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'defaultFlagStillNamesBundle021');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(0);
      TestLogger.value(TAG_API, 'observed value', String(info.name));
      expect(info.name).assertEqual('com.samples.customtextinput');
      TestLogger.end(TAG_API, 'defaultFlagStillNamesBundle021');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0220
     * @tc.name defaultFlagVersionCodeStable022
     * @tc.desc Verify the empty flag set still reports the manifest versionCode
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'defaultFlagVersionCodeStable_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'defaultFlagVersionCodeStable022');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(0);
      TestLogger.value(TAG_API, 'observed value', String(info.versionCode));
      expect(info.versionCode).assertEqual(1000000);
      TestLogger.end(TAG_API, 'defaultFlagVersionCodeStable022');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0230
     * @tc.name withApplicationReturnsAppInfo023
     * @tc.desc Verify the application flag populates appInfo
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'withApplicationReturnsAppInfo_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'withApplicationReturnsAppInfo023');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.appInfo !== undefined));
      expect(info.appInfo !== undefined).assertTrue();
      TestLogger.end(TAG_API, 'withApplicationReturnsAppInfo023');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0240
     * @tc.name appInfoNameIsBundleName024
     * @tc.desc Verify ApplicationInfo.name repeats the bundle name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'appInfoNameIsBundleName_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoNameIsBundleName024');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.appInfo.name));
      expect(info.appInfo.name).assertEqual('com.samples.customtextinput');
      TestLogger.end(TAG_API, 'appInfoNameIsBundleName024');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0250
     * @tc.name appInfoEnabled025
     * @tc.desc Verify the sample application is enabled after installation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'appInfoEnabled_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoEnabled025');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.appInfo.enabled));
      expect(info.appInfo.enabled).assertTrue();
      TestLogger.end(TAG_API, 'appInfoEnabled025');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0260
     * @tc.name appInfoSystemAppIsBoolean026
     * @tc.desc Verify the systemApp marker is exposed as a boolean
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoSystemAppIsBoolean_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoSystemAppIsBoolean026');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed type', typeof info.appInfo.systemApp);
      expect(typeof info.appInfo.systemApp).assertEqual('boolean');
      TestLogger.end(TAG_API, 'appInfoSystemAppIsBoolean026');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0270
     * @tc.name appInfoDebugIsBoolean027
     * @tc.desc Verify the debug marker is exposed as a boolean
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoDebugIsBoolean_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoDebugIsBoolean027');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed type', typeof info.appInfo.debug);
      expect(typeof info.appInfo.debug).assertEqual('boolean');
      TestLogger.end(TAG_API, 'appInfoDebugIsBoolean027');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0280
     * @tc.name appInfoIconIdNonZero028
     * @tc.desc Verify the application icon resource id is assigned
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'appInfoIconIdNonZero_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoIconIdNonZero028');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.appInfo.iconId));
      expect(info.appInfo.iconId > 0).assertTrue();
      TestLogger.end(TAG_API, 'appInfoIconIdNonZero028');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0290
     * @tc.name appInfoLabelIdNonZero029
     * @tc.desc Verify the application label resource id is assigned
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'appInfoLabelIdNonZero_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoLabelIdNonZero029');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.appInfo.labelId));
      expect(info.appInfo.labelId > 0).assertTrue();
      TestLogger.end(TAG_API, 'appInfoLabelIdNonZero029');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0300
     * @tc.name appInfoIconNameNotEmpty030
     * @tc.desc Verify the application icon reference is a non-empty string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoIconNameNotEmpty_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoIconNameNotEmpty030');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', info.appInfo.icon);
      expect(info.appInfo.icon.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'appInfoIconNameNotEmpty030');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0310
     * @tc.name appInfoLabelNameNotEmpty031
     * @tc.desc Verify the application label reference is a non-empty string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoLabelNameNotEmpty_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoLabelNameNotEmpty031');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', info.appInfo.label);
      expect(info.appInfo.label.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'appInfoLabelNameNotEmpty031');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0320
     * @tc.name appInfoDescriptionIsString032
     * @tc.desc Verify the application description is exposed as a string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoDescriptionIsString_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoDescriptionIsString032');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed type', typeof info.appInfo.description);
      expect(typeof info.appInfo.description).assertEqual('string');
      TestLogger.end(TAG_API, 'appInfoDescriptionIsString032');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0330
     * @tc.name appInfoCodePathNotEmpty033
     * @tc.desc Verify the installed code path is recorded
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'appInfoCodePathNotEmpty_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoCodePathNotEmpty033');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', info.appInfo.codePath);
      expect(info.appInfo.codePath.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'appInfoCodePathNotEmpty033');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0340
     * @tc.name appInfoProcessNotEmpty034
     * @tc.desc Verify the application process name is recorded
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoProcessNotEmpty_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoProcessNotEmpty034');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', info.appInfo.process);
      expect(info.appInfo.process.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'appInfoProcessNotEmpty034');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0350
     * @tc.name appInfoUidPositive035
     * @tc.desc Verify the application uid is a positive integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoUidPositive_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoUidPositive035');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.appInfo.uid));
      expect(info.appInfo.uid > 0).assertTrue();
      TestLogger.end(TAG_API, 'appInfoUidPositive035');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0360
     * @tc.name appInfoAccessTokenPositive036
     * @tc.desc Verify the access token id is assigned
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoAccessTokenPositive_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoAccessTokenPositive036');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.appInfo.accessTokenId));
      expect(info.appInfo.accessTokenId > 0).assertTrue();
      TestLogger.end(TAG_API, 'appInfoAccessTokenPositive036');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0370
     * @tc.name appInfoDistributionTypeNotEmpty037
     * @tc.desc Verify the distribution type string is exposed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoDistributionTypeNotEmpty_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoDistributionTypeNotEmpty037');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', info.appInfo.appDistributionType);
      expect(info.appInfo.appDistributionType.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'appInfoDistributionTypeNotEmpty037');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0380
     * @tc.name appInfoProvisionTypeNotEmpty038
     * @tc.desc Verify the provision type string is exposed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoProvisionTypeNotEmpty_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoProvisionTypeNotEmpty038');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', info.appInfo.appProvisionType);
      expect(info.appInfo.appProvisionType.length > 0).assertTrue();
      TestLogger.end(TAG_API, 'appInfoProvisionTypeNotEmpty038');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0390
     * @tc.name appInfoPermissionsListed039
     * @tc.desc Verify the application permission list is exposed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoPermissionsListed_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoPermissionsListed039');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.appInfo.permissions !== undefined));
      expect(info.appInfo.permissions !== undefined).assertTrue();
      TestLogger.end(TAG_API, 'appInfoPermissionsListed039');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0400
     * @tc.name appInfoRemovableIsBoolean040
     * @tc.desc Verify the removable marker is exposed as a boolean
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoRemovableIsBoolean_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoRemovableIsBoolean040');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed type', typeof info.appInfo.removable);
      expect(typeof info.appInfo.removable).assertEqual('boolean');
      TestLogger.end(TAG_API, 'appInfoRemovableIsBoolean040');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0410
     * @tc.name appInfoIconResourcePresent041
     * @tc.desc Verify the icon Resource handle is exposed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoIconResourcePresent_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoIconResourcePresent041');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.appInfo.iconResource !== undefined));
      expect(info.appInfo.iconResource !== undefined).assertTrue();
      TestLogger.end(TAG_API, 'appInfoIconResourcePresent041');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0420
     * @tc.name appInfoLabelResourcePresent042
     * @tc.desc Verify the label Resource handle is exposed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoLabelResourcePresent_042', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoLabelResourcePresent042');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.appInfo.labelResource !== undefined));
      expect(info.appInfo.labelResource !== undefined).assertTrue();
      TestLogger.end(TAG_API, 'appInfoLabelResourcePresent042');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0430
     * @tc.name appInfoDescriptionResourcePresent043
     * @tc.desc Verify the description Resource handle is exposed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoDescriptionResourcePresent_043', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoDescriptionResourcePresent043');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.appInfo.descriptionResource !== undefined));
      expect(info.appInfo.descriptionResource !== undefined).assertTrue();
      TestLogger.end(TAG_API, 'appInfoDescriptionResourcePresent043');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0440
     * @tc.name appInfoProcessIsString044
     * @tc.desc Verify the application process name is exposed as a string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'appInfoProcessIsString_044', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoProcessIsString044');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed type', typeof info.appInfo.process);
      expect(typeof info.appInfo.process).assertEqual('string');
      TestLogger.end(TAG_API, 'appInfoProcessIsString044');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0450
     * @tc.name appInfoNameEqualsBundleName045
     * @tc.desc Verify ApplicationInfo.name and BundleInfo.name are the same value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'appInfoNameEqualsBundleName_045', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'appInfoNameEqualsBundleName045');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(1);
      TestLogger.value(TAG_API, 'observed value', String(info.appInfo.name === info.name));
      expect(info.appInfo.name === info.name).assertTrue();
      TestLogger.end(TAG_API, 'appInfoNameEqualsBundleName045');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0460
     * @tc.name hapModuleListPresent046
     * @tc.desc Verify the HAP module list is populated with the hap-module flag
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'hapModuleListPresent_046', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'hapModuleListPresent046');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(3);
      TestLogger.value(TAG_API, 'observed value', String(info.hapModulesInfo.length >= 1));
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      TestLogger.end(TAG_API, 'hapModuleListPresent046');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0470
     * @tc.name firstModuleNamedEntry047
     * @tc.desc Verify the first installed module is the entry module
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'firstModuleNamedEntry_047', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'firstModuleNamedEntry047');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(3);
      TestLogger.value(TAG_API, 'observed value', String(info.hapModulesInfo[0].name));
      expect(info.hapModulesInfo[0].name).assertEqual('entry');
      TestLogger.end(TAG_API, 'firstModuleNamedEntry047');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0480
     * @tc.name entryModulePresent048
     * @tc.desc Verify an entry module appears among the installed modules
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'entryModulePresent_048', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'entryModulePresent048');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(3);
      TestLogger.value(TAG_API, 'observed value', String(info.hapModulesInfo[0].name === 'entry'));
      expect(info.hapModulesInfo[0].name === 'entry').assertTrue();
      TestLogger.end(TAG_API, 'entryModulePresent048');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0490
     * @tc.name moduleDeviceTypesContainDefault049
     * @tc.desc Verify the entry module targets the default device type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moduleDeviceTypesContainDefault_049', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'moduleDeviceTypesContainDefault049');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(3);
      TestLogger.value(TAG_API, 'observed value', String(info.hapModulesInfo[0].deviceTypes.indexOf('default') >= 0));
      expect(info.hapModulesInfo[0].deviceTypes.indexOf('default') >= 0).assertTrue();
      TestLogger.end(TAG_API, 'moduleDeviceTypesContainDefault049');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0500
     * @tc.name moduleNotInstallationFree050
     * @tc.desc Verify the entry module is not installation-free
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moduleNotInstallationFree_050', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'moduleNotInstallationFree050');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(3);
      TestLogger.value(TAG_API, 'observed value', String(info.hapModulesInfo[0].installationFree));
      expect(info.hapModulesInfo[0].installationFree).assertFalse();
      TestLogger.end(TAG_API, 'moduleNotInstallationFree050');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0510
     * @tc.name moduleMainElementIsEntryAbility051
     * @tc.desc Verify the entry module main element is EntryAbility
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'moduleMainElementIsEntryAbility_051', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'moduleMainElementIsEntryAbility051');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(3);
      TestLogger.value(TAG_API, 'observed value', String(info.hapModulesInfo[0].mainElementName));
      expect(info.hapModulesInfo[0].mainElementName).assertEqual('EntryAbility');
      TestLogger.end(TAG_API, 'moduleMainElementIsEntryAbility051');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0520
     * @tc.name moduleIconIdNonZero052
     * @tc.desc Verify the module icon resource id is assigned
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moduleIconIdNonZero_052', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'moduleIconIdNonZero052');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(3);
      TestLogger.value(TAG_API, 'observed value', String(info.hapModulesInfo[0].iconId));
      expect(info.hapModulesInfo[0].iconId > 0).assertTrue();
      TestLogger.end(TAG_API, 'moduleIconIdNonZero052');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0530
     * @tc.name moduleLabelIdNonZero053
     * @tc.desc Verify the module label resource id is assigned
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moduleLabelIdNonZero_053', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'moduleLabelIdNonZero053');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(3);
      TestLogger.value(TAG_API, 'observed value', String(info.hapModulesInfo[0].labelId));
      expect(info.hapModulesInfo[0].labelId > 0).assertTrue();
      TestLogger.end(TAG_API, 'moduleLabelIdNonZero053');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0540
     * @tc.name moduleTypeIsNumber054
     * @tc.desc Verify the module type enum is exposed as a number
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moduleTypeIsNumber_054', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'moduleTypeIsNumber054');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(3);
      TestLogger.value(TAG_API, 'observed type', typeof info.hapModulesInfo[0].type);
      expect(typeof info.hapModulesInfo[0].type).assertEqual('number');
      TestLogger.end(TAG_API, 'moduleTypeIsNumber054');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0550
     * @tc.name moduleDependenciesExposed055
     * @tc.desc Verify the module dependency list is exposed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'moduleDependenciesExposed_055', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'moduleDependenciesExposed055');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(3);
      TestLogger.value(TAG_API, 'observed value', String(info.hapModulesInfo[0].dependencies !== undefined));
      expect(info.hapModulesInfo[0].dependencies !== undefined).assertTrue();
      TestLogger.end(TAG_API, 'moduleDependenciesExposed055');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0560
     * @tc.name bundleFlagApplicationValue056
     * @tc.desc Verify the SDK application bundle flag equals the value used by this suite
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'bundleFlagApplicationValue_056', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'bundleFlagApplicationValue056');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(0);
      TestLogger.value(TAG_API, 'observed value', String(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION));
      expect(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION).assertEqual(FLAG_APP);
      TestLogger.end(TAG_API, 'bundleFlagApplicationValue056');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0570
     * @tc.name bundleFlagHapValue057
     * @tc.desc Verify the SDK hap-module bundle flag equals the value used by this suite
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'bundleFlagHapValue_057', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'bundleFlagHapValue057');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(0);
      TestLogger.value(TAG_API, 'observed value', String(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE));
      expect(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE).assertEqual(FLAG_HAP);
      TestLogger.end(TAG_API, 'bundleFlagHapValue057');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0580
     * @tc.name bundleFlagCombinedValue058
     * @tc.desc Verify the combined flag equals the bitwise union of the two SDK flags
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'bundleFlagCombinedValue_058', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'bundleFlagCombinedValue058');
      let info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(0);
      TestLogger.value(TAG_API, 'observed value', String(FLAG_APP_HAP === (bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE)));
      expect(FLAG_APP_HAP === (bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE)).assertTrue();
      TestLogger.end(TAG_API, 'bundleFlagCombinedValue058');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0590
     * @tc.name twoCallsSameName059
     * @tc.desc Verify two bundle queries agree on the bundle name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'twoCallsSameName_059', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'twoCallsSameName059');
      let first: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APP_HAP);
      let second: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APP_HAP);
      TestLogger.value(TAG_API, 'first query', String(first.name));
      expect(first.name).assertEqual(second.name);
      TestLogger.end(TAG_API, 'twoCallsSameName059');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0600
     * @tc.name twoCallsSameVersionCode060
     * @tc.desc Verify two bundle queries agree on the versionCode
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'twoCallsSameVersionCode_060', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'twoCallsSameVersionCode060');
      let first: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APP_HAP);
      let second: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APP_HAP);
      TestLogger.value(TAG_API, 'first query', String(first.versionCode));
      expect(first.versionCode).assertEqual(second.versionCode);
      TestLogger.end(TAG_API, 'twoCallsSameVersionCode060');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0610
     * @tc.name twoCallsSameVersionName061
     * @tc.desc Verify two bundle queries agree on the versionName
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'twoCallsSameVersionName_061', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'twoCallsSameVersionName061');
      let first: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APP_HAP);
      let second: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APP_HAP);
      TestLogger.value(TAG_API, 'first query', String(first.versionName));
      expect(first.versionName).assertEqual(second.versionName);
      TestLogger.end(TAG_API, 'twoCallsSameVersionName061');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0620
     * @tc.name twoCallsSameTargetVersion062
     * @tc.desc Verify two bundle queries agree on the target version
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'twoCallsSameTargetVersion_062', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'twoCallsSameTargetVersion062');
      let first: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APP_HAP);
      let second: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APP_HAP);
      TestLogger.value(TAG_API, 'first query', String(first.targetVersion));
      expect(first.targetVersion).assertEqual(second.targetVersion);
      TestLogger.end(TAG_API, 'twoCallsSameTargetVersion062');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0630
     * @tc.name twoCallsSameInstallTime063
     * @tc.desc Verify two bundle queries agree on the install timestamp
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'twoCallsSameInstallTime_063', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'twoCallsSameInstallTime063');
      let first: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APP_HAP);
      let second: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APP_HAP);
      TestLogger.value(TAG_API, 'first query', String(first.installTime));
      expect(first.installTime).assertEqual(second.installTime);
      TestLogger.end(TAG_API, 'twoCallsSameInstallTime063');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0640
     * @tc.name twoCallsSameVendor064
     * @tc.desc Verify two bundle queries agree on the vendor
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'twoCallsSameVendor_064', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'twoCallsSameVendor064');
      let first: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APP_HAP);
      let second: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APP_HAP);
      TestLogger.value(TAG_API, 'first query', String(first.vendor));
      expect(first.vendor).assertEqual(second.vendor);
      TestLogger.end(TAG_API, 'twoCallsSameVendor064');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0650
     * @tc.name twoCallsSameModuleCount065
     * @tc.desc Verify two queries with the hap flag agree on the module count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'twoCallsSameModuleCount_065', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'twoCallsSameModuleCount065');
      let first: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APP_HAP);
      let second: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(FLAG_APP_HAP);
      TestLogger.value(TAG_API, 'first query', String(first.hapModulesInfo.length));
      expect(first.hapModulesInfo.length).assertEqual(second.hapModulesInfo.length);
      TestLogger.end(TAG_API, 'twoCallsSameModuleCount065');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0660
     * @tc.name syncBundleName066
     * @tc.desc Verify the synchronous query reports the sample bundle name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'syncBundleName_066', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'syncBundleName066');
      let info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(1);
      TestLogger.value(TAG_API, 'observed value', String(info.name));
      expect(info.name).assertEqual('com.samples.customtextinput');
      TestLogger.end(TAG_API, 'syncBundleName066');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0670
     * @tc.name syncVersionCode067
     * @tc.desc Verify the synchronous query reports the manifest versionCode
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'syncVersionCode_067', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'syncVersionCode067');
      let info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(1);
      TestLogger.value(TAG_API, 'observed value', String(info.versionCode));
      expect(info.versionCode).assertEqual(1000000);
      TestLogger.end(TAG_API, 'syncVersionCode067');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0680
     * @tc.name syncVersionName068
     * @tc.desc Verify the synchronous query reports the manifest versionName
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'syncVersionName_068', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'syncVersionName068');
      let info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(1);
      TestLogger.value(TAG_API, 'observed value', String(info.versionName));
      expect(info.versionName).assertEqual('1.0.0');
      TestLogger.end(TAG_API, 'syncVersionName068');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0690
     * @tc.name syncTargetVersion069
     * @tc.desc Verify the synchronous query reports a positive target version
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'syncTargetVersion_069', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'syncTargetVersion069');
      let info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(1);
      TestLogger.value(TAG_API, 'observed value', String(info.targetVersion));
      expect(info.targetVersion > 0).assertTrue();
      TestLogger.end(TAG_API, 'syncTargetVersion069');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0700
     * @tc.name syncAppInfoName070
     * @tc.desc Verify the synchronous application flag populates appInfo
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'syncAppInfoName_070', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'syncAppInfoName070');
      let info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(1);
      TestLogger.value(TAG_API, 'observed value', String(info.appInfo.name));
      expect(info.appInfo.name).assertEqual('com.samples.customtextinput');
      TestLogger.end(TAG_API, 'syncAppInfoName070');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0710
     * @tc.name syncModuleCount071
     * @tc.desc Verify the synchronous hap-module query reports at least one module
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'syncModuleCount_071', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'syncModuleCount071');
      let info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(3);
      TestLogger.value(TAG_API, 'observed value', String(info.hapModulesInfo.length >= 1));
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      TestLogger.end(TAG_API, 'syncModuleCount071');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0720
     * @tc.name syncModuleName072
     * @tc.desc Verify the synchronous module query names the entry module
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'syncModuleName_072', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'syncModuleName072');
      let info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(3);
      TestLogger.value(TAG_API, 'observed value', String(info.hapModulesInfo[0].name));
      expect(info.hapModulesInfo[0].name).assertEqual('entry');
      TestLogger.end(TAG_API, 'syncModuleName072');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0730
     * @tc.name displayWidthPositive073
     * @tc.desc Verify the default display width is positive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'displayWidthPositive_073', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'displayWidthPositive073');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.width));
      expect(metrics.width > 0).assertTrue();
      TestLogger.end(TAG_API, 'displayWidthPositive073');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0740
     * @tc.name displayHeightPositive074
     * @tc.desc Verify the default display height is positive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'displayHeightPositive_074', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'displayHeightPositive074');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.height));
      expect(metrics.height > 0).assertTrue();
      TestLogger.end(TAG_API, 'displayHeightPositive074');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0750
     * @tc.name displayWidthIsNumber075
     * @tc.desc Verify the display width is exposed as a number
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'displayWidthIsNumber_075', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'displayWidthIsNumber075');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed type', typeof metrics.width);
      expect(typeof metrics.width).assertEqual('number');
      TestLogger.end(TAG_API, 'displayWidthIsNumber075');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0760
     * @tc.name displayHeightIsNumber076
     * @tc.desc Verify the display height is exposed as a number
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'displayHeightIsNumber_076', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'displayHeightIsNumber076');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed type', typeof metrics.height);
      expect(typeof metrics.height).assertEqual('number');
      TestLogger.end(TAG_API, 'displayHeightIsNumber076');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0770
     * @tc.name displayWidthIsInteger077
     * @tc.desc Verify the display width is an integral pixel count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'displayWidthIsInteger_077', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'displayWidthIsInteger077');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(Math.floor(metrics.width) === metrics.width));
      expect(Math.floor(metrics.width) === metrics.width).assertTrue();
      TestLogger.end(TAG_API, 'displayWidthIsInteger077');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0780
     * @tc.name displayHeightIsInteger078
     * @tc.desc Verify the display height is an integral pixel count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'displayHeightIsInteger_078', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'displayHeightIsInteger078');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(Math.floor(metrics.height) === metrics.height));
      expect(Math.floor(metrics.height) === metrics.height).assertTrue();
      TestLogger.end(TAG_API, 'displayHeightIsInteger078');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0790
     * @tc.name displayWidthPlausible079
     * @tc.desc Verify the display width stays below the 10000 px sanity bound
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'displayWidthPlausible_079', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'displayWidthPlausible079');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.width <= 10000));
      expect(metrics.width <= 10000).assertTrue();
      TestLogger.end(TAG_API, 'displayWidthPlausible079');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0800
     * @tc.name displayHeightPlausible080
     * @tc.desc Verify the display height stays below the 10000 px sanity bound
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'displayHeightPlausible_080', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'displayHeightPlausible080');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.height <= 10000));
      expect(metrics.height <= 10000).assertTrue();
      TestLogger.end(TAG_API, 'displayHeightPlausible080');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0810
     * @tc.name displayPixelAreaPositive081
     * @tc.desc Verify width times height yields a positive pixel area
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'displayPixelAreaPositive_081', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'displayPixelAreaPositive081');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.width * metrics.height > 0));
      expect(metrics.width * metrics.height > 0).assertTrue();
      TestLogger.end(TAG_API, 'displayPixelAreaPositive081');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0820
     * @tc.name displayAspectAboveLowerBound082
     * @tc.desc Verify the width height ratio is above 0.1 for the board panel
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'displayAspectAboveLowerBound_082', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'displayAspectAboveLowerBound082');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.width / metrics.height > 0.1));
      expect(metrics.width / metrics.height > 0.1).assertTrue();
      TestLogger.end(TAG_API, 'displayAspectAboveLowerBound082');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0830
     * @tc.name displayAspectBelowUpperBound083
     * @tc.desc Verify the width height ratio is below 10 for the board panel
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'displayAspectBelowUpperBound_083', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'displayAspectBelowUpperBound083');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.width / metrics.height < 10));
      expect(metrics.width / metrics.height < 10).assertTrue();
      TestLogger.end(TAG_API, 'displayAspectBelowUpperBound083');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0840
     * @tc.name densityDpiPositive084
     * @tc.desc Verify the display density in dpi is positive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'densityDpiPositive_084', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'densityDpiPositive084');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.densityDPI));
      expect(metrics.densityDPI > 0).assertTrue();
      TestLogger.end(TAG_API, 'densityDpiPositive084');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0850
     * @tc.name densityDpiPlausible085
     * @tc.desc Verify the dpi stays within the supported 1000 bound
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'densityDpiPlausible_085', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'densityDpiPlausible085');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.densityDPI <= 1000));
      expect(metrics.densityDPI <= 1000).assertTrue();
      TestLogger.end(TAG_API, 'densityDpiPlausible085');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0860
     * @tc.name densityPixelsPositive086
     * @tc.desc Verify the density scale factor is positive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'densityPixelsPositive_086', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'densityPixelsPositive086');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.densityPixels));
      expect(metrics.densityPixels > 0).assertTrue();
      TestLogger.end(TAG_API, 'densityPixelsPositive086');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0870
     * @tc.name densityPixelsPlausible087
     * @tc.desc Verify the density scale factor stays below 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'densityPixelsPlausible_087', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'densityPixelsPlausible087');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.densityPixels <= 10));
      expect(metrics.densityPixels <= 10).assertTrue();
      TestLogger.end(TAG_API, 'densityPixelsPlausible087');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0880
     * @tc.name densityMatchesDpi088
     * @tc.desc Verify densityPixels equals densityDPI divided by 160 within 0.05
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'densityMatchesDpi_088', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'densityMatchesDpi088');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(Math.abs(metrics.densityPixels - metrics.densityDPI / 160) <= 0.05));
      expect(Math.abs(metrics.densityPixels - metrics.densityDPI / 160) <= 0.05).assertTrue();
      TestLogger.end(TAG_API, 'densityMatchesDpi088');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0890
     * @tc.name scaledDensityPositive089
     * @tc.desc Verify the scaled density factor is positive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'scaledDensityPositive_089', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'scaledDensityPositive089');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.scaledDensity));
      expect(metrics.scaledDensity > 0).assertTrue();
      TestLogger.end(TAG_API, 'scaledDensityPositive089');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0900
     * @tc.name scaledDensityNotBelowBase090
     * @tc.desc Verify the scaled density is not below the base density
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'scaledDensityNotBelowBase_090', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'scaledDensityNotBelowBase090');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.scaledDensity >= metrics.densityPixels - 0.05));
      expect(metrics.scaledDensity >= metrics.densityPixels - 0.05).assertTrue();
      TestLogger.end(TAG_API, 'scaledDensityNotBelowBase090');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0910
     * @tc.name rotationInRange091
     * @tc.desc Verify the display rotation falls in the 0 to 3 quarter-turn range
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'rotationInRange_091', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'rotationInRange091');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.rotation));
      expect(metrics.rotation >= 0 && metrics.rotation <= 3).assertTrue();
      TestLogger.end(TAG_API, 'rotationInRange091');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0920
     * @tc.name orientationInRange092
     * @tc.desc Verify the orientation enum value is within the documented range
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'orientationInRange_092', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'orientationInRange092');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.orientation));
      expect(metrics.orientation >= 0 && metrics.orientation <= 5).assertTrue();
      TestLogger.end(TAG_API, 'orientationInRange092');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0930
     * @tc.name stateInRange093
     * @tc.desc Verify the display state enum value is within the documented range
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'stateInRange_093', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'stateInRange093');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.state));
      expect(metrics.state >= 0 && metrics.state <= 3).assertTrue();
      TestLogger.end(TAG_API, 'stateInRange093');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CONFIG_0940
     * @tc.name displayIdNonNegative094
     * @tc.desc Verify the display id is a non-negative integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'displayIdNonNegative_094', 0, async (done: Function) => {
      TestLogger.begin(TAG_API, 'displayIdNonNegative094');
      let metrics: display.Display = display.getDefaultDisplaySync();
      TestLogger.value(TAG_API, 'observed value', String(metrics.id));
      expect(metrics.id >= 0).assertTrue();
      TestLogger.end(TAG_API, 'displayIdNonNegative094');
      await yieldToEventLoop();
      done();
    });

  });
}
