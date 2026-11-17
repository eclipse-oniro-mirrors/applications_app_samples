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
import { Driver } from '@ohos.UiTest';
import resourceManager from '@ohos.resourceManager';
import i18n from '@ohos.i18n';
import Logger from '../../utils/Logger';
import {
  APP_STRING_NAMES,
  expectedAppString,
  expectedTestString,
  menuExpectation
} from '../common/ResourceExpectation';
import {
  BUNDLE,
  BUNDLE_NAME,
  MODULE_NAME,
  SETTLE_PAGE,
  SuiteTag,
  UiText
} from '../common/TestConstant';
import {
  createDriver,
  ensureAppVisible,
  getAppResourceManager,
  getAppStringByName,
  getTestResourceManager,
  launchApp,
  sleep,
  waitForText
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.RESOURCE;

const KNOWN_DENSITIES: Array<number> = [120, 160, 240, 320, 480, 640];

async function rejectOfStringByName(rm: resourceManager.ResourceManager, name: string): Promise<boolean> {
  try {
    await getAppStringByName(rm, name);
    return false;
  } catch (error) {
    return true;
  }
}

/**
 * String resource contract. The application string table is validated through
 * the ability resource manager so the assertions cover the values that the
 * installed application actually renders, not a test side copy.
 */
export default function resourceStringTest(): void {
  describe('LottieResourceStringTest', (): void => {
    let driver: Driver;
    let appRm: resourceManager.ResourceManager | null = null;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
      appRm = await getAppResourceManager();
      if (appRm === null) {
        await launchApp();
        await sleep(SETTLE_PAGE);
        appRm = await getAppResourceManager();
      }
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RESOURCE_0100
     * @tc.name applicationStringsMatchExpected001
     * @tc.desc Verify every application string resolves to its expected Chinese value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'applicationStringsMatchExpected_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'applicationStringsMatchExpected_001 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'applicationStringsMatchExpected_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      const mismatches: Array<string> = [];
      for (let i: number = 0; i < APP_STRING_NAMES.length; i++) {
        const name: string = APP_STRING_NAMES[i];
        const value: string = await getAppStringByName(appRm, name);
        const expected: string = expectedAppString(name);
        if (value !== expected) {
          mismatches.push(name + '=' + value);
        }
      }
      Logger.info(TAG, 'applicationStringsMatchExpected_001 mismatches=' + mismatches.join(','));
      const check02: number = mismatches.length;
      Logger.info(TAG, 'applicationStringsMatchExpected_001, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(0);
      Logger.info(TAG, 'applicationStringsMatchExpected_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RESOURCE_0200
     * @tc.name syncAndAsyncReadsAgree002
     * @tc.desc Verify the synchronous and asynchronous by-name reads return identical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'syncAndAsyncReadsAgree_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'syncAndAsyncReadsAgree_002 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'syncAndAsyncReadsAgree_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      const mismatches: Array<string> = [];
      for (let i: number = 0; i < APP_STRING_NAMES.length; i++) {
        const name: string = APP_STRING_NAMES[i];
        const asyncValue: string = await getAppStringByName(appRm, name);
        const syncValue: string = appRm.getStringByNameSync(name);
        if (asyncValue !== syncValue) {
          mismatches.push(name);
        }
      }
      const check02: number = mismatches.length;
      Logger.info(TAG, 'syncAndAsyncReadsAgree_002, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(0);
      Logger.info(TAG, 'syncAndAsyncReadsAgree_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RESOURCE_0300
     * @tc.name repeatedReadsAreStable003
     * @tc.desc Verify repeated reads of each application string return a stable value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'repeatedReadsAreStable_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'repeatedReadsAreStable_003 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'repeatedReadsAreStable_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      const unstable: Array<string> = [];
      for (let i: number = 0; i < APP_STRING_NAMES.length; i++) {
        const name: string = APP_STRING_NAMES[i];
        const first: string = await getAppStringByName(appRm, name);
        const second: string = await getAppStringByName(appRm, name);
        if (first !== second) {
          unstable.push(name);
        }
      }
      const check02: number = unstable.length;
      Logger.info(TAG, 'repeatedReadsAreStable_003, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(0);
      Logger.info(TAG, 'repeatedReadsAreStable_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RESOURCE_0400
     * @tc.name menuStringsFollowLocale004
     * @tc.desc Verify the three selector entries resolve according to the device language
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'menuStringsFollowLocale_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'menuStringsFollowLocale_004 begin');
      const language: string = i18n.System.getSystemLanguage();
      const testRm: resourceManager.ResourceManager = getTestResourceManager();
      const grunt: string = await testRm.getStringValue($r('app.string.grunt'));
      const year: string = await testRm.getStringValue($r('app.string.year'));
      const threeSpeed: string = await testRm.getStringValue($r('app.string.three_speed'));
      const check01: string = grunt;
      Logger.info(TAG, 'menuStringsFollowLocale_004, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(menuExpectation('grunt', language));
      const check02: string = year;
      Logger.info(TAG, 'menuStringsFollowLocale_004, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(menuExpectation('year', language));
      const check03: string = threeSpeed;
      Logger.info(TAG, 'menuStringsFollowLocale_004, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(menuExpectation('three_speed', language));
      Logger.info(TAG, 'menuStringsFollowLocale_004 end, language=' + language);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RESOURCE_0500
     * @tc.name testAbilityStringsPresent005
     * @tc.desc Verify the test ability string resources resolve to their declared values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'testAbilityStringsPresent_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'testAbilityStringsPresent_005 begin');
      const testRm: resourceManager.ResourceManager = getTestResourceManager();
      const moduleDesc: string = await testRm.getStringValue($r('app.string.module_test_desc'));
      const abilityDesc: string = await testRm.getStringValue($r('app.string.TestAbility_desc'));
      const abilityLabel: string = await testRm.getStringValue($r('app.string.TestAbility_label'));
      const check01: string = moduleDesc;
      Logger.info(TAG, 'testAbilityStringsPresent_005, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(expectedTestString('module_test_desc'));
      const check02: string = abilityDesc;
      Logger.info(TAG, 'testAbilityStringsPresent_005, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(expectedTestString('TestAbility_desc'));
      const check03: string = abilityLabel;
      Logger.info(TAG, 'testAbilityStringsPresent_005, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(expectedTestString('TestAbility_label'));
      Logger.info(TAG, 'testAbilityStringsPresent_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RESOURCE_0600
     * @tc.name missingStringByNameRejected006
     * @tc.desc Verify reading an unknown string name is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'missingStringByNameRejected_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'missingStringByNameRejected_006 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'missingStringByNameRejected_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      const rejected: boolean = await rejectOfStringByName(appRm, 'lottie_missing_resource_key');
      const check02: boolean = rejected;
      Logger.info(TAG, 'missingStringByNameRejected_006, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'missingStringByNameRejected_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RESOURCE_0700
     * @tc.name emptyStringNameRejected007
     * @tc.desc Verify reading an empty string name is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'emptyStringNameRejected_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'emptyStringNameRejected_007 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'emptyStringNameRejected_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      const rejected: boolean = await rejectOfStringByName(appRm, '');
      const check02: boolean = rejected;
      Logger.info(TAG, 'emptyStringNameRejected_007, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'emptyStringNameRejected_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RESOURCE_0800
     * @tc.name invalidResourceIdRejected008
     * @tc.desc Verify getStringValue rejects a resource id that does not exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'invalidResourceIdRejected_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'invalidResourceIdRejected_008 begin');
      const testRm: resourceManager.ResourceManager = getTestResourceManager();
      const invalid: Resource = {
        bundleName: BUNDLE_NAME,
        moduleName: MODULE_NAME,
        id: 0x7FFFFFF,
        type: 10002,
        params: []
      };
      let rejected: boolean = false;
      try {
        await testRm.getStringValue(invalid);
      } catch (error) {
        rejected = true;
      }
      const check01: boolean = rejected;
      Logger.info(TAG, 'invalidResourceIdRejected_008, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'invalidResourceIdRejected_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RESOURCE_0900
     * @tc.name mediaPassedToStringRejected009
     * @tc.desc Verify getStringValue rejects a resource that is a media asset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'mediaPassedToStringRejected_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'mediaPassedToStringRejected_009 begin');
      const testRm: resourceManager.ResourceManager = getTestResourceManager();
      let rejected: boolean = false;
      try {
        await testRm.getStringValue($r('app.media.icon'));
      } catch (error) {
        rejected = true;
      }
      const check01: boolean = rejected;
      Logger.info(TAG, 'mediaPassedToStringRejected_009, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'mediaPassedToStringRejected_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RESOURCE_1000
     * @tc.name configurationLocaleAvailable010
     * @tc.desc Verify the application configuration exposes a locale and a valid layout direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'configurationLocaleAvailable_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'configurationLocaleAvailable_010 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'configurationLocaleAvailable_010, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      const configuration: resourceManager.Configuration = await appRm.getConfiguration();
      const check02: boolean = configuration.locale.length > 0;
      Logger.info(TAG, 'configurationLocaleAvailable_010, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const direction: number = configuration.direction;
      const check03: boolean = direction === 0 || direction === 1;
      Logger.info(TAG, 'configurationLocaleAvailable_010, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'configurationLocaleAvailable_010 end, locale=' + configuration.locale);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RESOURCE_1100
     * @tc.name deviceCapabilityScreenDensity011
     * @tc.desc Verify the device capability reports a supported screen density
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'deviceCapabilityScreenDensity_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'deviceCapabilityScreenDensity_011 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'deviceCapabilityScreenDensity_011, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      const capability: resourceManager.DeviceCapability = await appRm.getDeviceCapability();
      const check02: boolean = KNOWN_DENSITIES.indexOf(capability.screenDensity) >= 0;
      Logger.info(TAG, 'deviceCapabilityScreenDensity_011, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'deviceCapabilityScreenDensity_011 end, density=' + capability.screenDensity);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_RESOURCE_1200
     * @tc.name deviceCapabilityDeviceType012
     * @tc.desc Verify the device capability reports one of the supported device types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'deviceCapabilityDeviceType_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'deviceCapabilityDeviceType_012 begin');
      const check01: boolean = appRm !== null;
      Logger.info(TAG, 'deviceCapabilityDeviceType_012, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (appRm === null) {
        return;
      }
      const capability: resourceManager.DeviceCapability = await appRm.getDeviceCapability();
      const check02: boolean = capability.deviceType >= 0 && capability.deviceType <= 10;
      Logger.info(TAG, 'deviceCapabilityDeviceType_012, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'deviceCapabilityDeviceType_012 end, type=' + capability.deviceType);
    });
  });
}
