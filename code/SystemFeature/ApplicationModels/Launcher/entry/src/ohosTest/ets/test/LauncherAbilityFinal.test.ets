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
import { bundleManager } from '@kit.AbilityKit';
let info: bundleManager.BundleInfo;
export default function launcherAbilityFinalTest() {
  describe('LauncherAbilityFinalTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION); })

    /**
     * @tc.name   testAbilityFinal0001
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0001
     * @tc.desc   Test Launcher ability final case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0002
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0002
     * @tc.desc   Test Launcher ability final case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') { found = true; expect(module.mainElementName).assertEqual('HomeAbility'); }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0003
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0003
     * @tc.desc   Test Launcher ability final case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') { found = true; expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE); }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0004
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0004
     * @tc.desc   Test Launcher ability final case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) { names.add(info.reqPermissionDetails[i].name); }
      expect(names.size).assertEqual(info.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testAbilityFinal0005
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0005
     * @tc.desc   Test Launcher ability final case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.installTime >= 0).assertTrue();
      expect(info.updateTime > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0006
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0006
     * @tc.desc   Test Launcher ability final case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0007
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0007
     * @tc.desc   Test Launcher ability final case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') { found = true; expect(module.mainElementName).assertEqual('HomeAbility'); }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0008
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0008
     * @tc.desc   Test Launcher ability final case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') { found = true; expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE); }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0009
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0009
     * @tc.desc   Test Launcher ability final case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) { names.add(info.reqPermissionDetails[i].name); }
      expect(names.size).assertEqual(info.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testAbilityFinal0010
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0010
     * @tc.desc   Test Launcher ability final case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.installTime >= 0).assertTrue();
      expect(info.updateTime > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0011
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0011
     * @tc.desc   Test Launcher ability final case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0012
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0012
     * @tc.desc   Test Launcher ability final case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') { found = true; expect(module.mainElementName).assertEqual('HomeAbility'); }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0013
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0013
     * @tc.desc   Test Launcher ability final case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') { found = true; expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE); }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0014
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0014
     * @tc.desc   Test Launcher ability final case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) { names.add(info.reqPermissionDetails[i].name); }
      expect(names.size).assertEqual(info.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testAbilityFinal0015
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0015
     * @tc.desc   Test Launcher ability final case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.installTime >= 0).assertTrue();
      expect(info.updateTime > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0016
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0016
     * @tc.desc   Test Launcher ability final case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0017
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0017
     * @tc.desc   Test Launcher ability final case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') { found = true; expect(module.mainElementName).assertEqual('HomeAbility'); }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0018
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0018
     * @tc.desc   Test Launcher ability final case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') { found = true; expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE); }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0019
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0019
     * @tc.desc   Test Launcher ability final case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) { names.add(info.reqPermissionDetails[i].name); }
      expect(names.size).assertEqual(info.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testAbilityFinal0020
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0020
     * @tc.desc   Test Launcher ability final case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.installTime >= 0).assertTrue();
      expect(info.updateTime > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0021
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0021
     * @tc.desc   Test Launcher ability final case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0022
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0022
     * @tc.desc   Test Launcher ability final case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') { found = true; expect(module.mainElementName).assertEqual('HomeAbility'); }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0023
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0023
     * @tc.desc   Test Launcher ability final case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') { found = true; expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE); }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0024
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0024
     * @tc.desc   Test Launcher ability final case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) { names.add(info.reqPermissionDetails[i].name); }
      expect(names.size).assertEqual(info.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testAbilityFinal0025
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0025
     * @tc.desc   Test Launcher ability final case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.installTime >= 0).assertTrue();
      expect(info.updateTime > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0026
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0026
     * @tc.desc   Test Launcher ability final case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0027
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0027
     * @tc.desc   Test Launcher ability final case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') { found = true; expect(module.mainElementName).assertEqual('HomeAbility'); }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0028
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0028
     * @tc.desc   Test Launcher ability final case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') { found = true; expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE); }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0029
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0029
     * @tc.desc   Test Launcher ability final case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) { names.add(info.reqPermissionDetails[i].name); }
      expect(names.size).assertEqual(info.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testAbilityFinal0030
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0030
     * @tc.desc   Test Launcher ability final case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.installTime >= 0).assertTrue();
      expect(info.updateTime > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0031
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0031
     * @tc.desc   Test Launcher ability final case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0032
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0032
     * @tc.desc   Test Launcher ability final case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') { found = true; expect(module.mainElementName).assertEqual('HomeAbility'); }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0033
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0033
     * @tc.desc   Test Launcher ability final case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') { found = true; expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE); }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0034
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0034
     * @tc.desc   Test Launcher ability final case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) { names.add(info.reqPermissionDetails[i].name); }
      expect(names.size).assertEqual(info.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testAbilityFinal0035
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0035
     * @tc.desc   Test Launcher ability final case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.installTime >= 0).assertTrue();
      expect(info.updateTime > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0036
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0036
     * @tc.desc   Test Launcher ability final case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0037
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0037
     * @tc.desc   Test Launcher ability final case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') { found = true; expect(module.mainElementName).assertEqual('HomeAbility'); }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0038
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0038
     * @tc.desc   Test Launcher ability final case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') { found = true; expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE); }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0039
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0039
     * @tc.desc   Test Launcher ability final case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) { names.add(info.reqPermissionDetails[i].name); }
      expect(names.size).assertEqual(info.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testAbilityFinal0040
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0040
     * @tc.desc   Test Launcher ability final case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.installTime >= 0).assertTrue();
      expect(info.updateTime > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0041
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0041
     * @tc.desc   Test Launcher ability final case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0042
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0042
     * @tc.desc   Test Launcher ability final case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') { found = true; expect(module.mainElementName).assertEqual('HomeAbility'); }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0043
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0043
     * @tc.desc   Test Launcher ability final case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') { found = true; expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE); }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0044
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0044
     * @tc.desc   Test Launcher ability final case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) { names.add(info.reqPermissionDetails[i].name); }
      expect(names.size).assertEqual(info.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testAbilityFinal0045
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0045
     * @tc.desc   Test Launcher ability final case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.installTime >= 0).assertTrue();
      expect(info.updateTime > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0046
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0046
     * @tc.desc   Test Launcher ability final case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.name).assertEqual('ohos.samples.launcher');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.appInfo.systemApp).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0047
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0047
     * @tc.desc   Test Launcher ability final case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') { found = true; expect(module.mainElementName).assertEqual('HomeAbility'); }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0048
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0048
     * @tc.desc   Test Launcher ability final case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') { found = true; expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE); }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityFinal0049
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0049
     * @tc.desc   Test Launcher ability final case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) { names.add(info.reqPermissionDetails[i].name); }
      expect(names.size).assertEqual(info.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testAbilityFinal0050
     * @tc.number SUB_LAUNCHER_ABILITY_FINAL_0050
     * @tc.desc   Test Launcher ability final case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityFinal0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.codePath.length > 0).assertTrue();
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.installTime >= 0).assertTrue();
      expect(info.updateTime > 0).assertTrue();
    })
  })
}
