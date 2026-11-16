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
import bundleManager from '@ohos.bundle.bundleManager';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let info: bundleManager.BundleInfo;

export default function wlanAbilityExtraTest() {
  describe('WlanAbilityExtraTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL); })

    /**
     * @tc.name   testWlanAbilityDesc0001
     * @tc.number SUB_WLAN_ABILITY_0001
     * @tc.desc   Verify EntryAbility description is populated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAbilityDesc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAbilityDesc0001 begin');
      const ability = info.hapModulesInfo[0].abilitiesInfo[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(ability.description.length > 0).assertTrue();');
      expect(ability.description.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(ability.name).assertEqual(\'EntryAbility\');');
      expect(ability.name).assertEqual('EntryAbility');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(ability.labelId > 0).assertTrue();');
      expect(ability.labelId > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAbilityDesc0001 end');
    })

    /**
     * @tc.name   testWlanAbilitySkillShape0002
     * @tc.number SUB_WLAN_ABILITY_0002
     * @tc.desc   Verify EntryAbility skill entity and action lengths.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAbilitySkillShape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAbilitySkillShape0002 begin');
      const skill = info.hapModulesInfo[0].abilitiesInfo[0].skills[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(skill.entities.length).assertEqual(1);');
      expect(skill.entities.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(skill.actions.length).assertEqual(1);');
      expect(skill.actions.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(skill.entities[0]).assertEqual(\'entity.system.home\');');
      expect(skill.entities[0]).assertEqual('entity.system.home');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAbilitySkillShape0002 end');
    })

    /**
     * @tc.name   testWlanAbilityExportScene0003
     * @tc.number SUB_WLAN_ABILITY_0003
     * @tc.desc   Verify EntryAbility export flag and permission scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAbilityExportScene0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAbilityExportScene0003 begin');
      const ability = info.hapModulesInfo[0].abilitiesInfo[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(ability.exported).assertTrue();');
      expect(ability.exported).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.reqPermissionDetails[0].usedScene.abilities.includes(\'MainAbility\')).assertTrue();');
      expect(info.reqPermissionDetails[0].usedScene.abilities.includes('MainAbility')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(info.reqPermissionDetails[0].usedScene.when.length > 0).assertTrue();');
      expect(info.reqPermissionDetails[0].usedScene.when.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAbilityExportScene0003 end');
    })
  })
}
