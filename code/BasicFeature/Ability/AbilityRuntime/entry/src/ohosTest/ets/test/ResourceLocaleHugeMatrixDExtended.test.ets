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

export default function resourceLocaleHugeMatrixDExtendedTest(): void {
  describe('AbilityRuntimeResourceLocaleHugeMatrixDExtendedTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0074
     * @tc.name      testResourceLocaleHugeMatrixD0074
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 ApplicationContext_setFont 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0074 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0074 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0075
     * @tc.name      testResourceLocaleHugeMatrixD0075
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 UIAbilityContext_moveAbilityToBackground 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0075 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0075 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0076
     * @tc.name      testResourceLocaleHugeMatrixD0076
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 main_title 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0076 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0076 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0077
     * @tc.name      testResourceLocaleHugeMatrixD0077
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 WantAgent 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0077 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0077 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0078
     * @tc.name      testResourceLocaleHugeMatrixD0078
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 ErrorManager 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0078 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0078 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0079
     * @tc.name      testResourceLocaleHugeMatrixD0079
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 isRamConstrainedDevicePromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0079 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0079 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0080
     * @tc.name      testResourceLocaleHugeMatrixD0080
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 getRunningProcessInformationPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0080 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0080 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0081
     * @tc.name      testResourceLocaleHugeMatrixD0081
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 registerLoopObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0081 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0081 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0082
     * @tc.name      testResourceLocaleHugeMatrixD0082
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 unregisterUnhandledRejection 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0082 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0082 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0083
     * @tc.name      testResourceLocaleHugeMatrixD0083
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 deleteId 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0083 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0083 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0084
     * @tc.name      testResourceLocaleHugeMatrixD0084
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0084 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0084 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0085
     * @tc.name      testResourceLocaleHugeMatrixD0085
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 privacy_window_permission 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0085 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0085 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0086
     * @tc.name      testResourceLocaleHugeMatrixD0086
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 getUidCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0086 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0086 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0087
     * @tc.name      testResourceLocaleHugeMatrixD0087
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 equalCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0087 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0087 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0088
     * @tc.name      testResourceLocaleHugeMatrixD0088
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 trigger 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0088 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0088 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0089
     * @tc.name      testResourceLocaleHugeMatrixD0089
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 ApplicationContext_setFont 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0089 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0089 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0090
     * @tc.name      testResourceLocaleHugeMatrixD0090
     * @tc.desc      DARK 模式下 fr_Latn_FR 字符串 UIAbilityContext_moveAbilityToBackground 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0090 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0090 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0091
     * @tc.name      testResourceLocaleHugeMatrixD0091
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 main_title 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0091 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0091 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0092
     * @tc.name      testResourceLocaleHugeMatrixD0092
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 WantAgent 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0092 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0092 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0093
     * @tc.name      testResourceLocaleHugeMatrixD0093
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 ErrorManager 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0093 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0093 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0094
     * @tc.name      testResourceLocaleHugeMatrixD0094
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 isRamConstrainedDevicePromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0094 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0094 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0095
     * @tc.name      testResourceLocaleHugeMatrixD0095
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 getRunningProcessInformationPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0095 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0095 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0096
     * @tc.name      testResourceLocaleHugeMatrixD0096
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 registerLoopObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0096 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0096 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0097
     * @tc.name      testResourceLocaleHugeMatrixD0097
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 unregisterUnhandledRejection 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0097 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0097 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0098
     * @tc.name      testResourceLocaleHugeMatrixD0098
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 deleteId 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0098 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0098 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0099
     * @tc.name      testResourceLocaleHugeMatrixD0099
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0099 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0099 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0100
     * @tc.name      testResourceLocaleHugeMatrixD0100
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 privacy_window_permission 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0100 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0100 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0101
     * @tc.name      testResourceLocaleHugeMatrixD0101
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 getUidCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0101 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0101 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0102
     * @tc.name      testResourceLocaleHugeMatrixD0102
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 equalCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0102 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0102 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0103
     * @tc.name      testResourceLocaleHugeMatrixD0103
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 trigger 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0103 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0103 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0104
     * @tc.name      testResourceLocaleHugeMatrixD0104
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 ApplicationContext_setFont 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0104 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0104 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0105
     * @tc.name      testResourceLocaleHugeMatrixD0105
     * @tc.desc      LIGHT 模式下 ja_Jpan_JP 字符串 UIAbilityContext_moveAbilityToBackground 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0105 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0105 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0106
     * @tc.name      testResourceLocaleHugeMatrixD0106
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 main_title 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0106 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0106 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0107
     * @tc.name      testResourceLocaleHugeMatrixD0107
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 WantAgent 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0107 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0107 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0108
     * @tc.name      testResourceLocaleHugeMatrixD0108
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 ErrorManager 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0108 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0108 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0109
     * @tc.name      testResourceLocaleHugeMatrixD0109
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 isRamConstrainedDevicePromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0109 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0109 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0110
     * @tc.name      testResourceLocaleHugeMatrixD0110
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 getRunningProcessInformationPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0110 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0110 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0111
     * @tc.name      testResourceLocaleHugeMatrixD0111
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 registerLoopObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0111 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0111 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0112
     * @tc.name      testResourceLocaleHugeMatrixD0112
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 unregisterUnhandledRejection 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0112 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0112 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0113
     * @tc.name      testResourceLocaleHugeMatrixD0113
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 deleteId 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0113 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0113 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0114
     * @tc.name      testResourceLocaleHugeMatrixD0114
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0114 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0114 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0115
     * @tc.name      testResourceLocaleHugeMatrixD0115
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 privacy_window_permission 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0115 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0115 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0116
     * @tc.name      testResourceLocaleHugeMatrixD0116
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 getUidCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0116 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0116 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0117
     * @tc.name      testResourceLocaleHugeMatrixD0117
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 equalCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0117 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0117 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0118
     * @tc.name      testResourceLocaleHugeMatrixD0118
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 trigger 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0118 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0118 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0119
     * @tc.name      testResourceLocaleHugeMatrixD0119
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 ApplicationContext_setFont 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0119 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0119 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0120
     * @tc.name      testResourceLocaleHugeMatrixD0120
     * @tc.desc      DARK 模式下 ja_Jpan_JP 字符串 UIAbilityContext_moveAbilityToBackground 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0120 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0120 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0121
     * @tc.name      testResourceLocaleHugeMatrixD0121
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 main_title 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0121 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0121 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0122
     * @tc.name      testResourceLocaleHugeMatrixD0122
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 WantAgent 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0122 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0122 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0123
     * @tc.name      testResourceLocaleHugeMatrixD0123
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 ErrorManager 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0123 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0123 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0124
     * @tc.name      testResourceLocaleHugeMatrixD0124
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 isRamConstrainedDevicePromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0124 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0124 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0125
     * @tc.name      testResourceLocaleHugeMatrixD0125
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 getRunningProcessInformationPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0125 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0125 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0126
     * @tc.name      testResourceLocaleHugeMatrixD0126
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 registerLoopObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0126 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0126 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0127
     * @tc.name      testResourceLocaleHugeMatrixD0127
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 unregisterUnhandledRejection 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0127 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0127 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0128
     * @tc.name      testResourceLocaleHugeMatrixD0128
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 deleteId 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0128 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0128 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0129
     * @tc.name      testResourceLocaleHugeMatrixD0129
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0129 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0129 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0130
     * @tc.name      testResourceLocaleHugeMatrixD0130
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 privacy_window_permission 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0130 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0130 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0131
     * @tc.name      testResourceLocaleHugeMatrixD0131
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 getUidCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0131 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0131 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0132
     * @tc.name      testResourceLocaleHugeMatrixD0132
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 equalCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0132 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0132 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0133
     * @tc.name      testResourceLocaleHugeMatrixD0133
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 trigger 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0133 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0133 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0134
     * @tc.name      testResourceLocaleHugeMatrixD0134
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 ApplicationContext_setFont 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0134 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0134 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0135
     * @tc.name      testResourceLocaleHugeMatrixD0135
     * @tc.desc      LIGHT 模式下 de_Latn_DE 字符串 UIAbilityContext_moveAbilityToBackground 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0135 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0135 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0136
     * @tc.name      testResourceLocaleHugeMatrixD0136
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 main_title 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0136 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0136 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0137
     * @tc.name      testResourceLocaleHugeMatrixD0137
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 WantAgent 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0137 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0137 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0138
     * @tc.name      testResourceLocaleHugeMatrixD0138
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 ErrorManager 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0138 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0138 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0139
     * @tc.name      testResourceLocaleHugeMatrixD0139
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 isRamConstrainedDevicePromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0139 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0139 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0140
     * @tc.name      testResourceLocaleHugeMatrixD0140
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 getRunningProcessInformationPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0140 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0140 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0141
     * @tc.name      testResourceLocaleHugeMatrixD0141
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 registerLoopObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0141 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0141 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0142
     * @tc.name      testResourceLocaleHugeMatrixD0142
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 unregisterUnhandledRejection 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0142 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0142 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0143
     * @tc.name      testResourceLocaleHugeMatrixD0143
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 deleteId 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0143 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0143 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0144
     * @tc.name      testResourceLocaleHugeMatrixD0144
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0144 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0144 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0145
     * @tc.name      testResourceLocaleHugeMatrixD0145
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 privacy_window_permission 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0145 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0145 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0146
     * @tc.name      testResourceLocaleHugeMatrixD0146
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 getUidCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrixD0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0146 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0146 end');
    })
  })
}
