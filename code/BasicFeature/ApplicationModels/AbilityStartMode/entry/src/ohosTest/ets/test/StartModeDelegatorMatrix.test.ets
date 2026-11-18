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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { bundleManager } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_StartMode]';

export default function startModeDelegatorMatrixTest(): void {
  describe('StartModeDelegatorMatrixTest', () => {
    /**
     * @tc.number    SUB_START_MODE_DELEGATOR_0001
     * @tc.name      startModeDelegatorMatrix0001
     * @tc.desc      AbilityDelegatorArgs 携带被测包的 bundleName
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeDelegatorMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeDelegatorMatrix0001 begin');
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      const args = abilityDelegatorRegistry.getArguments();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 args.bundleName=${args.bundleName}`);
      expect(args.bundleName).assertEqual('ohos.samples.startmode');
      const actual2: boolean = args.parameters !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = Object.keys(args.parameters).length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeDelegatorMatrix0001 end');
    })

    /**
     * @tc.number    SUB_START_MODE_DELEGATOR_0002
     * @tc.name      startModeDelegatorMatrix0002
     * @tc.desc      getAppContext 返回的上下文属于被测应用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeDelegatorMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeDelegatorMatrix0002 begin');
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      const context = delegator.getAppContext();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 context.applicationInfo.name=${context.applicationInfo.name}`);
      expect(context.applicationInfo.name).assertEqual('ohos.samples.startmode');
      const actual2: boolean = context.applicationInfo.uid > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = context.applicationInfo.accessTokenId > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeDelegatorMatrix0002 end');
    })

    /**
     * @tc.number    SUB_START_MODE_DELEGATOR_0003
     * @tc.name      startModeDelegatorMatrix0003
     * @tc.desc      应用上下文的 files/cache/database 目录可读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeDelegatorMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeDelegatorMatrix0003 begin');
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      const context = delegator.getAppContext();
      const actual1: string = typeof context.filesDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = context.filesDir.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = typeof context.cacheDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      const actual4: boolean = context.cacheDir.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: string = typeof context.databaseDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('string');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeDelegatorMatrix0003 end');
    })

    /**
     * @tc.number    SUB_START_MODE_DELEGATOR_0004
     * @tc.name      startModeDelegatorMatrix0004
     * @tc.desc      主 Ability 的 label 与指定模式标题资源可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeDelegatorMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeDelegatorMatrix0004 begin');
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      const context = delegator.getAppContext();
      const label: string = context.resourceManager.getStringByNameSync('mainAbility_label');
      const title: string = context.resourceManager.getStringByNameSync('specifiedMode_title');
      const actual1: string = typeof label;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 title=${title}`);
      expect(title).assertEqual('SpecifiedMode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 label=${label}`);
      expect(label).assertEqual('label');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeDelegatorMatrix0004 end');
    })

    /**
     * @tc.number    SUB_START_MODE_DELEGATOR_0005
     * @tc.name      startModeDelegatorMatrix0005
     * @tc.desc      被测应用的版本信息与 app.json5 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeDelegatorMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeDelegatorMatrix0005 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('ohos.samples.startmode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.versionName=${info.versionName}`);
      expect(info.versionName).assertEqual('1.0.0');
      const actual3: boolean = info.appInfo.label.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeDelegatorMatrix0005 end');
    })

    /**
     * @tc.number    SUB_START_MODE_DELEGATOR_0006
     * @tc.name      startModeDelegatorMatrix0006
     * @tc.desc      entry 模块声明了 4 个 Ability 且主入口为 MainAbility
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeDelegatorMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeDelegatorMatrix0006 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      let module: bundleManager.HapModuleInfo = info.hapModulesInfo[0];
      for (let i = 0; i < info.hapModulesInfo.length; i++) {
        if (info.hapModulesInfo[i].name === 'entry') {
          module = info.hapModulesInfo[i];
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 module.mainElementName=${module.mainElementName}`);
      expect(module.mainElementName).assertEqual('MainAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 module.name=${module.name}`);
      expect(module.name).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 module.abilitiesInfo.length=${module.abilitiesInfo.length}`);
      expect(module.abilitiesInfo.length).assertEqual(4);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeDelegatorMatrix0006 end');
    })

    /**
     * @tc.number    SUB_START_MODE_DELEGATOR_0007
     * @tc.name      startModeDelegatorMatrix0007
     * @tc.desc      模块描述与启动窗口背景色资源均可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeDelegatorMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeDelegatorMatrix0007 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const color: number = context.resourceManager.getColorByNameSync('white');
      const desc: string = context.resourceManager.getStringByNameSync('entry_desc');
      const actual1: string = typeof color;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: boolean = color !== 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 desc=${desc}`);
      expect(desc).assertEqual('description');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeDelegatorMatrix0007 end');
    })
  })
}
