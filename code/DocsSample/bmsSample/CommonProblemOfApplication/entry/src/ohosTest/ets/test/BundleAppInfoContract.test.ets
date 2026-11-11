/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { paceTurn } from './shared/TestPace';
import {
  FLAGS_FOR_APP,
  FLAGS_FOR_FULL,
  FLAGS_FOR_MODULE,
  FLAGS_FOR_SIGNATURE,
  querySelf,
  querySelfSync
} from './shared/BundleProbe';

const ENTRY_ABILITY_NAME: string = 'EntryAbility';
const ENTRY_BACKUP_ABILITY_NAME: string = 'EntryBackupAbility';
const ENTRY_MODULE_NAME: string = 'entry';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';
const EXPECTED_VENDOR: string = 'example';

function moduleNames(modules: bundleManager.HapModuleInfo[]): string[] {
  const list: string[] = [];
  for (let m: number = 0; m < modules.length; m++) {
    list.push(modules[m].name);
  }
  return list;
}

function findAbility(info: bundleManager.BundleInfo, name: string): bundleManager.AbilityInfo | undefined {
  for (let m: number = 0; m < info.hapModulesInfo.length; m++) {
    const abilities: bundleManager.AbilityInfo[] = info.hapModulesInfo[m].abilitiesInfo;
    for (let a: number = 0; a < abilities.length; a++) {
      if (abilities[a].name === name) {
        return abilities[a];
      }
    }
  }
  return undefined;
}

function findExtension(info: bundleManager.BundleInfo,
  name: string): bundleManager.ExtensionAbilityInfo | undefined {
  for (let m: number = 0; m < info.hapModulesInfo.length; m++) {
    const extensions: bundleManager.ExtensionAbilityInfo[] = info.hapModulesInfo[m].extensionAbilitiesInfo;
    for (let e: number = 0; e < extensions.length; e++) {
      if (extensions[e].name === name) {
        return extensions[e];
      }
    }
  }
  return undefined;
}

