/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityRuntime]';

export default function bundleManagerFlagMatrixTest(): void {
  describe('AbilityRuntimeBundleManagerFlagMatrixTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0001
     * @tc.name      testBundleManagerFlagMatrix0001
     * @tc.desc      getBundleInfoForSelfSync flags=[0] 时不含应用与模块信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0001 begin');
      const flags: number = 0;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual6: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0002
     * @tc.name      testBundleManagerFlagMatrix0002
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0002 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0003
     * @tc.name      testBundleManagerFlagMatrix0003
     * @tc.desc      getBundleInfoForSelfSync flags=[HAP_MODULE] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0003 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0004
     * @tc.name      testBundleManagerFlagMatrix0004
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,HAP_MODULE] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0004 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0005
     * @tc.name      testBundleManagerFlagMatrix0005
     * @tc.desc      getBundleInfoForSelfSync flags=[ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0005 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0006
     * @tc.name      testBundleManagerFlagMatrix0006
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0006 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0007
     * @tc.name      testBundleManagerFlagMatrix0007
     * @tc.desc      getBundleInfoForSelfSync flags=[HAP_MODULE,ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0007 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual6: number = entry[0].abilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(2);
      expect(entry[0].extensionAbilitiesInfo === undefined ||
        entry[0].extensionAbilitiesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0008
     * @tc.name      testBundleManagerFlagMatrix0008
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,HAP_MODULE,ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0008 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual6: number = entry[0].abilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(2);
      expect(entry[0].extensionAbilitiesInfo === undefined ||
        entry[0].extensionAbilitiesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0009
     * @tc.name      testBundleManagerFlagMatrix0009
     * @tc.desc      getBundleInfoForSelfSync flags=[SKILL] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0009 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0010
     * @tc.name      testBundleManagerFlagMatrix0010
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,SKILL] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0010 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0011
     * @tc.name      testBundleManagerFlagMatrix0011
     * @tc.desc      getBundleInfoForSelfSync flags=[HAP_MODULE,SKILL] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0011 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      expect(entry[0].abilitiesInfo === null || entry[0].abilitiesInfo === undefined ||
        entry[0].abilitiesInfo.length === 0).assertTrue();
      expect(entry[0].extensionAbilitiesInfo === undefined ||
        entry[0].extensionAbilitiesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0012
     * @tc.name      testBundleManagerFlagMatrix0012
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,HAP_MODULE,SKILL] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0012 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      expect(entry[0].abilitiesInfo === null || entry[0].abilitiesInfo === undefined ||
        entry[0].abilitiesInfo.length === 0).assertTrue();
      expect(entry[0].extensionAbilitiesInfo === undefined ||
        entry[0].extensionAbilitiesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0013
     * @tc.name      testBundleManagerFlagMatrix0013
     * @tc.desc      getBundleInfoForSelfSync flags=[ABILITY,SKILL] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0013 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0014
     * @tc.name      testBundleManagerFlagMatrix0014
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,ABILITY,SKILL] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0014 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0015
     * @tc.name      testBundleManagerFlagMatrix0015
     * @tc.desc      getBundleInfoForSelfSync flags=[HAP_MODULE,ABILITY,SKILL] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0015 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual6: number = entry[0].abilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(2);
      const actual7: number = entry[0].abilitiesInfo[0].skills.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual(1);
      expect(entry[0].extensionAbilitiesInfo === undefined ||
        entry[0].extensionAbilitiesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0016
     * @tc.name      testBundleManagerFlagMatrix0016
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,HAP_MODULE,ABILITY,SKILL] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0016 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual6: number = entry[0].abilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(2);
      const actual7: number = entry[0].abilitiesInfo[0].skills.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual(1);
      expect(entry[0].extensionAbilitiesInfo === undefined ||
        entry[0].extensionAbilitiesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0017
     * @tc.name      testBundleManagerFlagMatrix0017
     * @tc.desc      getBundleInfoForSelfSync flags=[EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0017 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0018
     * @tc.name      testBundleManagerFlagMatrix0018
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0018 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0019
     * @tc.name      testBundleManagerFlagMatrix0019
     * @tc.desc      getBundleInfoForSelfSync flags=[HAP_MODULE,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0019 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      expect(entry[0].abilitiesInfo === null || entry[0].abilitiesInfo === undefined ||
        entry[0].abilitiesInfo.length === 0).assertTrue();
      const actual6: number = entry[0].extensionAbilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0020
     * @tc.name      testBundleManagerFlagMatrix0020
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,HAP_MODULE,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0020 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      expect(entry[0].abilitiesInfo === null || entry[0].abilitiesInfo === undefined ||
        entry[0].abilitiesInfo.length === 0).assertTrue();
      const actual6: number = entry[0].extensionAbilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0021
     * @tc.name      testBundleManagerFlagMatrix0021
     * @tc.desc      getBundleInfoForSelfSync flags=[ABILITY,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0021 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0022
     * @tc.name      testBundleManagerFlagMatrix0022
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,ABILITY,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0022 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0023
     * @tc.name      testBundleManagerFlagMatrix0023
     * @tc.desc      getBundleInfoForSelfSync flags=[HAP_MODULE,ABILITY,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0023 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual6: number = entry[0].abilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(2);
      const actual7: number = entry[0].extensionAbilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0024
     * @tc.name      testBundleManagerFlagMatrix0024
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,HAP_MODULE,ABILITY,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0024 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual6: number = entry[0].abilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(2);
      const actual7: number = entry[0].extensionAbilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0025
     * @tc.name      testBundleManagerFlagMatrix0025
     * @tc.desc      getBundleInfoForSelfSync flags=[SKILL,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0025 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0026
     * @tc.name      testBundleManagerFlagMatrix0026
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,SKILL,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0026 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0027
     * @tc.name      testBundleManagerFlagMatrix0027
     * @tc.desc      getBundleInfoForSelfSync flags=[HAP_MODULE,SKILL,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0027 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      expect(entry[0].abilitiesInfo === null || entry[0].abilitiesInfo === undefined ||
        entry[0].abilitiesInfo.length === 0).assertTrue();
      const actual6: number = entry[0].extensionAbilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0028
     * @tc.name      testBundleManagerFlagMatrix0028
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,HAP_MODULE,SKILL,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0028 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      expect(entry[0].abilitiesInfo === null || entry[0].abilitiesInfo === undefined ||
        entry[0].abilitiesInfo.length === 0).assertTrue();
      const actual6: number = entry[0].extensionAbilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0029
     * @tc.name      testBundleManagerFlagMatrix0029
     * @tc.desc      getBundleInfoForSelfSync flags=[ABILITY,SKILL,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0029 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0030
     * @tc.name      testBundleManagerFlagMatrix0030
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,ABILITY,SKILL,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0030 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0031
     * @tc.name      testBundleManagerFlagMatrix0031
     * @tc.desc      getBundleInfoForSelfSync flags=[HAP_MODULE,ABILITY,SKILL,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0031 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual6: number = entry[0].abilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(2);
      const actual7: number = entry[0].abilitiesInfo[0].skills.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual(1);
      const actual8: number = entry[0].extensionAbilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a8=${actual8}`);
      expect(actual8).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0032
     * @tc.name      testBundleManagerFlagMatrix0032
     * @tc.desc      getBundleInfoForSelfSync flags=[APPLICATION,HAP_MODULE,ABILITY,SKILL,EXTENSION_ABILITY] 时包含对应信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleManagerFlagMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0032 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.abilityruntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
        (m: bundleManager.HapModuleInfo) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual6: number = entry[0].abilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(2);
      const actual7: number = entry[0].abilitiesInfo[0].skills.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual(1);
      const actual8: number = entry[0].extensionAbilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a8=${actual8}`);
      expect(actual8).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_BUNDLE_FLAG_0033
     * @tc.name      testBundleManagerFlagMatrix0033
     * @tc.desc      getBundleInfoForSelf 异步与同步返回的包名、版本号、模块数一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleManagerFlagMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0033 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const sync: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const async: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 sync.name=${sync.name}`);
      expect(sync.name).assertEqual(async.name);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 sync.versionCode=${sync.versionCode}`);
      expect(sync.versionCode).assertEqual(async.versionCode);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 sync.hapModulesInfo.length=${sync.hapModulesInfo.length}`);
      expect(sync.hapModulesInfo.length).assertEqual(async.hapModulesInfo.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleManagerFlagMatrix0033 end');
    })
  })
}
