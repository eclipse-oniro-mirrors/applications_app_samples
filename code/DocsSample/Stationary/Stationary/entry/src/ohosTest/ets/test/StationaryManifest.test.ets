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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { bundleManager } from '@kit.AbilityKit';

const DOMAIN: number = 0xF812;
const TAG: string = 'Sample_Stationary';

const MODULE_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;

async function entryModule(): Promise<bundleManager.HapModuleInfo | null> {
  const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(MODULE_FLAGS);
  for (const hap of info.hapModulesInfo) {
    if (hap.name === 'entry') {
      return hap;
    }
  }
  return null;
}

/**
 * 安装后的入口模块声明契约
 *
 * 读取设备上真实安装的 entry 模块元数据，校验入口 Ability、备份扩展的可见性，
 * 以及模块只声明 default 设备类型。所有断言针对安装产物，而不是复刻源码声明。
 */

function caseEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

function caseBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

export default function StationaryManifestTest() {
  describe('StationaryManifestTest', () => {
    /**
     * @tc.number SUB_STATIONARY_MANIFEST_0100
     * @tc.name testManifest0001
     * @tc.desc Verify the installed entry module exposes exactly one backup capability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testManifest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testManifest0001');
      const hap: bundleManager.HapModuleInfo | null = await entryModule();
      expect(hap !== null).assertTrue();
      if (hap === null) {
        return;
      }
      let backupCount: number = 0;
      for (const ext of hap.extensionAbilitiesInfo) {
        if (ext.extensionAbilityType === bundleManager.ExtensionAbilityType.BACKUP) {
          backupCount++;
        }
      }
      expect(backupCount).assertEqual(1);
      caseEnd('testManifest0001');
    });

    /**
     * @tc.number SUB_STATIONARY_MANIFEST_0200
     * @tc.name testManifest0002
     * @tc.desc Verify the entry module declares a single entry Ability named EntryAbility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testManifest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testManifest0002');
      const hap: bundleManager.HapModuleInfo | null = await entryModule();
      expect(hap !== null).assertTrue();
      if (hap === null) {
        return;
      }
      expect(hap.abilitiesInfo.length).assertEqual(1);
      expect(hap.abilitiesInfo[0].name).assertEqual('EntryAbility');
      expect(hap.abilitiesInfo[0].exported).assertTrue();
      caseEnd('testManifest0002');
    });

    /**
     * @tc.number SUB_STATIONARY_MANIFEST_0300
     * @tc.name testManifest0003
     * @tc.desc Verify the entry module only targets the default device type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testManifest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testManifest0003');
      const hap: bundleManager.HapModuleInfo | null = await entryModule();
      expect(hap !== null).assertTrue();
      if (hap === null) {
        return;
      }
      expect(hap.deviceTypes.length).assertEqual(1);
      expect(hap.deviceTypes[0]).assertEqual('default');
      caseEnd('testManifest0003');
    });

    /**
     * @tc.number SUB_STATIONARY_MANIFEST_0400
     * @tc.name testManifest0004
     * @tc.desc Verify the backup extension stays private to the bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testManifest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testManifest0004');
      const hap: bundleManager.HapModuleInfo | null = await entryModule();
      expect(hap !== null).assertTrue();
      if (hap === null) {
        return;
      }
      expect(hap.extensionAbilitiesInfo.length).assertEqual(1);
      const ext: bundleManager.ExtensionAbilityInfo = hap.extensionAbilitiesInfo[0];
      expect(ext.name).assertEqual('EntryBackupAbility');
      expect(ext.exported).assertFalse();
      caseEnd('testManifest0004');
    });

    /**
     * @tc.number SUB_STATIONARY_MANIFEST_0500
     * @tc.name testManifest0005
     * @tc.desc Verify every installed module belongs to the running bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testManifest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testManifest0005');
      const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(MODULE_FLAGS);
      expect(info.hapModulesInfo.length > 0).assertTrue();
      for (const hap of info.hapModulesInfo) {
        for (const ext of hap.extensionAbilitiesInfo) {
          expect(ext.bundleName).assertEqual(bundleName);
        }
      }
      expect(info.appInfo !== undefined && info.appInfo !== null).assertTrue();
      expect(info.appInfo.name).assertEqual(bundleName);
      caseEnd('testManifest0005');
    });
  });
}
