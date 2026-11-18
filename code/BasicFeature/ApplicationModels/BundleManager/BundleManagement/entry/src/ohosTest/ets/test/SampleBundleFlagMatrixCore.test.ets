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
const TAG: string = '[Sample_BundleManagement]';

export default function sampleBundleFlagMatrixCoreTest(): void {
  describe('SampleBundleFlagMatrixCoreTest', () => {
    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0001
     * @tc.name      sampleBundleFlagMatrix0001
     * @tc.desc      getBundleInfoForSelfSync mask=0x1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0001 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0001 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0002
     * @tc.name      sampleBundleFlagMatrix0002
     * @tc.desc      getBundleInfoForSelfSync mask=0x2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0002 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0002 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0003
     * @tc.name      sampleBundleFlagMatrix0003
     * @tc.desc      getBundleInfoForSelfSync mask=0x3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0003 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0003 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0004
     * @tc.name      sampleBundleFlagMatrix0004
     * @tc.desc      getBundleInfoForSelfSync mask=0x4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0004 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0004 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0005
     * @tc.name      sampleBundleFlagMatrix0005
     * @tc.desc      getBundleInfoForSelfSync mask=0x5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0005 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0005 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0006
     * @tc.name      sampleBundleFlagMatrix0006
     * @tc.desc      getBundleInfoForSelfSync mask=0x6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0006 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0006 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0007
     * @tc.name      sampleBundleFlagMatrix0007
     * @tc.desc      getBundleInfoForSelfSync mask=0x7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0007 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0007 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0008
     * @tc.name      sampleBundleFlagMatrix0008
     * @tc.desc      getBundleInfoForSelfSync mask=0x8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0008 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0008 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0009
     * @tc.name      sampleBundleFlagMatrix0009
     * @tc.desc      getBundleInfoForSelfSync mask=0x9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0009 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0009 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0010
     * @tc.name      sampleBundleFlagMatrix0010
     * @tc.desc      getBundleInfoForSelfSync mask=0xA
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0010 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0010 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0011
     * @tc.name      sampleBundleFlagMatrix0011
     * @tc.desc      getBundleInfoForSelfSync mask=0xB
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0011 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0011 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0012
     * @tc.name      sampleBundleFlagMatrix0012
     * @tc.desc      getBundleInfoForSelfSync mask=0xC
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0012 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0012 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0013
     * @tc.name      sampleBundleFlagMatrix0013
     * @tc.desc      getBundleInfoForSelfSync mask=0xD
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0013 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0013 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0014
     * @tc.name      sampleBundleFlagMatrix0014
     * @tc.desc      getBundleInfoForSelfSync mask=0xE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0014 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0014 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0015
     * @tc.name      sampleBundleFlagMatrix0015
     * @tc.desc      getBundleInfoForSelfSync mask=0xF
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0015 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0015 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0016
     * @tc.name      sampleBundleFlagMatrix0016
     * @tc.desc      getBundleInfoForSelfSync mask=0x10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0016 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0016 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0017
     * @tc.name      sampleBundleFlagMatrix0017
     * @tc.desc      getBundleInfoForSelfSync mask=0x11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0017 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0017 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0018
     * @tc.name      sampleBundleFlagMatrix0018
     * @tc.desc      getBundleInfoForSelfSync mask=0x12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0018 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0018 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0019
     * @tc.name      sampleBundleFlagMatrix0019
     * @tc.desc      getBundleInfoForSelfSync mask=0x13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0019 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0019 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0020
     * @tc.name      sampleBundleFlagMatrix0020
     * @tc.desc      getBundleInfoForSelfSync mask=0x14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0020 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0020 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0021
     * @tc.name      sampleBundleFlagMatrix0021
     * @tc.desc      getBundleInfoForSelfSync mask=0x15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0021 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0021 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0022
     * @tc.name      sampleBundleFlagMatrix0022
     * @tc.desc      getBundleInfoForSelfSync mask=0x16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0022 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0022 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0023
     * @tc.name      sampleBundleFlagMatrix0023
     * @tc.desc      getBundleInfoForSelfSync mask=0x17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0023 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0023 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0024
     * @tc.name      sampleBundleFlagMatrix0024
     * @tc.desc      getBundleInfoForSelfSync mask=0x18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0024 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0024 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0025
     * @tc.name      sampleBundleFlagMatrix0025
     * @tc.desc      getBundleInfoForSelfSync mask=0x19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0025 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0025 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0026
     * @tc.name      sampleBundleFlagMatrix0026
     * @tc.desc      getBundleInfoForSelfSync mask=0x1A
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0026 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0026 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0027
     * @tc.name      sampleBundleFlagMatrix0027
     * @tc.desc      getBundleInfoForSelfSync mask=0x1B
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0027 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0027 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0028
     * @tc.name      sampleBundleFlagMatrix0028
     * @tc.desc      getBundleInfoForSelfSync mask=0x1C
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0028 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0028 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0029
     * @tc.name      sampleBundleFlagMatrix0029
     * @tc.desc      getBundleInfoForSelfSync mask=0x1D
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0029 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0029 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0030
     * @tc.name      sampleBundleFlagMatrix0030
     * @tc.desc      getBundleInfoForSelfSync mask=0x1E
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0030 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0030 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0031
     * @tc.name      sampleBundleFlagMatrix0031
     * @tc.desc      getBundleInfoForSelfSync mask=0x1F
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0031 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0031 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0032
     * @tc.name      sampleBundleFlagMatrix0032
     * @tc.desc      getBundleInfoForSelfSync mask=0x20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0032 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0032 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0033
     * @tc.name      sampleBundleFlagMatrix0033
     * @tc.desc      getBundleInfoForSelfSync mask=0x21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0033 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0033 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0034
     * @tc.name      sampleBundleFlagMatrix0034
     * @tc.desc      getBundleInfoForSelfSync mask=0x22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0034 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0034 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0035
     * @tc.name      sampleBundleFlagMatrix0035
     * @tc.desc      getBundleInfoForSelfSync mask=0x23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0035 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0035 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0036
     * @tc.name      sampleBundleFlagMatrix0036
     * @tc.desc      getBundleInfoForSelfSync mask=0x24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0036 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0036 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0037
     * @tc.name      sampleBundleFlagMatrix0037
     * @tc.desc      getBundleInfoForSelfSync mask=0x25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0037 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0037 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0038
     * @tc.name      sampleBundleFlagMatrix0038
     * @tc.desc      getBundleInfoForSelfSync mask=0x26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0038 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0038 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0039
     * @tc.name      sampleBundleFlagMatrix0039
     * @tc.desc      getBundleInfoForSelfSync mask=0x27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0039 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0039 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0040
     * @tc.name      sampleBundleFlagMatrix0040
     * @tc.desc      getBundleInfoForSelfSync mask=0x28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0040 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0040 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0041
     * @tc.name      sampleBundleFlagMatrix0041
     * @tc.desc      getBundleInfoForSelfSync mask=0x29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0041 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0041 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0042
     * @tc.name      sampleBundleFlagMatrix0042
     * @tc.desc      getBundleInfoForSelfSync mask=0x2A
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0042 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0042 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0043
     * @tc.name      sampleBundleFlagMatrix0043
     * @tc.desc      getBundleInfoForSelfSync mask=0x2B
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0043 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0043 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0044
     * @tc.name      sampleBundleFlagMatrix0044
     * @tc.desc      getBundleInfoForSelfSync mask=0x2C
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0044 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0044 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0045
     * @tc.name      sampleBundleFlagMatrix0045
     * @tc.desc      getBundleInfoForSelfSync mask=0x2D
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0045 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0045 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0046
     * @tc.name      sampleBundleFlagMatrix0046
     * @tc.desc      getBundleInfoForSelfSync mask=0x2E
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0046 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0046 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0047
     * @tc.name      sampleBundleFlagMatrix0047
     * @tc.desc      getBundleInfoForSelfSync mask=0x2F
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0047 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0047 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0048
     * @tc.name      sampleBundleFlagMatrix0048
     * @tc.desc      getBundleInfoForSelfSync mask=0x30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0048 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0048 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0049
     * @tc.name      sampleBundleFlagMatrix0049
     * @tc.desc      getBundleInfoForSelfSync mask=0x31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0049 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0049 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0050
     * @tc.name      sampleBundleFlagMatrix0050
     * @tc.desc      getBundleInfoForSelfSync mask=0x32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0050 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0050 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0051
     * @tc.name      sampleBundleFlagMatrix0051
     * @tc.desc      getBundleInfoForSelfSync mask=0x33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0051 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0051 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0052
     * @tc.name      sampleBundleFlagMatrix0052
     * @tc.desc      getBundleInfoForSelfSync mask=0x34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0052 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0052 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0053
     * @tc.name      sampleBundleFlagMatrix0053
     * @tc.desc      getBundleInfoForSelfSync mask=0x35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0053 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0053 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0054
     * @tc.name      sampleBundleFlagMatrix0054
     * @tc.desc      getBundleInfoForSelfSync mask=0x36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0054 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0054 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0055
     * @tc.name      sampleBundleFlagMatrix0055
     * @tc.desc      getBundleInfoForSelfSync mask=0x37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0055 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0055 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_BUNDLE_FLAG_0056
     * @tc.name      sampleBundleFlagMatrix0056
     * @tc.desc      getBundleInfoForSelfSync mask=0x38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleBundleFlagMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0056 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleBundleFlagMatrix0056 end');
    })
  })
}
