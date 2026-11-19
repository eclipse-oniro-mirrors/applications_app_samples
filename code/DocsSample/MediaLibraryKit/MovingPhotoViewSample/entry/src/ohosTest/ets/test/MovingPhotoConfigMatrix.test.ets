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

const BUNDLE_NAME: string = 'com.example.movingphotoviewsample';
let bundleInfo: bundleManager.BundleInfo;
let appContext: common.Context;

export default function movingPhotoConfigMatrixTest() {
  describe('MovingPhotoConfigMatrixTest', () => {

    beforeAll(() => {
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      bundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      appContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    })

    /**
     * @tc.name   testConfigMatrix0001
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0001
     * @tc.desc   Test bundle identity fields. Config matrix case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testConfigMatrix0002
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0002
     * @tc.desc   Test application metadata fields. Config matrix case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.label.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0003
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0003
     * @tc.desc   Test entry module and ability declaration. Config matrix case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0004
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0004
     * @tc.desc   Test bundle identity fields. Config matrix case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testConfigMatrix0005
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0005
     * @tc.desc   Test application metadata fields. Config matrix case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.label.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0006
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0006
     * @tc.desc   Test entry module and ability declaration. Config matrix case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0007
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0007
     * @tc.desc   Test bundle identity fields. Config matrix case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testConfigMatrix0008
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0008
     * @tc.desc   Test application metadata fields. Config matrix case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.label.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0009
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0009
     * @tc.desc   Test entry module and ability declaration. Config matrix case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0010
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0010
     * @tc.desc   Test bundle identity fields. Config matrix case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testConfigMatrix0011
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0011
     * @tc.desc   Test application metadata fields. Config matrix case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.label.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0012
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0012
     * @tc.desc   Test entry module and ability declaration. Config matrix case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0013
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0013
     * @tc.desc   Test bundle identity fields. Config matrix case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testConfigMatrix0014
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0014
     * @tc.desc   Test application metadata fields. Config matrix case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.label.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0015
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0015
     * @tc.desc   Test entry module and ability declaration. Config matrix case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0016
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0016
     * @tc.desc   Test bundle identity fields. Config matrix case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testConfigMatrix0017
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0017
     * @tc.desc   Test application metadata fields. Config matrix case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.label.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0018
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0018
     * @tc.desc   Test entry module and ability declaration. Config matrix case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0019
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0019
     * @tc.desc   Test bundle identity fields. Config matrix case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testConfigMatrix0020
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0020
     * @tc.desc   Test application metadata fields. Config matrix case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.label.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0021
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0021
     * @tc.desc   Test entry module and ability declaration. Config matrix case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0022
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0022
     * @tc.desc   Test bundle identity fields. Config matrix case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testConfigMatrix0023
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0023
     * @tc.desc   Test application metadata fields. Config matrix case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.label.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0024
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0024
     * @tc.desc   Test entry module and ability declaration. Config matrix case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0025
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0025
     * @tc.desc   Test bundle identity fields. Config matrix case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testConfigMatrix0026
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0026
     * @tc.desc   Test application metadata fields. Config matrix case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.label.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0027
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0027
     * @tc.desc   Test entry module and ability declaration. Config matrix case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0028
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0028
     * @tc.desc   Test bundle identity fields. Config matrix case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testConfigMatrix0029
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0029
     * @tc.desc   Test application metadata fields. Config matrix case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.label.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testConfigMatrix0030
     * @tc.number MOVING_PHOTO_VIEW_CONFIG_0030
     * @tc.desc   Test entry module and ability declaration. Config matrix case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          expect(module.installationFree).assertFalse();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === 'EntryAbility') {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })
  })
}
