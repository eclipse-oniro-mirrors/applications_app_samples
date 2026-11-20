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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { bundleManager, common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

const BUNDLE_NAME: string = 'com.example.shakeliveformdemo';
const ENTRY_ABILITY_NAME: string = 'EntryAbility';
const MODULE_NAME: string = 'entry';
const FORM_ABILITY_NAME: string = 'EntryFormAbility';
const LIVE_FORM_ABILITY_NAME: string = 'EntryFormLiveAbility';
const EXPECTED_VERSION_NAME: string = '1.0.0';

export default function abilityTest() {
  describe('ShakeLiveFormAbilityTest', () => {
    let appContext: common.Context;

    beforeAll(() => {
      appContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_Ability_0001
     * @tc.number SUB_FORM_SHAKE_ABILITY_0100
     * @tc.desc   Test that the app context and resource manager are available and the app name equals the bundle name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('com.example.shakeliveformdemo_Ability_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Ability_0001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(appContext !== undefined));
      expect(appContext !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(appContext.resourceManager !== undefined));
      expect(appContext.resourceManager !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(appContext.applicationInfo.name), String(BUNDLE_NAME));
      expect(appContext.applicationInfo.name).assertEqual(BUNDLE_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Ability_0001 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_Ability_0002
     * @tc.number SUB_FORM_SHAKE_ABILITY_0200
     * @tc.desc   Test that the bundle name and the version of the app itself equal the values configured in app.json5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('com.example.shakeliveformdemo_Ability_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Ability_0002 begin');
      const bundleFlag: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
      const bundleInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlag);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(bundleInfo.name), String(BUNDLE_NAME));
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(bundleInfo.versionName), String(EXPECTED_VERSION_NAME));
      expect(bundleInfo.versionName).assertEqual(EXPECTED_VERSION_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Ability_0002 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_Ability_0003
     * @tc.number SUB_FORM_SHAKE_ABILITY_0300
     * @tc.desc   Test that the entry module has the expected name, main element and both form extension abilities.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('com.example.shakeliveformdemo_Ability_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Ability_0003 begin');
      const bundleFlag: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const bundleInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlag);
      const hapModules: Array<bundleManager.HapModuleInfo> = bundleInfo.hapModulesInfo;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(hapModules.length >= 1));
      expect(hapModules.length >= 1).assertTrue();
      let foundEntryModule: boolean = false;
      let foundFormAbility: boolean = false;
      let foundLiveFormAbility: boolean = false;
      for (let i = 0; i < hapModules.length; i++) {
        const hapModule: bundleManager.HapModuleInfo = hapModules[i];
        if (hapModule.name !== MODULE_NAME) {
          continue;
        }
        foundEntryModule = true;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(hapModule.mainElementName), String(ENTRY_ABILITY_NAME));
        expect(hapModule.mainElementName).assertEqual(ENTRY_ABILITY_NAME);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(hapModule.deviceTypes.length > 0));
        expect(hapModule.deviceTypes.length > 0).assertTrue();
        const extensionAbilities: Array<bundleManager.ExtensionAbilityInfo> = hapModule.extensionAbilitiesInfo;
        for (let j = 0; j < extensionAbilities.length; j++) {
          if (extensionAbilities[j].name === FORM_ABILITY_NAME) {
            foundFormAbility = true;
          }
          if (extensionAbilities[j].name === LIVE_FORM_ABILITY_NAME) {
            foundLiveFormAbility = true;
          }
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(foundEntryModule));
      expect(foundEntryModule).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(foundFormAbility));
      expect(foundFormAbility).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(foundLiveFormAbility));
      expect(foundLiveFormAbility).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Ability_0003 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_Ability_0004
     * @tc.number SUB_FORM_SHAKE_ABILITY_0400
     * @tc.desc   Test that the entry ability can be started without error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('com.example.shakeliveformdemo_Ability_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Ability_0004 begin');
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: ENTRY_ABILITY_NAME
      };
      const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      let isFailed: boolean = false;
      abilityDelegator.startAbility(want, (err: BusinessError) => {
        if (err !== undefined && err !== null && err.code !== 0) {
          isFailed = true;
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(isFailed));
        expect(isFailed).assertFalse();
        done();
      }
        );
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Ability_0004 end');
    })
  })
}
