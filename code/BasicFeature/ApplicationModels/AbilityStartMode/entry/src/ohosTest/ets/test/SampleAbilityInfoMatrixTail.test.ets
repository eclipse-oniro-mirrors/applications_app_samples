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

export default function sampleAbilityInfoMatrixTailTest(): void {
  describe('SampleAbilityInfoMatrixTailTest', () => {
    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0052
     * @tc.name      sampleAbilityInfoMatrix0052
     * @tc.desc      SpecifiedAbility 的 deviceTypes.length 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0052 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SpecifiedAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      const actual2: boolean = target.deviceTypes.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0052 end');
    })
  })
}
