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

export default function startModeAbilitySkillMatrixTest(): void {
  describe('StartModeAbilitySkillMatrixTest', () => {
    /**
     * @tc.number    SUB_START_MODE_ABILITY_SKILL_0001
     * @tc.name      startModeAbilitySkillMatrix0001
     * @tc.desc      MainAbility 的启动方式与 skills 组合一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeAbilitySkillMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0001 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 module.name=${module.name}`);
      expect(module.name).assertEqual('entry');
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'MainAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 found=${found}`);
      expect(found).assertTrue();
      const expectedSkillCount: number = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.skills.length=${target.skills.length}`);
      expect(target.skills.length).assertEqual(expectedSkillCount);
      const actual4: boolean = target.deviceTypes.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = target.deviceTypes.indexOf('default') >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 target.launchType=${target.launchType}`);
      expect(target.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0001 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_SKILL_0002
     * @tc.name      startModeAbilitySkillMatrix0002
     * @tc.desc      MainAbility 的 skills 声明了桌面入口
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeAbilitySkillMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0002 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 module.name=${module.name}`);
      expect(module.name).assertEqual('entry');
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'MainAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 found=${found}`);
      expect(found).assertTrue();
      const actual3: boolean = target.skills[0].actions.indexOf('action.system.home') >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = target.skills[0].entities.indexOf('entity.system.home') >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 target.name=${target.name}`);
      expect(target.name).assertEqual('MainAbility');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0002 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_SKILL_0003
     * @tc.name      startModeAbilitySkillMatrix0003
     * @tc.desc      StandardAbility 的启动方式与 skills 组合一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeAbilitySkillMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0003 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 module.name=${module.name}`);
      expect(module.name).assertEqual('entry');
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 found=${found}`);
      expect(found).assertTrue();
      const expectedSkillCount: number = 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.skills.length=${target.skills.length}`);
      expect(target.skills.length).assertEqual(expectedSkillCount);
      const actual4: boolean = target.deviceTypes.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = target.deviceTypes.indexOf('default') >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 target.launchType=${target.launchType}`);
      expect(target.launchType).assertEqual(bundleManager.LaunchType.MULTITON);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0003 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_SKILL_0004
     * @tc.name      startModeAbilitySkillMatrix0004
     * @tc.desc      StandardAbility 未声明 skills，只能被显式启动
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeAbilitySkillMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0004 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 module.name=${module.name}`);
      expect(module.name).assertEqual('entry');
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.skills.length=${target.skills.length}`);
      expect(target.skills.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.name=${target.name}`);
      expect(target.name).assertEqual('StandardAbility');
      expect(target.launchType === bundleManager.LaunchType.MULTITON ||
        target.launchType === bundleManager.LaunchType.SINGLETON ||
        target.launchType === bundleManager.LaunchType.SPECIFIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0004 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_SKILL_0005
     * @tc.name      startModeAbilitySkillMatrix0005
     * @tc.desc      SingletonAbility 的启动方式与 skills 组合一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeAbilitySkillMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0005 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 module.name=${module.name}`);
      expect(module.name).assertEqual('entry');
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 found=${found}`);
      expect(found).assertTrue();
      const expectedSkillCount: number = 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.skills.length=${target.skills.length}`);
      expect(target.skills.length).assertEqual(expectedSkillCount);
      const actual4: boolean = target.deviceTypes.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = target.deviceTypes.indexOf('default') >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 target.launchType=${target.launchType}`);
      expect(target.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0005 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_SKILL_0006
     * @tc.name      startModeAbilitySkillMatrix0006
     * @tc.desc      SingletonAbility 未声明 skills，只能被显式启动
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeAbilitySkillMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0006 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 module.name=${module.name}`);
      expect(module.name).assertEqual('entry');
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.skills.length=${target.skills.length}`);
      expect(target.skills.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.name=${target.name}`);
      expect(target.name).assertEqual('SingletonAbility');
      expect(target.launchType === bundleManager.LaunchType.MULTITON ||
        target.launchType === bundleManager.LaunchType.SINGLETON ||
        target.launchType === bundleManager.LaunchType.SPECIFIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0006 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_SKILL_0007
     * @tc.name      startModeAbilitySkillMatrix0007
     * @tc.desc      SpecifiedAbility 的启动方式与 skills 组合一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeAbilitySkillMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0007 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 module.name=${module.name}`);
      expect(module.name).assertEqual('entry');
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SpecifiedAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 found=${found}`);
      expect(found).assertTrue();
      const expectedSkillCount: number = 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.skills.length=${target.skills.length}`);
      expect(target.skills.length).assertEqual(expectedSkillCount);
      const actual4: boolean = target.deviceTypes.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = target.deviceTypes.indexOf('default') >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 target.launchType=${target.launchType}`);
      expect(target.launchType).assertEqual(bundleManager.LaunchType.SPECIFIED);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0007 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_SKILL_0008
     * @tc.name      startModeAbilitySkillMatrix0008
     * @tc.desc      SpecifiedAbility 未声明 skills，只能被显式启动
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeAbilitySkillMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0008 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 module.name=${module.name}`);
      expect(module.name).assertEqual('entry');
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SpecifiedAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.skills.length=${target.skills.length}`);
      expect(target.skills.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.name=${target.name}`);
      expect(target.name).assertEqual('SpecifiedAbility');
      expect(target.launchType === bundleManager.LaunchType.MULTITON ||
        target.launchType === bundleManager.LaunchType.SINGLETON ||
        target.launchType === bundleManager.LaunchType.SPECIFIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeAbilitySkillMatrix0008 end');
    })
  })
}
