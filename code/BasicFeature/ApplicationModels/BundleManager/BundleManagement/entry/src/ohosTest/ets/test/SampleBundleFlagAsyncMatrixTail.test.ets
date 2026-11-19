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
import { bundleManager } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_BundleManagement]';

export default function sampleBundleFlagAsyncMatrixTailTest(): void {
  describe('SampleBundleFlagAsyncMatrixTailTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0112
     * @tc.name      sampleBundleFlagAsyncMatrix0112
     * @tc.desc      getBundleInfoForSelf mask=0x70
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0112 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0112 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0113
     * @tc.name      sampleBundleFlagAsyncMatrix0113
     * @tc.desc      getBundleInfoForSelf mask=0x71
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0113 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0113 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0114
     * @tc.name      sampleBundleFlagAsyncMatrix0114
     * @tc.desc      getBundleInfoForSelf mask=0x72
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0114 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0114 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0115
     * @tc.name      sampleBundleFlagAsyncMatrix0115
     * @tc.desc      getBundleInfoForSelf mask=0x73
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0115 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0115 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0116
     * @tc.name      sampleBundleFlagAsyncMatrix0116
     * @tc.desc      getBundleInfoForSelf mask=0x74
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0116 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0116 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0117
     * @tc.name      sampleBundleFlagAsyncMatrix0117
     * @tc.desc      getBundleInfoForSelf mask=0x75
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0117 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0117 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0118
     * @tc.name      sampleBundleFlagAsyncMatrix0118
     * @tc.desc      getBundleInfoForSelf mask=0x76
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0118 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0118 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0119
     * @tc.name      sampleBundleFlagAsyncMatrix0119
     * @tc.desc      getBundleInfoForSelf mask=0x77
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0119 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0119 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0120
     * @tc.name      sampleBundleFlagAsyncMatrix0120
     * @tc.desc      getBundleInfoForSelf mask=0x78
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0120 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0120 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0121
     * @tc.name      sampleBundleFlagAsyncMatrix0121
     * @tc.desc      getBundleInfoForSelf mask=0x79
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0121 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0121 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0122
     * @tc.name      sampleBundleFlagAsyncMatrix0122
     * @tc.desc      getBundleInfoForSelf mask=0x7A
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0122 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0122 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0123
     * @tc.name      sampleBundleFlagAsyncMatrix0123
     * @tc.desc      getBundleInfoForSelf mask=0x7B
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0123 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0123 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0124
     * @tc.name      sampleBundleFlagAsyncMatrix0124
     * @tc.desc      getBundleInfoForSelf mask=0x7C
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0124 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0124 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0125
     * @tc.name      sampleBundleFlagAsyncMatrix0125
     * @tc.desc      getBundleInfoForSelf mask=0x7D
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0125 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0125 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0126
     * @tc.name      sampleBundleFlagAsyncMatrix0126
     * @tc.desc      getBundleInfoForSelf mask=0x7E
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0126 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0126 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_ASYNC_0127
     * @tc.name      sampleBundleFlagAsyncMatrix0127
     * @tc.desc      getBundleInfoForSelf mask=0x7F
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagAsyncMatrix0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0127 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.bundlemanagement');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagAsyncMatrix0127 end');
    })
  })
}
