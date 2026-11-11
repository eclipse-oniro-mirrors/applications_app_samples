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
const TAG: string = '[Sample_CommonProblem_BundleModuleAdvanced]';
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


export default function bundleModuleAdvancedTest() {
  describe('bundleModuleAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0129
     * @tc.name      testBundleModule0129
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x80 (SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0129 begin');
      const flags: number = flagsForIndex(128);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0129 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0130
     * @tc.name      testBundleModule0130
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x81 (APPLICATION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0130 begin');
      const flags: number = flagsForIndex(129);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0130 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0131
     * @tc.name      testBundleModule0131
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x82 (HAP_MODULE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0131 begin');
      const flags: number = flagsForIndex(130);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0131 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0132
     * @tc.name      testBundleModule0132
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x83 (APPLICATION|HAP_MODULE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0132 begin');
      const flags: number = flagsForIndex(131);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0132 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0133
     * @tc.name      testBundleModule0133
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x84 (ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0133 begin');
      const flags: number = flagsForIndex(132);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0133 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0134
     * @tc.name      testBundleModule0134
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x85 (APPLICATION|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0134 begin');
      const flags: number = flagsForIndex(133);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0134 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0135
     * @tc.name      testBundleModule0135
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x86 (HAP_MODULE|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0135 begin');
      const flags: number = flagsForIndex(134);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0135 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0136
     * @tc.name      testBundleModule0136
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x87 (APPLICATION|HAP_MODULE|ABILITY|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0136 begin');
      const flags: number = flagsForIndex(135);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0136 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0137
     * @tc.name      testBundleModule0137
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x88 (EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0137 begin');
      const flags: number = flagsForIndex(136);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0137 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0138
     * @tc.name      testBundleModule0138
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x89 (APPLICATION|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0138 begin');
      const flags: number = flagsForIndex(137);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0138 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0139
     * @tc.name      testBundleModule0139
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x8A (HAP_MODULE|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0139 begin');
      const flags: number = flagsForIndex(138);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0139 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0140
     * @tc.name      testBundleModule0140
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x8B (APPLICATION|HAP_MODULE|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0140 begin');
      const flags: number = flagsForIndex(139);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0140 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0141
     * @tc.name      testBundleModule0141
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x8C (ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0141 begin');
      const flags: number = flagsForIndex(140);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0141 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0142
     * @tc.name      testBundleModule0142
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x8D (APPLICATION|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0142 begin');
      const flags: number = flagsForIndex(141);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0142 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0143
     * @tc.name      testBundleModule0143
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x8E (HAP_MODULE|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0143 begin');
      const flags: number = flagsForIndex(142);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0143 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0144
     * @tc.name      testBundleModule0144
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x8F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0144 begin');
      const flags: number = flagsForIndex(143);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0144 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0145
     * @tc.name      testBundleModule0145
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x90 (PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0145 begin');
      const flags: number = flagsForIndex(144);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0145 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0146
     * @tc.name      testBundleModule0146
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x91 (APPLICATION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0146 begin');
      const flags: number = flagsForIndex(145);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0146 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0147
     * @tc.name      testBundleModule0147
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x92 (HAP_MODULE|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0147 begin');
      const flags: number = flagsForIndex(146);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0147 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0148
     * @tc.name      testBundleModule0148
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x93 (APPLICATION|HAP_MODULE|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0148 begin');
      const flags: number = flagsForIndex(147);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0148 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0149
     * @tc.name      testBundleModule0149
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x94 (ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0149 begin');
      const flags: number = flagsForIndex(148);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0149 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0150
     * @tc.name      testBundleModule0150
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x95 (APPLICATION|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0150 begin');
      const flags: number = flagsForIndex(149);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0150 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0151
     * @tc.name      testBundleModule0151
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x96 (HAP_MODULE|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0151 begin');
      const flags: number = flagsForIndex(150);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0151 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0152
     * @tc.name      testBundleModule0152
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x97 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0152 begin');
      const flags: number = flagsForIndex(151);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0152 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0153
     * @tc.name      testBundleModule0153
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x98 (EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0153 begin');
      const flags: number = flagsForIndex(152);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0153 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0154
     * @tc.name      testBundleModule0154
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x99 (APPLICATION|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0154 begin');
      const flags: number = flagsForIndex(153);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0154 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0155
     * @tc.name      testBundleModule0155
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x9A (HAP_MODULE|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0155 begin');
      const flags: number = flagsForIndex(154);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0155 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0156
     * @tc.name      testBundleModule0156
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x9B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0156 begin');
      const flags: number = flagsForIndex(155);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0156 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0157
     * @tc.name      testBundleModule0157
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x9C (ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0157 begin');
      const flags: number = flagsForIndex(156);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0157 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0158
     * @tc.name      testBundleModule0158
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x9D (APPLICATION|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0158 begin');
      const flags: number = flagsForIndex(157);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0158 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0159
     * @tc.name      testBundleModule0159
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x9E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0159 begin');
      const flags: number = flagsForIndex(158);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0159 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0160
     * @tc.name      testBundleModule0160
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x9F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0160 begin');
      const flags: number = flagsForIndex(159);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0160 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0161
     * @tc.name      testBundleModule0161
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xA0 (METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0161 begin');
      const flags: number = flagsForIndex(160);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0161 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0162
     * @tc.name      testBundleModule0162
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xA1 (APPLICATION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0162 begin');
      const flags: number = flagsForIndex(161);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0162 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0163
     * @tc.name      testBundleModule0163
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xA2 (HAP_MODULE|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0163 begin');
      const flags: number = flagsForIndex(162);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0163 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0164
     * @tc.name      testBundleModule0164
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xA3 (APPLICATION|HAP_MODULE|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0164 begin');
      const flags: number = flagsForIndex(163);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0164 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0165
     * @tc.name      testBundleModule0165
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xA4 (ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0165 begin');
      const flags: number = flagsForIndex(164);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0165 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0166
     * @tc.name      testBundleModule0166
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xA5 (APPLICATION|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0166 begin');
      const flags: number = flagsForIndex(165);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0166 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0167
     * @tc.name      testBundleModule0167
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xA6 (HAP_MODULE|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0167 begin');
      const flags: number = flagsForIndex(166);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0167 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0168
     * @tc.name      testBundleModule0168
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xA7 (APPLICATION|HAP_MODULE|ABILITY|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0168 begin');
      const flags: number = flagsForIndex(167);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0168 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0169
     * @tc.name      testBundleModule0169
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xA8 (EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0169 begin');
      const flags: number = flagsForIndex(168);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0169 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0170
     * @tc.name      testBundleModule0170
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xA9 (APPLICATION|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0170 begin');
      const flags: number = flagsForIndex(169);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0170 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0171
     * @tc.name      testBundleModule0171
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xAA (HAP_MODULE|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0171 begin');
      const flags: number = flagsForIndex(170);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0171 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0172
     * @tc.name      testBundleModule0172
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xAB (APPLICATION|HAP_MODULE|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0172 begin');
      const flags: number = flagsForIndex(171);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0172 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0173
     * @tc.name      testBundleModule0173
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xAC (ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0173 begin');
      const flags: number = flagsForIndex(172);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0173 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0174
     * @tc.name      testBundleModule0174
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xAD (APPLICATION|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0174 begin');
      const flags: number = flagsForIndex(173);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0174 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0175
     * @tc.name      testBundleModule0175
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xAE (HAP_MODULE|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0175 begin');
      const flags: number = flagsForIndex(174);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0175 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0176
     * @tc.name      testBundleModule0176
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xAF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0176 begin');
      const flags: number = flagsForIndex(175);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0176 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0177
     * @tc.name      testBundleModule0177
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xB0 (PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0177 begin');
      const flags: number = flagsForIndex(176);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0177 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0178
     * @tc.name      testBundleModule0178
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xB1 (APPLICATION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0178 begin');
      const flags: number = flagsForIndex(177);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0178 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0179
     * @tc.name      testBundleModule0179
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xB2 (HAP_MODULE|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0179 begin');
      const flags: number = flagsForIndex(178);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0179 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0180
     * @tc.name      testBundleModule0180
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xB3 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0180 begin');
      const flags: number = flagsForIndex(179);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0180 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0181
     * @tc.name      testBundleModule0181
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xB4 (ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0181 begin');
      const flags: number = flagsForIndex(180);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0181 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0182
     * @tc.name      testBundleModule0182
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xB5 (APPLICATION|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0182 begin');
      const flags: number = flagsForIndex(181);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0182 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0183
     * @tc.name      testBundleModule0183
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xB6 (HAP_MODULE|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0183 begin');
      const flags: number = flagsForIndex(182);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0183 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0184
     * @tc.name      testBundleModule0184
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xB7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0184 begin');
      const flags: number = flagsForIndex(183);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0184 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0185
     * @tc.name      testBundleModule0185
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xB8 (EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0185 begin');
      const flags: number = flagsForIndex(184);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0185 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0186
     * @tc.name      testBundleModule0186
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xB9 (APPLICATION|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0186 begin');
      const flags: number = flagsForIndex(185);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0186 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0187
     * @tc.name      testBundleModule0187
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xBA (HAP_MODULE|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0187 begin');
      const flags: number = flagsForIndex(186);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0187 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0188
     * @tc.name      testBundleModule0188
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xBB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0188 begin');
      const flags: number = flagsForIndex(187);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0188 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0189
     * @tc.name      testBundleModule0189
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xBC (ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0189 begin');
      const flags: number = flagsForIndex(188);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0189 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0190
     * @tc.name      testBundleModule0190
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xBD (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0190 begin');
      const flags: number = flagsForIndex(189);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0190 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0191
     * @tc.name      testBundleModule0191
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xBE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0191 begin');
      const flags: number = flagsForIndex(190);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0191 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0192
     * @tc.name      testBundleModule0192
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xBF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0192 begin');
      const flags: number = flagsForIndex(191);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0192 end');
    })

  })
}
