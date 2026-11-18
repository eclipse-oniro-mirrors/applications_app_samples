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
const TAG: string = '[Sample_BundleManagement]';

export default function sampleModuleConfigMatrixTest(): void {
  describe('SampleModuleConfigMatrixTest', () => {
    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0001
     * @tc.name      sampleModuleConfigMatrix0001
     * @tc.desc      HapModuleInfo 的 name 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0001 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 module.name=${module.name}`);
      expect(module.name).assertEqual('entry');
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0001 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0002
     * @tc.name      sampleModuleConfigMatrix0002
     * @tc.desc      HapModuleInfo 的 type 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0002 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 module.type=${module.type}`);
      expect(module.type).assertEqual(1);
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0002 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0003
     * @tc.name      sampleModuleConfigMatrix0003
     * @tc.desc      HapModuleInfo 的 description 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0003 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: boolean = module.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0003 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0004
     * @tc.name      sampleModuleConfigMatrix0004
     * @tc.desc      HapModuleInfo 的 descriptionId 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0004 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: boolean = module.descriptionId >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0004 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0005
     * @tc.name      sampleModuleConfigMatrix0005
     * @tc.desc      HapModuleInfo 的 label 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0005 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: boolean = module.label.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0005 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0006
     * @tc.name      sampleModuleConfigMatrix0006
     * @tc.desc      HapModuleInfo 的 labelId 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0006 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: boolean = module.labelId >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0006 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0007
     * @tc.name      sampleModuleConfigMatrix0007
     * @tc.desc      HapModuleInfo 的 icon 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0007 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: string = typeof module.icon;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0007 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0008
     * @tc.name      sampleModuleConfigMatrix0008
     * @tc.desc      HapModuleInfo 的 iconId 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0008 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: boolean = module.iconId >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0008 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0009
     * @tc.name      sampleModuleConfigMatrix0009
     * @tc.desc      HapModuleInfo 的 mainElementName 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0009 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 module.mainElementName=${module.mainElementName}`);
      expect(module.mainElementName).assertEqual('EntryAbility');
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0009 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0010
     * @tc.name      sampleModuleConfigMatrix0010
     * @tc.desc      HapModuleInfo 的 installationFree 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0010 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 module.installationFree=${module.installationFree}`);
      expect(module.installationFree).assertFalse();
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0010 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0011
     * @tc.name      sampleModuleConfigMatrix0011
     * @tc.desc      HapModuleInfo 的 hashValue 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0011 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: string = typeof module.hashValue;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0011 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0012
     * @tc.name      sampleModuleConfigMatrix0012
     * @tc.desc      HapModuleInfo 的 deviceTypes.length 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0012 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: boolean = module.deviceTypes.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0012 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0013
     * @tc.name      sampleModuleConfigMatrix0013
     * @tc.desc      HapModuleInfo 的 codePath 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0013 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: boolean = module.codePath.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0013 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0014
     * @tc.name      sampleModuleConfigMatrix0014
     * @tc.desc      HapModuleInfo 的 nativeLibraryPath 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0014 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: string = typeof module.nativeLibraryPath;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0014 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0015
     * @tc.name      sampleModuleConfigMatrix0015
     * @tc.desc      HapModuleInfo 的 dependencies.length 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0015 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: boolean = module.dependencies.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0015 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0016
     * @tc.name      sampleModuleConfigMatrix0016
     * @tc.desc      HapModuleInfo 的 preloads.length 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0016 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: boolean = module.preloads.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0016 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0017
     * @tc.name      sampleModuleConfigMatrix0017
     * @tc.desc      HapModuleInfo 的 metadata.length 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0017 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: boolean = module.metadata.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0017 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0018
     * @tc.name      sampleModuleConfigMatrix0018
     * @tc.desc      HapModuleInfo 的 abilitiesInfo.length 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0018 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: boolean = module.abilitiesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0018 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_MODULE_CONFIG_0019
     * @tc.name      sampleModuleConfigMatrix0019
     * @tc.desc      HapModuleInfo 的 extensionAbilityInfo.length 与 entry 模块配置一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleModuleConfigMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0019 begin');
      const moduleFlags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(moduleFlags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: boolean = module.extensionAbilitiesInfo.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = info.hapModulesInfo.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleModuleConfigMatrix0019 end');
    })
  })
}
