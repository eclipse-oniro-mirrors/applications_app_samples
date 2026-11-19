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

export default function bundleInfoExtendedMatrixCoreTest(): void {
  describe('AppStartupBundleInfoExtendedMatrixCoreTest', () => {
    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0001
     * @tc.name      testBundleInfoExtendedMatrix0001
     * @tc.desc      flags=[0] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0001 begin');
      const flags: number = 0;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0001 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0002
     * @tc.name      testBundleInfoExtendedMatrix0002
     * @tc.desc      flags=[0] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0002 begin');
      const flags: number = 0;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0002 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0003
     * @tc.name      testBundleInfoExtendedMatrix0003
     * @tc.desc      flags=[0] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0003 begin');
      const flags: number = 0;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.appInfo?.name === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0003 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0004
     * @tc.name      testBundleInfoExtendedMatrix0004
     * @tc.desc      flags=[0] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0004 begin');
      const flags: number = 0;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0004 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0005
     * @tc.name      testBundleInfoExtendedMatrix0005
     * @tc.desc      flags=[0] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0005 begin');
      const flags: number = 0;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0005 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0006
     * @tc.name      testBundleInfoExtendedMatrix0006
     * @tc.desc      flags=[0] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0006 begin');
      const flags: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0006 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0007
     * @tc.name      testBundleInfoExtendedMatrix0007
     * @tc.desc      flags=[APPLICATION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0007 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0007 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0008
     * @tc.name      testBundleInfoExtendedMatrix0008
     * @tc.desc      flags=[APPLICATION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0008 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0008 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0009
     * @tc.name      testBundleInfoExtendedMatrix0009
     * @tc.desc      flags=[APPLICATION] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0009 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0009 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0010
     * @tc.name      testBundleInfoExtendedMatrix0010
     * @tc.desc      flags=[APPLICATION] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0010 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0010 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0011
     * @tc.name      testBundleInfoExtendedMatrix0011
     * @tc.desc      flags=[APPLICATION] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0011 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0011 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0012
     * @tc.name      testBundleInfoExtendedMatrix0012
     * @tc.desc      flags=[APPLICATION] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0012 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0012 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0013
     * @tc.name      testBundleInfoExtendedMatrix0013
     * @tc.desc      flags=[HAP_MODULE] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0013 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0013 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0014
     * @tc.name      testBundleInfoExtendedMatrix0014
     * @tc.desc      flags=[HAP_MODULE] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0014 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0014 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0015
     * @tc.name      testBundleInfoExtendedMatrix0015
     * @tc.desc      flags=[HAP_MODULE] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0015 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.appInfo?.name === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0015 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0016
     * @tc.name      testBundleInfoExtendedMatrix0016
     * @tc.desc      flags=[HAP_MODULE] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0016 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter((m) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual3: string = entry[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0016 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0017
     * @tc.name      testBundleInfoExtendedMatrix0017
     * @tc.desc      flags=[HAP_MODULE] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0017 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0017 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0018
     * @tc.name      testBundleInfoExtendedMatrix0018
     * @tc.desc      flags=[HAP_MODULE] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0018 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0018 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0019
     * @tc.name      testBundleInfoExtendedMatrix0019
     * @tc.desc      flags=[ABILITY] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0019 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0019 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0020
     * @tc.name      testBundleInfoExtendedMatrix0020
     * @tc.desc      flags=[ABILITY] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0020 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0020 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0021
     * @tc.name      testBundleInfoExtendedMatrix0021
     * @tc.desc      flags=[ABILITY] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0021 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.appInfo?.name === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0021 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0022
     * @tc.name      testBundleInfoExtendedMatrix0022
     * @tc.desc      flags=[ABILITY] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0022 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0022 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0023
     * @tc.name      testBundleInfoExtendedMatrix0023
     * @tc.desc      flags=[ABILITY] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0023 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0023 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0024
     * @tc.name      testBundleInfoExtendedMatrix0024
     * @tc.desc      flags=[ABILITY] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0024 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0024 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0025
     * @tc.name      testBundleInfoExtendedMatrix0025
     * @tc.desc      flags=[SKILL] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0025 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0025 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0026
     * @tc.name      testBundleInfoExtendedMatrix0026
     * @tc.desc      flags=[SKILL] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0026 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0026 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0027
     * @tc.name      testBundleInfoExtendedMatrix0027
     * @tc.desc      flags=[SKILL] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0027 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.appInfo?.name === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0027 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0028
     * @tc.name      testBundleInfoExtendedMatrix0028
     * @tc.desc      flags=[SKILL] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0028 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0028 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0029
     * @tc.name      testBundleInfoExtendedMatrix0029
     * @tc.desc      flags=[SKILL] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0029 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0029 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0030
     * @tc.name      testBundleInfoExtendedMatrix0030
     * @tc.desc      flags=[SKILL] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0030 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0030 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0031
     * @tc.name      testBundleInfoExtendedMatrix0031
     * @tc.desc      flags=[EXTENSION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0031 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0031 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0032
     * @tc.name      testBundleInfoExtendedMatrix0032
     * @tc.desc      flags=[EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0032 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0032 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0033
     * @tc.name      testBundleInfoExtendedMatrix0033
     * @tc.desc      flags=[EXTENSION] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0033 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.appInfo?.name === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0033 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0034
     * @tc.name      testBundleInfoExtendedMatrix0034
     * @tc.desc      flags=[EXTENSION] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0034 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0034 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0035
     * @tc.name      testBundleInfoExtendedMatrix0035
     * @tc.desc      flags=[EXTENSION] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0035 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0035 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0036
     * @tc.name      testBundleInfoExtendedMatrix0036
     * @tc.desc      flags=[EXTENSION] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0036 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0036 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0037
     * @tc.name      testBundleInfoExtendedMatrix0037
     * @tc.desc      flags=[APPLICATION,HAP_MODULE] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0037 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0037 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0038
     * @tc.name      testBundleInfoExtendedMatrix0038
     * @tc.desc      flags=[APPLICATION,HAP_MODULE] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0038 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0038 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0039
     * @tc.name      testBundleInfoExtendedMatrix0039
     * @tc.desc      flags=[APPLICATION,HAP_MODULE] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0039 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0039 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0040
     * @tc.name      testBundleInfoExtendedMatrix0040
     * @tc.desc      flags=[APPLICATION,HAP_MODULE] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0040 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.hapModulesInfo.length=${info.hapModulesInfo.length}`);
      expect(info.hapModulesInfo.length).assertEqual(2);
      const entry: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter((m) => m.name === 'entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 entry.length=${entry.length}`);
      expect(entry.length).assertEqual(1);
      const actual3: string = entry[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0040 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0041
     * @tc.name      testBundleInfoExtendedMatrix0041
     * @tc.desc      flags=[APPLICATION,HAP_MODULE] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0041 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.installTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof info.updateTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0041 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0042
     * @tc.name      testBundleInfoExtendedMatrix0042
     * @tc.desc      flags=[APPLICATION,HAP_MODULE] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0042 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0042 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0043
     * @tc.name      testBundleInfoExtendedMatrix0043
     * @tc.desc      flags=[APPLICATION,ABILITY] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0043 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0043 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0044
     * @tc.name      testBundleInfoExtendedMatrix0044
     * @tc.desc      flags=[APPLICATION,ABILITY] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0044 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0044 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0045
     * @tc.name      testBundleInfoExtendedMatrix0045
     * @tc.desc      flags=[APPLICATION,ABILITY] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0045 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0045 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0046
     * @tc.name      testBundleInfoExtendedMatrix0046
     * @tc.desc      flags=[APPLICATION,ABILITY] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0046 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0046 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0047
     * @tc.name      testBundleInfoExtendedMatrix0047
     * @tc.desc      flags=[APPLICATION,ABILITY] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0047 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0047 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0048
     * @tc.name      testBundleInfoExtendedMatrix0048
     * @tc.desc      flags=[APPLICATION,ABILITY] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0048 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0048 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0049
     * @tc.name      testBundleInfoExtendedMatrix0049
     * @tc.desc      flags=[APPLICATION,SKILL] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0049 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0049 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0050
     * @tc.name      testBundleInfoExtendedMatrix0050
     * @tc.desc      flags=[APPLICATION,SKILL] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0050 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0050 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0051
     * @tc.name      testBundleInfoExtendedMatrix0051
     * @tc.desc      flags=[APPLICATION,SKILL] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0051 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0051 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0052
     * @tc.name      testBundleInfoExtendedMatrix0052
     * @tc.desc      flags=[APPLICATION,SKILL] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0052 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0052 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0053
     * @tc.name      testBundleInfoExtendedMatrix0053
     * @tc.desc      flags=[APPLICATION,SKILL] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0053 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0053 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0054
     * @tc.name      testBundleInfoExtendedMatrix0054
     * @tc.desc      flags=[APPLICATION,SKILL] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0054 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0054 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0055
     * @tc.name      testBundleInfoExtendedMatrix0055
     * @tc.desc      flags=[APPLICATION,EXTENSION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0055 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0055 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0056
     * @tc.name      testBundleInfoExtendedMatrix0056
     * @tc.desc      flags=[APPLICATION,EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0056 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0056 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0057
     * @tc.name      testBundleInfoExtendedMatrix0057
     * @tc.desc      flags=[APPLICATION,EXTENSION] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0057 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0057 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0058
     * @tc.name      testBundleInfoExtendedMatrix0058
     * @tc.desc      flags=[APPLICATION,EXTENSION] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0058 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0058 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0059
     * @tc.name      testBundleInfoExtendedMatrix0059
     * @tc.desc      flags=[APPLICATION,EXTENSION] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0059 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0059 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0060
     * @tc.name      testBundleInfoExtendedMatrix0060
     * @tc.desc      flags=[APPLICATION,EXTENSION] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBundleInfoExtendedMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0060 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0060 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0061
     * @tc.name      testBundleInfoExtendedMatrix0061
     * @tc.desc      flags=[HAP_MODULE,ABILITY] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0061 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0061 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0062
     * @tc.name      testBundleInfoExtendedMatrix0062
     * @tc.desc      flags=[HAP_MODULE,ABILITY] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0062 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0062 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0063
     * @tc.name      testBundleInfoExtendedMatrix0063
     * @tc.desc      flags=[HAP_MODULE,ABILITY] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0063 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.appInfo?.name === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0063 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0064
     * @tc.name      testBundleInfoExtendedMatrix0064
     * @tc.desc      flags=[HAP_MODULE,ABILITY] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0064 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0064 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0065
     * @tc.name      testBundleInfoExtendedMatrix0065
     * @tc.desc      flags=[HAP_MODULE,ABILITY] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0065 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0065 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0066
     * @tc.name      testBundleInfoExtendedMatrix0066
     * @tc.desc      flags=[HAP_MODULE,ABILITY] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0066 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0066 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0067
     * @tc.name      testBundleInfoExtendedMatrix0067
     * @tc.desc      flags=[HAP_MODULE,SKILL] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0067 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0067 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0068
     * @tc.name      testBundleInfoExtendedMatrix0068
     * @tc.desc      flags=[HAP_MODULE,SKILL] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0068 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0068 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0069
     * @tc.name      testBundleInfoExtendedMatrix0069
     * @tc.desc      flags=[HAP_MODULE,SKILL] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0069 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0069 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0070
     * @tc.name      testBundleInfoExtendedMatrix0070
     * @tc.desc      flags=[HAP_MODULE,SKILL] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0070 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0070 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0071
     * @tc.name      testBundleInfoExtendedMatrix0071
     * @tc.desc      flags=[HAP_MODULE,SKILL] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0071 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0071 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0072
     * @tc.name      testBundleInfoExtendedMatrix0072
     * @tc.desc      flags=[HAP_MODULE,SKILL] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0072 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0072 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0073
     * @tc.name      testBundleInfoExtendedMatrix0073
     * @tc.desc      flags=[HAP_MODULE,EXTENSION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0073 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0073 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0074
     * @tc.name      testBundleInfoExtendedMatrix0074
     * @tc.desc      flags=[HAP_MODULE,EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0074 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0074 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0075
     * @tc.name      testBundleInfoExtendedMatrix0075
     * @tc.desc      flags=[HAP_MODULE,EXTENSION] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0075 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0075 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0076
     * @tc.name      testBundleInfoExtendedMatrix0076
     * @tc.desc      flags=[HAP_MODULE,EXTENSION] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0076 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0076 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0077
     * @tc.name      testBundleInfoExtendedMatrix0077
     * @tc.desc      flags=[HAP_MODULE,EXTENSION] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0077 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0077 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0078
     * @tc.name      testBundleInfoExtendedMatrix0078
     * @tc.desc      flags=[HAP_MODULE,EXTENSION] 时安装时间与更新时间关系符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0078 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0078 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0079
     * @tc.name      testBundleInfoExtendedMatrix0079
     * @tc.desc      flags=[ABILITY,SKILL] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0079 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0079 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0080
     * @tc.name      testBundleInfoExtendedMatrix0080
     * @tc.desc      flags=[ABILITY,SKILL] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0080 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0080 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0081
     * @tc.name      testBundleInfoExtendedMatrix0081
     * @tc.desc      flags=[ABILITY,SKILL] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0081 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0081 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0082
     * @tc.name      testBundleInfoExtendedMatrix0082
     * @tc.desc      flags=[ABILITY,SKILL] 时模块信息长度为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0082 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      const actual1: number = (info.hapModulesInfo ?? []).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0082 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_BUNDLE_INFO_EXTENDED_0083
     * @tc.name      testBundleInfoExtendedMatrix0083
     * @tc.desc      flags=[ABILITY,SKILL] 时 installTime/updateTime/appIndex 字段类型符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0083 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0083 end');
    })
  })
}
