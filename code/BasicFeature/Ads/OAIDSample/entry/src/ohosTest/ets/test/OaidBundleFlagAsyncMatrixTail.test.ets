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
const TAG: string = '[Sample_OAID]';

export default function oaidBundleFlagAsyncMatrixTailTest(): void {
  describe('OaidBundleFlagAsyncMatrixTailTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0112
     * @tc.name      oaidBundleFlagAsyncMatrix0112
     * @tc.desc      getBundleInfoForSelf mask=0x70 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0112 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0112 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0113
     * @tc.name      oaidBundleFlagAsyncMatrix0113
     * @tc.desc      getBundleInfoForSelf mask=0x71 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0113 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0113 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0114
     * @tc.name      oaidBundleFlagAsyncMatrix0114
     * @tc.desc      getBundleInfoForSelf mask=0x72 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0114 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0114 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0115
     * @tc.name      oaidBundleFlagAsyncMatrix0115
     * @tc.desc      getBundleInfoForSelf mask=0x73 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0115 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0115 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0116
     * @tc.name      oaidBundleFlagAsyncMatrix0116
     * @tc.desc      getBundleInfoForSelf mask=0x74 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0116 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0116 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0117
     * @tc.name      oaidBundleFlagAsyncMatrix0117
     * @tc.desc      getBundleInfoForSelf mask=0x75 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0117 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0117 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0118
     * @tc.name      oaidBundleFlagAsyncMatrix0118
     * @tc.desc      getBundleInfoForSelf mask=0x76 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0118 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0118 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0119
     * @tc.name      oaidBundleFlagAsyncMatrix0119
     * @tc.desc      getBundleInfoForSelf mask=0x77 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0119 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0119 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0120
     * @tc.name      oaidBundleFlagAsyncMatrix0120
     * @tc.desc      getBundleInfoForSelf mask=0x78 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0120 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0120 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0121
     * @tc.name      oaidBundleFlagAsyncMatrix0121
     * @tc.desc      getBundleInfoForSelf mask=0x79 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0121 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0121 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0122
     * @tc.name      oaidBundleFlagAsyncMatrix0122
     * @tc.desc      getBundleInfoForSelf mask=0x7A 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0122 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0122 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0123
     * @tc.name      oaidBundleFlagAsyncMatrix0123
     * @tc.desc      getBundleInfoForSelf mask=0x7B 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0123 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0123 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0124
     * @tc.name      oaidBundleFlagAsyncMatrix0124
     * @tc.desc      getBundleInfoForSelf mask=0x7C 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0124 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0124 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0125
     * @tc.name      oaidBundleFlagAsyncMatrix0125
     * @tc.desc      getBundleInfoForSelf mask=0x7D 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0125 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0125 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0126
     * @tc.name      oaidBundleFlagAsyncMatrix0126
     * @tc.desc      getBundleInfoForSelf mask=0x7E 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0126 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0126 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_FLAG_ASYNC_0127
     * @tc.name      oaidBundleFlagAsyncMatrix0127
     * @tc.desc      getBundleInfoForSelf mask=0x7F 返回对应粒度信息
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleFlagAsyncMatrix0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0127 begin');
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
      expect(info.name).assertEqual('com.samples.oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleFlagAsyncMatrix0127 end');
    })
  })
}
