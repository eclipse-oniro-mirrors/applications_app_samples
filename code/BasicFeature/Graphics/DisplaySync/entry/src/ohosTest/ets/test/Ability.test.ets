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

import { describe, expect, it } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { bundleManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DisplaySync]';
const BUNDLE: string = 'com.samples.displaySync';
const delegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function abilityTest(): void {
  describe('ActsAbilityTest', () => {
    it('displaySync_context_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'displaySync_context_001 begin');
      const context = delegator.getAppContext();
      expect(context.applicationInfo.name).assertEqual(BUNDLE);
      expect(context.filesDir.length > 0).assertTrue();
      expect(typeof context.applicationInfo.releaseType).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'displaySync_context_001 end');
    });

    it('displaySync_bundle_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'displaySync_bundle_001 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      expect(info.name).assertEqual(BUNDLE);
      expect(info.versionCode > 0).assertTrue();
      expect(info.appInfo.accessTokenId > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'displaySync_bundle_001 end');
    });

    it('displaySync_module_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'displaySync_module_001 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      expect(module.mainElementName).assertEqual('EntryAbility');
      expect(module.abilitiesInfo.length > 0).assertTrue();
      expect(module.name.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'displaySync_module_001 end');
    });
  });
}
