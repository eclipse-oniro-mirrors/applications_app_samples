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
const TAG: string = '[Sample_CommonProblem_BundleModuleTail]';
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


export default function bundleModuleTailTest() {
  describe('bundleModuleTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0193
     * @tc.name      testBundleModule0193
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xC0 (DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0193 begin');
      const flags: number = flagsForIndex(192);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0193 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0194
     * @tc.name      testBundleModule0194
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xC1 (APPLICATION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0194 begin');
      const flags: number = flagsForIndex(193);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0194 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0195
     * @tc.name      testBundleModule0195
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xC2 (HAP_MODULE|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0195 begin');
      const flags: number = flagsForIndex(194);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0195 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0196
     * @tc.name      testBundleModule0196
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xC3 (APPLICATION|HAP_MODULE|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0196 begin');
      const flags: number = flagsForIndex(195);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0196 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0197
     * @tc.name      testBundleModule0197
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xC4 (ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0197 begin');
      const flags: number = flagsForIndex(196);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0197 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0198
     * @tc.name      testBundleModule0198
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xC5 (APPLICATION|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0198 begin');
      const flags: number = flagsForIndex(197);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0198 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0199
     * @tc.name      testBundleModule0199
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xC6 (HAP_MODULE|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0199 begin');
      const flags: number = flagsForIndex(198);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0199 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0200
     * @tc.name      testBundleModule0200
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xC7 (APPLICATION|HAP_MODULE|ABILITY|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0200 begin');
      const flags: number = flagsForIndex(199);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0200 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0201
     * @tc.name      testBundleModule0201
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xC8 (EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0201 begin');
      const flags: number = flagsForIndex(200);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0201 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0202
     * @tc.name      testBundleModule0202
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xC9 (APPLICATION|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0202 begin');
      const flags: number = flagsForIndex(201);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0202 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0203
     * @tc.name      testBundleModule0203
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xCA (HAP_MODULE|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0203 begin');
      const flags: number = flagsForIndex(202);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0203 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0204
     * @tc.name      testBundleModule0204
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xCB (APPLICATION|HAP_MODULE|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0204 begin');
      const flags: number = flagsForIndex(203);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0204 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0205
     * @tc.name      testBundleModule0205
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xCC (ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0205 begin');
      const flags: number = flagsForIndex(204);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0205 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0206
     * @tc.name      testBundleModule0206
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xCD (APPLICATION|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0206 begin');
      const flags: number = flagsForIndex(205);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0206 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0207
     * @tc.name      testBundleModule0207
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xCE (HAP_MODULE|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0207 begin');
      const flags: number = flagsForIndex(206);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0207 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0208
     * @tc.name      testBundleModule0208
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xCF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0208 begin');
      const flags: number = flagsForIndex(207);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0208 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0209
     * @tc.name      testBundleModule0209
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xD0 (PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0209 begin');
      const flags: number = flagsForIndex(208);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0209 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0210
     * @tc.name      testBundleModule0210
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xD1 (APPLICATION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0210 begin');
      const flags: number = flagsForIndex(209);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0210 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0211
     * @tc.name      testBundleModule0211
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xD2 (HAP_MODULE|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0211 begin');
      const flags: number = flagsForIndex(210);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0211 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0212
     * @tc.name      testBundleModule0212
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xD3 (APPLICATION|HAP_MODULE|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0212 begin');
      const flags: number = flagsForIndex(211);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0212 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0213
     * @tc.name      testBundleModule0213
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xD4 (ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0213 begin');
      const flags: number = flagsForIndex(212);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0213 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0214
     * @tc.name      testBundleModule0214
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xD5 (APPLICATION|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0214 begin');
      const flags: number = flagsForIndex(213);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0214 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0215
     * @tc.name      testBundleModule0215
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xD6 (HAP_MODULE|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0215 begin');
      const flags: number = flagsForIndex(214);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0215 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0216
     * @tc.name      testBundleModule0216
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xD7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0216 begin');
      const flags: number = flagsForIndex(215);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0216 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0217
     * @tc.name      testBundleModule0217
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xD8 (EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0217 begin');
      const flags: number = flagsForIndex(216);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0217 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0218
     * @tc.name      testBundleModule0218
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xD9 (APPLICATION|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0218 begin');
      const flags: number = flagsForIndex(217);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0218 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0219
     * @tc.name      testBundleModule0219
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xDA (HAP_MODULE|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0219 begin');
      const flags: number = flagsForIndex(218);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0219 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0220
     * @tc.name      testBundleModule0220
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xDB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0220 begin');
      const flags: number = flagsForIndex(219);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0220 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0221
     * @tc.name      testBundleModule0221
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xDC (ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0221 begin');
      const flags: number = flagsForIndex(220);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0221 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0222
     * @tc.name      testBundleModule0222
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xDD (APPLICATION|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0222 begin');
      const flags: number = flagsForIndex(221);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0222 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0223
     * @tc.name      testBundleModule0223
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xDE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0223 begin');
      const flags: number = flagsForIndex(222);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0223 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0224
     * @tc.name      testBundleModule0224
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xDF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0224 begin');
      const flags: number = flagsForIndex(223);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0224 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0225
     * @tc.name      testBundleModule0225
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xE0 (METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0225 begin');
      const flags: number = flagsForIndex(224);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0225 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0226
     * @tc.name      testBundleModule0226
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xE1 (APPLICATION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0226 begin');
      const flags: number = flagsForIndex(225);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0226 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0227
     * @tc.name      testBundleModule0227
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xE2 (HAP_MODULE|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0227 begin');
      const flags: number = flagsForIndex(226);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0227 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0228
     * @tc.name      testBundleModule0228
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xE3 (APPLICATION|HAP_MODULE|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0228 begin');
      const flags: number = flagsForIndex(227);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0228 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0229
     * @tc.name      testBundleModule0229
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xE4 (ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0229 begin');
      const flags: number = flagsForIndex(228);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0229 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0230
     * @tc.name      testBundleModule0230
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xE5 (APPLICATION|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0230 begin');
      const flags: number = flagsForIndex(229);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0230 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0231
     * @tc.name      testBundleModule0231
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xE6 (HAP_MODULE|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0231 begin');
      const flags: number = flagsForIndex(230);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0231 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0232
     * @tc.name      testBundleModule0232
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xE7 (APPLICATION|HAP_MODULE|ABILITY|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0232 begin');
      const flags: number = flagsForIndex(231);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0232 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0233
     * @tc.name      testBundleModule0233
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xE8 (EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0233 begin');
      const flags: number = flagsForIndex(232);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0233 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0234
     * @tc.name      testBundleModule0234
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xE9 (APPLICATION|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0234 begin');
      const flags: number = flagsForIndex(233);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0234 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0235
     * @tc.name      testBundleModule0235
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xEA (HAP_MODULE|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0235 begin');
      const flags: number = flagsForIndex(234);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0235 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0236
     * @tc.name      testBundleModule0236
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xEB (APPLICATION|HAP_MODULE|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0236 begin');
      const flags: number = flagsForIndex(235);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0236 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0237
     * @tc.name      testBundleModule0237
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xEC (ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0237 begin');
      const flags: number = flagsForIndex(236);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0237 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0238
     * @tc.name      testBundleModule0238
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xED (APPLICATION|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0238 begin');
      const flags: number = flagsForIndex(237);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0238 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0239
     * @tc.name      testBundleModule0239
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xEE (HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0239 begin');
      const flags: number = flagsForIndex(238);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0239 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0240
     * @tc.name      testBundleModule0240
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xEF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0240 begin');
      const flags: number = flagsForIndex(239);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0240 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0241
     * @tc.name      testBundleModule0241
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xF0 (PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0241 begin');
      const flags: number = flagsForIndex(240);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0241 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0242
     * @tc.name      testBundleModule0242
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xF1 (APPLICATION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0242 begin');
      const flags: number = flagsForIndex(241);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0242 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0243
     * @tc.name      testBundleModule0243
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xF2 (HAP_MODULE|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0243 begin');
      const flags: number = flagsForIndex(242);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0243 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0244
     * @tc.name      testBundleModule0244
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xF3 (APPLICATION|HAP_MODULE|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0244 begin');
      const flags: number = flagsForIndex(243);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0244 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0245
     * @tc.name      testBundleModule0245
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xF4 (ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0245 begin');
      const flags: number = flagsForIndex(244);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0245 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0246
     * @tc.name      testBundleModule0246
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xF5 (APPLICATION|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0246 begin');
      const flags: number = flagsForIndex(245);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0246 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0247
     * @tc.name      testBundleModule0247
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xF6 (HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0247 begin');
      const flags: number = flagsForIndex(246);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0247 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0248
     * @tc.name      testBundleModule0248
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xF7 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0248 begin');
      const flags: number = flagsForIndex(247);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0248 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0249
     * @tc.name      testBundleModule0249
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xF8 (EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0249 begin');
      const flags: number = flagsForIndex(248);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0249 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0250
     * @tc.name      testBundleModule0250
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xF9 (APPLICATION|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0250 begin');
      const flags: number = flagsForIndex(249);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0250 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0251
     * @tc.name      testBundleModule0251
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xFA (HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0251 begin');
      const flags: number = flagsForIndex(250);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0251 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0252
     * @tc.name      testBundleModule0252
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xFB (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0252 begin');
      const flags: number = flagsForIndex(251);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0252 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0253
     * @tc.name      testBundleModule0253
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xFC (ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0253 begin');
      const flags: number = flagsForIndex(252);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0253 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0254
     * @tc.name      testBundleModule0254
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xFD (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0254 begin');
      const flags: number = flagsForIndex(253);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0254 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0255
     * @tc.name      testBundleModule0255
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xFE (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0255 begin');
      const flags: number = flagsForIndex(254);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0255 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0256
     * @tc.name      testBundleModule0256
     * @tc.desc      Verify bundleModule with BundleFlag combination 0xFF (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA|DISABLE|SIGNATURE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0256 begin');
      const flags: number = flagsForIndex(255);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0256 end');
    })

  })
}
