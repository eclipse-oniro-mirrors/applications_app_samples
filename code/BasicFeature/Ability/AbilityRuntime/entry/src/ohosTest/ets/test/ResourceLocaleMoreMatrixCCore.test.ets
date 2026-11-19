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

export default function resourceLocaleMoreMatrixCCoreTest(): void {
  describe('AbilityRuntimeResourceLocaleMoreMatrixCCoreTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0001
     * @tc.name      testResourceLocaleMoreMatrixC0001
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 EntryAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0001 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
      const key: string = 'EntryAbility_label';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0002
     * @tc.name      testResourceLocaleMoreMatrixC0002
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 appRecovery 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0002 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
      const key: string = 'appRecovery';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(19);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0003
     * @tc.name      testResourceLocaleMoreMatrixC0003
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 ApplicationContext 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0003 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0004
     * @tc.name      testResourceLocaleMoreMatrixC0004
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 ErrorManager 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0004 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0005
     * @tc.name      testResourceLocaleMoreMatrixC0005
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 isRamConstrainedDeviceCallback 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0005 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
      const key: string = 'isRamConstrainedDeviceCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0006
     * @tc.name      testResourceLocaleMoreMatrixC0006
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 getAppMemorySizePromise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0006 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
      const key: string = 'getAppMemorySizePromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0007
     * @tc.name      testResourceLocaleMoreMatrixC0007
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 registerErrorObserver 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0007 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0008
     * @tc.name      testResourceLocaleMoreMatrixC0008
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 registerLoopObserver 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0008 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0009
     * @tc.name      testResourceLocaleMoreMatrixC0009
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 registerUnhandledRejection 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0009 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
      const key: string = 'registerUnhandledRejection';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(35);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0010
     * @tc.name      testResourceLocaleMoreMatrixC0010
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 getId 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0010 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
      const key: string = 'getId';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0011
     * @tc.name      testResourceLocaleMoreMatrixC0011
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 updateId 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0011 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0012
     * @tc.name      testResourceLocaleMoreMatrixC0012
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0012 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0013
     * @tc.name      testResourceLocaleMoreMatrixC0013
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 UIExtensionContentSession_setWindowPrivacyModePromise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0013 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModePromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(29);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0014
     * @tc.name      testResourceLocaleMoreMatrixC0014
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 getBundleNameCallback 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0014 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
      const key: string = 'getBundleNameCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0015
     * @tc.name      testResourceLocaleMoreMatrixC0015
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 getUidPromise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0015 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0016
     * @tc.name      testResourceLocaleMoreMatrixC0016
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 equalCallback 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0016 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0017
     * @tc.name      testResourceLocaleMoreMatrixC0017
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 getOperationTypePromise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0017 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
      const key: string = 'getOperationTypePromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0018
     * @tc.name      testResourceLocaleMoreMatrixC0018
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 MapAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0018 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
      const key: string = 'MapAbility_label';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0019
     * @tc.name      testResourceLocaleMoreMatrixC0019
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 ApplicationContext_getRunningProcessInformation_promise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0019 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0020
     * @tc.name      testResourceLocaleMoreMatrixC0020
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 UIAbilityContext_moveAbilityToBackground 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0020 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0021
     * @tc.name      testResourceLocaleMoreMatrixC0021
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 EntryAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0021 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
      const key: string = 'EntryAbility_label';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0022
     * @tc.name      testResourceLocaleMoreMatrixC0022
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 appRecovery 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0022 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
      const key: string = 'appRecovery';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(19);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0023
     * @tc.name      testResourceLocaleMoreMatrixC0023
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 ApplicationContext 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0023 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0024
     * @tc.name      testResourceLocaleMoreMatrixC0024
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 ErrorManager 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0024 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0025
     * @tc.name      testResourceLocaleMoreMatrixC0025
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 isRamConstrainedDeviceCallback 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0025 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
      const key: string = 'isRamConstrainedDeviceCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0026
     * @tc.name      testResourceLocaleMoreMatrixC0026
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 getAppMemorySizePromise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0026 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
      const key: string = 'getAppMemorySizePromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0027
     * @tc.name      testResourceLocaleMoreMatrixC0027
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 registerErrorObserver 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0027 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0028
     * @tc.name      testResourceLocaleMoreMatrixC0028
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 registerLoopObserver 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0028 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0029
     * @tc.name      testResourceLocaleMoreMatrixC0029
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 registerUnhandledRejection 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0029 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
      const key: string = 'registerUnhandledRejection';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(35);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0030
     * @tc.name      testResourceLocaleMoreMatrixC0030
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 getId 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0030 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
      const key: string = 'getId';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0031
     * @tc.name      testResourceLocaleMoreMatrixC0031
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 updateId 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0031 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0032
     * @tc.name      testResourceLocaleMoreMatrixC0032
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0032 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0033
     * @tc.name      testResourceLocaleMoreMatrixC0033
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 UIExtensionContentSession_setWindowPrivacyModePromise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0033 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModePromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(29);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0033 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0034
     * @tc.name      testResourceLocaleMoreMatrixC0034
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 getBundleNameCallback 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0034 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
      const key: string = 'getBundleNameCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0034 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0035
     * @tc.name      testResourceLocaleMoreMatrixC0035
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 getUidPromise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0035 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0035 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0036
     * @tc.name      testResourceLocaleMoreMatrixC0036
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 equalCallback 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0036 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0036 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0037
     * @tc.name      testResourceLocaleMoreMatrixC0037
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 getOperationTypePromise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0037 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
      const key: string = 'getOperationTypePromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0037 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0038
     * @tc.name      testResourceLocaleMoreMatrixC0038
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 MapAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0038 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
      const key: string = 'MapAbility_label';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0038 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0039
     * @tc.name      testResourceLocaleMoreMatrixC0039
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 ApplicationContext_getRunningProcessInformation_promise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0039 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0039 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0040
     * @tc.name      testResourceLocaleMoreMatrixC0040
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 UIAbilityContext_moveAbilityToBackground 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0040 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0040 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0041
     * @tc.name      testResourceLocaleMoreMatrixC0041
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 EntryAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0041 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
      const key: string = 'EntryAbility_label';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0041 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0042
     * @tc.name      testResourceLocaleMoreMatrixC0042
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 appRecovery 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0042 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
      const key: string = 'appRecovery';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(19);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0042 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0043
     * @tc.name      testResourceLocaleMoreMatrixC0043
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 ApplicationContext 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0043 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0043 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0044
     * @tc.name      testResourceLocaleMoreMatrixC0044
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 ErrorManager 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0044 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0044 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0045
     * @tc.name      testResourceLocaleMoreMatrixC0045
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 isRamConstrainedDeviceCallback 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0045 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
      const key: string = 'isRamConstrainedDeviceCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0045 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0046
     * @tc.name      testResourceLocaleMoreMatrixC0046
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 getAppMemorySizePromise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0046 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
      const key: string = 'getAppMemorySizePromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0046 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0047
     * @tc.name      testResourceLocaleMoreMatrixC0047
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 registerErrorObserver 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0047 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0047 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0048
     * @tc.name      testResourceLocaleMoreMatrixC0048
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 registerLoopObserver 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0048 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0048 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0049
     * @tc.name      testResourceLocaleMoreMatrixC0049
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 registerUnhandledRejection 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0049 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
      const key: string = 'registerUnhandledRejection';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(35);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0049 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0050
     * @tc.name      testResourceLocaleMoreMatrixC0050
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 getId 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0050 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
      const key: string = 'getId';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0050 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0051
     * @tc.name      testResourceLocaleMoreMatrixC0051
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 updateId 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0051 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0051 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0052
     * @tc.name      testResourceLocaleMoreMatrixC0052
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0052 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0052 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0053
     * @tc.name      testResourceLocaleMoreMatrixC0053
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 UIExtensionContentSession_setWindowPrivacyModePromise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0053 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModePromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(29);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0053 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0054
     * @tc.name      testResourceLocaleMoreMatrixC0054
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 getBundleNameCallback 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0054 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
      const key: string = 'getBundleNameCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0054 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0055
     * @tc.name      testResourceLocaleMoreMatrixC0055
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 getUidPromise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0055 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0055 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0056
     * @tc.name      testResourceLocaleMoreMatrixC0056
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 equalCallback 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0056 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0056 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0057
     * @tc.name      testResourceLocaleMoreMatrixC0057
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 getOperationTypePromise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0057 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
      const key: string = 'getOperationTypePromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0057 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0058
     * @tc.name      testResourceLocaleMoreMatrixC0058
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 MapAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0058 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
      const key: string = 'MapAbility_label';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0058 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0059
     * @tc.name      testResourceLocaleMoreMatrixC0059
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 ApplicationContext_getRunningProcessInformation_promise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0059 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0059 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0060
     * @tc.name      testResourceLocaleMoreMatrixC0060
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 UIAbilityContext_moveAbilityToBackground 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrixC0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0060 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0060 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0061
     * @tc.name      testResourceLocaleMoreMatrixC0061
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 EntryAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0061 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
      const key: string = 'EntryAbility_label';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0061 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0062
     * @tc.name      testResourceLocaleMoreMatrixC0062
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 appRecovery 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0062 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
      const key: string = 'appRecovery';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(19);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0062 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0063
     * @tc.name      testResourceLocaleMoreMatrixC0063
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 ApplicationContext 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0063 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0063 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0064
     * @tc.name      testResourceLocaleMoreMatrixC0064
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 ErrorManager 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0064 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0064 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0065
     * @tc.name      testResourceLocaleMoreMatrixC0065
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 isRamConstrainedDeviceCallback 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0065 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
      const key: string = 'isRamConstrainedDeviceCallback';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0065 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0066
     * @tc.name      testResourceLocaleMoreMatrixC0066
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 getAppMemorySizePromise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0066 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
      const key: string = 'getAppMemorySizePromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0066 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0067
     * @tc.name      testResourceLocaleMoreMatrixC0067
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 registerErrorObserver 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0067 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0067 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0068
     * @tc.name      testResourceLocaleMoreMatrixC0068
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 registerLoopObserver 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0068 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0068 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0069
     * @tc.name      testResourceLocaleMoreMatrixC0069
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 registerUnhandledRejection 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0069 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
      const key: string = 'registerUnhandledRejection';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(35);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0069 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0070
     * @tc.name      testResourceLocaleMoreMatrixC0070
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 getId 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0070 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
      const key: string = 'getId';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0070 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0071
     * @tc.name      testResourceLocaleMoreMatrixC0071
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 updateId 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0071 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0071 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0072
     * @tc.name      testResourceLocaleMoreMatrixC0072
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0072 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0072 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_MORE_C_0073
     * @tc.name      testResourceLocaleMoreMatrixC0073
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 UIExtensionContentSession_setWindowPrivacyModePromise 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrixC0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0073 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModePromise';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(29);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrixC0073 end');
    })
  })
}
