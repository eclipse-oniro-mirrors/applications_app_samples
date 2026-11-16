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
import bundleManager from '@ohos.bundle.bundleManager';
let info: bundleManager.BundleInfo;

export default function wlanBundleSkillsTest() {
  describe('WlanBundleSkillsTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL); })

    /**
     * @tc.name   testWlanSkillsCount0001
     * @tc.number SUB_WLAN_SKILLS_0001
     * @tc.desc   Verify EntryAbility declares one skill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanSkillsCount0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ability = info.hapModulesInfo[0].abilitiesInfo[0];
      expect(ability.skills.length > 0).assertTrue();
      expect(ability.skills.length).assertEqual(1);
      expect(ability.name).assertEqual('EntryAbility');
    })

    /**
     * @tc.name   testWlanSkillsEntity0002
     * @tc.number SUB_WLAN_SKILLS_0002
     * @tc.desc   Verify EntryAbility home entity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanSkillsEntity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const skill = info.hapModulesInfo[0].abilitiesInfo[0].skills[0];
      expect(skill.entities.includes('entity.system.home')).assertTrue();
      expect(skill.entities.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanSkillsAction0003
     * @tc.number SUB_WLAN_SKILLS_0003
     * @tc.desc   Verify EntryAbility home action.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanSkillsAction0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const skill = info.hapModulesInfo[0].abilitiesInfo[0].skills[0];
      expect(skill.actions.includes('action.system.home')).assertTrue();
      expect(skill.actions.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanSkillsModule0004
     * @tc.number SUB_WLAN_SKILLS_0004
     * @tc.desc   Verify entry module declares one ability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanSkillsModule0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let module: bundleManager.HapModuleInfo | undefined = undefined;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') { module = info.hapModulesInfo[i]; }
      }
      expect(module !== undefined).assertTrue();
      expect(module?.abilitiesInfo.length).assertEqual(1);
      expect((module?.extensionAbilitiesInfo.length ?? 0)).assertEqual(0);
    })

    /**
     * @tc.name   testWlanReasonAll0005
     * @tc.number SUB_WLAN_SKILLS_0005
     * @tc.desc   Verify every requested permission has a reason.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanReasonAll0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) {
        expect(info.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(info.reqPermissionDetails.length >= 4).assertTrue();
    })

    /**
     * @tc.name   testWlanSceneAbilityAll0006
     * @tc.number SUB_WLAN_SKILLS_0006
     * @tc.desc   Verify every permission scene references MainAbility.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanSceneAbilityAll0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) {
        expect(info.reqPermissionDetails[i].usedScene.abilities.includes('MainAbility')).assertTrue();
        expect(info.reqPermissionDetails[i].usedScene.abilities.length > 0).assertTrue();
      }
      expect(info.reqPermissionDetails.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanAppLabelIcon0007
     * @tc.number SUB_WLAN_SKILLS_0007
     * @tc.desc   Verify application label and icon resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAppLabelIcon0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.appInfo.labelId > 0).assertTrue();
      expect(info.appInfo.iconId > 0).assertTrue();
      expect(info.appInfo.name).assertEqual('ohos.samples.wlan');
    })

    /**
     * @tc.name   testWlanModuleName0008
     * @tc.number SUB_WLAN_SKILLS_0008
     * @tc.desc   Verify installable entry module name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanModuleName0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') { found = true; expect(info.hapModulesInfo[i].name).assertEqual('entry'); }
      }
      expect(found).assertTrue();
    })
  })
}
