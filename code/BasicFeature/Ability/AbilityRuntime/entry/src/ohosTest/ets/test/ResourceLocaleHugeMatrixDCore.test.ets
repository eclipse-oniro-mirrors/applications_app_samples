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

export default function resourceLocaleHugeMatrixDCoreTest(): void {
  describe('AbilityRuntimeResourceLocaleHugeMatrixDCoreTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0001
     * @tc.name      testResourceLocaleHugeMatrixD0001
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 main_title 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0001 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const key: string = 'main_title';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('元能力public接口开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('元能力public接口开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0002
     * @tc.name      testResourceLocaleHugeMatrixD0002
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 WantAgent 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0002 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const key: string = 'WantAgent';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('WantAgent开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('WantAgent开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0003
     * @tc.name      testResourceLocaleHugeMatrixD0003
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 ErrorManager 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0003 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const key: string = 'ErrorManager';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('errorManager开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('errorManager开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0004
     * @tc.name      testResourceLocaleHugeMatrixD0004
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 isRamConstrainedDevicePromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0004 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0005
     * @tc.name      testResourceLocaleHugeMatrixD0005
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 getRunningProcessInformationPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0005 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0006
     * @tc.name      testResourceLocaleHugeMatrixD0006
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 registerLoopObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0006 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const key: string = 'registerLoopObserver';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('注册LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('注册LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0007
     * @tc.name      testResourceLocaleHugeMatrixD0007
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 unregisterUnhandledRejection 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0007 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const key: string = 'unregisterUnhandledRejection';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('注销UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(28);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('注销UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0008
     * @tc.name      testResourceLocaleHugeMatrixD0008
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 deleteId 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0008 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const key: string = 'deleteId';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('deleteId(删除指定uri路径末尾的ID)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(24);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('deleteId(删除指定uri路径末尾的ID)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0009
     * @tc.name      testResourceLocaleHugeMatrixD0009
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0009 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0010
     * @tc.name      testResourceLocaleHugeMatrixD0010
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 privacy_window_permission 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0010 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const key: string = 'privacy_window_permission';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('运行用户设置隐私窗口');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(10);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('运行用户设置隐私窗口');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0011
     * @tc.name      testResourceLocaleHugeMatrixD0011
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 getUidCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0011 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0012
     * @tc.name      testResourceLocaleHugeMatrixD0012
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 equalCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0012 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0013
     * @tc.name      testResourceLocaleHugeMatrixD0013
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 trigger 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0013 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0014
     * @tc.name      testResourceLocaleHugeMatrixD0014
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 ApplicationContext_setFont 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0014 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0015
     * @tc.name      testResourceLocaleHugeMatrixD0015
     * @tc.desc      LIGHT 模式下 zh_Hans_CN 字符串 UIAbilityContext_moveAbilityToBackground 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0015 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0016
     * @tc.name      testResourceLocaleHugeMatrixD0016
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 main_title 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0016 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'main_title';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('元能力public接口开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('元能力public接口开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0017
     * @tc.name      testResourceLocaleHugeMatrixD0017
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 WantAgent 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0017 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'WantAgent';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('WantAgent开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('WantAgent开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0018
     * @tc.name      testResourceLocaleHugeMatrixD0018
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 ErrorManager 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0018 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'ErrorManager';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('errorManager开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('errorManager开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0019
     * @tc.name      testResourceLocaleHugeMatrixD0019
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 isRamConstrainedDevicePromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0019 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0020
     * @tc.name      testResourceLocaleHugeMatrixD0020
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 getRunningProcessInformationPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0020 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0021
     * @tc.name      testResourceLocaleHugeMatrixD0021
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 registerLoopObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0021 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'registerLoopObserver';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('注册LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('注册LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0022
     * @tc.name      testResourceLocaleHugeMatrixD0022
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 unregisterUnhandledRejection 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0022 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterUnhandledRejection';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('注销UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(28);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('注销UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0023
     * @tc.name      testResourceLocaleHugeMatrixD0023
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 deleteId 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0023 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'deleteId';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('deleteId(删除指定uri路径末尾的ID)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(24);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('deleteId(删除指定uri路径末尾的ID)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0024
     * @tc.name      testResourceLocaleHugeMatrixD0024
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0024 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0025
     * @tc.name      testResourceLocaleHugeMatrixD0025
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 privacy_window_permission 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0025 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'privacy_window_permission';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('运行用户设置隐私窗口');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(10);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('运行用户设置隐私窗口');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0026
     * @tc.name      testResourceLocaleHugeMatrixD0026
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 getUidCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0026 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0027
     * @tc.name      testResourceLocaleHugeMatrixD0027
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 equalCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0027 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0028
     * @tc.name      testResourceLocaleHugeMatrixD0028
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 trigger 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0028 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0029
     * @tc.name      testResourceLocaleHugeMatrixD0029
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 ApplicationContext_setFont 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0029 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0030
     * @tc.name      testResourceLocaleHugeMatrixD0030
     * @tc.desc      DARK 模式下 zh_Hans_CN 字符串 UIAbilityContext_moveAbilityToBackground 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0030 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0031
     * @tc.name      testResourceLocaleHugeMatrixD0031
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 main_title 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0031 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0032
     * @tc.name      testResourceLocaleHugeMatrixD0032
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 WantAgent 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0032 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0033
     * @tc.name      testResourceLocaleHugeMatrixD0033
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 ErrorManager 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0033 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0033 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0034
     * @tc.name      testResourceLocaleHugeMatrixD0034
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 isRamConstrainedDevicePromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0034 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0034 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0035
     * @tc.name      testResourceLocaleHugeMatrixD0035
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 getRunningProcessInformationPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0035 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0035 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0036
     * @tc.name      testResourceLocaleHugeMatrixD0036
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 registerLoopObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0036 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0036 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0037
     * @tc.name      testResourceLocaleHugeMatrixD0037
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 unregisterUnhandledRejection 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0037 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0037 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0038
     * @tc.name      testResourceLocaleHugeMatrixD0038
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 deleteId 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0038 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0038 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0039
     * @tc.name      testResourceLocaleHugeMatrixD0039
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0039 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0039 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0040
     * @tc.name      testResourceLocaleHugeMatrixD0040
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 privacy_window_permission 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0040 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0040 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0041
     * @tc.name      testResourceLocaleHugeMatrixD0041
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 getUidCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0041 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0041 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0042
     * @tc.name      testResourceLocaleHugeMatrixD0042
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 equalCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0042 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0042 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0043
     * @tc.name      testResourceLocaleHugeMatrixD0043
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 trigger 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0043 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0043 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0044
     * @tc.name      testResourceLocaleHugeMatrixD0044
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 ApplicationContext_setFont 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0044 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0044 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0045
     * @tc.name      testResourceLocaleHugeMatrixD0045
     * @tc.desc      LIGHT 模式下 en_Latn_US 字符串 UIAbilityContext_moveAbilityToBackground 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleHugeMatrixD0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0045 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0045 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0046
     * @tc.name      testResourceLocaleHugeMatrixD0046
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 main_title 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0046 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0046 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0047
     * @tc.name      testResourceLocaleHugeMatrixD0047
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 WantAgent 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0047 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0047 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0048
     * @tc.name      testResourceLocaleHugeMatrixD0048
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 ErrorManager 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0048 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0048 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0049
     * @tc.name      testResourceLocaleHugeMatrixD0049
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 isRamConstrainedDevicePromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0049 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0049 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0050
     * @tc.name      testResourceLocaleHugeMatrixD0050
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 getRunningProcessInformationPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0050 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0050 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0051
     * @tc.name      testResourceLocaleHugeMatrixD0051
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 registerLoopObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0051 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0051 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0052
     * @tc.name      testResourceLocaleHugeMatrixD0052
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 unregisterUnhandledRejection 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0052 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0052 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0053
     * @tc.name      testResourceLocaleHugeMatrixD0053
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 deleteId 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0053 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0053 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0054
     * @tc.name      testResourceLocaleHugeMatrixD0054
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0054 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0054 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0055
     * @tc.name      testResourceLocaleHugeMatrixD0055
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 privacy_window_permission 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0055 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0055 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0056
     * @tc.name      testResourceLocaleHugeMatrixD0056
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 getUidCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0056 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0056 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0057
     * @tc.name      testResourceLocaleHugeMatrixD0057
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 equalCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0057 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0057 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0058
     * @tc.name      testResourceLocaleHugeMatrixD0058
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 trigger 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0058 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0058 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0059
     * @tc.name      testResourceLocaleHugeMatrixD0059
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 ApplicationContext_setFont 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0059 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0059 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0060
     * @tc.name      testResourceLocaleHugeMatrixD0060
     * @tc.desc      DARK 模式下 en_Latn_US 字符串 UIAbilityContext_moveAbilityToBackground 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0060 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0060 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0061
     * @tc.name      testResourceLocaleHugeMatrixD0061
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 main_title 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0061 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0061 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0062
     * @tc.name      testResourceLocaleHugeMatrixD0062
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 WantAgent 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0062 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0062 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0063
     * @tc.name      testResourceLocaleHugeMatrixD0063
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 ErrorManager 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0063 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0063 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0064
     * @tc.name      testResourceLocaleHugeMatrixD0064
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 isRamConstrainedDevicePromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0064 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0064 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0065
     * @tc.name      testResourceLocaleHugeMatrixD0065
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 getRunningProcessInformationPromise 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0065 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0065 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0066
     * @tc.name      testResourceLocaleHugeMatrixD0066
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 registerLoopObserver 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0066 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0066 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0067
     * @tc.name      testResourceLocaleHugeMatrixD0067
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 unregisterUnhandledRejection 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0067 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0067 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0068
     * @tc.name      testResourceLocaleHugeMatrixD0068
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 deleteId 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0068 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0068 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0069
     * @tc.name      testResourceLocaleHugeMatrixD0069
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0069 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0069 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0070
     * @tc.name      testResourceLocaleHugeMatrixD0070
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 privacy_window_permission 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0070 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0070 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0071
     * @tc.name      testResourceLocaleHugeMatrixD0071
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 getUidCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0071 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0071 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0072
     * @tc.name      testResourceLocaleHugeMatrixD0072
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 equalCallback 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0072 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0072 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_LOCALE_HUGE_D_0073
     * @tc.name      testResourceLocaleHugeMatrixD0073
     * @tc.desc      LIGHT 模式下 fr_Latn_FR 字符串 trigger 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleHugeMatrixD0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0073 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrixD0073 end');
    })
  })
}
