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

export default function resourceLocaleMatrixAdvancedTest(): void {
  describe('AbilityRuntimeResourceLocaleMatrixAdvancedTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0166
     * @tc.name      testResourceLocaleMatrix0166
     * @tc.desc      法语下字符串 getBundleNameCallback 为 "getBundleName(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0166 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'getBundleNameCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0166 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0167
     * @tc.name      testResourceLocaleMatrix0167
     * @tc.desc      法语下字符串 getBundleNamePromise 为 "getBundleName(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0167 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'getBundleNamePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getBundleName(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(22);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getBundleName(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0167 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0168
     * @tc.name      testResourceLocaleMatrix0168
     * @tc.desc      法语下字符串 getUidCallback 为 "getUid(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0168 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'getUidCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0168 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0169
     * @tc.name      testResourceLocaleMatrix0169
     * @tc.desc      法语下字符串 getUidPromise 为 "getUid(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0169 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'getUidPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0169 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0170
     * @tc.name      testResourceLocaleMatrix0170
     * @tc.desc      法语下字符串 cancelCallback 为 "cancel(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0170 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'cancelCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0170 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0171
     * @tc.name      testResourceLocaleMatrix0171
     * @tc.desc      法语下字符串 cancelPromise 为 "cancel(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0171 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'cancelPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('cancel(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('cancel(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0171 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0172
     * @tc.name      testResourceLocaleMatrix0172
     * @tc.desc      法语下字符串 equalCallback 为 "equal(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0172 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'equalCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0172 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0173
     * @tc.name      testResourceLocaleMatrix0173
     * @tc.desc      法语下字符串 equalPromise 为 "equal(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0173 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'equalPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0173 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0174
     * @tc.name      testResourceLocaleMatrix0174
     * @tc.desc      法语下字符串 getOperationTypeCallback 为 "getOperationType(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0174 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'getOperationTypeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getOperationType(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getOperationType(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0174 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0175
     * @tc.name      testResourceLocaleMatrix0175
     * @tc.desc      法语下字符串 getOperationTypePromise 为 "getOperationType(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0175 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'getOperationTypePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0175 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0176
     * @tc.name      testResourceLocaleMatrix0176
     * @tc.desc      法语下字符串 trigger 为 "trigger"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0176 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'trigger';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(7);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0176 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0177
     * @tc.name      testResourceLocaleMatrix0177
     * @tc.desc      法语下字符串 MapAbility_desc 为 "description"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0177 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'MapAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0177 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0178
     * @tc.name      testResourceLocaleMatrix0178
     * @tc.desc      法语下字符串 MapAbility_label 为 "label"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0178 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'MapAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0178 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0179
     * @tc.name      testResourceLocaleMatrix0179
     * @tc.desc      法语下字符串 ApplicationContext_restartApp 为 "restartApp"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0179 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'ApplicationContext_restartApp';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('restartApp');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(10);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('restartApp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0179 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0180
     * @tc.name      testResourceLocaleMatrix0180
     * @tc.desc      法语下字符串 ApplicationContext_setFont 为 "setFont"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0180 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'ApplicationContext_setFont';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(7);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0180 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0181
     * @tc.name      testResourceLocaleMatrix0181
     * @tc.desc      法语下字符串 ApplicationContext_getRunningProcessInformation_promise 为
     *               "getRunningProcessInformationPromise"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0181 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'ApplicationContext_getRunningProcessInformation_promise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(35);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0181 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0182
     * @tc.name      testResourceLocaleMatrix0182
     * @tc.desc      法语下字符串 ApplicationContext_getRunningProcessInformation_callback 为
     *               "getRunningProcessInformation(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0182 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'ApplicationContext_getRunningProcessInformation_callback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(38);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0182 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0183
     * @tc.name      testResourceLocaleMatrix0183
     * @tc.desc      法语下字符串 ApplicationContext_getCurrentAppCloneIndex 为 "getCurrentAppCloneIndex"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0183 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'ApplicationContext_getCurrentAppCloneIndex';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0183 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0184
     * @tc.name      testResourceLocaleMatrix0184
     * @tc.desc      法语下字符串 UIAbilityContext_moveAbilityToBackground 为 "moveAbilityToBackground"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0184 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'UIAbilityContext_moveAbilityToBackground';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0184 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0185
     * @tc.name      testResourceLocaleMatrix0185
     * @tc.desc      法语下字符串 UIAbilityContext_terminateSelf 为 "terminateSelf"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0185 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'UIAbilityContext_terminateSelf';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0185 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0186
     * @tc.name      testResourceLocaleMatrix0186
     * @tc.desc      法语下字符串 app_name 为 "AbilityRuntime"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0186 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('AbilityRuntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('AbilityRuntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0186 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0187
     * @tc.name      testResourceLocaleMatrix0187
     * @tc.desc      日语下字符串 module_desc 为 "module description"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0187 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'module_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0187 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0188
     * @tc.name      testResourceLocaleMatrix0188
     * @tc.desc      日语下字符串 EntryAbility_desc 为 "description"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0188 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'EntryAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0188 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0189
     * @tc.name      testResourceLocaleMatrix0189
     * @tc.desc      日语下字符串 EntryAbility_label 为 "label"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0189 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'EntryAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0189 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0190
     * @tc.name      testResourceLocaleMatrix0190
     * @tc.desc      日语下字符串 main_title 为 "public api example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0190 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'main_title';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('public api example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('public api example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0190 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0191
     * @tc.name      testResourceLocaleMatrix0191
     * @tc.desc      日语下字符串 AppManager 为 "appManager example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0191 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'AppManager';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('appManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('appManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0191 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0192
     * @tc.name      testResourceLocaleMatrix0192
     * @tc.desc      日语下字符串 appRecovery 为 "appRecovery example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0192 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'appRecovery';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(19);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('appRecovery example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0192 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0193
     * @tc.name      testResourceLocaleMatrix0193
     * @tc.desc      日语下字符串 DataUriUtils 为 "dataUriUtils example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0193 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'DataUriUtils';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('dataUriUtils example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('dataUriUtils example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0193 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0194
     * @tc.name      testResourceLocaleMatrix0194
     * @tc.desc      日语下字符串 WantAgent 为 "WantAgent example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0194 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'WantAgent';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('WantAgent example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(17);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('WantAgent example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0194 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0195
     * @tc.name      testResourceLocaleMatrix0195
     * @tc.desc      日语下字符串 ApplicationContext 为 "ApplicationContext example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0195 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'ApplicationContext';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('ApplicationContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ApplicationContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0195 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0196
     * @tc.name      testResourceLocaleMatrix0196
     * @tc.desc      日语下字符串 UIAbilityContext 为 "UIAbilityContext example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0196 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'UIAbilityContext';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UIAbilityContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(24);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('UIAbilityContext example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0196 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0197
     * @tc.name      testResourceLocaleMatrix0197
     * @tc.desc      日语下字符串 AbilityLifecycleCallback 为 "AbilityLifecycleCallback example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0197 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'AbilityLifecycleCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('AbilityLifecycleCallback example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('AbilityLifecycleCallback example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0197 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0198
     * @tc.name      testResourceLocaleMatrix0198
     * @tc.desc      日语下字符串 ErrorManager 为 "errorManager example"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0198 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'ErrorManager';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('errorManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('errorManager example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0198 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0199
     * @tc.name      testResourceLocaleMatrix0199
     * @tc.desc      日语下字符串 isRunningInStabilityTestCallback 为 "isRunningInStabilityTest(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0199 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'isRunningInStabilityTestCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(34);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('isRunningInStabilityTest(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0199 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0200
     * @tc.name      testResourceLocaleMatrix0200
     * @tc.desc      日语下字符串 isRunningInStabilityTestPromise 为 "isRunningInStabilityTest(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0200 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'isRunningInStabilityTestPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRunningInStabilityTest(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('isRunningInStabilityTest(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0200 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0201
     * @tc.name      testResourceLocaleMatrix0201
     * @tc.desc      日语下字符串 isRamConstrainedDeviceCallback 为 "isRamConstrainedDevice(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0201 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'isRamConstrainedDeviceCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('isRamConstrainedDevice(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0201 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0202
     * @tc.name      testResourceLocaleMatrix0202
     * @tc.desc      日语下字符串 isRamConstrainedDevicePromise 为 "isRamConstrainedDevice(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0202 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'isRamConstrainedDevicePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('isRamConstrainedDevice(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(31);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('isRamConstrainedDevice(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0202 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0203
     * @tc.name      testResourceLocaleMatrix0203
     * @tc.desc      日语下字符串 getAppMemorySizeCallback 为 "getAppMemorySize(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0203 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'getAppMemorySizeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getAppMemorySize(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0203 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0204
     * @tc.name      testResourceLocaleMatrix0204
     * @tc.desc      日语下字符串 getAppMemorySizePromise 为 "getAppMemorySize(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0204 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'getAppMemorySizePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getAppMemorySize(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0204 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0205
     * @tc.name      testResourceLocaleMatrix0205
     * @tc.desc      日语下字符串 getRunningProcessInformationCallback 为 "getRunningProcessInformation(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0205 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'getRunningProcessInformationCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(38);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0205 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0206
     * @tc.name      testResourceLocaleMatrix0206
     * @tc.desc      日语下字符串 getRunningProcessInformationPromise 为 "getRunningProcessInformation(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0206 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'getRunningProcessInformationPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getRunningProcessInformation(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0206 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0207
     * @tc.name      testResourceLocaleMatrix0207
     * @tc.desc      日语下字符串 registerErrorObserver 为 "register ErrorObserver"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0207 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'registerErrorObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(22);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('register ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0207 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0208
     * @tc.name      testResourceLocaleMatrix0208
     * @tc.desc      日语下字符串 unregisterErrorObserver 为 "unregister ErrorObserver"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0208 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'unregisterErrorObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(24);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('unregister ErrorObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0208 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0209
     * @tc.name      testResourceLocaleMatrix0209
     * @tc.desc      日语下字符串 simulateError 为 "simulate Error"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0209 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'simulateError';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate Error');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('simulate Error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0209 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0210
     * @tc.name      testResourceLocaleMatrix0210
     * @tc.desc      日语下字符串 registerLoopObserver 为 "register LoopObserver"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0210 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'registerLoopObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(21);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('register LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0210 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0211
     * @tc.name      testResourceLocaleMatrix0211
     * @tc.desc      日语下字符串 unregisterLoopObserver 为 "unregister LoopObserver"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0211 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'unregisterLoopObserver';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('unregister LoopObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0211 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0212
     * @tc.name      testResourceLocaleMatrix0212
     * @tc.desc      日语下字符串 simulateLoopTimeout 为 "simulate LoopTimeout"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0212 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'simulateLoopTimeout';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate LoopTimeout');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(20);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('simulate LoopTimeout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0212 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0213
     * @tc.name      testResourceLocaleMatrix0213
     * @tc.desc      日语下字符串 registerUnhandledRejection 为 "register UnhandledRejectionObserver"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0213 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'registerUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(35);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('register UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0213 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0214
     * @tc.name      testResourceLocaleMatrix0214
     * @tc.desc      日语下字符串 unregisterUnhandledRejection 为 "unregister UnhandledRejectionObserver"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0214 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'unregisterUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('unregister UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('unregister UnhandledRejectionObserver');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0214 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0215
     * @tc.name      testResourceLocaleMatrix0215
     * @tc.desc      日语下字符串 simulateUnhandledRejection 为 "simulate UnhandledRejection"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0215 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'simulateUnhandledRejection';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(27);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('simulate UnhandledRejection');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0215 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0216
     * @tc.name      testResourceLocaleMatrix0216
     * @tc.desc      日语下字符串 getId 为 "getId"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0216 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'getId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0216 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0217
     * @tc.name      testResourceLocaleMatrix0217
     * @tc.desc      日语下字符串 attachId 为 "attachId"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0217 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'attachId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('attachId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('attachId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0217 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0218
     * @tc.name      testResourceLocaleMatrix0218
     * @tc.desc      日语下字符串 deleteId 为 "deleteId"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0218 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'deleteId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('deleteId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('deleteId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0218 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0219
     * @tc.name      testResourceLocaleMatrix0219
     * @tc.desc      日语下字符串 updateId 为 "updateId"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0219 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'updateId';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(8);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('updateId');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0219 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0220
     * @tc.name      testResourceLocaleMatrix0220
     * @tc.desc      日语下字符串 UIAbilityContext_startAbilityByType 为 "startAbilityByType"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0220 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'UIAbilityContext_startAbilityByType';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('startAbilityByType');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('startAbilityByType');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0220 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0221
     * @tc.name      testResourceLocaleMatrix0221
     * @tc.desc      日语下字符串 UIAbilityContext_requestModalUIExtension 为 "requestModalUIExtension"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0221 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'UIAbilityContext_requestModalUIExtension';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('requestModalUIExtension');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('requestModalUIExtension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0221 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0222
     * @tc.name      testResourceLocaleMatrix0222
     * @tc.desc      日语下字符串 UIExtensionContentSession_terminateSelfWithResultCallback 为
     *               "terminateSelfWithResult(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0222 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('terminateSelfWithResult(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0222 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0223
     * @tc.name      testResourceLocaleMatrix0223
     * @tc.desc      日语下字符串 UIExtensionContentSession_terminateSelfWithResultPromise 为
     *               "terminateSelfWithResult(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0223 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'UIExtensionContentSession_terminateSelfWithResultPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(32);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('terminateSelfWithResult(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0223 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0224
     * @tc.name      testResourceLocaleMatrix0224
     * @tc.desc      日语下字符串 UIExtensionContentSession_setWindowPrivacyModeCallback 为
     *               "setWindowPrivacyMode(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0224 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setWindowPrivacyMode(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(30);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('setWindowPrivacyMode(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0224 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0225
     * @tc.name      testResourceLocaleMatrix0225
     * @tc.desc      日语下字符串 UIExtensionContentSession_setWindowPrivacyModePromise 为 "setWindowPrivacyMode(promise)"（回落），
     *               同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0225 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'UIExtensionContentSession_setWindowPrivacyModePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(29);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('setWindowPrivacyMode(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0225 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0226
     * @tc.name      testResourceLocaleMatrix0226
     * @tc.desc      日语下字符串 privacy_window_permission 为 "permit user to set privacy window"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0226 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'privacy_window_permission';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(33);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('permit user to set privacy window');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0226 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0227
     * @tc.name      testResourceLocaleMatrix0227
     * @tc.desc      日语下字符串 UIExtensionContentSession_getUIExtensionWindowProxy 为 "getUIExtensionWindowProxy"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0227 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'UIExtensionContentSession_getUIExtensionWindowProxy';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getUIExtensionWindowProxy');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0227 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0228
     * @tc.name      testResourceLocaleMatrix0228
     * @tc.desc      日语下字符串 getBundleNameCallback 为 "getBundleName(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0228 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'getBundleNameCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getBundleName(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0228 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0229
     * @tc.name      testResourceLocaleMatrix0229
     * @tc.desc      日语下字符串 getBundleNamePromise 为 "getBundleName(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0229 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'getBundleNamePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getBundleName(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(22);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getBundleName(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0229 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0230
     * @tc.name      testResourceLocaleMatrix0230
     * @tc.desc      日语下字符串 getUidCallback 为 "getUid(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0230 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'getUidCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getUid(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0230 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0231
     * @tc.name      testResourceLocaleMatrix0231
     * @tc.desc      日语下字符串 getUidPromise 为 "getUid(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0231 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'getUidPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getUid(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0231 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0232
     * @tc.name      testResourceLocaleMatrix0232
     * @tc.desc      日语下字符串 cancelCallback 为 "cancel(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0232 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'cancelCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('cancel(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0232 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0233
     * @tc.name      testResourceLocaleMatrix0233
     * @tc.desc      日语下字符串 cancelPromise 为 "cancel(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0233 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'cancelPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('cancel(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('cancel(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0233 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0234
     * @tc.name      testResourceLocaleMatrix0234
     * @tc.desc      日语下字符串 equalCallback 为 "equal(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0234 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'equalCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(15);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('equal(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0234 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0235
     * @tc.name      testResourceLocaleMatrix0235
     * @tc.desc      日语下字符串 equalPromise 为 "equal(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0235 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'equalPromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('equal(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0235 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0236
     * @tc.name      testResourceLocaleMatrix0236
     * @tc.desc      日语下字符串 getOperationTypeCallback 为 "getOperationType(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0236 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'getOperationTypeCallback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getOperationType(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getOperationType(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0236 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0237
     * @tc.name      testResourceLocaleMatrix0237
     * @tc.desc      日语下字符串 getOperationTypePromise 为 "getOperationType(promise)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0237 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'getOperationTypePromise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getOperationType(promise)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0237 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0238
     * @tc.name      testResourceLocaleMatrix0238
     * @tc.desc      日语下字符串 trigger 为 "trigger"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0238 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'trigger';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(7);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('trigger');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0238 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0239
     * @tc.name      testResourceLocaleMatrix0239
     * @tc.desc      日语下字符串 MapAbility_desc 为 "description"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0239 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'MapAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0239 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0240
     * @tc.name      testResourceLocaleMatrix0240
     * @tc.desc      日语下字符串 MapAbility_label 为 "label"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0240 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'MapAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0240 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0241
     * @tc.name      testResourceLocaleMatrix0241
     * @tc.desc      日语下字符串 ApplicationContext_restartApp 为 "restartApp"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0241 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'ApplicationContext_restartApp';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('restartApp');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(10);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('restartApp');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0241 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0242
     * @tc.name      testResourceLocaleMatrix0242
     * @tc.desc      日语下字符串 ApplicationContext_setFont 为 "setFont"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0242 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'ApplicationContext_setFont';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(7);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('setFont');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0242 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0243
     * @tc.name      testResourceLocaleMatrix0243
     * @tc.desc      日语下字符串 ApplicationContext_getRunningProcessInformation_promise 为
     *               "getRunningProcessInformationPromise"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0243 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'ApplicationContext_getRunningProcessInformation_promise';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(35);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getRunningProcessInformationPromise');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0243 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0244
     * @tc.name      testResourceLocaleMatrix0244
     * @tc.desc      日语下字符串 ApplicationContext_getRunningProcessInformation_callback 为
     *               "getRunningProcessInformation(callback)"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0244 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'ApplicationContext_getRunningProcessInformation_callback';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(38);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getRunningProcessInformation(callback)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0244 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0245
     * @tc.name      testResourceLocaleMatrix0245
     * @tc.desc      日语下字符串 ApplicationContext_getCurrentAppCloneIndex 为 "getCurrentAppCloneIndex"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0245 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'ApplicationContext_getCurrentAppCloneIndex';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('getCurrentAppCloneIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0245 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0246
     * @tc.name      testResourceLocaleMatrix0246
     * @tc.desc      日语下字符串 UIAbilityContext_moveAbilityToBackground 为 "moveAbilityToBackground"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0246 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'UIAbilityContext_moveAbilityToBackground';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(23);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('moveAbilityToBackground');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0246 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0247
     * @tc.name      testResourceLocaleMatrix0247
     * @tc.desc      日语下字符串 UIAbilityContext_terminateSelf 为 "terminateSelf"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0247 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'UIAbilityContext_terminateSelf';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('terminateSelf');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0247 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0248
     * @tc.name      testResourceLocaleMatrix0248
     * @tc.desc      日语下字符串 app_name 为 "AbilityRuntime"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0248 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('AbilityRuntime');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(14);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('AbilityRuntime');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0248 end');
    })
  })
}
