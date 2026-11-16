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

export default function wlanBundleSkillsTest() {
  describe('WlanBundleSkillsTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL); })

    /**
     * @tc.name   ohos.samples.wlan_BundleSkills_0001
     * @tc.number SUB_WLAN_SKILLS_0001
     * @tc.desc   Verify EntryAbility declares one skill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_BundleSkills_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0001 begin');
      const ability: bundleManager.AbilityInfo = info.hapModulesInfo[0].abilitiesInfo[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ability.skills.length > 0));
      expect(ability.skills.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ability.skills.length), String(1));
      expect(ability.skills.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ability.name), String('EntryAbility'));
      expect(ability.name).assertEqual('EntryAbility');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_BundleSkills_0002
     * @tc.number SUB_WLAN_SKILLS_0002
     * @tc.desc   Verify EntryAbility home entity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_BundleSkills_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0002 begin');
      const skill: bundleManager.SkillInfo = info.hapModulesInfo[0].abilitiesInfo[0].skills[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(skill.entities.includes('entity.system.home')));
      expect(skill.entities.includes('entity.system.home')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(skill.entities.length > 0));
      expect(skill.entities.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_BundleSkills_0003
     * @tc.number SUB_WLAN_SKILLS_0003
     * @tc.desc   Verify EntryAbility home action.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_BundleSkills_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0003 begin');
      const skill: bundleManager.SkillInfo = info.hapModulesInfo[0].abilitiesInfo[0].skills[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(skill.actions.includes('action.system.home')));
      expect(skill.actions.includes('action.system.home')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(skill.actions.length > 0));
      expect(skill.actions.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_BundleSkills_0004
     * @tc.number SUB_WLAN_SKILLS_0004
     * @tc.desc   Verify entry module declares one ability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_BundleSkills_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0004 begin');
      let module: bundleManager.HapModuleInfo | undefined = undefined;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
          }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(module !== undefined));
      expect(module !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(module?.abilitiesInfo.length), String(1));
      expect(module?.abilitiesInfo.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String((module?.extensionAbilitiesInfo.length ?? 0)), String(0));
      expect((module?.extensionAbilitiesInfo.length ?? 0)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_BundleSkills_0005
     * @tc.number SUB_WLAN_SKILLS_0005
     * @tc.desc   Verify every requested permission has a reason.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_BundleSkills_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0005 begin');
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails[i].reason.length > 0));
        expect(info.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails.length >= 4));
      expect(info.reqPermissionDetails.length >= 4).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_BundleSkills_0006
     * @tc.number SUB_WLAN_SKILLS_0006
     * @tc.desc   Verify every permission scene references MainAbility.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_BundleSkills_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0006 begin');
      for (let i: number = 0; i < info.reqPermissionDetails.length; i++) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails[i].usedScene.abilities.includes('MainAbility')));
        expect(info.reqPermissionDetails[i].usedScene.abilities.includes('MainAbility')).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails[i].usedScene.abilities.length > 0));
        expect(info.reqPermissionDetails[i].usedScene.abilities.length > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.reqPermissionDetails.length > 0));
      expect(info.reqPermissionDetails.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_BundleSkills_0007
     * @tc.number SUB_WLAN_SKILLS_0007
     * @tc.desc   Verify application label and icon resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_BundleSkills_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.labelId > 0));
      expect(info.appInfo.labelId > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(info.appInfo.iconId > 0));
      expect(info.appInfo.iconId > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.appInfo.name), String('ohos.samples.wlan'));
      expect(info.appInfo.name).assertEqual('ohos.samples.wlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_BundleSkills_0008
     * @tc.number SUB_WLAN_SKILLS_0008
     * @tc.desc   Verify installable entry module name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_BundleSkills_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0008 begin');
      let found: boolean = false;
      for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          found = true;
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(info.hapModulesInfo[i].name), String('entry'));
          expect(info.hapModulesInfo[i].name).assertEqual('entry');
          }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(found));
      expect(found).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_BundleSkills_0008 end');
    })
  })
}
