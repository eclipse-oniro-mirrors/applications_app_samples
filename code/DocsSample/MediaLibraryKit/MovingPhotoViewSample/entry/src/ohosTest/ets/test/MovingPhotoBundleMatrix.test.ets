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
const ENTRY_ABILITY: string = 'EntryAbility';
let bundleInfo: bundleManager.BundleInfo;

export default function movingPhotoBundleMatrixTest() {
  describe('MovingPhotoBundleMatrixTest', () => {

    beforeAll(() => {
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      bundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
    })

    /**
     * @tc.name   testBundleMatrix0001
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0001
     * @tc.desc   Test bundle and entry module contract, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0002
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0002
     * @tc.desc   Test bundle and entry module contract, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0003
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0003
     * @tc.desc   Test bundle and entry module contract, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0004
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0004
     * @tc.desc   Test bundle and entry module contract, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0005
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0005
     * @tc.desc   Test bundle and entry module contract, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0006
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0006
     * @tc.desc   Test bundle and entry module contract, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0007
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0007
     * @tc.desc   Test bundle and entry module contract, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0008
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0008
     * @tc.desc   Test bundle and entry module contract, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0009
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0009
     * @tc.desc   Test bundle and entry module contract, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0010
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0010
     * @tc.desc   Test bundle and entry module contract, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0011
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0011
     * @tc.desc   Test bundle and entry module contract, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0012
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0012
     * @tc.desc   Test bundle and entry module contract, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0013
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0013
     * @tc.desc   Test bundle and entry module contract, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0014
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0014
     * @tc.desc   Test bundle and entry module contract, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0015
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0015
     * @tc.desc   Test bundle and entry module contract, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0016
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0016
     * @tc.desc   Test bundle and entry module contract, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0017
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0017
     * @tc.desc   Test bundle and entry module contract, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0018
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0018
     * @tc.desc   Test bundle and entry module contract, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0019
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0019
     * @tc.desc   Test bundle and entry module contract, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
              abilityFound = true;
            }
          }
        }
      }
      expect(entryFound).assertTrue();
      expect(abilityFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0020
     * @tc.number MOVING_PHOTO_VIEW_BUNDLE_0020
     * @tc.desc   Test bundle and entry module contract, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
          for (let j: number = 0; j < module.abilitiesInfo.length; j++) {
            if (module.abilitiesInfo[j].name === ENTRY_ABILITY) {
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
