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
const TAG: string = '[Sample_UniversalLink]';

export default function bundleInfoExtendedMatrixTailTest(): void {
  describe('UniversalLinkBundleInfoExtendedMatrixTailTest', () => {
    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0164
     * @tc.name      testBundleInfoExtendedMatrix0164
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY,EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0164 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0164 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0165
     * @tc.name      testBundleInfoExtendedMatrix0165
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY,EXTENSION] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0165 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.example.universallink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0165 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0166
     * @tc.name      testBundleInfoExtendedMatrix0166
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY,EXTENSION] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0166 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0166 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0167
     * @tc.name      testBundleInfoExtendedMatrix0167
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY,EXTENSION] 时 installTime/updateTime/appIndex 字段符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0167 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0167 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0168
     * @tc.name      testBundleInfoExtendedMatrix0168
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,ABILITY,EXTENSION] 时安装时间与更新时间先后顺序符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0168 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0168 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0169
     * @tc.name      testBundleInfoExtendedMatrix0169
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,SKILL,EXTENSION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0169 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.example.universallink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0169 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0170
     * @tc.name      testBundleInfoExtendedMatrix0170
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,SKILL,EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0170 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0170 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0171
     * @tc.name      testBundleInfoExtendedMatrix0171
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,SKILL,EXTENSION] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0171 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.example.universallink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0171 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0172
     * @tc.name      testBundleInfoExtendedMatrix0172
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,SKILL,EXTENSION] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0172 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0172 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0173
     * @tc.name      testBundleInfoExtendedMatrix0173
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,SKILL,EXTENSION] 时 installTime/updateTime/appIndex 字段符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0173 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0173 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0174
     * @tc.name      testBundleInfoExtendedMatrix0174
     * @tc.desc      flags=[APPLICATION,HAP_MODULE,SKILL,EXTENSION] 时安装时间与更新时间先后顺序符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0174 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0174 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0175
     * @tc.name      testBundleInfoExtendedMatrix0175
     * @tc.desc      flags=[APPLICATION,ABILITY,SKILL,EXTENSION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0175 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.example.universallink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0175 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0176
     * @tc.name      testBundleInfoExtendedMatrix0176
     * @tc.desc      flags=[APPLICATION,ABILITY,SKILL,EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0176 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0176 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0177
     * @tc.name      testBundleInfoExtendedMatrix0177
     * @tc.desc      flags=[APPLICATION,ABILITY,SKILL,EXTENSION] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0177 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.example.universallink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0177 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0178
     * @tc.name      testBundleInfoExtendedMatrix0178
     * @tc.desc      flags=[APPLICATION,ABILITY,SKILL,EXTENSION] 时模块信息为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0178 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.example.universallink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      expect(info.hapModulesInfo === null || info.hapModulesInfo === undefined ||
        info.hapModulesInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0178 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0179
     * @tc.name      testBundleInfoExtendedMatrix0179
     * @tc.desc      flags=[APPLICATION,ABILITY,SKILL,EXTENSION] 时 installTime/updateTime/appIndex 字段符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0179 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0179 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0180
     * @tc.name      testBundleInfoExtendedMatrix0180
     * @tc.desc      flags=[APPLICATION,ABILITY,SKILL,EXTENSION] 时安装时间与更新时间先后顺序符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0180 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0180 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0181
     * @tc.name      testBundleInfoExtendedMatrix0181
     * @tc.desc      flags=[HAP_MODULE,ABILITY,SKILL,EXTENSION] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0181 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.example.universallink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0181 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0182
     * @tc.name      testBundleInfoExtendedMatrix0182
     * @tc.desc      flags=[HAP_MODULE,ABILITY,SKILL,EXTENSION] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0182 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0182 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0183
     * @tc.name      testBundleInfoExtendedMatrix0183
     * @tc.desc      flags=[HAP_MODULE,ABILITY,SKILL,EXTENSION] 时应用信息字段为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0183 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.example.universallink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual3: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0183 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0184
     * @tc.name      testBundleInfoExtendedMatrix0184
     * @tc.desc      flags=[HAP_MODULE,ABILITY,SKILL,EXTENSION] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0184 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0184 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0185
     * @tc.name      testBundleInfoExtendedMatrix0185
     * @tc.desc      flags=[HAP_MODULE,ABILITY,SKILL,EXTENSION] 时 installTime/updateTime/appIndex 字段符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0185 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0185 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0186
     * @tc.name      testBundleInfoExtendedMatrix0186
     * @tc.desc      flags=[HAP_MODULE,ABILITY,SKILL,EXTENSION] 时安装时间与更新时间先后顺序符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0186 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0186 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0187
     * @tc.name      testBundleInfoExtendedMatrix0187
     * @tc.desc      flags=[ALL] 时包名、版本号、版本名与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0187 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.example.universallink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0187 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0188
     * @tc.name      testBundleInfoExtendedMatrix0188
     * @tc.desc      flags=[ALL] 时厂商、最低兼容版本、目标 API 与基线一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0188 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.vendor=${info.vendor}`);
      expect(info.vendor).assertEqual('example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.minCompatibleVersionCode=${info.minCompatibleVersionCode}`);
      expect(info.minCompatibleVersionCode).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.targetVersion=${info.targetVersion}`);
      expect(info.targetVersion).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0188 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0189
     * @tc.name      testBundleInfoExtendedMatrix0189
     * @tc.desc      flags=[ALL] 时应用信息字段存在且正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0189 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.example.universallink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
      const actual3: boolean = info.appInfo.description === undefined || info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0189 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0190
     * @tc.name      testBundleInfoExtendedMatrix0190
     * @tc.desc      flags=[ALL] 时模块信息包含 entry 且长度正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0190 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0190 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0191
     * @tc.name      testBundleInfoExtendedMatrix0191
     * @tc.desc      flags=[ALL] 时 installTime/updateTime/appIndex 字段符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0191 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0191 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_BUNDLE_INFO_EXTENDED_0192
     * @tc.name      testBundleInfoExtendedMatrix0192
     * @tc.desc      flags=[ALL] 时安装时间与更新时间先后顺序符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testBundleInfoExtendedMatrix0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0192 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBundleInfoExtendedMatrix0192 end');
    })
  })
}
