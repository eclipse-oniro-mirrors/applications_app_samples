/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { resourceManager } from '@kit.LocalizationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { loadOverrideResourceManager } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityRuntime]';

export default function resourceLocaleHugeMatrixATailTest(): void {
  describe('AbilityRuntimeResourceLocaleHugeMatrixATailTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0220
     * @tc.name      testResourceLocaleHugeMatrixA0220
     * @tc.desc      DARK 模式下 ru_Latn_RU 字符串 getUidPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0220 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.DARK);
      const key: string = 'getUidPromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0220 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0221
     * @tc.name      testResourceLocaleHugeMatrixA0221
     * @tc.desc      DARK 模式下 ru_Latn_RU 字符串 equalPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0221 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.DARK);
      const key: string = 'equalPromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0221 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0222
     * @tc.name      testResourceLocaleHugeMatrixA0222
     * @tc.desc      DARK 模式下 ru_Latn_RU 字符串 MapAbility_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0222 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.DARK);
      const key: string = 'MapAbility_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0222 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0223
     * @tc.name      testResourceLocaleHugeMatrixA0223
     * @tc.desc      DARK 模式下 ru_Latn_RU 字符串 ApplicationContext_getRunningProcessInformation_promise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0223 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_getRunningProcessInformation_promise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(35);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0223 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0224
     * @tc.name      testResourceLocaleHugeMatrixA0224
     * @tc.desc      DARK 模式下 ru_Latn_RU 字符串 UIAbilityContext_terminateSelf 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0224 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_terminateSelf';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0224 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0225
     * @tc.name      testResourceLocaleHugeMatrixA0225
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 module_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0225 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'module_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0225 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0226
     * @tc.name      testResourceLocaleHugeMatrixA0226
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 AppManager 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0226 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'AppManager';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('appManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('appManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0226 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0227
     * @tc.name      testResourceLocaleHugeMatrixA0227
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 ApplicationContext 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0227 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'ApplicationContext';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('ApplicationContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('ApplicationContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0227 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0228
     * @tc.name      testResourceLocaleHugeMatrixA0228
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 isRunningInStabilityTestCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0228 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'isRunningInStabilityTestCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(34);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0228 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0229
     * @tc.name      testResourceLocaleHugeMatrixA0229
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 getAppMemorySizeCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0229 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'getAppMemorySizeCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0229 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0230
     * @tc.name      testResourceLocaleHugeMatrixA0230
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 registerErrorObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0230 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'registerErrorObserver';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('register ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(22);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0230 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0231
     * @tc.name      testResourceLocaleHugeMatrixA0231
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 unregisterLoopObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0231 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'unregisterLoopObserver';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0231 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0232
     * @tc.name      testResourceLocaleHugeMatrixA0232
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 simulateUnhandledRejection 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0232 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'simulateUnhandledRejection';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(27);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0232 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0233
     * @tc.name      testResourceLocaleHugeMatrixA0233
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 updateId 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0233 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'updateId';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(8);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0233 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0234
     * @tc.name      testResourceLocaleHugeMatrixA0234
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 UIExtensionContentSession_terminateSelfWithResultPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0234 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultPromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0234 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0235
     * @tc.name      testResourceLocaleHugeMatrixA0235
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 UIExtensionContentSession_getUIExtensionWindowProxy 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0235 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'UIExtensionContentSession_getUIExtensionWindowProxy';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0235 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0236
     * @tc.name      testResourceLocaleHugeMatrixA0236
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 getUidPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0236 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'getUidPromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0236 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0237
     * @tc.name      testResourceLocaleHugeMatrixA0237
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 equalPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0237 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'equalPromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0237 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0238
     * @tc.name      testResourceLocaleHugeMatrixA0238
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 MapAbility_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0238 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'MapAbility_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0238 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0239
     * @tc.name      testResourceLocaleHugeMatrixA0239
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 ApplicationContext_getRunningProcessInformation_promise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0239 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'ApplicationContext_getRunningProcessInformation_promise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(35);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0239 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0240
     * @tc.name      testResourceLocaleHugeMatrixA0240
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 UIAbilityContext_terminateSelf 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0240 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'UIAbilityContext_terminateSelf';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0240 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0241
     * @tc.name      testResourceLocaleHugeMatrixA0241
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 module_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0241 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'module_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0241 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0242
     * @tc.name      testResourceLocaleHugeMatrixA0242
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 AppManager 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0242 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'AppManager';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('appManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('appManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0242 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0243
     * @tc.name      testResourceLocaleHugeMatrixA0243
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 ApplicationContext 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0243 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('ApplicationContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('ApplicationContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0243 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0244
     * @tc.name      testResourceLocaleHugeMatrixA0244
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 isRunningInStabilityTestCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0244 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'isRunningInStabilityTestCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(34);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0244 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0245
     * @tc.name      testResourceLocaleHugeMatrixA0245
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 getAppMemorySizeCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0245 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'getAppMemorySizeCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0245 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0246
     * @tc.name      testResourceLocaleHugeMatrixA0246
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 registerErrorObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0246 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'registerErrorObserver';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('register ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(22);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0246 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0247
     * @tc.name      testResourceLocaleHugeMatrixA0247
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 unregisterLoopObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0247 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterLoopObserver';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0247 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0248
     * @tc.name      testResourceLocaleHugeMatrixA0248
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 simulateUnhandledRejection 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0248 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'simulateUnhandledRejection';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(27);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0248 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0249
     * @tc.name      testResourceLocaleHugeMatrixA0249
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 updateId 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0249 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'updateId';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(8);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0249 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0250
     * @tc.name      testResourceLocaleHugeMatrixA0250
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 UIExtensionContentSession_terminateSelfWithResultPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0250 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultPromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0250 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0251
     * @tc.name      testResourceLocaleHugeMatrixA0251
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 UIExtensionContentSession_getUIExtensionWindowProxy 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0251 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_getUIExtensionWindowProxy';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0251 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0252
     * @tc.name      testResourceLocaleHugeMatrixA0252
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 getUidPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0252 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'getUidPromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0252 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0253
     * @tc.name      testResourceLocaleHugeMatrixA0253
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 equalPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0253 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'equalPromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0253 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0254
     * @tc.name      testResourceLocaleHugeMatrixA0254
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 MapAbility_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0254 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'MapAbility_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0254 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0255
     * @tc.name      testResourceLocaleHugeMatrixA0255
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 ApplicationContext_getRunningProcessInformation_promise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0255 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_getRunningProcessInformation_promise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(35);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0255 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_A_0256
     * @tc.name      testResourceLocaleHugeMatrixA0256
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 UIAbilityContext_terminateSelf 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixA0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0256 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_terminateSelf';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixA0256 end');
    })
  })
}
