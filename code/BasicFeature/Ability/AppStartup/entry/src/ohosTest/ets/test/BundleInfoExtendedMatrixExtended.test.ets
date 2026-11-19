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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppStartup]';

export default function bundleInfoExtendedMatrixExtendedTest(): void {
  describe('AppStartupBundleInfoExtendedMatrixExtendedTest', () => {
    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0084
     * @tc.name      testBundleInfoExtendedMatrix0084
     * @tc.desc      flags=[ABILITY,SKILL] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0084 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0084 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0085
     * @tc.name      testBundleInfoExtendedMatrix0085
     * @tc.desc      flags=[ABILITY,EXTENSION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0085 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0085 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0086
     * @tc.name      testBundleInfoExtendedMatrix0086
     * @tc.desc      flags=[ABILITY,EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0086 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0086 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0087
     * @tc.name      testBundleInfoExtendedMatrix0087
     * @tc.desc      flags=[ABILITY,EXTENSION] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0087 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.appInfo?.name === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0087 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0088
     * @tc.name      testBundleInfoExtendedMatrix0088
     * @tc.desc      flags=[ABILITY,EXTENSION] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0088 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0088 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0089
     * @tc.name      testBundleInfoExtendedMatrix0089
     * @tc.desc      flags=[ABILITY,EXTENSION] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0089 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0089 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0090
     * @tc.name      testBundleInfoExtendedMatrix0090
     * @tc.desc      flags=[ABILITY,EXTENSION] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0090 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0090 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0091
     * @tc.name      testBundleInfoExtendedMatrix0091
     * @tc.desc      flags=[SKILL,EXTENSION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0091 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0091 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0092
     * @tc.name      testBundleInfoExtendedMatrix0092
     * @tc.desc      flags=[SKILL,EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0092 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0092 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0093
     * @tc.name      testBundleInfoExtendedMatrix0093
     * @tc.desc      flags=[SKILL,EXTENSION] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0093 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.appInfo?.name === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0093 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0094
     * @tc.name      testBundleInfoExtendedMatrix0094
     * @tc.desc      flags=[SKILL,EXTENSION] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0094 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0094 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0095
     * @tc.name      testBundleInfoExtendedMatrix0095
     * @tc.desc      flags=[SKILL,EXTENSION] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0095 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0095 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0096
     * @tc.name      testBundleInfoExtendedMatrix0096
     * @tc.desc      flags=[SKILL,EXTENSION] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0096 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0096 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0097
     * @tc.name      testBundleInfoExtendedMatrix0097
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0097 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0097 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0098
     * @tc.name      testBundleInfoExtendedMatrix0098
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0098 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0098 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0099
     * @tc.name      testBundleInfoExtendedMatrix0099
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0099 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0099 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0100
     * @tc.name      testBundleInfoExtendedMatrix0100
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0100 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter((m) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual3: string = entry[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0100 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0101
     * @tc.name      testBundleInfoExtendedMatrix0101
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0101 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0101 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0102
     * @tc.name      testBundleInfoExtendedMatrix0102
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0102 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0102 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0103
     * @tc.name      testBundleInfoExtendedMatrix0103
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,SKILL] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0103 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0103 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0104
     * @tc.name      testBundleInfoExtendedMatrix0104
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,SKILL] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0104 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0104 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0105
     * @tc.name      testBundleInfoExtendedMatrix0105
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,SKILL] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0105 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0105 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0106
     * @tc.name      testBundleInfoExtendedMatrix0106
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,SKILL] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0106 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter((m) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual3: string = entry[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0106 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0107
     * @tc.name      testBundleInfoExtendedMatrix0107
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,SKILL] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0107 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0107 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0108
     * @tc.name      testBundleInfoExtendedMatrix0108
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,SKILL] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0108 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0108 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0109
     * @tc.name      testBundleInfoExtendedMatrix0109
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,EXTENSION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0109 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0109 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0110
     * @tc.name      testBundleInfoExtendedMatrix0110
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0110 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0110 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0111
     * @tc.name      testBundleInfoExtendedMatrix0111
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,EXTENSION] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0111 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0111 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0112
     * @tc.name      testBundleInfoExtendedMatrix0112
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,EXTENSION] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0112 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter((m) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual3: string = entry[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0112 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0113
     * @tc.name      testBundleInfoExtendedMatrix0113
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,EXTENSION] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0113 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0113 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0114
     * @tc.name      testBundleInfoExtendedMatrix0114
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,EXTENSION] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0114 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0114 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0115
     * @tc.name      testBundleInfoExtendedMatrix0115
     * @tc.desc      flags=[APPLICATION,ABILITY,SKILL] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0115 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0115 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0116
     * @tc.name      testBundleInfoExtendedMatrix0116
     * @tc.desc      flags=[APPLICATION,ABILITY,SKILL] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0116 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0116 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0117
     * @tc.name      testBundleInfoExtendedMatrix0117
     * @tc.desc      flags=[APPLICATION,ABILITY,SKILL] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0117 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0117 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0118
     * @tc.name      testBundleInfoExtendedMatrix0118
     * @tc.desc      flags=[APPLICATION,ABILITY,SKILL] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0118 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0118 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0119
     * @tc.name      testBundleInfoExtendedMatrix0119
     * @tc.desc      flags=[APPLICATION,ABILITY,SKILL] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0119 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0119 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0120
     * @tc.name      testBundleInfoExtendedMatrix0120
     * @tc.desc      flags=[APPLICATION,ABILITY,SKILL] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0120 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0120 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0121
     * @tc.name      testBundleInfoExtendedMatrix0121
     * @tc.desc      flags=[APPLICATION,ABILITY,EXTENSION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0121 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0121 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0122
     * @tc.name      testBundleInfoExtendedMatrix0122
     * @tc.desc      flags=[APPLICATION,ABILITY,EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0122 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0122 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0123
     * @tc.name      testBundleInfoExtendedMatrix0123
     * @tc.desc      flags=[APPLICATION,ABILITY,EXTENSION] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0123 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0123 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0124
     * @tc.name      testBundleInfoExtendedMatrix0124
     * @tc.desc      flags=[APPLICATION,ABILITY,EXTENSION] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0124 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0124 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0125
     * @tc.name      testBundleInfoExtendedMatrix0125
     * @tc.desc      flags=[APPLICATION,ABILITY,EXTENSION] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0125 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0125 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0126
     * @tc.name      testBundleInfoExtendedMatrix0126
     * @tc.desc      flags=[APPLICATION,ABILITY,EXTENSION] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0126 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0126 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0127
     * @tc.name      testBundleInfoExtendedMatrix0127
     * @tc.desc      flags=[APPLICATION,SKILL,EXTENSION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0127 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0127 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0128
     * @tc.name      testBundleInfoExtendedMatrix0128
     * @tc.desc      flags=[APPLICATION,SKILL,EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0128 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0128 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0129
     * @tc.name      testBundleInfoExtendedMatrix0129
     * @tc.desc      flags=[APPLICATION,SKILL,EXTENSION] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0129 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0129 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0130
     * @tc.name      testBundleInfoExtendedMatrix0130
     * @tc.desc      flags=[APPLICATION,SKILL,EXTENSION] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0130 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0130 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0131
     * @tc.name      testBundleInfoExtendedMatrix0131
     * @tc.desc      flags=[APPLICATION,SKILL,EXTENSION] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0131 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0131 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0132
     * @tc.name      testBundleInfoExtendedMatrix0132
     * @tc.desc      flags=[APPLICATION,SKILL,EXTENSION] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0132 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0132 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0133
     * @tc.name      testBundleInfoExtendedMatrix0133
     * @tc.desc      flags=[HAP_MODULE,ABILITY,SKILL] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0133 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0133 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0134
     * @tc.name      testBundleInfoExtendedMatrix0134
     * @tc.desc      flags=[HAP_MODULE,ABILITY,SKILL] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0134 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0134 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0135
     * @tc.name      testBundleInfoExtendedMatrix0135
     * @tc.desc      flags=[HAP_MODULE,ABILITY,SKILL] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0135 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.appInfo?.name === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0135 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0136
     * @tc.name      testBundleInfoExtendedMatrix0136
     * @tc.desc      flags=[HAP_MODULE,ABILITY,SKILL] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0136 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter((m) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual3: string = entry[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0136 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0137
     * @tc.name      testBundleInfoExtendedMatrix0137
     * @tc.desc      flags=[HAP_MODULE,ABILITY,SKILL] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0137 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0137 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0138
     * @tc.name      testBundleInfoExtendedMatrix0138
     * @tc.desc      flags=[HAP_MODULE,ABILITY,SKILL] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0138 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0138 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0139
     * @tc.name      testBundleInfoExtendedMatrix0139
     * @tc.desc      flags=[HAP_MODULE,ABILITY,EXTENSION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0139 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0139 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0140
     * @tc.name      testBundleInfoExtendedMatrix0140
     * @tc.desc      flags=[HAP_MODULE,ABILITY,EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0140 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0140 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0141
     * @tc.name      testBundleInfoExtendedMatrix0141
     * @tc.desc      flags=[HAP_MODULE,ABILITY,EXTENSION] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0141 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.appInfo?.name === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0141 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0142
     * @tc.name      testBundleInfoExtendedMatrix0142
     * @tc.desc      flags=[HAP_MODULE,ABILITY,EXTENSION] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0142 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter((m) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual3: string = entry[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0142 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0143
     * @tc.name      testBundleInfoExtendedMatrix0143
     * @tc.desc      flags=[HAP_MODULE,ABILITY,EXTENSION] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0143 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0143 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0144
     * @tc.name      testBundleInfoExtendedMatrix0144
     * @tc.desc      flags=[HAP_MODULE,ABILITY,EXTENSION] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0144 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0144 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0145
     * @tc.name      testBundleInfoExtendedMatrix0145
     * @tc.desc      flags=[HAP_MODULE,SKILL,EXTENSION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0145 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0145 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0146
     * @tc.name      testBundleInfoExtendedMatrix0146
     * @tc.desc      flags=[HAP_MODULE,SKILL,EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0146 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0146 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0147
     * @tc.name      testBundleInfoExtendedMatrix0147
     * @tc.desc      flags=[HAP_MODULE,SKILL,EXTENSION] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0147 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.appInfo?.name === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0147 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0148
     * @tc.name      testBundleInfoExtendedMatrix0148
     * @tc.desc      flags=[HAP_MODULE,SKILL,EXTENSION] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0148 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter((m) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual3: string = entry[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0148 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0149
     * @tc.name      testBundleInfoExtendedMatrix0149
     * @tc.desc      flags=[HAP_MODULE,SKILL,EXTENSION] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0149 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0149 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0150
     * @tc.name      testBundleInfoExtendedMatrix0150
     * @tc.desc      flags=[HAP_MODULE,SKILL,EXTENSION] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0150 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0150 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0151
     * @tc.name      testBundleInfoExtendedMatrix0151
     * @tc.desc      flags=[ABILITY,SKILL,EXTENSION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0151 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0151 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0152
     * @tc.name      testBundleInfoExtendedMatrix0152
     * @tc.desc      flags=[ABILITY,SKILL,EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0152 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0152 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0153
     * @tc.name      testBundleInfoExtendedMatrix0153
     * @tc.desc      flags=[ABILITY,SKILL,EXTENSION] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0153 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.appInfo?.name === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0153 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0154
     * @tc.name      testBundleInfoExtendedMatrix0154
     * @tc.desc      flags=[ABILITY,SKILL,EXTENSION] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0154 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0154 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0155
     * @tc.name      testBundleInfoExtendedMatrix0155
     * @tc.desc      flags=[ABILITY,SKILL,EXTENSION] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0155 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0155 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0156
     * @tc.name      testBundleInfoExtendedMatrix0156
     * @tc.desc      flags=[ABILITY,SKILL,EXTENSION] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0156 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0156 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0157
     * @tc.name      testBundleInfoExtendedMatrix0157
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY,SKILL] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0157 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0157 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0158
     * @tc.name      testBundleInfoExtendedMatrix0158
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY,SKILL] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0158 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0158 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0159
     * @tc.name      testBundleInfoExtendedMatrix0159
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY,SKILL] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0159 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0159 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0160
     * @tc.name      testBundleInfoExtendedMatrix0160
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY,SKILL] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0160 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter((m) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual3: string = entry[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0160 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0161
     * @tc.name      testBundleInfoExtendedMatrix0161
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY,SKILL] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0161 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0161 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0162
     * @tc.name      testBundleInfoExtendedMatrix0162
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY,SKILL] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0162 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.updateTime >= info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0162 end');
    })
  })
}
