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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { bundleManager, common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

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
     * @tc.name   testAppContext0001
     * @tc.number SUB_FORM_SHAKE_ABILITY_0100
     * @tc.desc   Test that the app context and resource manager are available and the app name equals the bundle name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAppContext0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(appContext !== undefined).assertTrue();
      expect(appContext.resourceManager !== undefined).assertTrue();
      expect(appContext.applicationInfo.name).assertEqual(BUNDLE_NAME);
    })

    /**
     * @tc.name   testBundleInfo0001
     * @tc.number SUB_FORM_SHAKE_ABILITY_0200
     * @tc.desc   Test that the bundle name and the version of the app itself equal the values configured in app.json5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBundleInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const bundleFlag: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
      const bundleInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlag);
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual(EXPECTED_VERSION_NAME);
    })

    /**
     * @tc.name   testHapModuleInfo0001
     * @tc.number SUB_FORM_SHAKE_ABILITY_0300
     * @tc.desc   Test that the entry module has the expected name, main element and both form extension abilities.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHapModuleInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const bundleFlag: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const bundleInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlag);
      const hapModules: Array<bundleManager.HapModuleInfo> = bundleInfo.hapModulesInfo;
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
        expect(hapModule.mainElementName).assertEqual(ENTRY_ABILITY_NAME);
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
      expect(foundEntryModule).assertTrue();
      expect(foundFormAbility).assertTrue();
      expect(foundLiveFormAbility).assertTrue();
    })

    /**
     * @tc.name   testStartEntryAbility0001
     * @tc.number SUB_FORM_SHAKE_ABILITY_0400
     * @tc.desc   Test that the entry ability can be started without error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartEntryAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        expect(isFailed).assertFalse();
        done();
      });
    })
  })
}
