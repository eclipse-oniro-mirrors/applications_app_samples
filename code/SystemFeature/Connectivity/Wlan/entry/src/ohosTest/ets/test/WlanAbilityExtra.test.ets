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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { bundleManager } from '@kit.AbilityKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let info: bundleManager.BundleInfo;

export default function wlanAbilityExtraTest() {
  describe('WlanAbilityExtraTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL); })

    /**
     * @tc.name   ohos.samples.wlan_AbilityExtra_0001
     * @tc.number SUB_WLAN_ABILITY_0001
     * @tc.desc   Verify EntryAbility description is populated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_AbilityExtra_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_AbilityExtra_0001 begin');
      const ability: bundleManager.AbilityInfo = info.hapModulesInfo[0].abilitiesInfo[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.description.length > 0));
      expect(ability.description.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ability.name), String('EntryAbility'));
      expect(ability.name).assertEqual('EntryAbility');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.labelId > 0));
      expect(ability.labelId > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_AbilityExtra_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_AbilityExtra_0002
     * @tc.number SUB_WLAN_ABILITY_0002
     * @tc.desc   Verify EntryAbility skill entity and action lengths.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_AbilityExtra_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_AbilityExtra_0002 begin');
      const skill: bundleManager.SkillInfo = info.hapModulesInfo[0].abilitiesInfo[0].skills[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(skill.entities.length), String(1));
      expect(skill.entities.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(skill.actions.length), String(1));
      expect(skill.actions.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(skill.entities[0]), String('entity.system.home'));
      expect(skill.entities[0]).assertEqual('entity.system.home');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_AbilityExtra_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_AbilityExtra_0003
     * @tc.number SUB_WLAN_ABILITY_0003
     * @tc.desc   Verify EntryAbility export flag and permission scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_AbilityExtra_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_AbilityExtra_0003 begin');
      const ability: bundleManager.AbilityInfo = info.hapModulesInfo[0].abilitiesInfo[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.exported));
      expect(ability.exported).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails[0].usedScene.abilities.includes('MainAbility')));
      expect(info.reqPermissionDetails[0].usedScene.abilities.includes('MainAbility')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails[0].usedScene.when.length > 0));
      expect(info.reqPermissionDetails[0].usedScene.when.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_AbilityExtra_0003 end');
    })
  })
}
