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
const BUNDLE_NAME: string = 'ohos.samples.launcher';
let bundleInfo: bundleManager.BundleInfo;
export default function launcherAbilityModelMatrixTest() {
  describe('LauncherAbilityModelMatrixTest', () => {
    beforeAll(() => { bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION); })

    /**
     * @tc.name   testAbilityModel0001
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0001
     * @tc.desc   Test Launcher ability/application model case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.vendor).assertEqual('samples');
    })

    /**
     * @tc.name   testAbilityModel0002
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0002
     * @tc.desc   Test Launcher ability/application model case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.systemApp).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0003
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0003
     * @tc.desc   Test Launcher ability/application model case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0004
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0004
     * @tc.desc   Test Launcher ability/application model case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0005
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0005
     * @tc.desc   Test Launcher ability/application model case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.vendor).assertEqual('samples');
    })

    /**
     * @tc.name   testAbilityModel0006
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0006
     * @tc.desc   Test Launcher ability/application model case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.systemApp).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0007
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0007
     * @tc.desc   Test Launcher ability/application model case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0008
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0008
     * @tc.desc   Test Launcher ability/application model case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0009
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0009
     * @tc.desc   Test Launcher ability/application model case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.vendor).assertEqual('samples');
    })

    /**
     * @tc.name   testAbilityModel0010
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0010
     * @tc.desc   Test Launcher ability/application model case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.systemApp).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0011
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0011
     * @tc.desc   Test Launcher ability/application model case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0012
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0012
     * @tc.desc   Test Launcher ability/application model case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0013
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0013
     * @tc.desc   Test Launcher ability/application model case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.vendor).assertEqual('samples');
    })

    /**
     * @tc.name   testAbilityModel0014
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0014
     * @tc.desc   Test Launcher ability/application model case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.systemApp).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0015
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0015
     * @tc.desc   Test Launcher ability/application model case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0016
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0016
     * @tc.desc   Test Launcher ability/application model case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0017
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0017
     * @tc.desc   Test Launcher ability/application model case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.vendor).assertEqual('samples');
    })

    /**
     * @tc.name   testAbilityModel0018
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0018
     * @tc.desc   Test Launcher ability/application model case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.systemApp).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0019
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0019
     * @tc.desc   Test Launcher ability/application model case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0020
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0020
     * @tc.desc   Test Launcher ability/application model case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0021
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0021
     * @tc.desc   Test Launcher ability/application model case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.vendor).assertEqual('samples');
    })

    /**
     * @tc.name   testAbilityModel0022
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0022
     * @tc.desc   Test Launcher ability/application model case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.systemApp).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0023
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0023
     * @tc.desc   Test Launcher ability/application model case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0024
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0024
     * @tc.desc   Test Launcher ability/application model case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0025
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0025
     * @tc.desc   Test Launcher ability/application model case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.vendor).assertEqual('samples');
    })

    /**
     * @tc.name   testAbilityModel0026
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0026
     * @tc.desc   Test Launcher ability/application model case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.systemApp).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0027
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0027
     * @tc.desc   Test Launcher ability/application model case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0028
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0028
     * @tc.desc   Test Launcher ability/application model case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0029
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0029
     * @tc.desc   Test Launcher ability/application model case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.vendor).assertEqual('samples');
    })

    /**
     * @tc.name   testAbilityModel0030
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0030
     * @tc.desc   Test Launcher ability/application model case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.systemApp).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0031
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0031
     * @tc.desc   Test Launcher ability/application model case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0032
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0032
     * @tc.desc   Test Launcher ability/application model case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0033
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0033
     * @tc.desc   Test Launcher ability/application model case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.vendor).assertEqual('samples');
    })

    /**
     * @tc.name   testAbilityModel0034
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0034
     * @tc.desc   Test Launcher ability/application model case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.systemApp).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0035
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0035
     * @tc.desc   Test Launcher ability/application model case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0036
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0036
     * @tc.desc   Test Launcher ability/application model case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0037
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0037
     * @tc.desc   Test Launcher ability/application model case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      expect(bundleInfo.vendor).assertEqual('samples');
    })

    /**
     * @tc.name   testAbilityModel0038
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0038
     * @tc.desc   Test Launcher ability/application model case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.systemApp).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0039
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0039
     * @tc.desc   Test Launcher ability/application model case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testAbilityModel0040
     * @tc.number SUB_LAUNCHER_ABILITY_MODEL_0040
     * @tc.desc   Test Launcher ability/application model case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAbilityModel0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
          }
        }
      }
      expect(found).assertTrue();
    })
  })
}
