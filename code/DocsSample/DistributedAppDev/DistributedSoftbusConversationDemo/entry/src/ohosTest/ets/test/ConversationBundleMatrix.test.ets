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

const BUNDLE_NAME: string = 'com.example.distributedsoftbusconversationdemo';
let bundleInfo: bundleManager.BundleInfo;

export default function conversationBundleMatrixTest() {
  describe('ConversationBundleMatrixTest', () => {

    beforeAll(() => {
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      bundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
    })

    /**
     * @tc.name   testBundleMatrix0001
     * @tc.number SUB_SOFTBUS_BUNDLE_0001
     * @tc.desc   Test bundle identity fields. Bundle matrix case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleMatrix0002
     * @tc.number SUB_SOFTBUS_BUNDLE_0002
     * @tc.desc   Test entry module and EntryAbility. Bundle matrix case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
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
     * @tc.name   testBundleMatrix0003
     * @tc.number SUB_SOFTBUS_BUNDLE_0003
     * @tc.desc   Test entry backup extension ability. Bundle matrix case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backupFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> =
          bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'EntryBackupAbility') {
            backupFound = true;
            expect(extensions[j].exported).assertFalse();
          }
        }
      }
      expect(backupFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0004
     * @tc.number SUB_SOFTBUS_BUNDLE_0004
     * @tc.desc   Test bundle identity fields. Bundle matrix case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleMatrix0005
     * @tc.number SUB_SOFTBUS_BUNDLE_0005
     * @tc.desc   Test entry module and EntryAbility. Bundle matrix case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
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
     * @tc.name   testBundleMatrix0006
     * @tc.number SUB_SOFTBUS_BUNDLE_0006
     * @tc.desc   Test entry backup extension ability. Bundle matrix case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backupFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> =
          bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'EntryBackupAbility') {
            backupFound = true;
            expect(extensions[j].exported).assertFalse();
          }
        }
      }
      expect(backupFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0007
     * @tc.number SUB_SOFTBUS_BUNDLE_0007
     * @tc.desc   Test bundle identity fields. Bundle matrix case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleMatrix0008
     * @tc.number SUB_SOFTBUS_BUNDLE_0008
     * @tc.desc   Test entry module and EntryAbility. Bundle matrix case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
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
     * @tc.name   testBundleMatrix0009
     * @tc.number SUB_SOFTBUS_BUNDLE_0009
     * @tc.desc   Test entry backup extension ability. Bundle matrix case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backupFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> =
          bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'EntryBackupAbility') {
            backupFound = true;
            expect(extensions[j].exported).assertFalse();
          }
        }
      }
      expect(backupFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0010
     * @tc.number SUB_SOFTBUS_BUNDLE_0010
     * @tc.desc   Test bundle identity fields. Bundle matrix case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleMatrix0011
     * @tc.number SUB_SOFTBUS_BUNDLE_0011
     * @tc.desc   Test entry module and EntryAbility. Bundle matrix case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
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
     * @tc.name   testBundleMatrix0012
     * @tc.number SUB_SOFTBUS_BUNDLE_0012
     * @tc.desc   Test entry backup extension ability. Bundle matrix case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backupFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> =
          bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'EntryBackupAbility') {
            backupFound = true;
            expect(extensions[j].exported).assertFalse();
          }
        }
      }
      expect(backupFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0013
     * @tc.number SUB_SOFTBUS_BUNDLE_0013
     * @tc.desc   Test bundle identity fields. Bundle matrix case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleMatrix0014
     * @tc.number SUB_SOFTBUS_BUNDLE_0014
     * @tc.desc   Test entry module and EntryAbility. Bundle matrix case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
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
     * @tc.name   testBundleMatrix0015
     * @tc.number SUB_SOFTBUS_BUNDLE_0015
     * @tc.desc   Test entry backup extension ability. Bundle matrix case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backupFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> =
          bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'EntryBackupAbility') {
            backupFound = true;
            expect(extensions[j].exported).assertFalse();
          }
        }
      }
      expect(backupFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0016
     * @tc.number SUB_SOFTBUS_BUNDLE_0016
     * @tc.desc   Test bundle identity fields. Bundle matrix case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleMatrix0017
     * @tc.number SUB_SOFTBUS_BUNDLE_0017
     * @tc.desc   Test entry module and EntryAbility. Bundle matrix case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
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
     * @tc.name   testBundleMatrix0018
     * @tc.number SUB_SOFTBUS_BUNDLE_0018
     * @tc.desc   Test entry backup extension ability. Bundle matrix case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backupFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> =
          bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'EntryBackupAbility') {
            backupFound = true;
            expect(extensions[j].exported).assertFalse();
          }
        }
      }
      expect(backupFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0019
     * @tc.number SUB_SOFTBUS_BUNDLE_0019
     * @tc.desc   Test bundle identity fields. Bundle matrix case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleMatrix0020
     * @tc.number SUB_SOFTBUS_BUNDLE_0020
     * @tc.desc   Test entry module and EntryAbility. Bundle matrix case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
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
     * @tc.name   testBundleMatrix0021
     * @tc.number SUB_SOFTBUS_BUNDLE_0021
     * @tc.desc   Test entry backup extension ability. Bundle matrix case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backupFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> =
          bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'EntryBackupAbility') {
            backupFound = true;
            expect(extensions[j].exported).assertFalse();
          }
        }
      }
      expect(backupFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0022
     * @tc.number SUB_SOFTBUS_BUNDLE_0022
     * @tc.desc   Test bundle identity fields. Bundle matrix case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleMatrix0023
     * @tc.number SUB_SOFTBUS_BUNDLE_0023
     * @tc.desc   Test entry module and EntryAbility. Bundle matrix case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
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
     * @tc.name   testBundleMatrix0024
     * @tc.number SUB_SOFTBUS_BUNDLE_0024
     * @tc.desc   Test entry backup extension ability. Bundle matrix case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backupFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> =
          bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'EntryBackupAbility') {
            backupFound = true;
            expect(extensions[j].exported).assertFalse();
          }
        }
      }
      expect(backupFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0025
     * @tc.number SUB_SOFTBUS_BUNDLE_0025
     * @tc.desc   Test bundle identity fields. Bundle matrix case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleMatrix0026
     * @tc.number SUB_SOFTBUS_BUNDLE_0026
     * @tc.desc   Test entry module and EntryAbility. Bundle matrix case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
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
     * @tc.name   testBundleMatrix0027
     * @tc.number SUB_SOFTBUS_BUNDLE_0027
     * @tc.desc   Test entry backup extension ability. Bundle matrix case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backupFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> =
          bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'EntryBackupAbility') {
            backupFound = true;
            expect(extensions[j].exported).assertFalse();
          }
        }
      }
      expect(backupFound).assertTrue();
    })

    /**
     * @tc.name   testBundleMatrix0028
     * @tc.number SUB_SOFTBUS_BUNDLE_0028
     * @tc.desc   Test bundle identity fields. Bundle matrix case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual(BUNDLE_NAME);
      expect(bundleInfo.versionName).assertEqual('1.0.0');
      expect(bundleInfo.versionCode).assertEqual(1000000);
    })

    /**
     * @tc.name   testBundleMatrix0029
     * @tc.number SUB_SOFTBUS_BUNDLE_0029
     * @tc.desc   Test entry module and EntryAbility. Bundle matrix case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entryFound: boolean = false;
      let abilityFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const module: bundleManager.HapModuleInfo = bundleInfo.hapModulesInfo[i];
        if (module.name === 'entry') {
          entryFound = true;
          expect(module.deviceTypes.includes('default')).assertTrue();
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
     * @tc.name   testBundleMatrix0030
     * @tc.number SUB_SOFTBUS_BUNDLE_0030
     * @tc.desc   Test entry backup extension ability. Bundle matrix case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backupFound: boolean = false;
      for (let i: number = 0; i < bundleInfo.hapModulesInfo.length; i++) {
        const extensions: Array<bundleManager.ExtensionAbilityInfo> =
          bundleInfo.hapModulesInfo[i].extensionAbilitiesInfo;
        for (let j: number = 0; j < extensions.length; j++) {
          if (extensions[j].name === 'EntryBackupAbility') {
            backupFound = true;
            expect(extensions[j].exported).assertFalse();
          }
        }
      }
      expect(backupFound).assertTrue();
    })
  })
}
