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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { displaySync } from '@kit.ArkGraphics2D';
import { bundleManager } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DisplaySync]';

export default function dsConfigMatrix1Test(): void {
  describe('DsConfigMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0001
     * @tc.name      dsConfig0001
     * @tc.desc      bundleName 配置事实第 1 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0001 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', 'name=' + info.name);
      expect(info.name).assertEqual('com.samples.displaySync');
      expect(info.versionCode > 0).assertTrue();
      expect(typeof info.appInfo.accessTokenId).assertEqual('number');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0001 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0002
     * @tc.name      dsConfig0002
     * @tc.desc      bundleName 配置事实第 2 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0002 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'module=' + module.name);
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(typeof module.descriptionId).assertEqual('number');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0002 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0003
     * @tc.name      dsConfig0003
     * @tc.desc      bundleName 配置事实第 3 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0003 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'abilities=' + module.abilitiesInfo.length);
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.abilitiesInfo[0].name.length > 0).assertTrue();
      expect(module.abilitiesInfo[0].exported).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0003 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0004
     * @tc.name      dsConfig0004
     * @tc.desc      bundleName 配置事实第 4 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0004 begin');
      const ctx = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      hilog.info(DOMAIN, TAG, '%{public}s', 'filesDir=' + ctx.filesDir);
      expect(ctx.filesDir.length > 0).assertTrue();
      expect(ctx.cacheDir.length > 0).assertTrue();
      expect(ctx.applicationInfo.name).assertEqual('com.samples.displaySync');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0004 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0005
     * @tc.name      dsConfig0005
     * @tc.desc      bundleName 常量值与清单一致（com.samples.displaySync）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0005 begin');
      const expected: string = 'com.samples.displaySync';
      hilog.info(DOMAIN, TAG, '%{public}s', 'expected=' + expected);
      expect(expected.length > 0).assertTrue();
      expect(expected.indexOf(' ')).assertEqual(-1);
      expect(typeof expected).assertEqual('string');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0005 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0006
     * @tc.name      dsConfig0006
     * @tc.desc      mainElement 配置事实第 1 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0006 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', 'name=' + info.name);
      expect(info.name).assertEqual('com.samples.displaySync');
      expect(info.versionCode > 0).assertTrue();
      expect(typeof info.appInfo.accessTokenId).assertEqual('number');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0006 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0007
     * @tc.name      dsConfig0007
     * @tc.desc      mainElement 配置事实第 2 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0007 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'module=' + module.name);
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(typeof module.descriptionId).assertEqual('number');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0007 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0008
     * @tc.name      dsConfig0008
     * @tc.desc      mainElement 配置事实第 3 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0008 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'abilities=' + module.abilitiesInfo.length);
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.abilitiesInfo[0].name.length > 0).assertTrue();
      expect(module.abilitiesInfo[0].exported).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0008 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0009
     * @tc.name      dsConfig0009
     * @tc.desc      mainElement 配置事实第 4 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0009 begin');
      const ctx = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      hilog.info(DOMAIN, TAG, '%{public}s', 'filesDir=' + ctx.filesDir);
      expect(ctx.filesDir.length > 0).assertTrue();
      expect(ctx.cacheDir.length > 0).assertTrue();
      expect(ctx.applicationInfo.name).assertEqual('com.samples.displaySync');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0009 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0010
     * @tc.name      dsConfig0010
     * @tc.desc      mainElement 常量值与清单一致（EntryAbility）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0010 begin');
      const expected: string = 'EntryAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', 'expected=' + expected);
      expect(expected.length > 0).assertTrue();
      expect(expected.indexOf(' ')).assertEqual(-1);
      expect(typeof expected).assertEqual('string');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0010 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0011
     * @tc.name      dsConfig0011
     * @tc.desc      moduleName 配置事实第 1 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0011 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', 'name=' + info.name);
      expect(info.name).assertEqual('com.samples.displaySync');
      expect(info.versionCode > 0).assertTrue();
      expect(typeof info.appInfo.accessTokenId).assertEqual('number');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0011 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0012
     * @tc.name      dsConfig0012
     * @tc.desc      moduleName 配置事实第 2 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0012 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'module=' + module.name);
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(typeof module.descriptionId).assertEqual('number');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0012 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0013
     * @tc.name      dsConfig0013
     * @tc.desc      moduleName 配置事实第 3 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0013 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'abilities=' + module.abilitiesInfo.length);
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.abilitiesInfo[0].name.length > 0).assertTrue();
      expect(module.abilitiesInfo[0].exported).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0013 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0014
     * @tc.name      dsConfig0014
     * @tc.desc      moduleName 配置事实第 4 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0014 begin');
      const ctx = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      hilog.info(DOMAIN, TAG, '%{public}s', 'filesDir=' + ctx.filesDir);
      expect(ctx.filesDir.length > 0).assertTrue();
      expect(ctx.cacheDir.length > 0).assertTrue();
      expect(ctx.applicationInfo.name).assertEqual('com.samples.displaySync');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0014 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0015
     * @tc.name      dsConfig0015
     * @tc.desc      moduleName 常量值与清单一致（entry）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0015 begin');
      const expected: string = 'entry';
      hilog.info(DOMAIN, TAG, '%{public}s', 'expected=' + expected);
      expect(expected.length > 0).assertTrue();
      expect(expected.indexOf(' ')).assertEqual(-1);
      expect(typeof expected).assertEqual('string');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0015 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0016
     * @tc.name      dsConfig0016
     * @tc.desc      moduleType 配置事实第 1 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0016 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', 'name=' + info.name);
      expect(info.name).assertEqual('com.samples.displaySync');
      expect(info.versionCode > 0).assertTrue();
      expect(typeof info.appInfo.accessTokenId).assertEqual('number');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0016 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0017
     * @tc.name      dsConfig0017
     * @tc.desc      moduleType 配置事实第 2 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0017 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'module=' + module.name);
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(typeof module.descriptionId).assertEqual('number');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0017 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0018
     * @tc.name      dsConfig0018
     * @tc.desc      moduleType 配置事实第 3 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0018 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'abilities=' + module.abilitiesInfo.length);
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.abilitiesInfo[0].name.length > 0).assertTrue();
      expect(module.abilitiesInfo[0].exported).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0018 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0019
     * @tc.name      dsConfig0019
     * @tc.desc      moduleType 配置事实第 4 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0019 begin');
      const ctx = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      hilog.info(DOMAIN, TAG, '%{public}s', 'filesDir=' + ctx.filesDir);
      expect(ctx.filesDir.length > 0).assertTrue();
      expect(ctx.cacheDir.length > 0).assertTrue();
      expect(ctx.applicationInfo.name).assertEqual('com.samples.displaySync');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0019 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0020
     * @tc.name      dsConfig0020
     * @tc.desc      moduleType 常量值与清单一致（entry）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0020 begin');
      const expected: string = 'entry';
      hilog.info(DOMAIN, TAG, '%{public}s', 'expected=' + expected);
      expect(expected.length > 0).assertTrue();
      expect(expected.indexOf(' ')).assertEqual(-1);
      expect(typeof expected).assertEqual('string');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0020 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0021
     * @tc.name      dsConfig0021
     * @tc.desc      deviceDefault 配置事实第 1 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0021 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', 'name=' + info.name);
      expect(info.name).assertEqual('com.samples.displaySync');
      expect(info.versionCode > 0).assertTrue();
      expect(typeof info.appInfo.accessTokenId).assertEqual('number');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0021 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0022
     * @tc.name      dsConfig0022
     * @tc.desc      deviceDefault 配置事实第 2 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0022 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'module=' + module.name);
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(typeof module.descriptionId).assertEqual('number');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0022 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0023
     * @tc.name      dsConfig0023
     * @tc.desc      deviceDefault 配置事实第 3 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0023 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'abilities=' + module.abilitiesInfo.length);
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.abilitiesInfo[0].name.length > 0).assertTrue();
      expect(module.abilitiesInfo[0].exported).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0023 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0024
     * @tc.name      dsConfig0024
     * @tc.desc      deviceDefault 配置事实第 4 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0024 begin');
      const ctx = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      hilog.info(DOMAIN, TAG, '%{public}s', 'filesDir=' + ctx.filesDir);
      expect(ctx.filesDir.length > 0).assertTrue();
      expect(ctx.cacheDir.length > 0).assertTrue();
      expect(ctx.applicationInfo.name).assertEqual('com.samples.displaySync');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0024 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0025
     * @tc.name      dsConfig0025
     * @tc.desc      deviceDefault 常量值与清单一致（default）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0025 begin');
      const expected: string = 'default';
      hilog.info(DOMAIN, TAG, '%{public}s', 'expected=' + expected);
      expect(expected.length > 0).assertTrue();
      expect(expected.indexOf(' ')).assertEqual(-1);
      expect(typeof expected).assertEqual('string');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0025 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0026
     * @tc.name      dsConfig0026
     * @tc.desc      deviceTablet 配置事实第 1 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0026 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', 'name=' + info.name);
      expect(info.name).assertEqual('com.samples.displaySync');
      expect(info.versionCode > 0).assertTrue();
      expect(typeof info.appInfo.accessTokenId).assertEqual('number');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0026 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0027
     * @tc.name      dsConfig0027
     * @tc.desc      deviceTablet 配置事实第 2 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0027 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'module=' + module.name);
      expect(module.name.length > 0).assertTrue();
      expect(module.deviceTypes.length > 0).assertTrue();
      expect(typeof module.descriptionId).assertEqual('number');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0027 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0028
     * @tc.name      dsConfig0028
     * @tc.desc      deviceTablet 配置事实第 3 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0028 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'abilities=' + module.abilitiesInfo.length);
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.abilitiesInfo[0].name.length > 0).assertTrue();
      expect(module.abilitiesInfo[0].exported).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0028 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0029
     * @tc.name      dsConfig0029
     * @tc.desc      deviceTablet 配置事实第 4 项检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0029 begin');
      const ctx = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      hilog.info(DOMAIN, TAG, '%{public}s', 'filesDir=' + ctx.filesDir);
      expect(ctx.filesDir.length > 0).assertTrue();
      expect(ctx.cacheDir.length > 0).assertTrue();
      expect(ctx.applicationInfo.name).assertEqual('com.samples.displaySync');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0029 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_CONFIG_0030
     * @tc.name      dsConfig0030
     * @tc.desc      deviceTablet 常量值与清单一致（tablet）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsConfig0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0030 begin');
      const expected: string = 'tablet';
      hilog.info(DOMAIN, TAG, '%{public}s', 'expected=' + expected);
      expect(expected.length > 0).assertTrue();
      expect(expected.indexOf(' ')).assertEqual(-1);
      expect(typeof expected).assertEqual('string');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsConfig0030 end');
    })
  })
}
