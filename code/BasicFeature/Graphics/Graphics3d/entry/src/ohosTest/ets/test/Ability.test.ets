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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { bundleManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Graphics3d]';
const delegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function abilityTest(): void {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.number    G3D_ABILITY_0001
     * @tc.name      g3d_context_001
     * @tc.desc      应用上下文与沙箱目录自检
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3d_context_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3d_context_001 begin');
      const context = delegator.getAppContext();
      expect(context.applicationInfo.name).assertEqual('com.samples.graphics3d');
      expect(context.filesDir.length > 0).assertTrue();
      expect(typeof context.applicationInfo.releaseType).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3d_context_001 end');
    })

    /**
     * @tc.number    G3D_ABILITY_0002
     * @tc.name      g3d_bundle_001
     * @tc.desc      包信息版本与令牌自检
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3d_bundle_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3d_bundle_001 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual('com.samples.graphics3d');
      expect(info.versionCode > 0).assertTrue();
      expect(info.appInfo.accessTokenId > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3d_bundle_001 end');
    })

    /**
     * @tc.number    G3D_ABILITY_0003
     * @tc.name      g3d_module_001
     * @tc.desc      模块入口能力自检
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3d_module_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3d_module_001 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      expect(module.mainElementName).assertEqual('EntryAbility');
      expect(module.name.length > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3d_module_001 end');
    })

    /**
     * @tc.number    G3D_ABILITY_0004
     * @tc.name      g3d_ability_001
     * @tc.desc      模块能力列表自检
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3d_ability_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3d_ability_001 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.abilitiesInfo[0].name.length > 0).assertTrue();
      expect(info.hapModulesInfo.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3d_ability_001 end');
    })

    /**
     * @tc.number    G3D_ABILITY_0005
     * @tc.name      g3d_appcontext_001
     * @tc.desc      应用级上下文目录一致性自检
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('g3d_appcontext_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3d_appcontext_001 begin');
      const appContext = delegator.getAppContext();
      const appLevel = appContext.getApplicationContext();
      expect(appLevel !== null && appLevel !== undefined).assertTrue();
      expect(appLevel.filesDir.length > 0).assertTrue();
      expect(appLevel.applicationInfo.name).assertEqual('com.samples.graphics3d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'g3d_appcontext_001 end');
    })
  });
}
