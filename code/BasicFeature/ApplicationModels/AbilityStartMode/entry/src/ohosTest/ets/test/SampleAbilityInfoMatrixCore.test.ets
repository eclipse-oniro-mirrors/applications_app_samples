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

export default function sampleAbilityInfoMatrixCoreTest(): void {
  describe('SampleAbilityInfoMatrixCoreTest', () => {
    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0001
     * @tc.name      sampleAbilityInfoMatrix0001
     * @tc.desc      MainAbility 的 name 字段可从 AbilityInfo 读取
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
        if (module.abilitiesInfo[i].name === 'MainAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.name=${target.name}`);
      expect(target.name).assertEqual('MainAbility');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0001 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0002
     * @tc.name      sampleAbilityInfoMatrix0002
     * @tc.desc      MainAbility 的 bundleName 字段可从 AbilityInfo 读取
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
        if (module.abilitiesInfo[i].name === 'MainAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.bundleName=${target.bundleName}`);
      expect(target.bundleName).assertEqual('ohos.samples.startmode');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0002 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0003
     * @tc.name      sampleAbilityInfoMatrix0003
     * @tc.desc      MainAbility 的 moduleName 字段可从 AbilityInfo 读取
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
        if (module.abilitiesInfo[i].name === 'MainAbility') {
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
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0004
     * @tc.name      sampleAbilityInfoMatrix0004
     * @tc.desc      MainAbility 的 launchType 字段可从 AbilityInfo 读取
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
        if (module.abilitiesInfo[i].name === 'MainAbility') {
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
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0005
     * @tc.name      sampleAbilityInfoMatrix0005
     * @tc.desc      MainAbility 的 orientation 字段可从 AbilityInfo 读取
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
        if (module.abilitiesInfo[i].name === 'MainAbility') {
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
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0006
     * @tc.name      sampleAbilityInfoMatrix0006
     * @tc.desc      MainAbility 的 exported 字段可从 AbilityInfo 读取
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
        if (module.abilitiesInfo[i].name === 'MainAbility') {
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
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0007
     * @tc.name      sampleAbilityInfoMatrix0007
     * @tc.desc      MainAbility 的 enabled 字段可从 AbilityInfo 读取
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
        if (module.abilitiesInfo[i].name === 'MainAbility') {
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
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0008
     * @tc.name      sampleAbilityInfoMatrix0008
     * @tc.desc      MainAbility 的 label 字段可从 AbilityInfo 读取
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
        if (module.abilitiesInfo[i].name === 'MainAbility') {
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
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0009
     * @tc.name      sampleAbilityInfoMatrix0009
     * @tc.desc      MainAbility 的 description 字段可从 AbilityInfo 读取
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
        if (module.abilitiesInfo[i].name === 'MainAbility') {
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
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0010
     * @tc.name      sampleAbilityInfoMatrix0010
     * @tc.desc      MainAbility 的 icon 字段可从 AbilityInfo 读取
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
        if (module.abilitiesInfo[i].name === 'MainAbility') {
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
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0011
     * @tc.name      sampleAbilityInfoMatrix0011
     * @tc.desc      MainAbility 的 process 字段可从 AbilityInfo 读取
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
        if (module.abilitiesInfo[i].name === 'MainAbility') {
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
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0012
     * @tc.name      sampleAbilityInfoMatrix0012
     * @tc.desc      MainAbility 的 permissions.length 字段可从 AbilityInfo 读取
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
        if (module.abilitiesInfo[i].name === 'MainAbility') {
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
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0013
     * @tc.name      sampleAbilityInfoMatrix0013
     * @tc.desc      MainAbility 的 deviceTypes.length 字段可从 AbilityInfo 读取
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
        if (module.abilitiesInfo[i].name === 'MainAbility') {
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

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0014
     * @tc.name      sampleAbilityInfoMatrix0014
     * @tc.desc      StandardAbility 的 name 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0014 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.name=${target.name}`);
      expect(target.name).assertEqual('StandardAbility');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0014 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0015
     * @tc.name      sampleAbilityInfoMatrix0015
     * @tc.desc      StandardAbility 的 bundleName 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0015 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.bundleName=${target.bundleName}`);
      expect(target.bundleName).assertEqual('ohos.samples.startmode');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0015 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0016
     * @tc.name      sampleAbilityInfoMatrix0016
     * @tc.desc      StandardAbility 的 moduleName 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0016 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0016 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0017
     * @tc.name      sampleAbilityInfoMatrix0017
     * @tc.desc      StandardAbility 的 launchType 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0017 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0017 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0018
     * @tc.name      sampleAbilityInfoMatrix0018
     * @tc.desc      StandardAbility 的 orientation 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0018 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0018 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0019
     * @tc.name      sampleAbilityInfoMatrix0019
     * @tc.desc      StandardAbility 的 exported 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0019 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0019 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0020
     * @tc.name      sampleAbilityInfoMatrix0020
     * @tc.desc      StandardAbility 的 enabled 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0020 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0020 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0021
     * @tc.name      sampleAbilityInfoMatrix0021
     * @tc.desc      StandardAbility 的 label 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0021 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0021 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0022
     * @tc.name      sampleAbilityInfoMatrix0022
     * @tc.desc      StandardAbility 的 description 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0022 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0022 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0023
     * @tc.name      sampleAbilityInfoMatrix0023
     * @tc.desc      StandardAbility 的 icon 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0023 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0023 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0024
     * @tc.name      sampleAbilityInfoMatrix0024
     * @tc.desc      StandardAbility 的 process 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0024 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0024 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0025
     * @tc.name      sampleAbilityInfoMatrix0025
     * @tc.desc      StandardAbility 的 permissions.length 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0025 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0025 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0026
     * @tc.name      sampleAbilityInfoMatrix0026
     * @tc.desc      StandardAbility 的 deviceTypes.length 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0026 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'StandardAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0026 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0027
     * @tc.name      sampleAbilityInfoMatrix0027
     * @tc.desc      SingletonAbility 的 name 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0027 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.name=${target.name}`);
      expect(target.name).assertEqual('SingletonAbility');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0027 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0028
     * @tc.name      sampleAbilityInfoMatrix0028
     * @tc.desc      SingletonAbility 的 bundleName 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0028 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
          target = module.abilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.bundleName=${target.bundleName}`);
      expect(target.bundleName).assertEqual('ohos.samples.startmode');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0028 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0029
     * @tc.name      sampleAbilityInfoMatrix0029
     * @tc.desc      SingletonAbility 的 moduleName 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0029 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0029 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0030
     * @tc.name      sampleAbilityInfoMatrix0030
     * @tc.desc      SingletonAbility 的 launchType 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0030 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0030 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0031
     * @tc.name      sampleAbilityInfoMatrix0031
     * @tc.desc      SingletonAbility 的 orientation 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0031 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0031 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0032
     * @tc.name      sampleAbilityInfoMatrix0032
     * @tc.desc      SingletonAbility 的 exported 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0032 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0032 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0033
     * @tc.name      sampleAbilityInfoMatrix0033
     * @tc.desc      SingletonAbility 的 enabled 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0033 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0033 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0034
     * @tc.name      sampleAbilityInfoMatrix0034
     * @tc.desc      SingletonAbility 的 label 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0034 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0034 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0035
     * @tc.name      sampleAbilityInfoMatrix0035
     * @tc.desc      SingletonAbility 的 description 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0035 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0035 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0036
     * @tc.name      sampleAbilityInfoMatrix0036
     * @tc.desc      SingletonAbility 的 icon 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0036 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0036 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0037
     * @tc.name      sampleAbilityInfoMatrix0037
     * @tc.desc      SingletonAbility 的 process 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0037 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0037 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0038
     * @tc.name      sampleAbilityInfoMatrix0038
     * @tc.desc      SingletonAbility 的 permissions.length 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0038 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0038 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0039
     * @tc.name      sampleAbilityInfoMatrix0039
     * @tc.desc      SingletonAbility 的 deviceTypes.length 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0039 begin');
      const abilityFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(abilityFlags);
      const module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      let target: bundleManager.AbilityInfo = module.abilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.abilitiesInfo.length; i++) {
        if (module.abilitiesInfo[i].name === 'SingletonAbility') {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0039 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0040
     * @tc.name      sampleAbilityInfoMatrix0040
     * @tc.desc      SpecifiedAbility 的 name 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0040 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.name=${target.name}`);
      expect(target.name).assertEqual('SpecifiedAbility');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0040 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0041
     * @tc.name      sampleAbilityInfoMatrix0041
     * @tc.desc      SpecifiedAbility 的 bundleName 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0041 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.bundleName=${target.bundleName}`);
      expect(target.bundleName).assertEqual('ohos.samples.startmode');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0041 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0042
     * @tc.name      sampleAbilityInfoMatrix0042
     * @tc.desc      SpecifiedAbility 的 moduleName 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0042 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.moduleName=${target.moduleName}`);
      expect(target.moduleName).assertEqual('entry');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0042 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0043
     * @tc.name      sampleAbilityInfoMatrix0043
     * @tc.desc      SpecifiedAbility 的 launchType 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0043 begin');
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
      const actual2: string = typeof target.launchType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0043 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0044
     * @tc.name      sampleAbilityInfoMatrix0044
     * @tc.desc      SpecifiedAbility 的 orientation 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0044 begin');
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
      const actual2: string = typeof target.orientation;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0044 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0045
     * @tc.name      sampleAbilityInfoMatrix0045
     * @tc.desc      SpecifiedAbility 的 exported 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0045 begin');
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
      const actual2: string = typeof target.exported;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('boolean');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0045 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0046
     * @tc.name      sampleAbilityInfoMatrix0046
     * @tc.desc      SpecifiedAbility 的 enabled 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0046 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.enabled=${target.enabled}`);
      expect(target.enabled).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0046 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0047
     * @tc.name      sampleAbilityInfoMatrix0047
     * @tc.desc      SpecifiedAbility 的 label 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0047 begin');
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
      const actual2: string = typeof target.label;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0047 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0048
     * @tc.name      sampleAbilityInfoMatrix0048
     * @tc.desc      SpecifiedAbility 的 description 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0048 begin');
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
      const actual2: string = typeof target.description;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0048 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0049
     * @tc.name      sampleAbilityInfoMatrix0049
     * @tc.desc      SpecifiedAbility 的 icon 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0049 begin');
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
      const actual2: string = typeof target.icon;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0049 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0050
     * @tc.name      sampleAbilityInfoMatrix0050
     * @tc.desc      SpecifiedAbility 的 process 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0050 begin');
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
      const actual2: boolean = target.process.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0050 end');
    })

    /**
     * @tc.number    SUB_START_MODE_ABILITY_INFO_0051
     * @tc.name      sampleAbilityInfoMatrix0051
     * @tc.desc      SpecifiedAbility 的 permissions.length 字段可从 AbilityInfo 读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleAbilityInfoMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0051 begin');
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
      const actual2: boolean = target.permissions.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleAbilityInfoMatrix0051 end');
    })
  })
}
