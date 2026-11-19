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
export default function launcherModuleDeepTest() {
  describe('LauncherModuleDeepTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE); })

    /**
     * @tc.name   testModuleDeep0001
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0001
     * @tc.desc   Test Launcher module deep case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0002
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0002
     * @tc.desc   Test Launcher module deep case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0003
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0003
     * @tc.desc   Test Launcher module deep case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0004
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0004
     * @tc.desc   Test Launcher module deep case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0005
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0005
     * @tc.desc   Test Launcher module deep case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0006
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0006
     * @tc.desc   Test Launcher module deep case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0007
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0007
     * @tc.desc   Test Launcher module deep case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0008
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0008
     * @tc.desc   Test Launcher module deep case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0009
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0009
     * @tc.desc   Test Launcher module deep case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0010
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0010
     * @tc.desc   Test Launcher module deep case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0011
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0011
     * @tc.desc   Test Launcher module deep case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0012
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0012
     * @tc.desc   Test Launcher module deep case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0013
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0013
     * @tc.desc   Test Launcher module deep case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0014
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0014
     * @tc.desc   Test Launcher module deep case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0015
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0015
     * @tc.desc   Test Launcher module deep case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0016
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0016
     * @tc.desc   Test Launcher module deep case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0017
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0017
     * @tc.desc   Test Launcher module deep case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0018
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0018
     * @tc.desc   Test Launcher module deep case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0019
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0019
     * @tc.desc   Test Launcher module deep case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0020
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0020
     * @tc.desc   Test Launcher module deep case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0021
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0021
     * @tc.desc   Test Launcher module deep case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0022
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0022
     * @tc.desc   Test Launcher module deep case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0023
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0023
     * @tc.desc   Test Launcher module deep case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0024
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0024
     * @tc.desc   Test Launcher module deep case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0025
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0025
     * @tc.desc   Test Launcher module deep case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0026
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0026
     * @tc.desc   Test Launcher module deep case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0027
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0027
     * @tc.desc   Test Launcher module deep case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0028
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0028
     * @tc.desc   Test Launcher module deep case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0029
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0029
     * @tc.desc   Test Launcher module deep case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0030
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0030
     * @tc.desc   Test Launcher module deep case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0031
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0031
     * @tc.desc   Test Launcher module deep case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0032
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0032
     * @tc.desc   Test Launcher module deep case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0033
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0033
     * @tc.desc   Test Launcher module deep case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0034
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0034
     * @tc.desc   Test Launcher module deep case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0035
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0035
     * @tc.desc   Test Launcher module deep case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0036
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0036
     * @tc.desc   Test Launcher module deep case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0037
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0037
     * @tc.desc   Test Launcher module deep case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0038
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0038
     * @tc.desc   Test Launcher module deep case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0039
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0039
     * @tc.desc   Test Launcher module deep case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })

    /**
     * @tc.name   testModuleDeep0040
     * @tc.number SUB_LAUNCHER_MODULE_DEEP_0040
     * @tc.desc   Test Launcher module deep case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testModuleDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = info.hapModulesInfo[i];
        if (module.name === 'entry') {
          found = true;
          expect(module.mainElementName).assertEqual('HomeAbility');
          expect(module.deviceTypes.length > 0).assertTrue();
          expect(module.installationFree).assertFalse();
          expect(module.description.length > 0).assertTrue();
        }
      }
      expect(found).assertTrue();
    })
  })
}
