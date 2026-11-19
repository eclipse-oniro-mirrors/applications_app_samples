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

export default function resourceLocaleExtendedAdvancedTest(): void {
  describe('AbilityRuntimeResourceLocaleExtendedAdvancedTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0159
     * @tc.name      testResourceLocaleExtended0159
     * @tc.desc      深色模式下 法语 字符串 UIAbilityContext_requestModalUIExtension 回落为 "requestModalUIExtension"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0159 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_requestModalUIExtension';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('requestModalUIExtension');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('requestModalUIExtension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0159 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0160
     * @tc.name      testResourceLocaleExtended0160
     * @tc.desc      深色模式下 法语 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 回落为
     *               "terminateSelfWithResult(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0160 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0160 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0161
     * @tc.name      testResourceLocaleExtended0161
     * @tc.desc      深色模式下 法语 字符串 UIExtensionContentSession_terminateSelfWithResultPromise 回落为
     *               "terminateSelfWithResult(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0161 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0161 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0162
     * @tc.name      testResourceLocaleExtended0162
     * @tc.desc      深色模式下 法语 字符串 UIExtensionContentSession_setWindowPrivacyModeCallback 回落为
     *               "setWindowPrivacyMode(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0162 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setWindowPrivacyMode(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(30);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setWindowPrivacyMode(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0162 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0163
     * @tc.name      testResourceLocaleExtended0163
     * @tc.desc      深色模式下 法语 字符串 UIExtensionContentSession_setWindowPrivacyModePromise 回落为
     *               "setWindowPrivacyMode(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0163 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(29);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0163 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0164
     * @tc.name      testResourceLocaleExtended0164
     * @tc.desc      深色模式下 法语 字符串 privacy_window_permission 回落为 "permit user to set privacy window"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0164 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'privacy_window_permission';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0164 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0165
     * @tc.name      testResourceLocaleExtended0165
     * @tc.desc      深色模式下 法语 字符串 UIExtensionContentSession_getUIExtensionWindowProxy 回落为 "getUIExtensionWindowProxy"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0165 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_getUIExtensionWindowProxy';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0165 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0166
     * @tc.name      testResourceLocaleExtended0166
     * @tc.desc      深色模式下 法语 字符串 getBundleNameCallback 回落为 "getBundleName(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0166 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'getBundleNameCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0166 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0167
     * @tc.name      testResourceLocaleExtended0167
     * @tc.desc      深色模式下 法语 字符串 getBundleNamePromise 回落为 "getBundleName(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0167 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'getBundleNamePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getBundleName(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(22);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getBundleName(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0167 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0168
     * @tc.name      testResourceLocaleExtended0168
     * @tc.desc      深色模式下 法语 字符串 getUidCallback 回落为 "getUid(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0168 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'getUidCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0168 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0169
     * @tc.name      testResourceLocaleExtended0169
     * @tc.desc      深色模式下 法语 字符串 getUidPromise 回落为 "getUid(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0169 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'getUidPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0169 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0170
     * @tc.name      testResourceLocaleExtended0170
     * @tc.desc      深色模式下 法语 字符串 cancelCallback 回落为 "cancel(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0170 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'cancelCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0170 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0171
     * @tc.name      testResourceLocaleExtended0171
     * @tc.desc      深色模式下 法语 字符串 cancelPromise 回落为 "cancel(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0171 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'cancelPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('cancel(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('cancel(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0171 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0172
     * @tc.name      testResourceLocaleExtended0172
     * @tc.desc      深色模式下 法语 字符串 equalCallback 回落为 "equal(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0172 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'equalCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0172 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0173
     * @tc.name      testResourceLocaleExtended0173
     * @tc.desc      深色模式下 法语 字符串 equalPromise 回落为 "equal(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0173 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'equalPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0173 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0174
     * @tc.name      testResourceLocaleExtended0174
     * @tc.desc      深色模式下 法语 字符串 getOperationTypeCallback 回落为 "getOperationType(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0174 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'getOperationTypeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getOperationType(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getOperationType(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0174 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0175
     * @tc.name      testResourceLocaleExtended0175
     * @tc.desc      深色模式下 法语 字符串 getOperationTypePromise 回落为 "getOperationType(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0175 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'getOperationTypePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0175 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0176
     * @tc.name      testResourceLocaleExtended0176
     * @tc.desc      深色模式下 法语 字符串 trigger 回落为 "trigger"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0176 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'trigger';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(7);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0176 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0177
     * @tc.name      testResourceLocaleExtended0177
     * @tc.desc      深色模式下 法语 字符串 MapAbility_desc 回落为 "description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0177 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'MapAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0177 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0178
     * @tc.name      testResourceLocaleExtended0178
     * @tc.desc      深色模式下 法语 字符串 MapAbility_label 回落为 "label"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0178 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'MapAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0178 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0179
     * @tc.name      testResourceLocaleExtended0179
     * @tc.desc      深色模式下 法语 字符串 ApplicationContext_restartApp 回落为 "restartApp"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0179 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_restartApp';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('restartApp');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(10);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('restartApp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0179 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0180
     * @tc.name      testResourceLocaleExtended0180
     * @tc.desc      深色模式下 法语 字符串 ApplicationContext_setFont 回落为 "setFont"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0180 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_setFont';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(7);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0180 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0181
     * @tc.name      testResourceLocaleExtended0181
     * @tc.desc      深色模式下 法语 字符串 ApplicationContext_getRunningProcessInformation_promise 回落为
     *               "getRunningProcessInformationPromise"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0181 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_getRunningProcessInformation_promise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(35);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0181 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0182
     * @tc.name      testResourceLocaleExtended0182
     * @tc.desc      深色模式下 法语 字符串 ApplicationContext_getRunningProcessInformation_callback 回落为
     *               "getRunningProcessInformation(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0182 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_getRunningProcessInformation_callback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(38);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0182 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0183
     * @tc.name      testResourceLocaleExtended0183
     * @tc.desc      深色模式下 法语 字符串 ApplicationContext_getCurrentAppCloneIndex 回落为 "getCurrentAppCloneIndex"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0183 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext_getCurrentAppCloneIndex';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0183 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0184
     * @tc.name      testResourceLocaleExtended0184
     * @tc.desc      深色模式下 法语 字符串 UIAbilityContext_moveAbilityToBackground 回落为 "moveAbilityToBackground"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0184 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_moveAbilityToBackground';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0184 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0185
     * @tc.name      testResourceLocaleExtended0185
     * @tc.desc      深色模式下 法语 字符串 UIAbilityContext_terminateSelf 回落为 "terminateSelf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0185 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_terminateSelf';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0185 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0186
     * @tc.name      testResourceLocaleExtended0186
     * @tc.desc      深色模式下 法语 字符串 app_name 回落为 "AbilityRuntime"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0186 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('AbilityRuntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('AbilityRuntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0186 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0187
     * @tc.name      testResourceLocaleExtended0187
     * @tc.desc      深色模式下 日语 字符串 module_desc 回落为 "module description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0187 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'module_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0187 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0188
     * @tc.name      testResourceLocaleExtended0188
     * @tc.desc      深色模式下 日语 字符串 EntryAbility_desc 回落为 "description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0188 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'EntryAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0188 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0189
     * @tc.name      testResourceLocaleExtended0189
     * @tc.desc      深色模式下 日语 字符串 EntryAbility_label 回落为 "label"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0189 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'EntryAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0189 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0190
     * @tc.name      testResourceLocaleExtended0190
     * @tc.desc      深色模式下 日语 字符串 main_title 回落为 "public api example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0190 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'main_title';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('public api example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('public api example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0190 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0191
     * @tc.name      testResourceLocaleExtended0191
     * @tc.desc      深色模式下 日语 字符串 AppManager 回落为 "appManager example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0191 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'AppManager';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('appManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('appManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0191 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0192
     * @tc.name      testResourceLocaleExtended0192
     * @tc.desc      深色模式下 日语 字符串 appRecovery 回落为 "appRecovery example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0192 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'appRecovery';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(19);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0192 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0193
     * @tc.name      testResourceLocaleExtended0193
     * @tc.desc      深色模式下 日语 字符串 DataUriUtils 回落为 "dataUriUtils example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0193 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'DataUriUtils';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('dataUriUtils example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('dataUriUtils example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0193 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0194
     * @tc.name      testResourceLocaleExtended0194
     * @tc.desc      深色模式下 日语 字符串 WantAgent 回落为 "WantAgent example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0194 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'WantAgent';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('WantAgent example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(17);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('WantAgent example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0194 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0195
     * @tc.name      testResourceLocaleExtended0195
     * @tc.desc      深色模式下 日语 字符串 ApplicationContext 回落为 "ApplicationContext example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0195 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'ApplicationContext';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('ApplicationContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('ApplicationContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0195 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0196
     * @tc.name      testResourceLocaleExtended0196
     * @tc.desc      深色模式下 日语 字符串 UIAbilityContext 回落为 "UIAbilityContext example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0196 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UIAbilityContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(24);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0196 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0197
     * @tc.name      testResourceLocaleExtended0197
     * @tc.desc      深色模式下 日语 字符串 AbilityLifecycleCallback 回落为 "AbilityLifecycleCallback example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0197 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'AbilityLifecycleCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('AbilityLifecycleCallback example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('AbilityLifecycleCallback example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0197 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0198
     * @tc.name      testResourceLocaleExtended0198
     * @tc.desc      深色模式下 日语 字符串 ErrorManager 回落为 "errorManager example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0198 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'ErrorManager';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('errorManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('errorManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0198 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0199
     * @tc.name      testResourceLocaleExtended0199
     * @tc.desc      深色模式下 日语 字符串 isRunningInStabilityTestCallback 回落为 "isRunningInStabilityTest(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0199 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'isRunningInStabilityTestCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(34);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0199 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0200
     * @tc.name      testResourceLocaleExtended0200
     * @tc.desc      深色模式下 日语 字符串 isRunningInStabilityTestPromise 回落为 "isRunningInStabilityTest(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0200 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'isRunningInStabilityTestPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRunningInStabilityTest(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRunningInStabilityTest(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0200 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0201
     * @tc.name      testResourceLocaleExtended0201
     * @tc.desc      深色模式下 日语 字符串 isRamConstrainedDeviceCallback 回落为 "isRamConstrainedDevice(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0201 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'isRamConstrainedDeviceCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0201 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0202
     * @tc.name      testResourceLocaleExtended0202
     * @tc.desc      深色模式下 日语 字符串 isRamConstrainedDevicePromise 回落为 "isRamConstrainedDevice(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0202 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'isRamConstrainedDevicePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRamConstrainedDevice(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(31);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('isRamConstrainedDevice(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0202 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0203
     * @tc.name      testResourceLocaleExtended0203
     * @tc.desc      深色模式下 日语 字符串 getAppMemorySizeCallback 回落为 "getAppMemorySize(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0203 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'getAppMemorySizeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0203 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0204
     * @tc.name      testResourceLocaleExtended0204
     * @tc.desc      深色模式下 日语 字符串 getAppMemorySizePromise 回落为 "getAppMemorySize(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0204 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'getAppMemorySizePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0204 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0205
     * @tc.name      testResourceLocaleExtended0205
     * @tc.desc      深色模式下 日语 字符串 getRunningProcessInformationCallback 回落为 "getRunningProcessInformation(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0205 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'getRunningProcessInformationCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(38);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0205 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0206
     * @tc.name      testResourceLocaleExtended0206
     * @tc.desc      深色模式下 日语 字符串 getRunningProcessInformationPromise 回落为 "getRunningProcessInformation(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0206 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'getRunningProcessInformationPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0206 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0207
     * @tc.name      testResourceLocaleExtended0207
     * @tc.desc      深色模式下 日语 字符串 registerErrorObserver 回落为 "register ErrorObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0207 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'registerErrorObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(22);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0207 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0208
     * @tc.name      testResourceLocaleExtended0208
     * @tc.desc      深色模式下 日语 字符串 unregisterErrorObserver 回落为 "unregister ErrorObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0208 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterErrorObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(24);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('unregister ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0208 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0209
     * @tc.name      testResourceLocaleExtended0209
     * @tc.desc      深色模式下 日语 字符串 simulateError 回落为 "simulate Error"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0209 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'simulateError';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate Error');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('simulate Error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0209 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0210
     * @tc.name      testResourceLocaleExtended0210
     * @tc.desc      深色模式下 日语 字符串 registerLoopObserver 回落为 "register LoopObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0210 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'registerLoopObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0210 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0211
     * @tc.name      testResourceLocaleExtended0211
     * @tc.desc      深色模式下 日语 字符串 unregisterLoopObserver 回落为 "unregister LoopObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0211 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterLoopObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0211 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0212
     * @tc.name      testResourceLocaleExtended0212
     * @tc.desc      深色模式下 日语 字符串 simulateLoopTimeout 回落为 "simulate LoopTimeout"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0212 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'simulateLoopTimeout';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate LoopTimeout');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('simulate LoopTimeout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0212 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0213
     * @tc.name      testResourceLocaleExtended0213
     * @tc.desc      深色模式下 日语 字符串 registerUnhandledRejection 回落为 "register UnhandledRejectionObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0213 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'registerUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(35);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0213 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0214
     * @tc.name      testResourceLocaleExtended0214
     * @tc.desc      深色模式下 日语 字符串 unregisterUnhandledRejection 回落为 "unregister UnhandledRejectionObserver"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0214 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'unregisterUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('unregister UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0214 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0215
     * @tc.name      testResourceLocaleExtended0215
     * @tc.desc      深色模式下 日语 字符串 simulateUnhandledRejection 回落为 "simulate UnhandledRejection"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0215 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'simulateUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(27);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0215 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0216
     * @tc.name      testResourceLocaleExtended0216
     * @tc.desc      深色模式下 日语 字符串 getId 回落为 "getId"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0216 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'getId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0216 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0217
     * @tc.name      testResourceLocaleExtended0217
     * @tc.desc      深色模式下 日语 字符串 attachId 回落为 "attachId"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0217 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'attachId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('attachId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('attachId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0217 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0218
     * @tc.name      testResourceLocaleExtended0218
     * @tc.desc      深色模式下 日语 字符串 deleteId 回落为 "deleteId"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0218 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'deleteId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('deleteId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('deleteId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0218 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0219
     * @tc.name      testResourceLocaleExtended0219
     * @tc.desc      深色模式下 日语 字符串 updateId 回落为 "updateId"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0219 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'updateId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0219 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0220
     * @tc.name      testResourceLocaleExtended0220
     * @tc.desc      深色模式下 日语 字符串 UIAbilityContext_startAbilityByType 回落为 "startAbilityByType"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0220 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_startAbilityByType';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('startAbilityByType');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('startAbilityByType');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0220 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0221
     * @tc.name      testResourceLocaleExtended0221
     * @tc.desc      深色模式下 日语 字符串 UIAbilityContext_requestModalUIExtension 回落为 "requestModalUIExtension"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0221 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_requestModalUIExtension';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('requestModalUIExtension');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('requestModalUIExtension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0221 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0222
     * @tc.name      testResourceLocaleExtended0222
     * @tc.desc      深色模式下 日语 字符串 UIExtensionContentSession_terminateSelfWithResultCallback 回落为
     *               "terminateSelfWithResult(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0222 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0222 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0223
     * @tc.name      testResourceLocaleExtended0223
     * @tc.desc      深色模式下 日语 字符串 UIExtensionContentSession_terminateSelfWithResultPromise 回落为
     *               "terminateSelfWithResult(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0223 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0223 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0224
     * @tc.name      testResourceLocaleExtended0224
     * @tc.desc      深色模式下 日语 字符串 UIExtensionContentSession_setWindowPrivacyModeCallback 回落为
     *               "setWindowPrivacyMode(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0224 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setWindowPrivacyMode(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(30);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setWindowPrivacyMode(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0224 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0225
     * @tc.name      testResourceLocaleExtended0225
     * @tc.desc      深色模式下 日语 字符串 UIExtensionContentSession_setWindowPrivacyModePromise 回落为
     *               "setWindowPrivacyMode(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0225 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(29);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0225 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0226
     * @tc.name      testResourceLocaleExtended0226
     * @tc.desc      深色模式下 日语 字符串 privacy_window_permission 回落为 "permit user to set privacy window"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0226 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'privacy_window_permission';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0226 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0227
     * @tc.name      testResourceLocaleExtended0227
     * @tc.desc      深色模式下 日语 字符串 UIExtensionContentSession_getUIExtensionWindowProxy 回落为 "getUIExtensionWindowProxy"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0227 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'UIExtensionContentSession_getUIExtensionWindowProxy';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0227 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0228
     * @tc.name      testResourceLocaleExtended0228
     * @tc.desc      深色模式下 日语 字符串 getBundleNameCallback 回落为 "getBundleName(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0228 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'getBundleNameCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0228 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0229
     * @tc.name      testResourceLocaleExtended0229
     * @tc.desc      深色模式下 日语 字符串 getBundleNamePromise 回落为 "getBundleName(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0229 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'getBundleNamePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getBundleName(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(22);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getBundleName(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0229 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0230
     * @tc.name      testResourceLocaleExtended0230
     * @tc.desc      深色模式下 日语 字符串 getUidCallback 回落为 "getUid(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0230 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'getUidCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0230 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0231
     * @tc.name      testResourceLocaleExtended0231
     * @tc.desc      深色模式下 日语 字符串 getUidPromise 回落为 "getUid(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0231 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'getUidPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0231 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0232
     * @tc.name      testResourceLocaleExtended0232
     * @tc.desc      深色模式下 日语 字符串 cancelCallback 回落为 "cancel(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0232 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'cancelCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0232 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0233
     * @tc.name      testResourceLocaleExtended0233
     * @tc.desc      深色模式下 日语 字符串 cancelPromise 回落为 "cancel(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0233 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'cancelPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('cancel(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('cancel(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0233 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0234
     * @tc.name      testResourceLocaleExtended0234
     * @tc.desc      深色模式下 日语 字符串 equalCallback 回落为 "equal(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0234 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'equalCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0234 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0235
     * @tc.name      testResourceLocaleExtended0235
     * @tc.desc      深色模式下 日语 字符串 equalPromise 回落为 "equal(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0235 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'equalPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0235 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0236
     * @tc.name      testResourceLocaleExtended0236
     * @tc.desc      深色模式下 日语 字符串 getOperationTypeCallback 回落为 "getOperationType(callback)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0236 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'getOperationTypeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getOperationType(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getOperationType(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0236 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_EXTENDED_0237
     * @tc.name      testResourceLocaleExtended0237
     * @tc.desc      深色模式下 日语 字符串 getOperationTypePromise 回落为 "getOperationType(promise)"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0237 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'getOperationTypePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0237 end');
    })
  })
}
