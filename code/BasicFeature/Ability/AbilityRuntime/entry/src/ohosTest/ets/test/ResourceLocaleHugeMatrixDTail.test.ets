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

export default function resourceLocaleHugeMatrixDTailTest(): void {
  describe('AbilityRuntimeResourceLocaleHugeMatrixDTailTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0220
     * @tc.name      testResourceLocaleHugeMatrixD0220
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 privacy_window_permission 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0220 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'privacy_window_permission';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(33);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0220 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0221
     * @tc.name      testResourceLocaleHugeMatrixD0221
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 getUidCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0221 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'getUidCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0221 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0222
     * @tc.name      testResourceLocaleHugeMatrixD0222
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 equalCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0222 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'equalCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0222 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0223
     * @tc.name      testResourceLocaleHugeMatrixD0223
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 trigger 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0223 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'trigger';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(7);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0223 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0224
     * @tc.name      testResourceLocaleHugeMatrixD0224
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 ApplicationContext_setFont 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0224 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'ApplicationContext_setFont';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(7);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0224 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0225
     * @tc.name      testResourceLocaleHugeMatrixD0225
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 UIAbilityContext_moveAbilityToBackground 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0225 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'UIAbilityContext_moveAbilityToBackground';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0225 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0226
     * @tc.name      testResourceLocaleHugeMatrixD0226
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 main_title 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0226 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'main_title';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('public api example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('public api example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0226 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0227
     * @tc.name      testResourceLocaleHugeMatrixD0227
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 WantAgent 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0227 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'WantAgent';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('WantAgent example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(17);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('WantAgent example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0227 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0228
     * @tc.name      testResourceLocaleHugeMatrixD0228
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 ErrorManager 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0228 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'ErrorManager';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('errorManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(20);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('errorManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0228 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0229
     * @tc.name      testResourceLocaleHugeMatrixD0229
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 isRamConstrainedDevicePromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0229 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'isRamConstrainedDevicePromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('isRamConstrainedDevice(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(31);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRamConstrainedDevice(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0229 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0230
     * @tc.name      testResourceLocaleHugeMatrixD0230
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 getRunningProcessInformationPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0230 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'getRunningProcessInformationPromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0230 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0231
     * @tc.name      testResourceLocaleHugeMatrixD0231
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 registerLoopObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0231 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'registerLoopObserver';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('register LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0231 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0232
     * @tc.name      testResourceLocaleHugeMatrixD0232
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 unregisterUnhandledRejection 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0232 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterUnhandledRejection';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('unregister UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('unregister UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0232 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0233
     * @tc.name      testResourceLocaleHugeMatrixD0233
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 deleteId 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0233 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'deleteId';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('deleteId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(8);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('deleteId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0233 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0234
     * @tc.name      testResourceLocaleHugeMatrixD0234
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0234 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(33);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0234 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0235
     * @tc.name      testResourceLocaleHugeMatrixD0235
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 privacy_window_permission 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0235 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'privacy_window_permission';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(33);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0235 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0236
     * @tc.name      testResourceLocaleHugeMatrixD0236
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 getUidCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0236 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'getUidCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0236 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0237
     * @tc.name      testResourceLocaleHugeMatrixD0237
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 equalCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0237 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'equalCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0237 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0238
     * @tc.name      testResourceLocaleHugeMatrixD0238
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 trigger 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0238 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'trigger';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(7);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0238 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0239
     * @tc.name      testResourceLocaleHugeMatrixD0239
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 ApplicationContext_setFont 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0239 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_setFont';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(7);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0239 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0240
     * @tc.name      testResourceLocaleHugeMatrixD0240
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 UIAbilityContext_moveAbilityToBackground 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0240 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_moveAbilityToBackground';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0240 end');
    })
  })
}
