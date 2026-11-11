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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from './shared/TestPace';
import { SELF_BUNDLE_NAME } from './shared/BundleProbe';
import {
  FLAG_APPLICATION,
  FLAG_ABILITY,
  FLAG_EXTENSION,
  FLAG_HAP_MODULE,
  FLAG_SIGNATURE,
  flagsForIndex,
  hasFlag
} from './shared/FlagMatrix';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_BundleModuleExtended]';
const EXPECTED_VERSION_CODE: number = 1000000;
const EXPECTED_VERSION_NAME: string = '1.0.0';


function moduleNames(info: bundleManager.BundleInfo): string[] {
  const names: string[] = [];
  for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
    names.push(info.hapModulesInfo[i].name);
  }
  return names;
}

function hasAbility(info: bundleManager.BundleInfo, name: string): boolean {
  for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
    const abilities: bundleManager.AbilityInfo[] = info.hapModulesInfo[i].abilitiesInfo;
    for (let j: number = 0; j < abilities.length; j++) {
      if (abilities[j].name === name) {
        return true;
      }
    }
  }
  return false;
}

function hasExtension(info: bundleManager.BundleInfo, name: string): boolean {
  for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
    const extensions: bundleManager.ExtensionAbilityInfo[] = info.hapModulesInfo[i].extensionAbilitiesInfo;
    for (let j: number = 0; j < extensions.length; j++) {
      if (extensions[j].name === name) {
        return true;
      }
    }
  }
  return false;
}


