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

const BUNDLE_NAME: string = 'com.example.movingphotoviewsample';
let bundleInfo: bundleManager.BundleInfo;

export default function movingPhotoBundleLongMatrixTest() {
  describe('MovingPhotoBundleLongMatrixTest', () => {

    beforeAll(() => {
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      bundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
    })

    /**
     * @tc.name   testBundleLong0001
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0001
     * @tc.desc   Test bundle contract, long matrix case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleLong0002
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0002
     * @tc.desc   Test bundle contract, long matrix case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testBundleLong0003
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0003
     * @tc.desc   Test bundle contract, long matrix case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
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
     * @tc.name   testBundleLong0004
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0004
     * @tc.desc   Test bundle contract, long matrix case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleLong0005
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0005
     * @tc.desc   Test bundle contract, long matrix case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testBundleLong0006
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0006
     * @tc.desc   Test bundle contract, long matrix case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
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
     * @tc.name   testBundleLong0007
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0007
     * @tc.desc   Test bundle contract, long matrix case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleLong0008
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0008
     * @tc.desc   Test bundle contract, long matrix case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testBundleLong0009
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0009
     * @tc.desc   Test bundle contract, long matrix case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
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
     * @tc.name   testBundleLong0010
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0010
     * @tc.desc   Test bundle contract, long matrix case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleLong0011
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0011
     * @tc.desc   Test bundle contract, long matrix case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testBundleLong0012
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0012
     * @tc.desc   Test bundle contract, long matrix case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
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
     * @tc.name   testBundleLong0013
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0013
     * @tc.desc   Test bundle contract, long matrix case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleLong0014
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0014
     * @tc.desc   Test bundle contract, long matrix case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testBundleLong0015
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0015
     * @tc.desc   Test bundle contract, long matrix case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
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
     * @tc.name   testBundleLong0016
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0016
     * @tc.desc   Test bundle contract, long matrix case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleLong0017
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0017
     * @tc.desc   Test bundle contract, long matrix case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testBundleLong0018
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0018
     * @tc.desc   Test bundle contract, long matrix case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
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
     * @tc.name   testBundleLong0019
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0019
     * @tc.desc   Test bundle contract, long matrix case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleLong0020
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0020
     * @tc.desc   Test bundle contract, long matrix case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testBundleLong0021
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0021
     * @tc.desc   Test bundle contract, long matrix case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
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
     * @tc.name   testBundleLong0022
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0022
     * @tc.desc   Test bundle contract, long matrix case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleLong0023
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0023
     * @tc.desc   Test bundle contract, long matrix case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testBundleLong0024
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0024
     * @tc.desc   Test bundle contract, long matrix case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
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
     * @tc.name   testBundleLong0025
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0025
     * @tc.desc   Test bundle contract, long matrix case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleLong0026
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0026
     * @tc.desc   Test bundle contract, long matrix case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testBundleLong0027
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0027
     * @tc.desc   Test bundle contract, long matrix case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
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
     * @tc.name   testBundleLong0028
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0028
     * @tc.desc   Test bundle contract, long matrix case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleLong0029
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0029
     * @tc.desc   Test bundle contract, long matrix case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.appInfo !== undefined).assertTrue();
      expect(bundleInfo.appInfo.codePath.length > 0).assertTrue();
      expect(bundleInfo.appInfo.labelId > 0).assertTrue();
    })

    /**
     * @tc.name   testBundleLong0030
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_LONG_0030
     * @tc.desc   Test bundle contract, long matrix case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleLong0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
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
