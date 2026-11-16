/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
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
const TAG: string = '[Sample_AppStartup]';

function lightManager(locale: string): Promise<resourceManager.ResourceManager> {
  return loadOverrideResourceManager(locale, resourceManager.ColorMode.LIGHT);
}

export default function resourceLocaleMatrixTest(): void {
  describe('AppStartupResourceLocaleMatrixTest', () => {
    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0001
     * @tc.name      testResourceLocaleMatrix0001
     * @tc.desc      中文下字符串 module_desc 为 "模块描述"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0001 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const key: string = 'module_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('模块描述');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(4);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('模块描述');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0001 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0002
     * @tc.name      testResourceLocaleMatrix0002
     * @tc.desc      中文下字符串 EntryAbility_desc 为 "description"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0002 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const key: string = 'EntryAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0002 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0003
     * @tc.name      testResourceLocaleMatrix0003
     * @tc.desc      中文下字符串 EntryAbility_label 为 "label"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0003 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const key: string = 'EntryAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0003 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0004
     * @tc.name      testResourceLocaleMatrix0004
     * @tc.desc      中文下字符串 Manual_mode 为 "手动模式"（该语言未定义，回落 base），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0004 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const key: string = 'Manual_mode';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(4);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0004 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0005
     * @tc.name      testResourceLocaleMatrix0005
     * @tc.desc      中文下字符串 app_name 为 "MyApplication"（该语言未定义，回落 base），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0005 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0005 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0006
     * @tc.name      testResourceLocaleMatrix0006
     * @tc.desc      英文下字符串 module_desc 为 "module description"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0006 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'module_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0006 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0007
     * @tc.name      testResourceLocaleMatrix0007
     * @tc.desc      英文下字符串 EntryAbility_desc 为 "description"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0007 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'EntryAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0007 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0008
     * @tc.name      testResourceLocaleMatrix0008
     * @tc.desc      英文下字符串 EntryAbility_label 为 "label"，同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0008 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'EntryAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0008 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0009
     * @tc.name      testResourceLocaleMatrix0009
     * @tc.desc      英文下字符串 Manual_mode 为 "手动模式"（该语言未定义，回落 base），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0009 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'Manual_mode';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(4);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0009 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0010
     * @tc.name      testResourceLocaleMatrix0010
     * @tc.desc      英文下字符串 app_name 为 "MyApplication"（该语言未定义，回落 base），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0010 begin');
      const manager: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0010 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0011
     * @tc.name      testResourceLocaleMatrix0011
     * @tc.desc      法语下字符串 module_desc 为 "module description"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0011 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0011 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0012
     * @tc.name      testResourceLocaleMatrix0012
     * @tc.desc      法语下字符串 EntryAbility_desc 为 "description"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0012 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0012 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0013
     * @tc.name      testResourceLocaleMatrix0013
     * @tc.desc      法语下字符串 EntryAbility_label 为 "label"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0013 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0013 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0014
     * @tc.name      testResourceLocaleMatrix0014
     * @tc.desc      法语下字符串 Manual_mode 为 "手动模式"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0014 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'Manual_mode';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(4);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0014 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0015
     * @tc.name      testResourceLocaleMatrix0015
     * @tc.desc      法语下字符串 app_name 为 "MyApplication"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0015 begin');
      const manager: resourceManager.ResourceManager = await lightManager('fr_Latn_FR');
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0015 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0016
     * @tc.name      testResourceLocaleMatrix0016
     * @tc.desc      日语下字符串 module_desc 为 "module description"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0016 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0016 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0017
     * @tc.name      testResourceLocaleMatrix0017
     * @tc.desc      日语下字符串 EntryAbility_desc 为 "description"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0017 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0017 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0018
     * @tc.name      testResourceLocaleMatrix0018
     * @tc.desc      日语下字符串 EntryAbility_label 为 "label"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0018 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0018 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0019
     * @tc.name      testResourceLocaleMatrix0019
     * @tc.desc      日语下字符串 Manual_mode 为 "手动模式"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0019 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'Manual_mode';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(4);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0019 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0020
     * @tc.name      testResourceLocaleMatrix0020
     * @tc.desc      日语下字符串 app_name 为 "MyApplication"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0020 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ja_Jpan_JP');
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0020 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0021
     * @tc.name      testResourceLocaleMatrix0021
     * @tc.desc      德语下字符串 module_desc 为 "module description"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0021 begin');
      const manager: resourceManager.ResourceManager = await lightManager('de_Latn_DE');
      const key: string = 'module_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0021 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0022
     * @tc.name      testResourceLocaleMatrix0022
     * @tc.desc      德语下字符串 EntryAbility_desc 为 "description"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0022 begin');
      const manager: resourceManager.ResourceManager = await lightManager('de_Latn_DE');
      const key: string = 'EntryAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0022 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0023
     * @tc.name      testResourceLocaleMatrix0023
     * @tc.desc      德语下字符串 EntryAbility_label 为 "label"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0023 begin');
      const manager: resourceManager.ResourceManager = await lightManager('de_Latn_DE');
      const key: string = 'EntryAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0023 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0024
     * @tc.name      testResourceLocaleMatrix0024
     * @tc.desc      德语下字符串 Manual_mode 为 "手动模式"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0024 begin');
      const manager: resourceManager.ResourceManager = await lightManager('de_Latn_DE');
      const key: string = 'Manual_mode';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(4);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0024 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0025
     * @tc.name      testResourceLocaleMatrix0025
     * @tc.desc      德语下字符串 app_name 为 "MyApplication"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0025 begin');
      const manager: resourceManager.ResourceManager = await lightManager('de_Latn_DE');
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0025 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0026
     * @tc.name      testResourceLocaleMatrix0026
     * @tc.desc      韩语下字符串 module_desc 为 "module description"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0026 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ko_Kore_KR');
      const key: string = 'module_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(18);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0026 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0027
     * @tc.name      testResourceLocaleMatrix0027
     * @tc.desc      韩语下字符串 EntryAbility_desc 为 "description"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0027 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ko_Kore_KR');
      const key: string = 'EntryAbility_desc';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(11);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0027 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0028
     * @tc.name      testResourceLocaleMatrix0028
     * @tc.desc      韩语下字符串 EntryAbility_label 为 "label"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0028 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ko_Kore_KR');
      const key: string = 'EntryAbility_label';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(5);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0028 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0029
     * @tc.name      testResourceLocaleMatrix0029
     * @tc.desc      韩语下字符串 Manual_mode 为 "手动模式"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0029 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ko_Kore_KR');
      const key: string = 'Manual_mode';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(4);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0029 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0030
     * @tc.name      testResourceLocaleMatrix0030
     * @tc.desc      韩语下字符串 app_name 为 "MyApplication"（回落），同步异步一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0030 begin');
      const manager: resourceManager.ResourceManager = await lightManager('ko_Kore_KR');
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const actual3: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0030 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0031
     * @tc.name      testResourceLocaleMatrix0031
     * @tc.desc      Manual_mode 只在 base 定义：中文与英文下都是“手动模式”，module_desc 则按语言区分
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0031 begin');
      const zh: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const en: resourceManager.ResourceManager = await lightManager('en_Latn_US');
      const actual1: string | number | boolean = zh.getStringByNameSync('Manual_mode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(en.getStringByNameSync('Manual_mode'));
      const actual2: string = zh.getStringByNameSync('module_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('模块描述');
      const actual3: string = en.getStringByNameSync('module_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0031 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0032
     * @tc.name      testResourceLocaleMatrix0032
     * @tc.desc      浅色下颜色 start_window_background 解析为 0xFFFFFFFF，不透明且 RGB 与 #FFFFFF 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0032 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const color: number = manager.getColorByNameSync('start_window_background');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 color=${color}`);
      expect(color).assertEqual(0xFFFFFFFF);
      const actual2: number = color >>> 24;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0xFF);
      const actual3: number = color & 0xFFFFFF;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0xFFFFFF);
      const actual4: number = await manager.getColorByName('start_window_background');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(0xFFFFFFFF);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0032 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0033
     * @tc.name      testResourceLocaleMatrix0033
     * @tc.desc      深色（无 dark 目录，回落 base）下颜色 start_window_background 解析为 0xFFFFFFFF，不透明且 RGB 与 #FFFFFF 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0033 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const color: number = manager.getColorByNameSync('start_window_background');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 color=${color}`);
      expect(color).assertEqual(0xFFFFFFFF);
      const actual2: number = color >>> 24;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0xFF);
      const actual3: number = color & 0xFFFFFF;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0xFFFFFF);
      const actual4: number = await manager.getColorByName('start_window_background');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(0xFFFFFFFF);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0033 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0034
     * @tc.name      testResourceLocaleMatrix0034
     * @tc.desc      媒体资源 startIcon（ResourceManagerTask 解码并旋转的图片）读取为 4351 字节 PNG，同步与异步接口内容一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0034 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const content: Uint8Array = manager.getMediaByNameSync('startIcon');
      const again: Uint8Array = await manager.getMediaByName('startIcon');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 content.length=${content.length}`);
      expect(content.length).assertEqual(4351);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 again.length=${again.length}`);
      expect(again.length).assertEqual(4351);
      const actual3: string = String.fromCharCode(content[1], content[2], content[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('PNG');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0034 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0035
     * @tc.name      testResourceLocaleMatrix0035
     * @tc.desc      媒体资源 icon（EntryAbility 的图标）读取为 2041 字节 PNG，同步与异步接口内容一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0035 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const content: Uint8Array = manager.getMediaByNameSync('icon');
      const again: Uint8Array = await manager.getMediaByName('icon');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 content.length=${content.length}`);
      expect(content.length).assertEqual(2041);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 again.length=${again.length}`);
      expect(again.length).assertEqual(2041);
      const actual3: string = String.fromCharCode(content[1], content[2], content[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('PNG');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0035 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0036
     * @tc.name      testResourceLocaleMatrix0036
     * @tc.desc      媒体资源 app_icon（AppScope 的应用图标）读取为 2041 字节 PNG，同步与异步接口内容一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0036 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const content: Uint8Array = manager.getMediaByNameSync('app_icon');
      const again: Uint8Array = await manager.getMediaByName('app_icon');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 content.length=${content.length}`);
      expect(content.length).assertEqual(2041);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 again.length=${again.length}`);
      expect(again.length).assertEqual(2041);
      const actual3: string = String.fromCharCode(content[1], content[2], content[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('PNG');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0036 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0037
     * @tc.name      testResourceLocaleMatrix0037
     * @tc.desc      按名称读取不存在的字符串 "no_such_string" 抛 9001003，正常资源仍可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0037 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      let code: string = '';
      try {
        manager.getStringByNameSync('no_such_string');
      } catch (error) {
        // 资源管理的错误码在真机上是字符串
        expect(typeof (error as BusinessError).code).assertEqual('string');
        code = String((error as BusinessError).code);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual('9001003');
      const actual2: string = manager.getStringByNameSync('Manual_mode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0037 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0038
     * @tc.name      testResourceLocaleMatrix0038
     * @tc.desc      按名称读取不存在的大小写不同的字符串名 "manual_mode" 抛 9001003，正常资源仍可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0038 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      let code: string = '';
      try {
        manager.getStringByNameSync('manual_mode');
      } catch (error) {
        // 资源管理的错误码在真机上是字符串
        expect(typeof (error as BusinessError).code).assertEqual('string');
        code = String((error as BusinessError).code);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual('9001003');
      const actual2: string = manager.getStringByNameSync('Manual_mode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0038 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0039
     * @tc.name      testResourceLocaleMatrix0039
     * @tc.desc      按名称读取不存在的带尾随空格的字符串名 "Manual_mode " 抛 9001003，正常资源仍可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0039 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      let code: string = '';
      try {
        manager.getStringByNameSync('Manual_mode ');
      } catch (error) {
        // 资源管理的错误码在真机上是字符串
        expect(typeof (error as BusinessError).code).assertEqual('string');
        code = String((error as BusinessError).code);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual('9001003');
      const actual2: string = manager.getStringByNameSync('Manual_mode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0039 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0040
     * @tc.name      testResourceLocaleMatrix0040
     * @tc.desc      按名称读取不存在的只存在于 entry_test 模块的字符串 "TestAbility_label" 抛 9001003，正常资源仍可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0040 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      let code: string = '';
      try {
        manager.getStringByNameSync('TestAbility_label');
      } catch (error) {
        // 资源管理的错误码在真机上是字符串
        expect(typeof (error as BusinessError).code).assertEqual('string');
        code = String((error as BusinessError).code);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual('9001003');
      const actual2: string = manager.getStringByNameSync('Manual_mode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0040 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0041
     * @tc.name      testResourceLocaleMatrix0041
     * @tc.desc      按名称读取不存在的颜色 "no_such_color" 抛 9001003，正常资源仍可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0041 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      let code: string = '';
      try {
        manager.getColorByNameSync('no_such_color');
      } catch (error) {
        // 资源管理的错误码在真机上是字符串
        expect(typeof (error as BusinessError).code).assertEqual('string');
        code = String((error as BusinessError).code);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual('9001003');
      const actual2: string = manager.getStringByNameSync('Manual_mode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0041 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0042
     * @tc.name      testResourceLocaleMatrix0042
     * @tc.desc      按名称读取不存在的大小写不同的颜色名 "Start_Window_Background" 抛 9001003，正常资源仍可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0042 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      let code: string = '';
      try {
        manager.getColorByNameSync('Start_Window_Background');
      } catch (error) {
        // 资源管理的错误码在真机上是字符串
        expect(typeof (error as BusinessError).code).assertEqual('string');
        code = String((error as BusinessError).code);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual('9001003');
      const actual2: string = manager.getStringByNameSync('Manual_mode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0042 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0043
     * @tc.name      testResourceLocaleMatrix0043
     * @tc.desc      按名称读取不存在的媒体 "no_such_media" 抛 9001003，正常资源仍可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0043 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      let code: string = '';
      try {
        manager.getMediaByNameSync('no_such_media');
      } catch (error) {
        // 资源管理的错误码在真机上是字符串
        expect(typeof (error as BusinessError).code).assertEqual('string');
        code = String((error as BusinessError).code);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual('9001003');
      const actual2: string = manager.getStringByNameSync('Manual_mode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0043 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_0044
     * @tc.name      testResourceLocaleMatrix0044
     * @tc.desc      按名称读取不存在的带扩展名的媒体名 "startIcon.png" 抛 9001003，正常资源仍可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0044 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      let code: string = '';
      try {
        manager.getMediaByNameSync('startIcon.png');
      } catch (error) {
        // 资源管理的错误码在真机上是字符串
        expect(typeof (error as BusinessError).code).assertEqual('string');
        code = String((error as BusinessError).code);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual('9001003');
      const actual2: string = manager.getStringByNameSync('Manual_mode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0044 end');
    })
  })
}
