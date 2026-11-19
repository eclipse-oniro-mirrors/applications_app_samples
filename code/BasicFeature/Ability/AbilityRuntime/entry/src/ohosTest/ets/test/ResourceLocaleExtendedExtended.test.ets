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

export default function resourceLocaleExtendedExtendedTest(): void {
  describe('AbilityRuntimeResourceLocaleExtendedExtendedTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0080
     * @tc.name      testResourceLocaleExtended0080
     * @tc.desc      深色模式下 英文 字符串 getAppMemorySizePromise 回落为 "getAppMemorySize(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0080 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'getAppMemorySizePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0080 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0081
     * @tc.name      testResourceLocaleExtended0081
     * @tc.desc      深色模式下 英文 字符串 getRunningProcessInformationCallback 回落为 "getRunningProcessInformation(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0081 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'getRunningProcessInformationCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(38);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0081 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0082
     * @tc.name      testResourceLocaleExtended0082
     * @tc.desc      深色模式下 英文 字符串 getRunningProcessInformationPromise 回落为 "getRunningProcessInformation(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0082 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'getRunningProcessInformationPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0082 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0083
     * @tc.name      testResourceLocaleExtended0083
     * @tc.desc      深色模式下 英文 字符串 registerErrorObserver 回落为 "register ErrorObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0083 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'registerErrorObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(22);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0083 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0084
     * @tc.name      testResourceLocaleExtended0084
     * @tc.desc      深色模式下 英文 字符串 unregisterErrorObserver 回落为 "unregister ErrorObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0084 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterErrorObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(24);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('unregister ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0084 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0085
     * @tc.name      testResourceLocaleExtended0085
     * @tc.desc      深色模式下 英文 字符串 simulateError 回落为 "simulate Error"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0085 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'simulateError';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate Error');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('simulate Error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0085 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0086
     * @tc.name      testResourceLocaleExtended0086
     * @tc.desc      深色模式下 英文 字符串 registerLoopObserver 回落为 "register LoopObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0086 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'registerLoopObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0086 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0087
     * @tc.name      testResourceLocaleExtended0087
     * @tc.desc      深色模式下 英文 字符串 unregisterLoopObserver 回落为 "unregister LoopObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0087 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterLoopObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0087 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0088
     * @tc.name      testResourceLocaleExtended0088
     * @tc.desc      深色模式下 英文 字符串 simulateLoopTimeout 回落为 "simulate LoopTimeout"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0088 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'simulateLoopTimeout';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate LoopTimeout');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('simulate LoopTimeout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0088 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0089
     * @tc.name      testResourceLocaleExtended0089
     * @tc.desc      深色模式下 英文 字符串 registerUnhandledRejection 回落为 "register UnhandledRejectionObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0089 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'registerUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(35);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0089 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0090
     * @tc.name      testResourceLocaleExtended0090
     * @tc.desc      深色模式下 英文 字符串 unregisterUnhandledRejection 回落为 "unregister UnhandledRejectionObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0090 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('unregister UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0090 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0091
     * @tc.name      testResourceLocaleExtended0091
     * @tc.desc      深色模式下 英文 字符串 simulateUnhandledRejection 回落为 "simulate UnhandledRejection"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0091 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'simulateUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(27);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0091 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0092
     * @tc.name      testResourceLocaleExtended0092
     * @tc.desc      深色模式下 英文 字符串 getId 回落为 "getId"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0092 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'getId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0092 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0093
     * @tc.name      testResourceLocaleExtended0093
     * @tc.desc      深色模式下 英文 字符串 attachId 回落为 "attachId"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0093 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'attachId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('attachId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('attachId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0093 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0094
     * @tc.name      testResourceLocaleExtended0094
     * @tc.desc      深色模式下 英文 字符串 deleteId 回落为 "deleteId"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0094 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'deleteId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('deleteId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('deleteId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0094 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0095
     * @tc.name      testResourceLocaleExtended0095
     * @tc.desc      深色模式下 英文 字符串 updateId 回落为 "updateId"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0095 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'updateId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0095 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0096
     * @tc.name      testResourceLocaleExtended0096
     * @tc.desc      深色模式下 英文 字符串 UIAbilityContext_startAbilityByType 回落为 "startAbilityByType"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0096 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_startAbilityByType';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('startAbilityByType');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('startAbilityByType');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0096 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0097
     * @tc.name      testResourceLocaleExtended0097
     * @tc.desc      深色模式下 英文 字符串 UIAbilityContext_requestModalUIExtension 回落为 "requestModalUIExtension"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0097 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_requestModalUIExtension';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('requestModalUIExtension');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('requestModalUIExtension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0097 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0098
     * @tc.name      testResourceLocaleExtended0098
     * @tc.desc      深色模式下 英文 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 回落为
     *               "terminateSelfWithResult(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0098 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0098 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0099
     * @tc.name      testResourceLocaleExtended0099
     * @tc.desc      深色模式下 英文 字符串 UIExtensionContentSession_terminateSelfWithResultPromise 回落为
     *               "terminateSelfWithResult(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0099 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0099 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0100
     * @tc.name      testResourceLocaleExtended0100
     * @tc.desc      深色模式下 英文 字符串 UIExtensionContentSession_setWindowPrivacyModeCallback 回落为
     *               "setWindowPrivacyMode(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0100 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setWindowPrivacyMode(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(30);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setWindowPrivacyMode(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0100 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0101
     * @tc.name      testResourceLocaleExtended0101
     * @tc.desc      深色模式下 英文 字符串 UIExtensionContentSession_setWindowPrivacyModePromise 回落为
     *               "setWindowPrivacyMode(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0101 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(29);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0101 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0102
     * @tc.name      testResourceLocaleExtended0102
     * @tc.desc      深色模式下 英文 字符串 privacy_window_permission 回落为 "permit user to set privacy window"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0102 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'privacy_window_permission';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0102 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0103
     * @tc.name      testResourceLocaleExtended0103
     * @tc.desc      深色模式下 英文 字符串 UIExtensionContentSession_getUIExtensionWindowProxy 回落为 "getUIExtensionWindowProxy"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0103 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_getUIExtensionWindowProxy';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0103 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0104
     * @tc.name      testResourceLocaleExtended0104
     * @tc.desc      深色模式下 英文 字符串 getBundleNameCallback 回落为 "getBundleName(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0104 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'getBundleNameCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0104 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0105
     * @tc.name      testResourceLocaleExtended0105
     * @tc.desc      深色模式下 英文 字符串 getBundleNamePromise 回落为 "getBundleName(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0105 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'getBundleNamePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getBundleName(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(22);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getBundleName(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0105 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0106
     * @tc.name      testResourceLocaleExtended0106
     * @tc.desc      深色模式下 英文 字符串 getUidCallback 回落为 "getUid(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0106 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'getUidCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0106 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0107
     * @tc.name      testResourceLocaleExtended0107
     * @tc.desc      深色模式下 英文 字符串 getUidPromise 回落为 "getUid(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0107 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'getUidPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0107 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0108
     * @tc.name      testResourceLocaleExtended0108
     * @tc.desc      深色模式下 英文 字符串 cancelCallback 回落为 "cancel(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0108 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'cancelCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0108 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0109
     * @tc.name      testResourceLocaleExtended0109
     * @tc.desc      深色模式下 英文 字符串 cancelPromise 回落为 "cancel(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0109 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'cancelPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('cancel(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('cancel(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0109 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0110
     * @tc.name      testResourceLocaleExtended0110
     * @tc.desc      深色模式下 英文 字符串 equalCallback 回落为 "equal(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0110 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'equalCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0110 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0111
     * @tc.name      testResourceLocaleExtended0111
     * @tc.desc      深色模式下 英文 字符串 equalPromise 回落为 "equal(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0111 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'equalPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0111 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0112
     * @tc.name      testResourceLocaleExtended0112
     * @tc.desc      深色模式下 英文 字符串 getOperationTypeCallback 回落为 "getOperationType(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0112 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'getOperationTypeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getOperationType(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getOperationType(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0112 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0113
     * @tc.name      testResourceLocaleExtended0113
     * @tc.desc      深色模式下 英文 字符串 getOperationTypePromise 回落为 "getOperationType(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0113 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'getOperationTypePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0113 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0114
     * @tc.name      testResourceLocaleExtended0114
     * @tc.desc      深色模式下 英文 字符串 trigger 回落为 "trigger"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0114 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'trigger';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(7);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0114 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0115
     * @tc.name      testResourceLocaleExtended0115
     * @tc.desc      深色模式下 英文 字符串 MapAbility_desc 回落为 "description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0115 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'MapAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0115 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0116
     * @tc.name      testResourceLocaleExtended0116
     * @tc.desc      深色模式下 英文 字符串 MapAbility_label 回落为 "label"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0116 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'MapAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0116 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0117
     * @tc.name      testResourceLocaleExtended0117
     * @tc.desc      深色模式下 英文 字符串 ApplicationContext_restartApp 回落为 "restartApp"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0117 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_restartApp';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('restartApp');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(10);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('restartApp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0117 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0118
     * @tc.name      testResourceLocaleExtended0118
     * @tc.desc      深色模式下 英文 字符串 ApplicationContext_setFont 回落为 "setFont"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0118 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_setFont';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(7);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0118 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0119
     * @tc.name      testResourceLocaleExtended0119
     * @tc.desc      深色模式下 英文 字符串 ApplicationContext_getRunningProcessInformation_promise 回落为
     *               "getRunningProcessInformationPromise"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0119 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_getRunningProcessInformation_promise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(35);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0119 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0120
     * @tc.name      testResourceLocaleExtended0120
     * @tc.desc      深色模式下 英文 字符串 ApplicationContext_getRunningProcessInformation_callback 回落为
     *               "getRunningProcessInformation(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0120 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_getRunningProcessInformation_callback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(38);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0120 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0121
     * @tc.name      testResourceLocaleExtended0121
     * @tc.desc      深色模式下 英文 字符串 ApplicationContext_getCurrentAppCloneIndex 回落为 "getCurrentAppCloneIndex"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0121 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_getCurrentAppCloneIndex';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0121 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0122
     * @tc.name      testResourceLocaleExtended0122
     * @tc.desc      深色模式下 英文 字符串 UIAbilityContext_moveAbilityToBackground 回落为 "moveAbilityToBackground"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0122 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_moveAbilityToBackground';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0122 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0123
     * @tc.name      testResourceLocaleExtended0123
     * @tc.desc      深色模式下 英文 字符串 UIAbilityContext_terminateSelf 回落为 "terminateSelf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0123 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_terminateSelf';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0123 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0124
     * @tc.name      testResourceLocaleExtended0124
     * @tc.desc      深色模式下 英文 字符串 app_name 回落为 "AbilityRuntime"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0124 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('AbilityRuntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('AbilityRuntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0124 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0125
     * @tc.name      testResourceLocaleExtended0125
     * @tc.desc      深色模式下 法语 字符串 module_desc 回落为 "module description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0125 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'module_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0125 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0126
     * @tc.name      testResourceLocaleExtended0126
     * @tc.desc      深色模式下 法语 字符串 EntryAbility_desc 回落为 "description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0126 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'EntryAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0126 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0127
     * @tc.name      testResourceLocaleExtended0127
     * @tc.desc      深色模式下 法语 字符串 EntryAbility_label 回落为 "label"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0127 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'EntryAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0127 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0128
     * @tc.name      testResourceLocaleExtended0128
     * @tc.desc      深色模式下 法语 字符串 main_title 回落为 "public api example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0128 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'main_title';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('public api example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('public api example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0128 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0129
     * @tc.name      testResourceLocaleExtended0129
     * @tc.desc      深色模式下 法语 字符串 AppManager 回落为 "appManager example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0129 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'AppManager';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('appManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('appManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0129 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0130
     * @tc.name      testResourceLocaleExtended0130
     * @tc.desc      深色模式下 法语 字符串 appRecovery 回落为 "appRecovery example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0130 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'appRecovery';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(19);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0130 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0131
     * @tc.name      testResourceLocaleExtended0131
     * @tc.desc      深色模式下 法语 字符串 DataUriUtils 回落为 "dataUriUtils example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0131 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'DataUriUtils';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('dataUriUtils example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('dataUriUtils example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0131 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0132
     * @tc.name      testResourceLocaleExtended0132
     * @tc.desc      深色模式下 法语 字符串 WantAgent 回落为 "WantAgent example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0132 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'WantAgent';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('WantAgent example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(17);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('WantAgent example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0132 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0133
     * @tc.name      testResourceLocaleExtended0133
     * @tc.desc      深色模式下 法语 字符串 ApplicationContext 回落为 "ApplicationContext example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0133 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('ApplicationContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('ApplicationContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0133 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0134
     * @tc.name      testResourceLocaleExtended0134
     * @tc.desc      深色模式下 法语 字符串 UIAbilityContext 回落为 "UIAbilityContext example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0134 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UIAbilityContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(24);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0134 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0135
     * @tc.name      testResourceLocaleExtended0135
     * @tc.desc      深色模式下 法语 字符串 AbilityLifecycleCallback 回落为 "AbilityLifecycleCallback example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0135 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'AbilityLifecycleCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('AbilityLifecycleCallback example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('AbilityLifecycleCallback example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0135 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0136
     * @tc.name      testResourceLocaleExtended0136
     * @tc.desc      深色模式下 法语 字符串 ErrorManager 回落为 "errorManager example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0136 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'ErrorManager';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('errorManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('errorManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0136 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0137
     * @tc.name      testResourceLocaleExtended0137
     * @tc.desc      深色模式下 法语 字符串 isRunningInStabilityTestCallback 回落为 "isRunningInStabilityTest(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0137 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'isRunningInStabilityTestCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(34);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0137 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0138
     * @tc.name      testResourceLocaleExtended0138
     * @tc.desc      深色模式下 法语 字符串 isRunningInStabilityTestPromise 回落为 "isRunningInStabilityTest(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0138 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'isRunningInStabilityTestPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRunningInStabilityTest(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRunningInStabilityTest(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0138 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0139
     * @tc.name      testResourceLocaleExtended0139
     * @tc.desc      深色模式下 法语 字符串 isRamConstrainedDeviceCallback 回落为 "isRamConstrainedDevice(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0139 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'isRamConstrainedDeviceCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0139 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0140
     * @tc.name      testResourceLocaleExtended0140
     * @tc.desc      深色模式下 法语 字符串 isRamConstrainedDevicePromise 回落为 "isRamConstrainedDevice(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0140 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'isRamConstrainedDevicePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRamConstrainedDevice(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(31);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRamConstrainedDevice(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0140 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0141
     * @tc.name      testResourceLocaleExtended0141
     * @tc.desc      深色模式下 法语 字符串 getAppMemorySizeCallback 回落为 "getAppMemorySize(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0141 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'getAppMemorySizeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0141 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0142
     * @tc.name      testResourceLocaleExtended0142
     * @tc.desc      深色模式下 法语 字符串 getAppMemorySizePromise 回落为 "getAppMemorySize(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0142 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'getAppMemorySizePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0142 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0143
     * @tc.name      testResourceLocaleExtended0143
     * @tc.desc      深色模式下 法语 字符串 getRunningProcessInformationCallback 回落为 "getRunningProcessInformation(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0143 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'getRunningProcessInformationCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(38);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0143 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0144
     * @tc.name      testResourceLocaleExtended0144
     * @tc.desc      深色模式下 法语 字符串 getRunningProcessInformationPromise 回落为 "getRunningProcessInformation(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0144 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'getRunningProcessInformationPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0144 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0145
     * @tc.name      testResourceLocaleExtended0145
     * @tc.desc      深色模式下 法语 字符串 registerErrorObserver 回落为 "register ErrorObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0145 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'registerErrorObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(22);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0145 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0146
     * @tc.name      testResourceLocaleExtended0146
     * @tc.desc      深色模式下 法语 字符串 unregisterErrorObserver 回落为 "unregister ErrorObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0146 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterErrorObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(24);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('unregister ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0146 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0147
     * @tc.name      testResourceLocaleExtended0147
     * @tc.desc      深色模式下 法语 字符串 simulateError 回落为 "simulate Error"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0147 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'simulateError';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate Error');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('simulate Error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0147 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0148
     * @tc.name      testResourceLocaleExtended0148
     * @tc.desc      深色模式下 法语 字符串 registerLoopObserver 回落为 "register LoopObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0148 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'registerLoopObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0148 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0149
     * @tc.name      testResourceLocaleExtended0149
     * @tc.desc      深色模式下 法语 字符串 unregisterLoopObserver 回落为 "unregister LoopObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0149 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterLoopObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0149 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0150
     * @tc.name      testResourceLocaleExtended0150
     * @tc.desc      深色模式下 法语 字符串 simulateLoopTimeout 回落为 "simulate LoopTimeout"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0150 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'simulateLoopTimeout';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate LoopTimeout');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('simulate LoopTimeout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0150 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0151
     * @tc.name      testResourceLocaleExtended0151
     * @tc.desc      深色模式下 法语 字符串 registerUnhandledRejection 回落为 "register UnhandledRejectionObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0151 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'registerUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(35);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0151 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0152
     * @tc.name      testResourceLocaleExtended0152
     * @tc.desc      深色模式下 法语 字符串 unregisterUnhandledRejection 回落为 "unregister UnhandledRejectionObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0152 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('unregister UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0152 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0153
     * @tc.name      testResourceLocaleExtended0153
     * @tc.desc      深色模式下 法语 字符串 simulateUnhandledRejection 回落为 "simulate UnhandledRejection"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0153 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'simulateUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(27);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0153 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0154
     * @tc.name      testResourceLocaleExtended0154
     * @tc.desc      深色模式下 法语 字符串 getId 回落为 "getId"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0154 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'getId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0154 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0155
     * @tc.name      testResourceLocaleExtended0155
     * @tc.desc      深色模式下 法语 字符串 attachId 回落为 "attachId"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0155 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'attachId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('attachId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('attachId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0155 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0156
     * @tc.name      testResourceLocaleExtended0156
     * @tc.desc      深色模式下 法语 字符串 deleteId 回落为 "deleteId"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0156 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'deleteId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('deleteId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('deleteId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0156 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0157
     * @tc.name      testResourceLocaleExtended0157
     * @tc.desc      深色模式下 法语 字符串 updateId 回落为 "updateId"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0157 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'updateId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0157 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0158
     * @tc.name      testResourceLocaleExtended0158
     * @tc.desc      深色模式下 法语 字符串 UIAbilityContext_startAbilityByType 回落为 "startAbilityByType"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0158 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_startAbilityByType';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('startAbilityByType');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('startAbilityByType');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0158 end');
    })
  })
}
