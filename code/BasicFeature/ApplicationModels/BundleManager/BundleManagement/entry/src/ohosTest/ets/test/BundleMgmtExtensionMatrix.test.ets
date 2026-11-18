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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { bundleManager } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_BundleManagement]';

export default function bundleMgmtExtensionMatrixTest(): void {
  describe('BundleMgmtExtensionMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_BUNDLE_MGMT_EXTENSION_0001
     * @tc.name      bundleMgmtExtensionMatrix0001
     * @tc.desc      NewUIExtAbility 作为扩展能力挂在 entry 模块下
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtExtensionMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtExtensionMatrix0001 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      let target: bundleManager.ExtensionAbilityInfo = module.extensionAbilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.extensionAbilitiesInfo.length; i++) {
        if (module.extensionAbilitiesInfo[i].name === 'NewUIExtAbility') {
          target = module.extensionAbilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.name=${target.name}`);
      expect(target.name).assertEqual('NewUIExtAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 target.bundleName=${target.bundleName}`);
      expect(target.bundleName).assertEqual('com.samples.bundlemanagement');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.moduleName=${target.moduleName}`);
      expect(target.moduleName).assertEqual('entry');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtExtensionMatrix0001 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_EXTENSION_0002
     * @tc.name      bundleMgmtExtensionMatrix0002
     * @tc.desc      NewUIExtAbility 的类型为 sysPicker/share 且对外导出
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtExtensionMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtExtensionMatrix0002 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      let target: bundleManager.ExtensionAbilityInfo = module.extensionAbilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.extensionAbilitiesInfo.length; i++) {
        if (module.extensionAbilitiesInfo[i].name === 'NewUIExtAbility') {
          target = module.extensionAbilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 target.extensionAbilityTypeName=${target.extensionAbilityTypeName}`);
      expect(target.extensionAbilityTypeName).assertEqual('sysPicker/share');
      const actual3: boolean = target.extensionAbilityType > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 target.exported=${target.exported}`);
      expect(target.exported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 target.enabled=${target.enabled}`);
      expect(target.enabled).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtExtensionMatrix0002 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_EXTENSION_0003
     * @tc.name      bundleMgmtExtensionMatrix0003
     * @tc.desc      NewUIExtAbility 的图标与标签资源 ID 可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtExtensionMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtExtensionMatrix0003 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      let target: bundleManager.ExtensionAbilityInfo = module.extensionAbilitiesInfo[0];
      let found: boolean = false;
      for (let i = 0; i < module.extensionAbilitiesInfo.length; i++) {
        if (module.extensionAbilitiesInfo[i].name === 'NewUIExtAbility') {
          target = module.extensionAbilitiesInfo[i];
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      const actual2: boolean = target.iconId >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = target.labelId >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = target.descriptionId >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtExtensionMatrix0003 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_EXTENSION_0004
     * @tc.name      bundleMgmtExtensionMatrix0004
     * @tc.desc      entry 模块只声明了一个扩展能力
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('bundleMgmtExtensionMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtExtensionMatrix0004 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      const actual1: number = module.extensionAbilitiesInfo.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 module.abilitiesInfo.length=${module.abilitiesInfo.length}`);
      expect(module.abilitiesInfo.length).assertEqual(2);
      const actual3: boolean = module.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundleMgmtExtensionMatrix0004 end');
    })
  })
}
