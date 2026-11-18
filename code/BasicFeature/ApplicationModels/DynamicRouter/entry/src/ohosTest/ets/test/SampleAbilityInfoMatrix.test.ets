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
const TAG: string = '[Sample_DynamicRouter]';

export default function sampleAbilityInfoMatrixTest(): void {
  describe('SampleAbilityInfoMatrixTest', () => {
    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_ABILITY_INFO_0001
     * @tc.name      sampleAbilityInfoMatrix0001
     * @tc.desc      EntryAbility 的 name 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0001 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'EntryAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.name=${target.name}`);
      expect(target.name).assertEqual('EntryAbility');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0001 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_ABILITY_INFO_0002
     * @tc.name      sampleAbilityInfoMatrix0002
     * @tc.desc      EntryAbility 的 bundleName 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0002 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'EntryAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.bundleName=${target.bundleName}`);
      expect(target.bundleName).assertEqual('com.samples.navigation');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0002 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_ABILITY_INFO_0003
     * @tc.name      sampleAbilityInfoMatrix0003
     * @tc.desc      EntryAbility 的 moduleName 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0003 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'EntryAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.moduleName=${target.moduleName}`);
      expect(target.moduleName).assertEqual('entry');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0003 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_ABILITY_INFO_0004
     * @tc.name      sampleAbilityInfoMatrix0004
     * @tc.desc      EntryAbility 的 launchType 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0004 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'EntryAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      const actual2: string = typeof target.launchType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0004 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_ABILITY_INFO_0005
     * @tc.name      sampleAbilityInfoMatrix0005
     * @tc.desc      EntryAbility 的 orientation 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0005 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'EntryAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      const actual2: string = typeof target.orientation;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0005 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_ABILITY_INFO_0006
     * @tc.name      sampleAbilityInfoMatrix0006
     * @tc.desc      EntryAbility 的 exported 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0006 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'EntryAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      const actual2: string = typeof target.exported;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('boolean');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0006 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_ABILITY_INFO_0007
     * @tc.name      sampleAbilityInfoMatrix0007
     * @tc.desc      EntryAbility 的 enabled 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0007 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'EntryAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.enabled=${target.enabled}`);
      expect(target.enabled).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0007 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_ABILITY_INFO_0008
     * @tc.name      sampleAbilityInfoMatrix0008
     * @tc.desc      EntryAbility 的 label 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0008 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'EntryAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      const actual2: string = typeof target.label;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0008 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_ABILITY_INFO_0009
     * @tc.name      sampleAbilityInfoMatrix0009
     * @tc.desc      EntryAbility 的 description 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0009 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'EntryAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      const actual2: string = typeof target.description;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0009 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_ABILITY_INFO_0010
     * @tc.name      sampleAbilityInfoMatrix0010
     * @tc.desc      EntryAbility 的 icon 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0010 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'EntryAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      const actual2: string = typeof target.icon;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0010 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_ABILITY_INFO_0011
     * @tc.name      sampleAbilityInfoMatrix0011
     * @tc.desc      EntryAbility 的 process 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0011 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'EntryAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      const actual2: boolean = target.process.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0011 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_ABILITY_INFO_0012
     * @tc.name      sampleAbilityInfoMatrix0012
     * @tc.desc      EntryAbility 的 permissions.length 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0012 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'EntryAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      const actual2: boolean = target.permissions.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0012 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_ABILITY_INFO_0013
     * @tc.name      sampleAbilityInfoMatrix0013
     * @tc.desc      EntryAbility 的 deviceTypes.length 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0013 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'EntryAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0013 end');
    })
  })
}
