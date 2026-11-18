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

export default function bundleMgmtProfileMatrixTest(): void {
  describe('BundleMgmtProfileMatrixTest', () => {
    /**
     * @tc.number    SUB_BUNDLE_MGMT_PROFILE_0001
     * @tc.name      bundleMgmtProfileMatrix0001
     * @tc.desc      EntryAbility 的 ohos.ability.shortcuts 档案可同步读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtProfileMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtProfileMatrix0001 begin');
      const profiles: Array<string> = bundleManager.getProfileByAbilitySync(
        'entry', 'EntryAbility', 'ohos.ability.shortcuts');
      const actual1: boolean = Array.isArray(profiles);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = profiles.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = typeof profiles[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtProfileMatrix0001 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PROFILE_0002
     * @tc.name      bundleMgmtProfileMatrix0002
     * @tc.desc      EntryAbility 的 ohos.ability.shortcuts 档案可异步读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtProfileMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtProfileMatrix0002 begin');
      const profiles: Array<string> = await bundleManager.getProfileByAbility(
        'entry', 'EntryAbility', 'ohos.ability.shortcuts');
      const actual1: boolean = Array.isArray(profiles);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = profiles.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = profiles[0].length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtProfileMatrix0002 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PROFILE_0003
     * @tc.name      bundleMgmtProfileMatrix0003
     * @tc.desc      NewAbility 的 ohos.ability.NewAbility 档案可同步读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtProfileMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtProfileMatrix0003 begin');
      const profiles: Array<string> = bundleManager.getProfileByAbilitySync(
        'entry', 'NewAbility', 'ohos.ability.NewAbility');
      const actual1: boolean = Array.isArray(profiles);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = profiles.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = typeof profiles[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtProfileMatrix0003 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PROFILE_0004
     * @tc.name      bundleMgmtProfileMatrix0004
     * @tc.desc      NewAbility 的 ohos.ability.NewAbility 档案可异步读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtProfileMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtProfileMatrix0004 begin');
      const profiles: Array<string> = await bundleManager.getProfileByAbility(
        'entry', 'NewAbility', 'ohos.ability.NewAbility');
      const actual1: boolean = Array.isArray(profiles);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = profiles.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = profiles[0].length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtProfileMatrix0004 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PROFILE_0005
     * @tc.name      bundleMgmtProfileMatrix0005
     * @tc.desc      NewUIExtAbility 的 ohos.ability.NewUIExtAbility 档案可同步读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtProfileMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtProfileMatrix0005 begin');
      const profiles: Array<string> = bundleManager.getProfileByExtensionAbilitySync(
        'entry', 'NewUIExtAbility', 'ohos.ability.NewUIExtAbility');
      const actual1: boolean = Array.isArray(profiles);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = profiles.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = typeof profiles[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtProfileMatrix0005 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PROFILE_0006
     * @tc.name      bundleMgmtProfileMatrix0006
     * @tc.desc      NewUIExtAbility 的 ohos.ability.NewUIExtAbility 档案可异步读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtProfileMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtProfileMatrix0006 begin');
      const profiles: Array<string> = await bundleManager.getProfileByExtensionAbility(
        'entry', 'NewUIExtAbility', 'ohos.ability.NewUIExtAbility');
      const actual1: boolean = Array.isArray(profiles);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = profiles.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = profiles[0].length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtProfileMatrix0006 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PROFILE_0007
     * @tc.name      bundleMgmtProfileMatrix0007
     * @tc.desc      不传 metadataName 时按 Ability 读取首个配置档案
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtProfileMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtProfileMatrix0007 begin');
      const profiles: Array<string> = bundleManager.getProfileByAbilitySync('entry', 'EntryAbility');
      const actual1: boolean = Array.isArray(profiles);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = profiles.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = typeof profiles[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtProfileMatrix0007 end');
    })
  })
}