export default function bundleAppInfoContractTest() {
  describe('bundleAppInfoContractTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_0100
     * @tc.name testAppInfoContract0001
     * @tc.desc Verify versionCode echoes the declared 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppInfoContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionCode).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_0200
     * @tc.name testAppInfoContract0002
     * @tc.desc Verify versionName echoes the declared 1.0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppInfoContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      expect(/^\d+\.\d+\.\d+$/.test(info.versionName)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_0300
     * @tc.name testAppInfoContract0003
     * @tc.desc Verify vendor echoes the declared example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppInfoContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      expect(info.vendor).assertEqual(EXPECTED_VENDOR);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_0400
     * @tc.name testAppInfoContract0004
     * @tc.desc Verify requesting the application flag populates appInfo with a non-zero uid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppInfoContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      expect(info.appInfo !== undefined).assertTrue();
      expect(info.appInfo.uid > 0).assertTrue();
      expect(info.appInfo.accessTokenId > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_0500
     * @tc.name testAppInfoContract0005
     * @tc.desc Verify the appInfo name matches the bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppInfoContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      expect(info.appInfo.name).assertEqual(info.name);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_0600
     * @tc.name testAppInfoContract0006
     * @tc.desc Verify the application is enabled and not a system app
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppInfoContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      expect(info.appInfo.enabled).assertTrue();
      expect(info.appInfo.systemApp).assertFalse();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_0700
     * @tc.name testAppInfoContract0007
     * @tc.desc Verify the bundle type is a plain application, not an atomic service
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppInfoContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      // BundleType.APP = 0
      expect(info.appInfo.bundleType).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_0800
     * @tc.name testAppInfoContract0008
     * @tc.desc Verify the code path is absolute and contains the bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppInfoContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      expect(info.appInfo.codePath.indexOf(info.name) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_0900
     * @tc.name testAppInfoContract0009
     * @tc.desc Verify requesting the module flag returns the entry hap module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppInfoContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_MODULE);
      const names: string[] = moduleNames(info.hapModulesInfo);
      expect(names.indexOf(ENTRY_MODULE_NAME) >= 0).assertTrue();
      // entry is declared first in app.json5 module list
      expect(info.hapModulesInfo.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_1000
     * @tc.name testAppInfoContract0010
     * @tc.desc Verify the entry module declares a non-empty device type list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppInfoContract0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_MODULE);
      const deviceTypes: string[] = info.hapModulesInfo[0].deviceTypes;
      expect(deviceTypes.length > 0).assertTrue();
      expect(deviceTypes.every((value: string) => value.length > 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_1100
     * @tc.name testAppInfoContract0011
     * @tc.desc Verify EntryAbility is discoverable with exported=true and PAGE type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppInfoContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_MODULE);
      const ability: bundleManager.AbilityInfo | undefined = findAbility(info, ENTRY_ABILITY_NAME);
      expect(ability !== undefined).assertTrue();
      if (ability !== undefined) {
        expect(ability.exported).assertTrue();
        expect(ability.bundleName).assertEqual(info.name);
        expect(ability.moduleName).assertEqual(ENTRY_MODULE_NAME);
        expect(ability.permissions.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_1300
     * @tc.name testAppInfoContract0013
     * @tc.desc Verify EntryBackupAbility is discoverable, not exported and lives in the entry module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppInfoContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo | undefined =
        findExtension(info, ENTRY_BACKUP_ABILITY_NAME);
      expect(extension !== undefined).assertTrue();
      if (extension !== undefined) {
        expect(extension.exported).assertFalse();
        expect(extension.moduleName).assertEqual(ENTRY_MODULE_NAME);
      }
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_1400
     * @tc.name testAppInfoContract0014
     * @tc.desc Verify the entry module exposes exactly one page ability and one backup extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppInfoContract0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_MODULE);
      let pageAbilities: number = 0;
      let backupExtensions: number = 0;
      for (let m: number = 0; m < info.hapModulesInfo.length; m++) {
        const abilities: bundleManager.AbilityInfo[] = info.hapModulesInfo[m].abilitiesInfo;
        for (let a: number = 0; a < abilities.length; a++) {
          if (abilities[a].name === ENTRY_ABILITY_NAME) {
            pageAbilities++;
          }
        }
        const extensions: bundleManager.ExtensionAbilityInfo[] = info.hapModulesInfo[m].extensionAbilitiesInfo;
        for (let e: number = 0; e < extensions.length; e++) {
          if (extensions[e].name === ENTRY_BACKUP_ABILITY_NAME) {
            backupExtensions++;
          }
        }
      }
      expect(pageAbilities).assertEqual(1);
      expect(backupExtensions).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_1500
     * @tc.name testAppInfoContract0015
     * @tc.desc Verify the entry module is not installation-free and the code path is absolute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppInfoContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_MODULE);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      expect(module.installationFree).assertFalse();
      expect(module.codePath.startsWith('/')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_1600
     * @tc.name testAppInfoContract0016
     * @tc.desc Verify installTime and updateTime are positive epoch milliseconds in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppInfoContract0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      expect(info.installTime > 0).assertTrue();
      expect(info.updateTime > 0).assertTrue();
      expect(info.updateTime >= info.installTime).assertTrue();
      expect(info.installTime > 1500000000000).assertTrue();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_1700
     * @tc.name testAppInfoContract0017
     * @tc.desc Verify minCompatibleVersionCode never exceeds the installed versionCode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppInfoContract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      expect(info.minCompatibleVersionCode <= info.versionCode).assertTrue();
      expect(info.minCompatibleVersionCode >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_1900
     * @tc.name testAppInfoContract0019
     * @tc.desc Verify requesting app plus module keeps both appInfo and hapModulesInfo populated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppInfoContract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP | FLAGS_FOR_MODULE);
      expect(info.appInfo.uid > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(moduleNames(info.hapModulesInfo).indexOf(ENTRY_MODULE_NAME) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_2000
     * @tc.name testAppInfoContract0020
     * @tc.desc Verify the module ability bundleName resolution matches across async and sync reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppInfoContract0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncInfo: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_MODULE);
      const syncInfo: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_MODULE);
      expect(asyncInfo.hapModulesInfo[0].name).assertEqual(syncInfo.hapModulesInfo[0].name);
      expect(asyncInfo.hapModulesInfo[0].mainElementName).assertEqual(syncInfo.hapModulesInfo[0].mainElementName);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_2100
     * @tc.name testAppInfoContract0021
     * @tc.desc Verify the appInfo uid is consistent with the delegator application context uid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppInfoContract0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
      const contextUid: number =
        abilityDelegatorRegistry.getAbilityDelegator().getAppContext().applicationInfo.uid;
      expect(info.appInfo.uid).assertEqual(contextUid);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_2200
     * @tc.name testAppInfoContract0022
     * @tc.desc Verify the full flag set yields app, module and signature information together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppInfoContract0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      expect(info.appInfo.uid > 0).assertTrue();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      expect(moduleNames(info.hapModulesInfo).indexOf(ENTRY_MODULE_NAME) >= 0).assertTrue();
      expect(info.signatureInfo.appId.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_2300
     * @tc.name testAppInfoContract0023
     * @tc.desc Verify the signature-only flag still returns a version tuple for the self bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppInfoContract0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_APPINFO_CONTRACT_2400
     * @tc.name testAppInfoContract0024
     * @tc.desc Verify the ability name filter finds EntryAbility but not an unknown name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppInfoContract0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_MODULE);
      expect(findAbility(info, ENTRY_ABILITY_NAME) !== undefined).assertTrue();
      expect(findAbility(info, 'MissingAbility') === undefined).assertTrue();
      expect(findExtension(info, ENTRY_BACKUP_ABILITY_NAME) !== undefined).assertTrue();
      expect(findExtension(info, 'MissingExtension') === undefined).assertTrue();
    });
  });
}
