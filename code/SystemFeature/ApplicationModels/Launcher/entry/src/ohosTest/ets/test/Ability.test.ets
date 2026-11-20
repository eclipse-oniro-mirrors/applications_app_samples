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
import { bundleManager, common } from '@kit.AbilityKit';

const BUNDLE_NAME: string = 'ohos.samples.launcher';
const MODULE_NAME: string = 'entry';
const DESKTOP_ABILITY_NAME: string = 'MainAbility';
const EXPECTED_VERSION_NAME: string = '1.0.0';

export default function abilityTest() {
  describe('LauncherAbilityTest', () => {
    let appContext: common.Context;

    beforeAll(() => {
      appContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    })

    /**
     * @tc.name   testAppContext0001
     * @tc.number SUB_LAUNCHER_ENTRY_ABILITY_0100
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
     * @tc.number SUB_LAUNCHER_ENTRY_ABILITY_0200
     * @tc.desc   Test that the bundle name and the version of the launcher equal the values configured in app.json5.
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
     * @tc.name   testHapModulePackaged0001
     * @tc.number SUB_LAUNCHER_ENTRY_ABILITY_0300
     * @tc.desc   Test that the entry module is packaged with device types and the desktop service extension ability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHapModulePackaged0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const bundleFlag: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const bundleInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlag);
      const hapModules: Array<bundleManager.HapModuleInfo> = bundleInfo.hapModulesInfo;
      expect(hapModules.length >= 1).assertTrue();
      let foundEntryModule: boolean = false;
      let foundDesktopAbility: boolean = false;
      for (let i = 0; i < hapModules.length; i++) {
        const hapModule: bundleManager.HapModuleInfo = hapModules[i];
        if (hapModule.name !== MODULE_NAME) {
          continue;
        }
        foundEntryModule = true;
        expect(hapModule.deviceTypes.length > 0).assertTrue();
        const extensionAbilities: Array<bundleManager.ExtensionAbilityInfo> = hapModule.extensionAbilitiesInfo;
        for (let j = 0; j < extensionAbilities.length; j++) {
          if (extensionAbilities[j].name === DESKTOP_ABILITY_NAME) {
            foundDesktopAbility = true;
          }
        }
      }
      expect(foundEntryModule).assertTrue();
      expect(foundDesktopAbility).assertTrue();
    })
  })
}
