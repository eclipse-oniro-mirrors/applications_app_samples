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

export default function startModeLaunchTypeMatrixTest(): void {
  describe('StartModeLaunchTypeMatrixTest', () => {
    /**
     * @tc.number    SUB_START_MODE_LAUNCH_TYPE_0001
     * @tc.name      startModeLaunchTypeMatrix0001
     * @tc.desc      MainAbility 的 launchType 为 默认（未声明）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeLaunchTypeMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0001 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.launchType=${target.launchType}`);
      expect(target.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.launchType=${target.launchType}`);
      expect(target.launchType).assertEqual(0);
      const actual5: string = typeof target.launchType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0001 end');
    })

    /**
     * @tc.number    SUB_START_MODE_LAUNCH_TYPE_0002
     * @tc.name      startModeLaunchTypeMatrix0002
     * @tc.desc      MainAbility 的 exported/enabled 与清单一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeLaunchTypeMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0002 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.exported=${target.exported}`);
      expect(target.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.enabled=${target.enabled}`);
      expect(target.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 target.name=${target.name}`);
      expect(target.name).assertEqual('MainAbility');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0002 end');
    })

    /**
     * @tc.number    SUB_START_MODE_LAUNCH_TYPE_0003
     * @tc.name      startModeLaunchTypeMatrix0003
     * @tc.desc      MainAbility 的 skills 数量为 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeLaunchTypeMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0003 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.skills.length=${target.skills.length}`);
      expect(target.skills.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.bundleName=${target.bundleName}`);
      expect(target.bundleName).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 target.moduleName=${target.moduleName}`);
      expect(target.moduleName).assertEqual('entry');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0003 end');
    })

    /**
     * @tc.number    SUB_START_MODE_LAUNCH_TYPE_0004
     * @tc.name      startModeLaunchTypeMatrix0004
     * @tc.desc      StandardAbility 的 launchType 为 standard
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeLaunchTypeMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0004 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.launchType=${target.launchType}`);
      expect(target.launchType).assertEqual(bundleManager.LaunchType.MULTITON);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.launchType=${target.launchType}`);
      expect(target.launchType).assertEqual(1);
      const actual5: string = typeof target.launchType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0004 end');
    })

    /**
     * @tc.number    SUB_START_MODE_LAUNCH_TYPE_0005
     * @tc.name      startModeLaunchTypeMatrix0005
     * @tc.desc      StandardAbility 的 exported/enabled 与清单一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeLaunchTypeMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0005 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.exported=${target.exported}`);
      expect(target.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.enabled=${target.enabled}`);
      expect(target.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 target.name=${target.name}`);
      expect(target.name).assertEqual('StandardAbility');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0005 end');
    })

    /**
     * @tc.number    SUB_START_MODE_LAUNCH_TYPE_0006
     * @tc.name      startModeLaunchTypeMatrix0006
     * @tc.desc      StandardAbility 的 skills 数量为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeLaunchTypeMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0006 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.bundleName=${target.bundleName}`);
      expect(target.bundleName).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 target.moduleName=${target.moduleName}`);
      expect(target.moduleName).assertEqual('entry');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0006 end');
    })

    /**
     * @tc.number    SUB_START_MODE_LAUNCH_TYPE_0007
     * @tc.name      startModeLaunchTypeMatrix0007
     * @tc.desc      SingletonAbility 的 launchType 为 singleton
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeLaunchTypeMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0007 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.launchType=${target.launchType}`);
      expect(target.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.launchType=${target.launchType}`);
      expect(target.launchType).assertEqual(0);
      const actual5: string = typeof target.launchType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0007 end');
    })

    /**
     * @tc.number    SUB_START_MODE_LAUNCH_TYPE_0008
     * @tc.name      startModeLaunchTypeMatrix0008
     * @tc.desc      SingletonAbility 的 exported/enabled 与清单一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeLaunchTypeMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0008 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.exported=${target.exported}`);
      expect(target.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.enabled=${target.enabled}`);
      expect(target.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 target.name=${target.name}`);
      expect(target.name).assertEqual('SingletonAbility');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0008 end');
    })

    /**
     * @tc.number    SUB_START_MODE_LAUNCH_TYPE_0009
     * @tc.name      startModeLaunchTypeMatrix0009
     * @tc.desc      SingletonAbility 的 skills 数量为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeLaunchTypeMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0009 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.bundleName=${target.bundleName}`);
      expect(target.bundleName).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 target.moduleName=${target.moduleName}`);
      expect(target.moduleName).assertEqual('entry');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0009 end');
    })

    /**
     * @tc.number    SUB_START_MODE_LAUNCH_TYPE_0010
     * @tc.name      startModeLaunchTypeMatrix0010
     * @tc.desc      SpecifiedAbility 的 launchType 为 specified
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeLaunchTypeMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0010 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.launchType=${target.launchType}`);
      expect(target.launchType).assertEqual(bundleManager.LaunchType.SPECIFIED);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.launchType=${target.launchType}`);
      expect(target.launchType).assertEqual(2);
      const actual5: string = typeof target.launchType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0010 end');
    })

    /**
     * @tc.number    SUB_START_MODE_LAUNCH_TYPE_0011
     * @tc.name      startModeLaunchTypeMatrix0011
     * @tc.desc      SpecifiedAbility 的 exported/enabled 与清单一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeLaunchTypeMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0011 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.exported=${target.exported}`);
      expect(target.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.enabled=${target.enabled}`);
      expect(target.enabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 target.name=${target.name}`);
      expect(target.name).assertEqual('SpecifiedAbility');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0011 end');
    })

    /**
     * @tc.number    SUB_START_MODE_LAUNCH_TYPE_0012
     * @tc.name      startModeLaunchTypeMatrix0012
     * @tc.desc      SpecifiedAbility 的 skills 数量为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeLaunchTypeMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0012 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.bundleName=${target.bundleName}`);
      expect(target.bundleName).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 target.moduleName=${target.moduleName}`);
      expect(target.moduleName).assertEqual('entry');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeLaunchTypeMatrix0012 end');
    })
  })
}
