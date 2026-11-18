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

function wantBundle(): string {
  return 'com.samples.bundlemanagement';
}

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_BundleManagement]';

export default function bundleMgmtUidMatrixTest(): void {
  describe('BundleMgmtUidMatrixTest', () => {
    /**
     * @tc.number    SUB_BUNDLE_MGMT_UID_0001
     * @tc.name      bundleMgmtUidMatrix0001
     * @tc.desc      按包名与按自身查询得到同一个 uid
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtUidMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtUidMatrix0001 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const selfInfo: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const byName: bundleManager.BundleInfo = bundleManager.getBundleInfoSync(wantBundle(), flags);
      const selfUid: number = selfInfo.appInfo.uid;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 byName.appInfo.uid=${byName.appInfo.uid}`);
      expect(byName.appInfo.uid).assertEqual(selfUid);
      const actual2: boolean = selfUid > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = typeof selfUid;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtUidMatrix0001 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_UID_0002
     * @tc.name      bundleMgmtUidMatrix0002
     * @tc.desc      appInfo 的 uid 与 accessTokenId 均为有效值
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtUidMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtUidMatrix0002 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const uid: number = info.appInfo.uid;
      const tokenId: number = info.appInfo.accessTokenId;
      const actual1: boolean = uid >= 10000;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = tokenId > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = tokenId >= uid;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtUidMatrix0002 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_UID_0003
     * @tc.name      bundleMgmtUidMatrix0003
     * @tc.desc      appInfo.name 与 BundleInfo.name 指向同一应用
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtUidMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtUidMatrix0003 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const appName: string = info.appInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 appName=${appName}`);
      expect(appName).assertEqual(info.name);
      const actual2: boolean = appName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = info.appInfo.uid > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtUidMatrix0003 end');
    })
  })
}
