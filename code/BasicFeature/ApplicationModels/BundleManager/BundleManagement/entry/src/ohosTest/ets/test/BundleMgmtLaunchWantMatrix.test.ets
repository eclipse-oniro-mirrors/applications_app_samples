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
import { bundleManager, Want } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_BundleManagement]';

export default function bundleMgmtLaunchWantMatrixTest(): void {
  describe('BundleMgmtLaunchWantMatrixTest', () => {
    /**
     * @tc.number    SUB_BUNDLE_MGMT_LAUNCH_WANT_0001
     * @tc.name      bundleMgmtLaunchWantMatrix0001
     * @tc.desc      getLaunchWant 返回本应用的入口启动 Want
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtLaunchWantMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtLaunchWantMatrix0001 begin');
      const want: Want = bundleManager.getLaunchWant();
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual('com.samples.bundlemanagement');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual('EntryAbility');
      const actual3: boolean = bundleRead.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtLaunchWantMatrix0001 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_LAUNCH_WANT_0002
     * @tc.name      bundleMgmtLaunchWantMatrix0002
     * @tc.desc      getLaunchWant 的 action 与 entities 指向桌面入口
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtLaunchWantMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtLaunchWantMatrix0002 begin');
      const want: Want = bundleManager.getLaunchWant();
      const actionRead: string = want.action ?? '';
      const entitiesRead: Array<string> = want.entities ?? [];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 actionRead=${actionRead}`);
      expect(actionRead).assertEqual('action.system.home');
      const actual2: boolean = entitiesRead.indexOf('entity.system.home') >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = entitiesRead.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtLaunchWantMatrix0002 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_LAUNCH_WANT_0003
     * @tc.name      bundleMgmtLaunchWantMatrix0003
     * @tc.desc      getLaunchWant 多次调用返回同一条入口 Want
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtLaunchWantMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtLaunchWantMatrix0003 begin');
      const first: Want = bundleManager.getLaunchWant();
      const second: Want = bundleManager.getLaunchWant();
      const firstAbility: string = first.abilityName ?? '';
      const secondAbility: string = second.abilityName ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 firstAbility=${firstAbility}`);
      expect(firstAbility).assertEqual(secondAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 first.bundleName=${first.bundleName}`);
      expect(first.bundleName).assertEqual(second.bundleName);
      const actual3: boolean = firstAbility.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtLaunchWantMatrix0003 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_LAUNCH_WANT_0004
     * @tc.name      bundleMgmtLaunchWantMatrix0004
     * @tc.desc      getLaunchWant 的 moduleName 指向入口模块
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtLaunchWantMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtLaunchWantMatrix0004 begin');
      const want: Want = bundleManager.getLaunchWant();
      const moduleRead: string = want.moduleName ?? '';
      const bundleRead: string = want.bundleName ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual('com.samples.bundlemanagement');
      const actual2: boolean = moduleRead === '' || moduleRead === 'entry';
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = moduleRead.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtLaunchWantMatrix0004 end');
    })
  })
}
