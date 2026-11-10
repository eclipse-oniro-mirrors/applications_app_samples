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
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility, Want, bundleManager } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo } from '@kit.CoreFileKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = 'Sample_Stationary';
const MODULE_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;

async function bundleInfo(): Promise<bundleManager.BundleInfo> {
  return await bundleManager.getBundleInfoForSelf(MODULE_FLAGS);
}

async function topAbility(): Promise<UIAbility | null> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  for (let attempt = 0; attempt < 10; attempt++) {
    try {
      const top: UIAbility = await delegator.getCurrentTopAbility();
      if (top !== null && top.context !== null) {
        return top;
      }
    } catch (err) {
      hilog.warn(DOMAIN, TAG, 'getCurrentTopAbility attempt %{public}d threw', attempt);
    }
    await new Promise<void>((resolve: () => void) => setTimeout(resolve, 500));
  }
  hilog.error(DOMAIN, TAG, 'no foreground UIAbility after retries');
  return null;
}

async function mainWindow(): Promise<window.Window | null> {
  const top: UIAbility | null = await topAbility();
  if (top === null) {
    return null;
  }
  try {
    return await window.getLastWindow(top.context);
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'getLastWindow failed: %{public}s', (err as BusinessError).message);
    return null;
  }
}

/**
 * 工程运行上下文契约（包信息 / 窗口 / 前台 Ability）
 *
 * 只校验清单与运行态自洽的部分：包名与测试目标一致、entry 模块与 EntryAbility
 * 已注册、页面 Ability 位于前台、主窗口存在且尺寸为正。不依赖 stationary 能力。
 */
