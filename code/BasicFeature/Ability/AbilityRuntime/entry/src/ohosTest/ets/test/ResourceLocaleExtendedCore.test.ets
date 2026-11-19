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

export default function resourceLocaleExtendedCoreTest(): void {
  describe('AbilityRuntimeResourceLocaleExtendedCoreTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0001
     * @tc.name      testResourceLocaleExtended0001
     * @tc.desc      深色模式下 中文 字符串 module_desc 回落为 "模块描述"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0001 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'module_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('模块描述');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(4);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('模块描述');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0002
     * @tc.name      testResourceLocaleExtended0002
     * @tc.desc      深色模式下 中文 字符串 EntryAbility_desc 回落为 "description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0002 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'EntryAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0003
     * @tc.name      testResourceLocaleExtended0003
     * @tc.desc      深色模式下 中文 字符串 EntryAbility_label 回落为 "label"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0003 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'EntryAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0004
     * @tc.name      testResourceLocaleExtended0004
     * @tc.desc      深色模式下 中文 字符串 main_title 回落为 "元能力public接口开发示例"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0004 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'main_title';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('元能力public接口开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('元能力public接口开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0005
     * @tc.name      testResourceLocaleExtended0005
     * @tc.desc      深色模式下 中文 字符串 AppManager 回落为 "appManager开发示例"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0005 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'AppManager';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('appManager开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('appManager开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0006
     * @tc.name      testResourceLocaleExtended0006
     * @tc.desc      深色模式下 中文 字符串 appRecovery 回落为 "appRecovery开发示例"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0006 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'appRecovery';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('appRecovery开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('appRecovery开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0007
     * @tc.name      testResourceLocaleExtended0007
     * @tc.desc      深色模式下 中文 字符串 DataUriUtils 回落为 "dataUriUtils开发示例"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0007 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'DataUriUtils';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('dataUriUtils开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('dataUriUtils开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0008
     * @tc.name      testResourceLocaleExtended0008
     * @tc.desc      深色模式下 中文 字符串 WantAgent 回落为 "WantAgent开发示例"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0008 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'WantAgent';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('WantAgent开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('WantAgent开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0009
     * @tc.name      testResourceLocaleExtended0009
     * @tc.desc      深色模式下 中文 字符串 ApplicationContext 回落为 "ApplicationContext开发示例"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0009 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('ApplicationContext开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(22);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('ApplicationContext开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0010
     * @tc.name      testResourceLocaleExtended0010
     * @tc.desc      深色模式下 中文 字符串 UIAbilityContext 回落为 "UIAbilityContext开发示例"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0010 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UIAbilityContext开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0011
     * @tc.name      testResourceLocaleExtended0011
     * @tc.desc      深色模式下 中文 字符串 AbilityLifecycleCallback 回落为 "AbilityLifecycleCallback开发示例"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0011 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'AbilityLifecycleCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('AbilityLifecycleCallback开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(28);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('AbilityLifecycleCallback开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0012
     * @tc.name      testResourceLocaleExtended0012
     * @tc.desc      深色模式下 中文 字符串 ErrorManager 回落为 "errorManager开发示例"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0012 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'ErrorManager';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('errorManager开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('errorManager开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0013
     * @tc.name      testResourceLocaleExtended0013
     * @tc.desc      深色模式下 中文 字符串 isRunningInStabilityTestCallback 回落为 "isRunningInStabilityTest(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0013 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'isRunningInStabilityTestCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(34);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0014
     * @tc.name      testResourceLocaleExtended0014
     * @tc.desc      深色模式下 中文 字符串 isRunningInStabilityTestPromise 回落为 "isRunningInStabilityTest(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0014 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'isRunningInStabilityTestPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRunningInStabilityTest(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRunningInStabilityTest(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0015
     * @tc.name      testResourceLocaleExtended0015
     * @tc.desc      深色模式下 中文 字符串 isRamConstrainedDeviceCallback 回落为 "isRamConstrainedDevice(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0015 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'isRamConstrainedDeviceCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0016
     * @tc.name      testResourceLocaleExtended0016
     * @tc.desc      深色模式下 中文 字符串 isRamConstrainedDevicePromise 回落为 "isRamConstrainedDevice(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0016 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'isRamConstrainedDevicePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRamConstrainedDevice(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(31);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRamConstrainedDevice(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0017
     * @tc.name      testResourceLocaleExtended0017
     * @tc.desc      深色模式下 中文 字符串 getAppMemorySizeCallback 回落为 "getAppMemorySize(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0017 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'getAppMemorySizeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0018
     * @tc.name      testResourceLocaleExtended0018
     * @tc.desc      深色模式下 中文 字符串 getAppMemorySizePromise 回落为 "getAppMemorySize(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0018 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'getAppMemorySizePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0019
     * @tc.name      testResourceLocaleExtended0019
     * @tc.desc      深色模式下 中文 字符串 getRunningProcessInformationCallback 回落为 "getRunningProcessInformation(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0019 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'getRunningProcessInformationCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(38);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0020
     * @tc.name      testResourceLocaleExtended0020
     * @tc.desc      深色模式下 中文 字符串 getRunningProcessInformationPromise 回落为 "getRunningProcessInformation(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0020 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'getRunningProcessInformationPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0021
     * @tc.name      testResourceLocaleExtended0021
     * @tc.desc      深色模式下 中文 字符串 registerErrorObserver 回落为 "注册ErrorObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0021 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'registerErrorObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('注册ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('注册ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0022
     * @tc.name      testResourceLocaleExtended0022
     * @tc.desc      深色模式下 中文 字符串 unregisterErrorObserver 回落为 "注销ErrorObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0022 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterErrorObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('注销ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('注销ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0023
     * @tc.name      testResourceLocaleExtended0023
     * @tc.desc      深色模式下 中文 字符串 simulateError 回落为 "模拟Error"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0023 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'simulateError';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('模拟Error');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(7);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('模拟Error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0024
     * @tc.name      testResourceLocaleExtended0024
     * @tc.desc      深色模式下 中文 字符串 registerLoopObserver 回落为 "注册LoopObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0024 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'registerLoopObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('注册LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('注册LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0025
     * @tc.name      testResourceLocaleExtended0025
     * @tc.desc      深色模式下 中文 字符串 unregisterLoopObserver 回落为 "注销LoopObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0025 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterLoopObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('注销LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('注销LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0026
     * @tc.name      testResourceLocaleExtended0026
     * @tc.desc      深色模式下 中文 字符串 simulateLoopTimeout 回落为 "模拟LoopTimeout"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0026 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'simulateLoopTimeout';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('模拟LoopTimeout');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('模拟LoopTimeout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0027
     * @tc.name      testResourceLocaleExtended0027
     * @tc.desc      深色模式下 中文 字符串 registerUnhandledRejection 回落为 "注册UnhandledRejectionObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0027 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'registerUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('注册UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(28);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('注册UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0028
     * @tc.name      testResourceLocaleExtended0028
     * @tc.desc      深色模式下 中文 字符串 unregisterUnhandledRejection 回落为 "注销UnhandledRejectionObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0028 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('注销UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(28);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('注销UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0029
     * @tc.name      testResourceLocaleExtended0029
     * @tc.desc      深色模式下 中文 字符串 simulateUnhandledRejection 回落为 "模拟UnhandledRejection"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0029 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'simulateUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('模拟UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('模拟UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0030
     * @tc.name      testResourceLocaleExtended0030
     * @tc.desc      深色模式下 中文 字符串 getId 回落为 "getId(获取指定uri路径末尾的ID)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0030 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'getId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getId(获取指定uri路径末尾的ID)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getId(获取指定uri路径末尾的ID)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0031
     * @tc.name      testResourceLocaleExtended0031
     * @tc.desc      深色模式下 中文 字符串 attachId 回落为 "attachId(将ID附加到uri的路径末尾)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0031 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'attachId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('attachId(将ID附加到uri的路径末尾)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(24);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('attachId(将ID附加到uri的路径末尾)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0032
     * @tc.name      testResourceLocaleExtended0032
     * @tc.desc      深色模式下 中文 字符串 deleteId 回落为 "deleteId(删除指定uri路径末尾的ID)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0032 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'deleteId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('deleteId(删除指定uri路径末尾的ID)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(24);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('deleteId(删除指定uri路径末尾的ID)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0033
     * @tc.name      testResourceLocaleExtended0033
     * @tc.desc      深色模式下 中文 字符串 updateId 回落为 "updateId(更新指定uri中的ID)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0033 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'updateId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('updateId(更新指定uri中的ID)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('updateId(更新指定uri中的ID)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0033 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0034
     * @tc.name      testResourceLocaleExtended0034
     * @tc.desc      深色模式下 中文 字符串 UIAbilityContext_startAbilityByType 回落为 "startAbilityByType"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0034 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_startAbilityByType';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('startAbilityByType');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('startAbilityByType');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0034 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0035
     * @tc.name      testResourceLocaleExtended0035
     * @tc.desc      深色模式下 中文 字符串 UIAbilityContext_requestModalUIExtension 回落为 "requestModalUIExtension"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0035 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_requestModalUIExtension';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('requestModalUIExtension');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('requestModalUIExtension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0035 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0036
     * @tc.name      testResourceLocaleExtended0036
     * @tc.desc      深色模式下 中文 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 回落为
     *               "terminateSelfWithResult(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0036 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0036 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0037
     * @tc.name      testResourceLocaleExtended0037
     * @tc.desc      深色模式下 中文 字符串 UIExtensionContentSession_terminateSelfWithResultPromise 回落为
     *               "terminateSelfWithResult(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0037 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0037 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0038
     * @tc.name      testResourceLocaleExtended0038
     * @tc.desc      深色模式下 中文 字符串 UIExtensionContentSession_setWindowPrivacyModeCallback 回落为
     *               "setWindowPrivacyMode(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0038 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setWindowPrivacyMode(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(30);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setWindowPrivacyMode(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0038 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0039
     * @tc.name      testResourceLocaleExtended0039
     * @tc.desc      深色模式下 中文 字符串 UIExtensionContentSession_setWindowPrivacyModePromise 回落为
     *               "setWindowPrivacyMode(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0039 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(29);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0039 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0040
     * @tc.name      testResourceLocaleExtended0040
     * @tc.desc      深色模式下 中文 字符串 privacy_window_permission 回落为 "运行用户设置隐私窗口"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0040 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'privacy_window_permission';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('运行用户设置隐私窗口');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(10);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('运行用户设置隐私窗口');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0040 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0041
     * @tc.name      testResourceLocaleExtended0041
     * @tc.desc      深色模式下 中文 字符串 UIExtensionContentSession_getUIExtensionWindowProxy 回落为 "getUIExtensionWindowProxy"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0041 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_getUIExtensionWindowProxy';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0041 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0042
     * @tc.name      testResourceLocaleExtended0042
     * @tc.desc      深色模式下 中文 字符串 getBundleNameCallback 回落为 "getBundleName(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0042 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'getBundleNameCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0042 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0043
     * @tc.name      testResourceLocaleExtended0043
     * @tc.desc      深色模式下 中文 字符串 getBundleNamePromise 回落为 "getBundleName(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0043 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'getBundleNamePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getBundleName(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(22);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getBundleName(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0043 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0044
     * @tc.name      testResourceLocaleExtended0044
     * @tc.desc      深色模式下 中文 字符串 getUidCallback 回落为 "getUid(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0044 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'getUidCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0044 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0045
     * @tc.name      testResourceLocaleExtended0045
     * @tc.desc      深色模式下 中文 字符串 getUidPromise 回落为 "getUid(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0045 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'getUidPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0045 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0046
     * @tc.name      testResourceLocaleExtended0046
     * @tc.desc      深色模式下 中文 字符串 cancelCallback 回落为 "cancel(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0046 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'cancelCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0046 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0047
     * @tc.name      testResourceLocaleExtended0047
     * @tc.desc      深色模式下 中文 字符串 cancelPromise 回落为 "cancel(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0047 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'cancelPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('cancel(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('cancel(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0047 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0048
     * @tc.name      testResourceLocaleExtended0048
     * @tc.desc      深色模式下 中文 字符串 equalCallback 回落为 "equal(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0048 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'equalCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0048 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0049
     * @tc.name      testResourceLocaleExtended0049
     * @tc.desc      深色模式下 中文 字符串 equalPromise 回落为 "equal(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0049 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'equalPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0049 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0050
     * @tc.name      testResourceLocaleExtended0050
     * @tc.desc      深色模式下 中文 字符串 getOperationTypeCallback 回落为 "getOperationType(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0050 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'getOperationTypeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getOperationType(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getOperationType(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0050 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0051
     * @tc.name      testResourceLocaleExtended0051
     * @tc.desc      深色模式下 中文 字符串 getOperationTypePromise 回落为 "getOperationType(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0051 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'getOperationTypePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0051 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0052
     * @tc.name      testResourceLocaleExtended0052
     * @tc.desc      深色模式下 中文 字符串 trigger 回落为 "trigger"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0052 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'trigger';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(7);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0052 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0053
     * @tc.name      testResourceLocaleExtended0053
     * @tc.desc      深色模式下 中文 字符串 MapAbility_desc 回落为 "description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0053 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'MapAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0053 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0054
     * @tc.name      testResourceLocaleExtended0054
     * @tc.desc      深色模式下 中文 字符串 MapAbility_label 回落为 "label"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0054 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'MapAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0054 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0055
     * @tc.name      testResourceLocaleExtended0055
     * @tc.desc      深色模式下 中文 字符串 ApplicationContext_restartApp 回落为 "restartApp"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0055 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_restartApp';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('restartApp');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(10);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('restartApp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0055 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0056
     * @tc.name      testResourceLocaleExtended0056
     * @tc.desc      深色模式下 中文 字符串 ApplicationContext_setFont 回落为 "setFont"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0056 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_setFont';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(7);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0056 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0057
     * @tc.name      testResourceLocaleExtended0057
     * @tc.desc      深色模式下 中文 字符串 ApplicationContext_getRunningProcessInformation_promise 回落为
     *               "getRunningProcessInformation(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0057 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_getRunningProcessInformation_promise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0057 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0058
     * @tc.name      testResourceLocaleExtended0058
     * @tc.desc      深色模式下 中文 字符串 ApplicationContext_getRunningProcessInformation_callback 回落为
     *               "getRunningProcessInformation(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0058 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_getRunningProcessInformation_callback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(38);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0058 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0059
     * @tc.name      testResourceLocaleExtended0059
     * @tc.desc      深色模式下 中文 字符串 ApplicationContext_getCurrentAppCloneIndex 回落为 "getCurrentAppCloneIndex"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0059 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_getCurrentAppCloneIndex';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0059 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0060
     * @tc.name      testResourceLocaleExtended0060
     * @tc.desc      深色模式下 中文 字符串 UIAbilityContext_moveAbilityToBackground 回落为 "moveAbilityToBackground"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0060 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_moveAbilityToBackground';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0060 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0061
     * @tc.name      testResourceLocaleExtended0061
     * @tc.desc      深色模式下 中文 字符串 UIAbilityContext_terminateSelf 回落为 "terminateSelf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0061 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_terminateSelf';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0061 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0062
     * @tc.name      testResourceLocaleExtended0062
     * @tc.desc      深色模式下 中文 字符串 app_name 回落为 "AbilityRuntime"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0062 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('AbilityRuntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('AbilityRuntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0062 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0063
     * @tc.name      testResourceLocaleExtended0063
     * @tc.desc      深色模式下 英文 字符串 module_desc 回落为 "module description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0063 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'module_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0063 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0064
     * @tc.name      testResourceLocaleExtended0064
     * @tc.desc      深色模式下 英文 字符串 EntryAbility_desc 回落为 "description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0064 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'EntryAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0064 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0065
     * @tc.name      testResourceLocaleExtended0065
     * @tc.desc      深色模式下 英文 字符串 EntryAbility_label 回落为 "label"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0065 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'EntryAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0065 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0066
     * @tc.name      testResourceLocaleExtended0066
     * @tc.desc      深色模式下 英文 字符串 main_title 回落为 "public api example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0066 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'main_title';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('public api example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('public api example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0066 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0067
     * @tc.name      testResourceLocaleExtended0067
     * @tc.desc      深色模式下 英文 字符串 AppManager 回落为 "appManager example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0067 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'AppManager';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('appManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('appManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0067 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0068
     * @tc.name      testResourceLocaleExtended0068
     * @tc.desc      深色模式下 英文 字符串 appRecovery 回落为 "appRecovery example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0068 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'appRecovery';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(19);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0068 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0069
     * @tc.name      testResourceLocaleExtended0069
     * @tc.desc      深色模式下 英文 字符串 DataUriUtils 回落为 "dataUriUtils example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0069 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'DataUriUtils';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('dataUriUtils example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('dataUriUtils example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0069 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0070
     * @tc.name      testResourceLocaleExtended0070
     * @tc.desc      深色模式下 英文 字符串 WantAgent 回落为 "WantAgent example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0070 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'WantAgent';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('WantAgent example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(17);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('WantAgent example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0070 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0071
     * @tc.name      testResourceLocaleExtended0071
     * @tc.desc      深色模式下 英文 字符串 ApplicationContext 回落为 "ApplicationContext example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0071 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('ApplicationContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('ApplicationContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0071 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0072
     * @tc.name      testResourceLocaleExtended0072
     * @tc.desc      深色模式下 英文 字符串 UIAbilityContext 回落为 "UIAbilityContext example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0072 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UIAbilityContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(24);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0072 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0073
     * @tc.name      testResourceLocaleExtended0073
     * @tc.desc      深色模式下 英文 字符串 AbilityLifecycleCallback 回落为 "AbilityLifecycleCallback example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0073 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'AbilityLifecycleCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('AbilityLifecycleCallback example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('AbilityLifecycleCallback example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0073 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0074
     * @tc.name      testResourceLocaleExtended0074
     * @tc.desc      深色模式下 英文 字符串 ErrorManager 回落为 "errorManager example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0074 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'ErrorManager';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('errorManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('errorManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0074 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0075
     * @tc.name      testResourceLocaleExtended0075
     * @tc.desc      深色模式下 英文 字符串 isRunningInStabilityTestCallback 回落为 "isRunningInStabilityTest(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0075 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'isRunningInStabilityTestCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(34);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0075 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0076
     * @tc.name      testResourceLocaleExtended0076
     * @tc.desc      深色模式下 英文 字符串 isRunningInStabilityTestPromise 回落为 "isRunningInStabilityTest(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0076 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'isRunningInStabilityTestPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRunningInStabilityTest(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRunningInStabilityTest(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0076 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0077
     * @tc.name      testResourceLocaleExtended0077
     * @tc.desc      深色模式下 英文 字符串 isRamConstrainedDeviceCallback 回落为 "isRamConstrainedDevice(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0077 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'isRamConstrainedDeviceCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0077 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0078
     * @tc.name      testResourceLocaleExtended0078
     * @tc.desc      深色模式下 英文 字符串 isRamConstrainedDevicePromise 回落为 "isRamConstrainedDevice(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0078 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'isRamConstrainedDevicePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRamConstrainedDevice(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(31);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRamConstrainedDevice(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0078 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0079
     * @tc.name      testResourceLocaleExtended0079
     * @tc.desc      深色模式下 英文 字符串 getAppMemorySizeCallback 回落为 "getAppMemorySize(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0079 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'getAppMemorySizeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0079 end');
    })
  })
}
