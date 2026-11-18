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

function wantBundle(): string {
  return 'com.samples.bundlemanagement';
}

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_BundleManagement]';

export default function bundleMgmtInfoByNameMatrixTest(): void {
  describe('BundleMgmtInfoByNameMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_BUNDLE_MGMT_INFO_BY_NAME_0001
     * @tc.name      bundleMgmtInfoByNameMatrix0001
     * @tc.desc      getBundleInfoSync 按包名取 APPLICATION 信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtInfoByNameMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0001 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoSync(wantBundle(), flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual(wantBundle());
      const actual2: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0001 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_INFO_BY_NAME_0002
     * @tc.name      bundleMgmtInfoByNameMatrix0002
     * @tc.desc      getBundleInfo 异步按包名取 APPLICATION 信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtInfoByNameMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0002 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfo(wantBundle(), flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual(wantBundle());
      const actual2: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0002 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_INFO_BY_NAME_0003
     * @tc.name      bundleMgmtInfoByNameMatrix0003
     * @tc.desc      getBundleInfoSync 按包名取 HAP_MODULE 信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtInfoByNameMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0003 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoSync(wantBundle(), flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual(wantBundle());
      const actual2: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0003 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_INFO_BY_NAME_0004
     * @tc.name      bundleMgmtInfoByNameMatrix0004
     * @tc.desc      getBundleInfo 异步按包名取 HAP_MODULE 信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtInfoByNameMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0004 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfo(wantBundle(), flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual(wantBundle());
      const actual2: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0004 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_INFO_BY_NAME_0005
     * @tc.name      bundleMgmtInfoByNameMatrix0005
     * @tc.desc      getBundleInfoSync 按包名取 ABILITY 信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtInfoByNameMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0005 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
    bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoSync(wantBundle(), flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual(wantBundle());
      const actual2: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0005 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_INFO_BY_NAME_0006
     * @tc.name      bundleMgmtInfoByNameMatrix0006
     * @tc.desc      getBundleInfo 异步按包名取 ABILITY 信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtInfoByNameMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0006 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
    bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfo(wantBundle(), flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual(wantBundle());
      const actual2: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0006 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_INFO_BY_NAME_0007
     * @tc.name      bundleMgmtInfoByNameMatrix0007
     * @tc.desc      getBundleInfoSync 按包名取 EXTENSION 信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtInfoByNameMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0007 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
    bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoSync(wantBundle(), flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual(wantBundle());
      const actual2: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0007 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_INFO_BY_NAME_0008
     * @tc.name      bundleMgmtInfoByNameMatrix0008
     * @tc.desc      getBundleInfo 异步按包名取 EXTENSION 信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtInfoByNameMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0008 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
    bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfo(wantBundle(), flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual(wantBundle());
      const actual2: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0008 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_INFO_BY_NAME_0009
     * @tc.name      bundleMgmtInfoByNameMatrix0009
     * @tc.desc      getBundleInfoSync 按包名取 METADATA 信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtInfoByNameMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0009 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
    bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoSync(wantBundle(), flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual(wantBundle());
      const actual2: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0009 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_INFO_BY_NAME_0010
     * @tc.name      bundleMgmtInfoByNameMatrix0010
     * @tc.desc      getBundleInfo 异步按包名取 METADATA 信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtInfoByNameMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0010 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
    bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
      const info: bundleManager.BundleInfo = await bundleManager.getBundleInfo(wantBundle(), flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual(wantBundle());
      const actual2: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0010 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_INFO_BY_NAME_0011
     * @tc.name      bundleMgmtInfoByNameMatrix0011
     * @tc.desc      getBundleInfoSync 与 getBundleInfoForSelfSync 取到同一份数据
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtInfoByNameMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0011 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const selfInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const byName: bundleManager.BundleInfo = bundleManager.getBundleInfoSync(wantBundle(), flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 byName.name=${byName.name}`);
      expect(byName.name).assertEqual(selfInfo.name);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 byName.versionCode=${byName.versionCode}`);
      expect(byName.versionCode).assertEqual(selfInfo.versionCode);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 byName.appInfo.accessTokenId=${byName.appInfo.accessTokenId}`);
      expect(byName.appInfo.accessTokenId).assertEqual(selfInfo.appInfo.accessTokenId);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtInfoByNameMatrix0011 end');
    })
  })
}
