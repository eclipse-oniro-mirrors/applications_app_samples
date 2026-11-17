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
const TAG: string = '[Sample_CommonProblem_BundleModule]';
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


export default function bundleModuleTest() {
  describe('bundleModuleTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    // 数据驱动生成：偶数下标走同步接口，奇数下标走异步接口，覆盖 256 种 BundleFlag 组合。
    for (let index: number = 0; index <= 255; index += 2) {
      const caseNo: string = `${index + 1}`.padStart(4, '0');
      const caseName: string = `testBundleModule${caseNo}`;
      it(caseName, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        hilog.info(DOMAIN, TAG, '%{public}s', `${caseName} begin`);
        const flags: number = flagsForIndex(index);
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
        hilog.info(DOMAIN, TAG, '%{public}s', `${caseName} end`);
      });
    }

    for (let index: number = 1; index <= 255; index += 2) {
      const caseNo: string = `${index + 1}`.padStart(4, '0');
      const caseName: string = `testBundleModule${caseNo}`;
      it(caseName, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', `${caseName} begin`);
        const flags: number = flagsForIndex(index);
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
        hilog.info(DOMAIN, TAG, '%{public}s', `${caseName} end`);
      });
    }
  })
}
