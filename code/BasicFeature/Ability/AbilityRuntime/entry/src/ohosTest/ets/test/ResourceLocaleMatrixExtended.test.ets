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
import { BusinessError } from '@kit.BasicServicesKit';
import { resourceManager } from '@kit.LocalizationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { loadOverrideResourceManager } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityRuntime]';

function lightManager(locale: string): Promise<resourceManager.ResourceManager> {
  return loadOverrideResourceManager(locale, resourceManager.ColorMode.LIGHT);
}

export default function resourceLocaleMatrixExtendedTest(): void {
  describe('AbilityRuntimeResourceLocaleMatrixExtendedTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0084
     * @tc.name      testResourceLocaleMatrix0084
     * @tc.desc      英文下字符串 unregisterErrorObserver 为 "unregister ErrorObserver"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0084 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'unregisterErrorObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(24);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('unregister ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0084 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0085
     * @tc.name      testResourceLocaleMatrix0085
     * @tc.desc      英文下字符串 simulateError 为 "simulate Error"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0085 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'simulateError';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate Error');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('simulate Error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0085 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0086
     * @tc.name      testResourceLocaleMatrix0086
     * @tc.desc      英文下字符串 registerLoopObserver 为 "register LoopObserver"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0086 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'registerLoopObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(21);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('register LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0086 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0087
     * @tc.name      testResourceLocaleMatrix0087
     * @tc.desc      英文下字符串 unregisterLoopObserver 为 "unregister LoopObserver"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0087 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'unregisterLoopObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0087 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0088
     * @tc.name      testResourceLocaleMatrix0088
     * @tc.desc      英文下字符串 simulateLoopTimeout 为 "simulate LoopTimeout"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0088 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'simulateLoopTimeout';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate LoopTimeout');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('simulate LoopTimeout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0088 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0089
     * @tc.name      testResourceLocaleMatrix0089
     * @tc.desc      英文下字符串 registerUnhandledRejection 为 "register UnhandledRejectionObserver"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0089 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'registerUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(35);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0089 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0090
     * @tc.name      testResourceLocaleMatrix0090
     * @tc.desc      英文下字符串 unregisterUnhandledRejection 为 "unregister UnhandledRejectionObserver"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0090 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'unregisterUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('unregister UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0090 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0091
     * @tc.name      testResourceLocaleMatrix0091
     * @tc.desc      英文下字符串 simulateUnhandledRejection 为 "simulate UnhandledRejection"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0091 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'simulateUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(27);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0091 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0092
     * @tc.name      testResourceLocaleMatrix0092
     * @tc.desc      英文下字符串 getId 为 "getId"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0092 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'getId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0092 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0093
     * @tc.name      testResourceLocaleMatrix0093
     * @tc.desc      英文下字符串 attachId 为 "attachId"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0093 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'attachId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('attachId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('attachId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0093 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0094
     * @tc.name      testResourceLocaleMatrix0094
     * @tc.desc      英文下字符串 deleteId 为 "deleteId"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0094 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'deleteId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('deleteId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('deleteId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0094 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0095
     * @tc.name      testResourceLocaleMatrix0095
     * @tc.desc      英文下字符串 updateId 为 "updateId"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0095 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'updateId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0095 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0096
     * @tc.name      testResourceLocaleMatrix0096
     * @tc.desc      英文下字符串 UIAbilityContext_startAbilityByType 为 "startAbilityByType"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0096 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'UIAbilityContext_startAbilityByType';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('startAbilityByType');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('startAbilityByType');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0096 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0097
     * @tc.name      testResourceLocaleMatrix0097
     * @tc.desc      英文下字符串 UIAbilityContext_requestModalUIExtension 为 "requestModalUIExtension"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0097 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'UIAbilityContext_requestModalUIExtension';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('requestModalUIExtension');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('requestModalUIExtension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0097 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0098
     * @tc.name      testResourceLocaleMatrix0098
     * @tc.desc      英文下字符串 UIExtensionContentSession_terminateSelfWithResultCallback 为
     *               "terminateSelfWithResult(callback)"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0098 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0098 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0099
     * @tc.name      testResourceLocaleMatrix0099
     * @tc.desc      英文下字符串 UIExtensionContentSession_terminateSelfWithResultPromise 为
     *               "terminateSelfWithResult(promise)"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0099 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0099 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0100
     * @tc.name      testResourceLocaleMatrix0100
     * @tc.desc      英文下字符串 UIExtensionContentSession_setWindowPrivacyModeCallback 为 "setWindowPrivacyMode(callback)"，
     *               同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0100 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setWindowPrivacyMode(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(30);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('setWindowPrivacyMode(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0100 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0101
     * @tc.name      testResourceLocaleMatrix0101
     * @tc.desc      英文下字符串 UIExtensionContentSession_setWindowPrivacyModePromise 为 "setWindowPrivacyMode(promise)"，
     *               同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0101 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(29);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0101 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0102
     * @tc.name      testResourceLocaleMatrix0102
     * @tc.desc      英文下字符串 privacy_window_permission 为 "permit user to set privacy window"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0102 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'privacy_window_permission';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0102 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0103
     * @tc.name      testResourceLocaleMatrix0103
     * @tc.desc      英文下字符串 UIExtensionContentSession_getUIExtensionWindowProxy 为 "getUIExtensionWindowProxy"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0103 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'UIExtensionContentSession_getUIExtensionWindowProxy';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0103 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0104
     * @tc.name      testResourceLocaleMatrix0104
     * @tc.desc      英文下字符串 getBundleNameCallback 为 "getBundleName(callback)"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0104 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'getBundleNameCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0104 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0105
     * @tc.name      testResourceLocaleMatrix0105
     * @tc.desc      英文下字符串 getBundleNamePromise 为 "getBundleName(promise)"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0105 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'getBundleNamePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getBundleName(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(22);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getBundleName(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0105 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0106
     * @tc.name      testResourceLocaleMatrix0106
     * @tc.desc      英文下字符串 getUidCallback 为 "getUid(callback)"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0106 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'getUidCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0106 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0107
     * @tc.name      testResourceLocaleMatrix0107
     * @tc.desc      英文下字符串 getUidPromise 为 "getUid(promise)"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0107 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'getUidPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0107 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0108
     * @tc.name      testResourceLocaleMatrix0108
     * @tc.desc      英文下字符串 cancelCallback 为 "cancel(callback)"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0108 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'cancelCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0108 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0109
     * @tc.name      testResourceLocaleMatrix0109
     * @tc.desc      英文下字符串 cancelPromise 为 "cancel(promise)"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0109 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'cancelPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('cancel(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('cancel(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0109 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0110
     * @tc.name      testResourceLocaleMatrix0110
     * @tc.desc      英文下字符串 equalCallback 为 "equal(callback)"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0110 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'equalCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0110 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0111
     * @tc.name      testResourceLocaleMatrix0111
     * @tc.desc      英文下字符串 equalPromise 为 "equal(promise)"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0111 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'equalPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0111 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0112
     * @tc.name      testResourceLocaleMatrix0112
     * @tc.desc      英文下字符串 getOperationTypeCallback 为 "getOperationType(callback)"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0112 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'getOperationTypeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getOperationType(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getOperationType(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0112 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0113
     * @tc.name      testResourceLocaleMatrix0113
     * @tc.desc      英文下字符串 getOperationTypePromise 为 "getOperationType(promise)"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0113 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'getOperationTypePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0113 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0114
     * @tc.name      testResourceLocaleMatrix0114
     * @tc.desc      英文下字符串 trigger 为 "trigger"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0114 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'trigger';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(7);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0114 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0115
     * @tc.name      testResourceLocaleMatrix0115
     * @tc.desc      英文下字符串 MapAbility_desc 为 "description"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0115 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'MapAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0115 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0116
     * @tc.name      testResourceLocaleMatrix0116
     * @tc.desc      英文下字符串 MapAbility_label 为 "label"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0116 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'MapAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0116 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0117
     * @tc.name      testResourceLocaleMatrix0117
     * @tc.desc      英文下字符串 ApplicationContext_restartApp 为 "restartApp"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0117 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'ApplicationContext_restartApp';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('restartApp');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(10);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('restartApp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0117 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0118
     * @tc.name      testResourceLocaleMatrix0118
     * @tc.desc      英文下字符串 ApplicationContext_setFont 为 "setFont"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0118 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'ApplicationContext_setFont';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(7);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0118 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0119
     * @tc.name      testResourceLocaleMatrix0119
     * @tc.desc      英文下字符串 ApplicationContext_getRunningProcessInformation_promise 为
     *               "getRunningProcessInformationPromise"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0119 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'ApplicationContext_getRunningProcessInformation_promise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(35);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0119 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0120
     * @tc.name      testResourceLocaleMatrix0120
     * @tc.desc      英文下字符串 ApplicationContext_getRunningProcessInformation_callback 为
     *               "getRunningProcessInformation(callback)"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0120 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'ApplicationContext_getRunningProcessInformation_callback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(38);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0120 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0121
     * @tc.name      testResourceLocaleMatrix0121
     * @tc.desc      英文下字符串 ApplicationContext_getCurrentAppCloneIndex 为 "getCurrentAppCloneIndex"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0121 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'ApplicationContext_getCurrentAppCloneIndex';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0121 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0122
     * @tc.name      testResourceLocaleMatrix0122
     * @tc.desc      英文下字符串 UIAbilityContext_moveAbilityToBackground 为 "moveAbilityToBackground"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0122 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'UIAbilityContext_moveAbilityToBackground';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0122 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0123
     * @tc.name      testResourceLocaleMatrix0123
     * @tc.desc      英文下字符串 UIAbilityContext_terminateSelf 为 "terminateSelf"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0123 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'UIAbilityContext_terminateSelf';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0123 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0124
     * @tc.name      testResourceLocaleMatrix0124
     * @tc.desc      英文下字符串 app_name 为 "AbilityRuntime"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0124 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('AbilityRuntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('AbilityRuntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0124 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0125
     * @tc.name      testResourceLocaleMatrix0125
     * @tc.desc      法语下字符串 module_desc 为 "module description"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0125 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'module_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0125 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0126
     * @tc.name      testResourceLocaleMatrix0126
     * @tc.desc      法语下字符串 EntryAbility_desc 为 "description"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0126 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'EntryAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0126 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0127
     * @tc.name      testResourceLocaleMatrix0127
     * @tc.desc      法语下字符串 EntryAbility_label 为 "label"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0127 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'EntryAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0127 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0128
     * @tc.name      testResourceLocaleMatrix0128
     * @tc.desc      法语下字符串 main_title 为 "public api example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0128 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'main_title';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('public api example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('public api example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0128 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0129
     * @tc.name      testResourceLocaleMatrix0129
     * @tc.desc      法语下字符串 AppManager 为 "appManager example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0129 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'AppManager';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('appManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('appManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0129 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0130
     * @tc.name      testResourceLocaleMatrix0130
     * @tc.desc      法语下字符串 appRecovery 为 "appRecovery example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0130 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'appRecovery';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(19);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0130 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0131
     * @tc.name      testResourceLocaleMatrix0131
     * @tc.desc      法语下字符串 DataUriUtils 为 "dataUriUtils example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0131 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'DataUriUtils';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('dataUriUtils example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('dataUriUtils example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0131 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0132
     * @tc.name      testResourceLocaleMatrix0132
     * @tc.desc      法语下字符串 WantAgent 为 "WantAgent example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0132 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'WantAgent';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('WantAgent example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(17);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('WantAgent example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0132 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0133
     * @tc.name      testResourceLocaleMatrix0133
     * @tc.desc      法语下字符串 ApplicationContext 为 "ApplicationContext example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0133 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'ApplicationContext';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('ApplicationContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ApplicationContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0133 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0134
     * @tc.name      testResourceLocaleMatrix0134
     * @tc.desc      法语下字符串 UIAbilityContext 为 "UIAbilityContext example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0134 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'UIAbilityContext';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UIAbilityContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(24);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('UIAbilityContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0134 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0135
     * @tc.name      testResourceLocaleMatrix0135
     * @tc.desc      法语下字符串 AbilityLifecycleCallback 为 "AbilityLifecycleCallback example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0135 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'AbilityLifecycleCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('AbilityLifecycleCallback example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('AbilityLifecycleCallback example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0135 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0136
     * @tc.name      testResourceLocaleMatrix0136
     * @tc.desc      法语下字符串 ErrorManager 为 "errorManager example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0136 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'ErrorManager';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('errorManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('errorManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0136 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0137
     * @tc.name      testResourceLocaleMatrix0137
     * @tc.desc      法语下字符串 isRunningInStabilityTestCallback 为 "isRunningInStabilityTest(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0137 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'isRunningInStabilityTestCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(34);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0137 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0138
     * @tc.name      testResourceLocaleMatrix0138
     * @tc.desc      法语下字符串 isRunningInStabilityTestPromise 为 "isRunningInStabilityTest(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0138 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'isRunningInStabilityTestPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRunningInStabilityTest(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('isRunningInStabilityTest(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0138 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0139
     * @tc.name      testResourceLocaleMatrix0139
     * @tc.desc      法语下字符串 isRamConstrainedDeviceCallback 为 "isRamConstrainedDevice(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0139 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'isRamConstrainedDeviceCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0139 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0140
     * @tc.name      testResourceLocaleMatrix0140
     * @tc.desc      法语下字符串 isRamConstrainedDevicePromise 为 "isRamConstrainedDevice(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0140 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'isRamConstrainedDevicePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRamConstrainedDevice(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(31);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('isRamConstrainedDevice(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0140 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0141
     * @tc.name      testResourceLocaleMatrix0141
     * @tc.desc      法语下字符串 getAppMemorySizeCallback 为 "getAppMemorySize(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0141 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'getAppMemorySizeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0141 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0142
     * @tc.name      testResourceLocaleMatrix0142
     * @tc.desc      法语下字符串 getAppMemorySizePromise 为 "getAppMemorySize(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0142 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'getAppMemorySizePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0142 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0143
     * @tc.name      testResourceLocaleMatrix0143
     * @tc.desc      法语下字符串 getRunningProcessInformationCallback 为 "getRunningProcessInformation(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0143 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'getRunningProcessInformationCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(38);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0143 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0144
     * @tc.name      testResourceLocaleMatrix0144
     * @tc.desc      法语下字符串 getRunningProcessInformationPromise 为 "getRunningProcessInformation(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0144 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'getRunningProcessInformationPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0144 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0145
     * @tc.name      testResourceLocaleMatrix0145
     * @tc.desc      法语下字符串 registerErrorObserver 为 "register ErrorObserver"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0145 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'registerErrorObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(22);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('register ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0145 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0146
     * @tc.name      testResourceLocaleMatrix0146
     * @tc.desc      法语下字符串 unregisterErrorObserver 为 "unregister ErrorObserver"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0146 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'unregisterErrorObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(24);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('unregister ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0146 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0147
     * @tc.name      testResourceLocaleMatrix0147
     * @tc.desc      法语下字符串 simulateError 为 "simulate Error"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0147 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'simulateError';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate Error');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('simulate Error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0147 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0148
     * @tc.name      testResourceLocaleMatrix0148
     * @tc.desc      法语下字符串 registerLoopObserver 为 "register LoopObserver"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0148 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'registerLoopObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(21);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('register LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0148 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0149
     * @tc.name      testResourceLocaleMatrix0149
     * @tc.desc      法语下字符串 unregisterLoopObserver 为 "unregister LoopObserver"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0149 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'unregisterLoopObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0149 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0150
     * @tc.name      testResourceLocaleMatrix0150
     * @tc.desc      法语下字符串 simulateLoopTimeout 为 "simulate LoopTimeout"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0150 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'simulateLoopTimeout';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate LoopTimeout');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('simulate LoopTimeout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0150 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0151
     * @tc.name      testResourceLocaleMatrix0151
     * @tc.desc      法语下字符串 registerUnhandledRejection 为 "register UnhandledRejectionObserver"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0151 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'registerUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(35);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0151 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0152
     * @tc.name      testResourceLocaleMatrix0152
     * @tc.desc      法语下字符串 unregisterUnhandledRejection 为 "unregister UnhandledRejectionObserver"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0152 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'unregisterUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('unregister UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0152 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0153
     * @tc.name      testResourceLocaleMatrix0153
     * @tc.desc      法语下字符串 simulateUnhandledRejection 为 "simulate UnhandledRejection"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0153 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'simulateUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(27);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0153 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0154
     * @tc.name      testResourceLocaleMatrix0154
     * @tc.desc      法语下字符串 getId 为 "getId"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0154 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'getId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0154 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0155
     * @tc.name      testResourceLocaleMatrix0155
     * @tc.desc      法语下字符串 attachId 为 "attachId"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0155 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'attachId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('attachId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('attachId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0155 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0156
     * @tc.name      testResourceLocaleMatrix0156
     * @tc.desc      法语下字符串 deleteId 为 "deleteId"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0156 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'deleteId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('deleteId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('deleteId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0156 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0157
     * @tc.name      testResourceLocaleMatrix0157
     * @tc.desc      法语下字符串 updateId 为 "updateId"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0157 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'updateId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0157 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0158
     * @tc.name      testResourceLocaleMatrix0158
     * @tc.desc      法语下字符串 UIAbilityContext_startAbilityByType 为 "startAbilityByType"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0158 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'UIAbilityContext_startAbilityByType';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('startAbilityByType');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('startAbilityByType');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0158 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0159
     * @tc.name      testResourceLocaleMatrix0159
     * @tc.desc      法语下字符串 UIAbilityContext_requestModalUIExtension 为 "requestModalUIExtension"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0159 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'UIAbilityContext_requestModalUIExtension';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('requestModalUIExtension');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('requestModalUIExtension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0159 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0160
     * @tc.name      testResourceLocaleMatrix0160
     * @tc.desc      法语下字符串 UIExtensionContentSession_terminateSelfWithResultCallback 为
     *               "terminateSelfWithResult(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0160 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0160 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0161
     * @tc.name      testResourceLocaleMatrix0161
     * @tc.desc      法语下字符串 UIExtensionContentSession_terminateSelfWithResultPromise 为
     *               "terminateSelfWithResult(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0161 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0161 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0162
     * @tc.name      testResourceLocaleMatrix0162
     * @tc.desc      法语下字符串 UIExtensionContentSession_setWindowPrivacyModeCallback 为
     *               "setWindowPrivacyMode(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0162 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setWindowPrivacyMode(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(30);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('setWindowPrivacyMode(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0162 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0163
     * @tc.name      testResourceLocaleMatrix0163
     * @tc.desc      法语下字符串 UIExtensionContentSession_setWindowPrivacyModePromise 为 "setWindowPrivacyMode(promise)"（回落），
     *               同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0163 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(29);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0163 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0164
     * @tc.name      testResourceLocaleMatrix0164
     * @tc.desc      法语下字符串 privacy_window_permission 为 "permit user to set privacy window"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0164 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'privacy_window_permission';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0164 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0165
     * @tc.name      testResourceLocaleMatrix0165
     * @tc.desc      法语下字符串 UIExtensionContentSession_getUIExtensionWindowProxy 为 "getUIExtensionWindowProxy"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0165 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'UIExtensionContentSession_getUIExtensionWindowProxy';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0165 end');
    })
  })
}
