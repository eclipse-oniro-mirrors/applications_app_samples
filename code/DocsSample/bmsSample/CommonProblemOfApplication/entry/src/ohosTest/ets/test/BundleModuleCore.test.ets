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
const TAG: string = '[Sample_CommonProblem_BundleModuleCore]';
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


export default function bundleModuleCoreTest() {
  describe('bundleModuleCoreTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0001
     * @tc.name      testBundleModule0001
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x00 (DEFAULT).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0001 begin');
      const flags: number = flagsForIndex(0);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0001 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0002
     * @tc.name      testBundleModule0002
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x01 (APPLICATION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0002 begin');
      const flags: number = flagsForIndex(1);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0002 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0003
     * @tc.name      testBundleModule0003
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x02 (HAP_MODULE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0003 begin');
      const flags: number = flagsForIndex(2);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0003 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0004
     * @tc.name      testBundleModule0004
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x03 (APPLICATION|HAP_MODULE).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0004 begin');
      const flags: number = flagsForIndex(3);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0004 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0005
     * @tc.name      testBundleModule0005
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x04 (ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0005 begin');
      const flags: number = flagsForIndex(4);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0005 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0006
     * @tc.name      testBundleModule0006
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x05 (APPLICATION|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0006 begin');
      const flags: number = flagsForIndex(5);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0006 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0007
     * @tc.name      testBundleModule0007
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x06 (HAP_MODULE|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0007 begin');
      const flags: number = flagsForIndex(6);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0007 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0008
     * @tc.name      testBundleModule0008
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x07 (APPLICATION|HAP_MODULE|ABILITY).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0008 begin');
      const flags: number = flagsForIndex(7);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0008 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0009
     * @tc.name      testBundleModule0009
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x08 (EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0009 begin');
      const flags: number = flagsForIndex(8);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0009 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0010
     * @tc.name      testBundleModule0010
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x09 (APPLICATION|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0010 begin');
      const flags: number = flagsForIndex(9);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0010 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0011
     * @tc.name      testBundleModule0011
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x0A (HAP_MODULE|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0011 begin');
      const flags: number = flagsForIndex(10);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0011 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0012
     * @tc.name      testBundleModule0012
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x0B (APPLICATION|HAP_MODULE|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0012 begin');
      const flags: number = flagsForIndex(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0012 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0013
     * @tc.name      testBundleModule0013
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x0C (ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0013 begin');
      const flags: number = flagsForIndex(12);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0013 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0014
     * @tc.name      testBundleModule0014
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x0D (APPLICATION|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0014 begin');
      const flags: number = flagsForIndex(13);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0014 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0015
     * @tc.name      testBundleModule0015
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x0E (HAP_MODULE|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0015 begin');
      const flags: number = flagsForIndex(14);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0015 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0016
     * @tc.name      testBundleModule0016
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x0F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0016 begin');
      const flags: number = flagsForIndex(15);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0016 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0017
     * @tc.name      testBundleModule0017
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x10 (PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0017 begin');
      const flags: number = flagsForIndex(16);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0017 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0018
     * @tc.name      testBundleModule0018
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x11 (APPLICATION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0018 begin');
      const flags: number = flagsForIndex(17);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0018 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0019
     * @tc.name      testBundleModule0019
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x12 (HAP_MODULE|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0019 begin');
      const flags: number = flagsForIndex(18);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0019 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0020
     * @tc.name      testBundleModule0020
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x13 (APPLICATION|HAP_MODULE|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0020 begin');
      const flags: number = flagsForIndex(19);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0020 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0021
     * @tc.name      testBundleModule0021
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x14 (ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0021 begin');
      const flags: number = flagsForIndex(20);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0021 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0022
     * @tc.name      testBundleModule0022
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x15 (APPLICATION|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0022 begin');
      const flags: number = flagsForIndex(21);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0022 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0023
     * @tc.name      testBundleModule0023
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x16 (HAP_MODULE|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0023 begin');
      const flags: number = flagsForIndex(22);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0023 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0024
     * @tc.name      testBundleModule0024
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x17 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0024 begin');
      const flags: number = flagsForIndex(23);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0024 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0025
     * @tc.name      testBundleModule0025
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x18 (EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0025 begin');
      const flags: number = flagsForIndex(24);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0025 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0026
     * @tc.name      testBundleModule0026
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x19 (APPLICATION|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0026 begin');
      const flags: number = flagsForIndex(25);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0026 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0027
     * @tc.name      testBundleModule0027
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x1A (HAP_MODULE|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0027 begin');
      const flags: number = flagsForIndex(26);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0027 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0028
     * @tc.name      testBundleModule0028
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x1B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0028 begin');
      const flags: number = flagsForIndex(27);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0028 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0029
     * @tc.name      testBundleModule0029
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x1C (ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0029 begin');
      const flags: number = flagsForIndex(28);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0029 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0030
     * @tc.name      testBundleModule0030
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x1D (APPLICATION|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0030 begin');
      const flags: number = flagsForIndex(29);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0030 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0031
     * @tc.name      testBundleModule0031
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x1E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0031 begin');
      const flags: number = flagsForIndex(30);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0031 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0032
     * @tc.name      testBundleModule0032
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x1F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0032 begin');
      const flags: number = flagsForIndex(31);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0032 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0033
     * @tc.name      testBundleModule0033
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x20 (METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0033 begin');
      const flags: number = flagsForIndex(32);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0033 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0034
     * @tc.name      testBundleModule0034
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x21 (APPLICATION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0034 begin');
      const flags: number = flagsForIndex(33);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0034 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0035
     * @tc.name      testBundleModule0035
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x22 (HAP_MODULE|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0035 begin');
      const flags: number = flagsForIndex(34);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0035 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0036
     * @tc.name      testBundleModule0036
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x23 (APPLICATION|HAP_MODULE|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0036 begin');
      const flags: number = flagsForIndex(35);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0036 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0037
     * @tc.name      testBundleModule0037
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x24 (ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0037 begin');
      const flags: number = flagsForIndex(36);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0037 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0038
     * @tc.name      testBundleModule0038
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x25 (APPLICATION|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0038 begin');
      const flags: number = flagsForIndex(37);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0038 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0039
     * @tc.name      testBundleModule0039
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x26 (HAP_MODULE|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0039 begin');
      const flags: number = flagsForIndex(38);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0039 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0040
     * @tc.name      testBundleModule0040
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x27 (APPLICATION|HAP_MODULE|ABILITY|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0040 begin');
      const flags: number = flagsForIndex(39);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0040 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0041
     * @tc.name      testBundleModule0041
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x28 (EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0041 begin');
      const flags: number = flagsForIndex(40);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0041 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0042
     * @tc.name      testBundleModule0042
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x29 (APPLICATION|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0042 begin');
      const flags: number = flagsForIndex(41);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0042 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0043
     * @tc.name      testBundleModule0043
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x2A (HAP_MODULE|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0043 begin');
      const flags: number = flagsForIndex(42);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0043 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0044
     * @tc.name      testBundleModule0044
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x2B (APPLICATION|HAP_MODULE|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0044 begin');
      const flags: number = flagsForIndex(43);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0044 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0045
     * @tc.name      testBundleModule0045
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x2C (ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0045 begin');
      const flags: number = flagsForIndex(44);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0045 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0046
     * @tc.name      testBundleModule0046
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x2D (APPLICATION|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0046 begin');
      const flags: number = flagsForIndex(45);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0046 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0047
     * @tc.name      testBundleModule0047
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x2E (HAP_MODULE|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0047 begin');
      const flags: number = flagsForIndex(46);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0047 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0048
     * @tc.name      testBundleModule0048
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x2F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0048 begin');
      const flags: number = flagsForIndex(47);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0048 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0049
     * @tc.name      testBundleModule0049
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x30 (PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0049 begin');
      const flags: number = flagsForIndex(48);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0049 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0050
     * @tc.name      testBundleModule0050
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x31 (APPLICATION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0050 begin');
      const flags: number = flagsForIndex(49);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0050 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0051
     * @tc.name      testBundleModule0051
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x32 (HAP_MODULE|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0051 begin');
      const flags: number = flagsForIndex(50);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0051 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0052
     * @tc.name      testBundleModule0052
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x33 (APPLICATION|HAP_MODULE|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0052 begin');
      const flags: number = flagsForIndex(51);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0052 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0053
     * @tc.name      testBundleModule0053
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x34 (ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0053 begin');
      const flags: number = flagsForIndex(52);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0053 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0054
     * @tc.name      testBundleModule0054
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x35 (APPLICATION|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0054 begin');
      const flags: number = flagsForIndex(53);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0054 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0055
     * @tc.name      testBundleModule0055
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x36 (HAP_MODULE|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0055 begin');
      const flags: number = flagsForIndex(54);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0055 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0056
     * @tc.name      testBundleModule0056
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x37 (APPLICATION|HAP_MODULE|ABILITY|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0056 begin');
      const flags: number = flagsForIndex(55);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0056 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0057
     * @tc.name      testBundleModule0057
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x38 (EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0057 begin');
      const flags: number = flagsForIndex(56);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0057 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0058
     * @tc.name      testBundleModule0058
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x39 (APPLICATION|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0058 begin');
      const flags: number = flagsForIndex(57);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0058 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0059
     * @tc.name      testBundleModule0059
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x3A (HAP_MODULE|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0059 begin');
      const flags: number = flagsForIndex(58);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0059 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0060
     * @tc.name      testBundleModule0060
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x3B (APPLICATION|HAP_MODULE|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0060 begin');
      const flags: number = flagsForIndex(59);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0060 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0061
     * @tc.name      testBundleModule0061
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x3C (ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0061 begin');
      const flags: number = flagsForIndex(60);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0061 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0062
     * @tc.name      testBundleModule0062
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x3D (APPLICATION|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0062 begin');
      const flags: number = flagsForIndex(61);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0062 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0063
     * @tc.name      testBundleModule0063
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x3E (HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0063 begin');
      const flags: number = flagsForIndex(62);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0063 end');
    })

    /**
     * @tc.number    SUB_COMMON_PROBLEM_MODULE_0064
     * @tc.name      testBundleModule0064
     * @tc.desc      Verify bundleModule with BundleFlag combination 0x3F (APPLICATION|HAP_MODULE|ABILITY|EXTENSION|PERMISSION|METADATA).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testBundleModule0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0064 begin');
      const flags: number = flagsForIndex(63);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleModule0064 end');
    })

  })
}