export default function StationaryAppContextTest() {
  describe('StationaryAppContextTest', () => {
    beforeAll(async () => {
      const want: Want = {
        bundleName: abilityDelegatorRegistry.getArguments().bundleName,
        abilityName: 'EntryAbility'
      };
      try {
        await abilityDelegatorRegistry.getAbilityDelegator().startAbility(want);
      } catch (err) {
      }
      await new Promise<void>((resolve: () => void) => setTimeout(resolve, 1500));
    });

    /**
     * @tc.number SUB_STATIONARY_CONTEXT_0100
     * @tc.name testAppContext0001
     * @tc.desc Verify the installed bundle name matches the test target bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testAppContext0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundleInfo();
      expect(info.name).assertEqual(abilityDelegatorRegistry.getArguments().bundleName);
      expect(info.name.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_CONTEXT_0200
     * @tc.name testAppContext0002
     * @tc.desc Verify version code and version name are present and well formed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppContext0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundleInfo();
      expect(info.versionCode > 0).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
      expect(Number.isNaN(Number(info.versionCode))).assertFalse();
    });

    /**
     * @tc.number SUB_STATIONARY_CONTEXT_0300
     * @tc.name testAppContext0003
     * @tc.desc Verify the entry module is installed exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppContext0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundleInfo();
      const names: string[] = [];
      for (const hap of info.hapModulesInfo) {
        names.push(hap.name);
      }
      expect(names.indexOf('entry') >= 0).assertTrue();
      expect(names.filter((name: string) => name === 'entry').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_STATIONARY_CONTEXT_0400
     * @tc.name testAppContext0004
     * @tc.desc Verify the entry module declares EntryAbility and the desired device types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppContext0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundleInfo();
      let found: boolean = false;
      for (const hap of info.hapModulesInfo) {
        if (hap.name !== 'entry') {
          continue;
        }
        found = true;
        expect(hap.deviceTypes.length > 0).assertTrue();
        let hasAbility: boolean = false;
        for (const ability of hap.abilitiesInfo) {
          if (ability.name === 'EntryAbility') {
            hasAbility = true;
          }
        }
        expect(hasAbility).assertTrue();
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_CONTEXT_0500
     * @tc.name testAppContext0005
     * @tc.desc Verify repeated bundle queries return identical metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppContext0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let round = 0; round < 3; round++) {
        const info: bundleManager.BundleInfo = await bundleInfo();
        expect(info.name).assertEqual(abilityDelegatorRegistry.getArguments().bundleName);
        expect(info.versionCode > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STATIONARY_CONTEXT_0600
     * @tc.name testAppContext0006
     * @tc.desc Verify EntryAbility is the foreground ability after launch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppContext0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const top: UIAbility | null = await topAbility();
      expect(top !== null).assertTrue();
      if (top === null) {
        return;
      }
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(top.context.abilityInfo.moduleName).assertEqual('entry');
    });

    /**
     * @tc.number SUB_STATIONARY_CONTEXT_0700
     * @tc.name testAppContext0007
     * @tc.desc Verify the main window exists and reports a positive size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppContext0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const main: window.Window | null = await mainWindow();
      expect(main !== null).assertTrue();
      if (main === null) {
        return;
      }
      const properties: window.WindowProperties = main.getWindowProperties();
      expect(properties.windowRect.width > 0).assertTrue();
      expect(properties.windowRect.height > 0).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_CONTEXT_0800
     * @tc.name testAppContext0008
     * @tc.desc Verify the window can be queried repeatedly without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppContext0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let round = 0; round < 3; round++) {
        const main: window.Window | null = await mainWindow();
        expect(main !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STATIONARY_CONTEXT_1000
     * @tc.name testAppContext0010
     * @tc.desc Verify the entry module registers EntryBackupAbility as a backup extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppContext0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundleInfo();
      const backupExts: bundleManager.ExtensionAbilityInfo[] = [];
      for (const hap of info.hapModulesInfo) {
        for (const ext of hap.extensionAbilitiesInfo) {
          if (ext.extensionAbilityType === bundleManager.ExtensionAbilityType.BACKUP) {
            backupExts.push(ext);
          }
        }
      }
      expect(backupExts.length).assertEqual(1);
      expect(backupExts[0].name).assertEqual('EntryBackupAbility');
      expect(backupExts[0].moduleName).assertEqual('entry');
      expect(backupExts[0].bundleName).assertEqual(abilityDelegatorRegistry.getArguments().bundleName);
    });

    /**
     * @tc.number SUB_STATIONARY_CONTEXT_1100
     * @tc.name testAppContext0011
     * @tc.desc Verify the entry module and its abilities all belong to the bundle under test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppContext0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
      const info: bundleManager.BundleInfo = await bundleInfo();
      let abilityCount: number = 0;
      for (const hap of info.hapModulesInfo) {
        expect(hap.name.length > 0).assertTrue();
        for (const ability of hap.abilitiesInfo) {
          abilityCount++;
          expect(ability.bundleName).assertEqual(bundleName);
          expect(ability.moduleName).assertEqual(hap.name);
        }
      }
      expect(abilityCount > 0).assertTrue();
      expect(info.name).assertEqual(bundleName);
    });

    /**
     * @tc.number SUB_STATIONARY_CONTEXT_0900
     * @tc.name testAppContext0009
     * @tc.desc Verify the ability cache dir is readable through the context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAppContext0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const top: UIAbility | null = await topAbility();
      expect(top !== null).assertTrue();
      if (top === null) {
        return;
      }
      const cacheDir: string = top.context.cacheDir;
      const filesDir: string = top.context.filesDir;
      const codeDir: string = top.context.bundleCodeDir;
      const dirs: string[] = [cacheDir, filesDir, codeDir];
      for (const dir of dirs) {
        expect(dir.length > 0).assertTrue();
        expect(dir.startsWith('/')).assertTrue();
      }
      expect(cacheDir !== filesDir).assertTrue();
      expect(await fileIo.access(cacheDir)).assertTrue();
      expect(await fileIo.access(filesDir)).assertTrue();
      expect(await fileIo.access(codeDir)).assertTrue();
    });
  });
}
