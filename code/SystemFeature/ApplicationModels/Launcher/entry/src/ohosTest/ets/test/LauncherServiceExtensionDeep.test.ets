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
export default function launcherServiceExtensionDeepTest() {
  describe('LauncherServiceExtensionDeepTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY); })

    /**
     * @tc.name   testServiceExtension0001
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0001
     * @tc.desc   Test Launcher service extension deep case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0002
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0002
     * @tc.desc   Test Launcher service extension deep case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0003
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0003
     * @tc.desc   Test Launcher service extension deep case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0004
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0004
     * @tc.desc   Test Launcher service extension deep case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0005
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0005
     * @tc.desc   Test Launcher service extension deep case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0006
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0006
     * @tc.desc   Test Launcher service extension deep case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0007
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0007
     * @tc.desc   Test Launcher service extension deep case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0008
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0008
     * @tc.desc   Test Launcher service extension deep case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0009
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0009
     * @tc.desc   Test Launcher service extension deep case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0010
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0010
     * @tc.desc   Test Launcher service extension deep case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0011
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0011
     * @tc.desc   Test Launcher service extension deep case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0012
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0012
     * @tc.desc   Test Launcher service extension deep case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0013
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0013
     * @tc.desc   Test Launcher service extension deep case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0014
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0014
     * @tc.desc   Test Launcher service extension deep case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0015
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0015
     * @tc.desc   Test Launcher service extension deep case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0016
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0016
     * @tc.desc   Test Launcher service extension deep case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0017
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0017
     * @tc.desc   Test Launcher service extension deep case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0018
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0018
     * @tc.desc   Test Launcher service extension deep case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0019
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0019
     * @tc.desc   Test Launcher service extension deep case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0020
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0020
     * @tc.desc   Test Launcher service extension deep case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0021
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0021
     * @tc.desc   Test Launcher service extension deep case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0022
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0022
     * @tc.desc   Test Launcher service extension deep case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0023
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0023
     * @tc.desc   Test Launcher service extension deep case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0024
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0024
     * @tc.desc   Test Launcher service extension deep case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0025
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0025
     * @tc.desc   Test Launcher service extension deep case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0026
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0026
     * @tc.desc   Test Launcher service extension deep case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0027
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0027
     * @tc.desc   Test Launcher service extension deep case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0028
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0028
     * @tc.desc   Test Launcher service extension deep case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0029
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0029
     * @tc.desc   Test Launcher service extension deep case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0030
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0030
     * @tc.desc   Test Launcher service extension deep case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0031
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0031
     * @tc.desc   Test Launcher service extension deep case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0032
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0032
     * @tc.desc   Test Launcher service extension deep case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0033
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0033
     * @tc.desc   Test Launcher service extension deep case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0034
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0034
     * @tc.desc   Test Launcher service extension deep case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0035
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0035
     * @tc.desc   Test Launcher service extension deep case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0036
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0036
     * @tc.desc   Test Launcher service extension deep case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0037
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0037
     * @tc.desc   Test Launcher service extension deep case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0038
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0038
     * @tc.desc   Test Launcher service extension deep case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0039
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0039
     * @tc.desc   Test Launcher service extension deep case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testServiceExtension0040
     * @tc.number SUB_LAUNCHER_SERVICE_EXT_0040
     * @tc.desc   Test Launcher service extension deep case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceExtension0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> = info.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'MainAbility') {
            found = true;
            expect(extensions[j].extensionAbilityType).assertEqual(bundleManager.ExtensionAbilityType.SERVICE);
            expect(extensions[j].exported).assertTrue();
            expect(extensions[j].skills.length > 0).assertTrue();
            expect(extensions[j].enabled).assertTrue();
          }
        }
      }
      expect(found).assertTrue();
    })
  })
}
