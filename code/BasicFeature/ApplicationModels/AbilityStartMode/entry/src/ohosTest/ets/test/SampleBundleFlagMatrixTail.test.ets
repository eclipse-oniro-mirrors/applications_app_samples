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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { bundleManager } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_StartMode]';

export default function sampleBundleFlagMatrixTailTest(): void {
  describe('SampleBundleFlagMatrixTailTest', () => {
    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0112
     * @tc.name      sampleBundleFlagMatrix0112
     * @tc.desc      getBundleInfoForSelfSync mask=0x70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0112 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertTrue();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0112 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0113
     * @tc.name      sampleBundleFlagMatrix0113
     * @tc.desc      getBundleInfoForSelfSync mask=0x71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0113 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertFalse();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0113 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0114
     * @tc.name      sampleBundleFlagMatrix0114
     * @tc.desc      getBundleInfoForSelfSync mask=0x72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0114 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertTrue();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0114 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0115
     * @tc.name      sampleBundleFlagMatrix0115
     * @tc.desc      getBundleInfoForSelfSync mask=0x73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0115 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertFalse();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0115 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0116
     * @tc.name      sampleBundleFlagMatrix0116
     * @tc.desc      getBundleInfoForSelfSync mask=0x74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0116 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertTrue();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0116 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0117
     * @tc.name      sampleBundleFlagMatrix0117
     * @tc.desc      getBundleInfoForSelfSync mask=0x75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0117 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertFalse();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0117 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0118
     * @tc.name      sampleBundleFlagMatrix0118
     * @tc.desc      getBundleInfoForSelfSync mask=0x76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0118 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertTrue();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0118 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0119
     * @tc.name      sampleBundleFlagMatrix0119
     * @tc.desc      getBundleInfoForSelfSync mask=0x77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0119 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertFalse();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0119 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0120
     * @tc.name      sampleBundleFlagMatrix0120
     * @tc.desc      getBundleInfoForSelfSync mask=0x78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0120 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertTrue();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0120 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0121
     * @tc.name      sampleBundleFlagMatrix0121
     * @tc.desc      getBundleInfoForSelfSync mask=0x79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0121 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertFalse();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0121 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0122
     * @tc.name      sampleBundleFlagMatrix0122
     * @tc.desc      getBundleInfoForSelfSync mask=0x7A
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0122 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertTrue();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0122 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0123
     * @tc.name      sampleBundleFlagMatrix0123
     * @tc.desc      getBundleInfoForSelfSync mask=0x7B
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0123 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertFalse();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0123 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0124
     * @tc.name      sampleBundleFlagMatrix0124
     * @tc.desc      getBundleInfoForSelfSync mask=0x7C
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0124 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertTrue();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0124 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0125
     * @tc.name      sampleBundleFlagMatrix0125
     * @tc.desc      getBundleInfoForSelfSync mask=0x7D
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0125 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertFalse();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0125 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0126
     * @tc.name      sampleBundleFlagMatrix0126
     * @tc.desc      getBundleInfoForSelfSync mask=0x7E
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0126 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertTrue();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0126 end');
    })

    /**
     * @tc.number    SUB_START_MODE_BUNDLE_FLAG_0127
     * @tc.name      sampleBundleFlagMatrix0127
     * @tc.desc      getBundleInfoForSelfSync mask=0x7F
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0127 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const appAbsent: boolean = info.appInfo === null || info.appInfo === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 appAbsent=${appAbsent}`);
      expect(appAbsent).assertFalse();
      const actual4: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0127 end');
    })
  })
}