export default function bundleModuleExtendedTest() {
  describe('bundleModuleExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0065
     * @tc.name      testBundleModule0065
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x40 (DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0065 begin');
      const flags: number = flagsForIndex(64);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0065 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0066
     * @tc.name      testBundleModule0066
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x41 (APPLICATION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0066 begin');
      const flags: number = flagsForIndex(65);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0066 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0067
     * @tc.name      testBundleModule0067
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x42 (HAP_MODULE|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0067 begin');
      const flags: number = flagsForIndex(66);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0067 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0068
     * @tc.name      testBundleModule0068
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x43 (APPLICATION|HAP_MODULE|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0068 begin');
      const flags: number = flagsForIndex(67);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0068 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0069
     * @tc.name      testBundleModule0069
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x44 (ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0069 begin');
      const flags: number = flagsForIndex(68);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0069 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0070
     * @tc.name      testBundleModule0070
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x45 (APPLICATION|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0070 begin');
      const flags: number = flagsForIndex(69);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0070 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0071
     * @tc.name      testBundleModule0071
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x46 (HAP_MODULE|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0071 begin');
      const flags: number = flagsForIndex(70);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0071 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0072
     * @tc.name      testBundleModule0072
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x47 (APPLICATION|HAP_MODULE|ABILITY|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0072 begin');
      const flags: number = flagsForIndex(71);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0072 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0073
     * @tc.name      testBundleModule0073
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x48 (EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0073 begin');
      const flags: number = flagsForIndex(72);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0073 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0074
     * @tc.name      testBundleModule0074
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x49 (APPLICATION|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0074 begin');
      const flags: number = flagsForIndex(73);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0074 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0075
     * @tc.name      testBundleModule0075
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x4A (HAP_MODULE|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0075 begin');
      const flags: number = flagsForIndex(74);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0075 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0076
     * @tc.name      testBundleModule0076
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x4B (APPLICATION|HAP_MODULE|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0076 begin');
      const flags: number = flagsForIndex(75);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0076 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0077
     * @tc.name      testBundleModule0077
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x4C (ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0077 begin');
      const flags: number = flagsForIndex(76);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0077 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0078
     * @tc.name      testBundleModule0078
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x4D (APPLICATION|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0078 begin');
      const flags: number = flagsForIndex(77);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0078 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0079
     * @tc.name      testBundleModule0079
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x4E (HAP_MODULE|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0079 begin');
      const flags: number = flagsForIndex(78);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0079 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0080
     * @tc.name      testBundleModule0080
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x4F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0080 begin');
      const flags: number = flagsForIndex(79);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0080 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0081
     * @tc.name      testBundleModule0081
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x50 (PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0081 begin');
      const flags: number = flagsForIndex(80);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0081 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0082
     * @tc.name      testBundleModule0082
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x51 (APPLICATION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0082 begin');
      const flags: number = flagsForIndex(81);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0082 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0083
     * @tc.name      testBundleModule0083
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x52 (HAP_MODULE|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0083 begin');
      const flags: number = flagsForIndex(82);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0083 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0084
     * @tc.name      testBundleModule0084
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x53 (APPLICATION|HAP_MODULE|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0084 begin');
      const flags: number = flagsForIndex(83);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0084 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0085
     * @tc.name      testBundleModule0085
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x54 (ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0085 begin');
      const flags: number = flagsForIndex(84);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0085 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0086
     * @tc.name      testBundleModule0086
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x55 (APPLICATION|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0086 begin');
      const flags: number = flagsForIndex(85);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0086 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0087
     * @tc.name      testBundleModule0087
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x56 (HAP_MODULE|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0087 begin');
      const flags: number = flagsForIndex(86);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0087 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0088
     * @tc.name      testBundleModule0088
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x57 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0088 begin');
      const flags: number = flagsForIndex(87);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0088 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0089
     * @tc.name      testBundleModule0089
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x58 (EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0089 begin');
      const flags: number = flagsForIndex(88);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0089 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0090
     * @tc.name      testBundleModule0090
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x59 (APPLICATION|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0090 begin');
      const flags: number = flagsForIndex(89);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0090 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0091
     * @tc.name      testBundleModule0091
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x5A (HAP_MODULE|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0091 begin');
      const flags: number = flagsForIndex(90);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0091 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0092
     * @tc.name      testBundleModule0092
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x5B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0092 begin');
      const flags: number = flagsForIndex(91);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0092 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0093
     * @tc.name      testBundleModule0093
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x5C (ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0093 begin');
      const flags: number = flagsForIndex(92);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0093 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0094
     * @tc.name      testBundleModule0094
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x5D (APPLICATION|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0094 begin');
      const flags: number = flagsForIndex(93);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0094 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0095
     * @tc.name      testBundleModule0095
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x5E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0095 begin');
      const flags: number = flagsForIndex(94);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0095 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0096
     * @tc.name      testBundleModule0096
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x5F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0096 begin');
      const flags: number = flagsForIndex(95);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0096 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0097
     * @tc.name      testBundleModule0097
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x60 (METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0097 begin');
      const flags: number = flagsForIndex(96);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0097 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0098
     * @tc.name      testBundleModule0098
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x61 (APPLICATION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0098 begin');
      const flags: number = flagsForIndex(97);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0098 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0099
     * @tc.name      testBundleModule0099
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x62 (HAP_MODULE|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0099 begin');
      const flags: number = flagsForIndex(98);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0099 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0100
     * @tc.name      testBundleModule0100
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x63 (APPLICATION|HAP_MODULE|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0100 begin');
      const flags: number = flagsForIndex(99);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0100 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0101
     * @tc.name      testBundleModule0101
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x64 (ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0101 begin');
      const flags: number = flagsForIndex(100);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0101 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0102
     * @tc.name      testBundleModule0102
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x65 (APPLICATION|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0102 begin');
      const flags: number = flagsForIndex(101);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0102 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0103
     * @tc.name      testBundleModule0103
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x66 (HAP_MODULE|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0103 begin');
      const flags: number = flagsForIndex(102);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0103 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0104
     * @tc.name      testBundleModule0104
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x67 (APPLICATION|HAP_MODULE|ABILITY|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0104 begin');
      const flags: number = flagsForIndex(103);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0104 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0105
     * @tc.name      testBundleModule0105
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x68 (EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0105 begin');
      const flags: number = flagsForIndex(104);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0105 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0106
     * @tc.name      testBundleModule0106
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x69 (APPLICATION|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0106 begin');
      const flags: number = flagsForIndex(105);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0106 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0107
     * @tc.name      testBundleModule0107
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x6A (HAP_MODULE|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0107 begin');
      const flags: number = flagsForIndex(106);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0107 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0108
     * @tc.name      testBundleModule0108
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x6B (APPLICATION|HAP_MODULE|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0108 begin');
      const flags: number = flagsForIndex(107);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0108 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0109
     * @tc.name      testBundleModule0109
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x6C (ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0109 begin');
      const flags: number = flagsForIndex(108);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0109 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0110
     * @tc.name      testBundleModule0110
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x6D (APPLICATION|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0110 begin');
      const flags: number = flagsForIndex(109);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0110 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0111
     * @tc.name      testBundleModule0111
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x6E (HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0111 begin');
      const flags: number = flagsForIndex(110);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0111 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0112
     * @tc.name      testBundleModule0112
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x6F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0112 begin');
      const flags: number = flagsForIndex(111);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0112 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0113
     * @tc.name      testBundleModule0113
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x70 (PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0113 begin');
      const flags: number = flagsForIndex(112);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0113 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0114
     * @tc.name      testBundleModule0114
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x71 (APPLICATION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0114 begin');
      const flags: number = flagsForIndex(113);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0114 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0115
     * @tc.name      testBundleModule0115
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x72 (HAP_MODULE|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0115 begin');
      const flags: number = flagsForIndex(114);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0115 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0116
     * @tc.name      testBundleModule0116
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x73 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0116 begin');
      const flags: number = flagsForIndex(115);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0116 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0117
     * @tc.name      testBundleModule0117
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x74 (ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0117 begin');
      const flags: number = flagsForIndex(116);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0117 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0118
     * @tc.name      testBundleModule0118
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x75 (APPLICATION|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0118 begin');
      const flags: number = flagsForIndex(117);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0118 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0119
     * @tc.name      testBundleModule0119
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x76 (HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0119 begin');
      const flags: number = flagsForIndex(118);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0119 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0120
     * @tc.name      testBundleModule0120
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x77 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0120 begin');
      const flags: number = flagsForIndex(119);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0120 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0121
     * @tc.name      testBundleModule0121
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x78 (EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0121 begin');
      const flags: number = flagsForIndex(120);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0121 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0122
     * @tc.name      testBundleModule0122
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x79 (APPLICATION|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0122 begin');
      const flags: number = flagsForIndex(121);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0122 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0123
     * @tc.name      testBundleModule0123
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x7A (HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0123 begin');
      const flags: number = flagsForIndex(122);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0123 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0124
     * @tc.name      testBundleModule0124
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x7B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0124 begin');
      const flags: number = flagsForIndex(123);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0124 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0125
     * @tc.name      testBundleModule0125
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x7C (ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0125 begin');
      const flags: number = flagsForIndex(124);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0125 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0126
     * @tc.name      testBundleModule0126
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x7D (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0126 begin');
      const flags: number = flagsForIndex(125);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0126 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0127
     * @tc.name      testBundleModule0127
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x7E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0127 begin');
      const flags: number = flagsForIndex(126);
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0127 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0128
     * @tc.name      testBundleModule0128
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x7F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0128 begin');
      const flags: number = flagsForIndex(127);
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.versionCode).assertEqual(EXPECTED_VERSION_CODE);
      expect(info.versionName).assertEqual(EXPECTED_VERSION_NAME);
      if (hasFlag(flags, FLAG_HAP_MODULE)) {
        const names: string[] = moduleNames(info);
        expect(names.indexOf('entry')).assertLargerOrEqual(0);
        if (hasFlag(flags, FLAG_ABILITY)) {
          expect(hasAbility(info, 'EntryAbility')).assertTrue();
        }
        if (hasFlag(flags, FLAG_EXTENSION)) {
          expect(hasExtension(info, 'EntryBackupAbility')).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0128 end');
    })

  })
}
