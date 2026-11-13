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
export default function launcherLaunchContractTest() {
  describe('LauncherLaunchContractTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION); })

    /**
     * @tc.name   testLaunchContract0001
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0001
     * @tc.desc   Test Launcher launch contract case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0002
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0002
     * @tc.desc   Test Launcher launch contract case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0003
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0003
     * @tc.desc   Test Launcher launch contract case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0004
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0004
     * @tc.desc   Test Launcher launch contract case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0005
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0005
     * @tc.desc   Test Launcher launch contract case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0006
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0006
     * @tc.desc   Test Launcher launch contract case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0007
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0007
     * @tc.desc   Test Launcher launch contract case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0008
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0008
     * @tc.desc   Test Launcher launch contract case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0009
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0009
     * @tc.desc   Test Launcher launch contract case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0010
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0010
     * @tc.desc   Test Launcher launch contract case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0011
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0011
     * @tc.desc   Test Launcher launch contract case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0012
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0012
     * @tc.desc   Test Launcher launch contract case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0013
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0013
     * @tc.desc   Test Launcher launch contract case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0014
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0014
     * @tc.desc   Test Launcher launch contract case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0015
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0015
     * @tc.desc   Test Launcher launch contract case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0016
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0016
     * @tc.desc   Test Launcher launch contract case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0017
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0017
     * @tc.desc   Test Launcher launch contract case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0018
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0018
     * @tc.desc   Test Launcher launch contract case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0019
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0019
     * @tc.desc   Test Launcher launch contract case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0020
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0020
     * @tc.desc   Test Launcher launch contract case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0021
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0021
     * @tc.desc   Test Launcher launch contract case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0022
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0022
     * @tc.desc   Test Launcher launch contract case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0023
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0023
     * @tc.desc   Test Launcher launch contract case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0024
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0024
     * @tc.desc   Test Launcher launch contract case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0025
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0025
     * @tc.desc   Test Launcher launch contract case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0026
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0026
     * @tc.desc   Test Launcher launch contract case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0027
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0027
     * @tc.desc   Test Launcher launch contract case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0028
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0028
     * @tc.desc   Test Launcher launch contract case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0029
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0029
     * @tc.desc   Test Launcher launch contract case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0030
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0030
     * @tc.desc   Test Launcher launch contract case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0031
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0031
     * @tc.desc   Test Launcher launch contract case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0032
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0032
     * @tc.desc   Test Launcher launch contract case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0033
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0033
     * @tc.desc   Test Launcher launch contract case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0034
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0034
     * @tc.desc   Test Launcher launch contract case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0035
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0035
     * @tc.desc   Test Launcher launch contract case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0036
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0036
     * @tc.desc   Test Launcher launch contract case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0037
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0037
     * @tc.desc   Test Launcher launch contract case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0038
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0038
     * @tc.desc   Test Launcher launch contract case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0039
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0039
     * @tc.desc   Test Launcher launch contract case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.includes('default')).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testLaunchContract0040
     * @tc.number SUB_LAUNCHER_LAUNCH_CONTRACT_0040
     * @tc.desc   Test Launcher launch contract case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchContract0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })
  })
}
