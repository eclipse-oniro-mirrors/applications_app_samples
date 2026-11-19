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
import { resourceManager } from '@kit.LocalizationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { loadOverrideResourceManager } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppStartup]';

export default function resourceLocaleMoreMatrixTest(): void {
  describe('AppStartupResourceLocaleMoreMatrixTest', () => {
    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0001
     * @tc.name      testResourceLocaleMoreMatrix0001
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 module_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0001 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
      const key: string = 'module_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0001 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0002
     * @tc.name      testResourceLocaleMoreMatrix0002
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 EntryAbility_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0002 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
      const key: string = 'EntryAbility_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0002 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0003
     * @tc.name      testResourceLocaleMoreMatrix0003
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 EntryAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0003 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0003 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0004
     * @tc.name      testResourceLocaleMoreMatrix0004
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 Manual_mode 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0004 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
      const key: string = 'Manual_mode';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(4);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0004 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0005
     * @tc.name      testResourceLocaleMoreMatrix0005
     * @tc.desc      扩展 LIGHT 模式下 it_Latn_IT 字符串 app_name 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0005 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.LIGHT);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0005 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0006
     * @tc.name      testResourceLocaleMoreMatrix0006
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 module_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0006 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
      const key: string = 'module_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0006 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0007
     * @tc.name      testResourceLocaleMoreMatrix0007
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 EntryAbility_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0007 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
      const key: string = 'EntryAbility_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0007 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0008
     * @tc.name      testResourceLocaleMoreMatrix0008
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 EntryAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0008 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0008 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0009
     * @tc.name      testResourceLocaleMoreMatrix0009
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 Manual_mode 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0009 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
      const key: string = 'Manual_mode';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(4);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0009 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0010
     * @tc.name      testResourceLocaleMoreMatrix0010
     * @tc.desc      扩展 DARK 模式下 it_Latn_IT 字符串 app_name 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0010 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('it_Latn_IT', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0010 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0011
     * @tc.name      testResourceLocaleMoreMatrix0011
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 module_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0011 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
      const key: string = 'module_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0011 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0012
     * @tc.name      testResourceLocaleMoreMatrix0012
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 EntryAbility_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0012 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
      const key: string = 'EntryAbility_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0012 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0013
     * @tc.name      testResourceLocaleMoreMatrix0013
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 EntryAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0013 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0013 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0014
     * @tc.name      testResourceLocaleMoreMatrix0014
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 Manual_mode 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0014 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
      const key: string = 'Manual_mode';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(4);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0014 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0015
     * @tc.name      testResourceLocaleMoreMatrix0015
     * @tc.desc      扩展 LIGHT 模式下 tr_Latn_TR 字符串 app_name 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMoreMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0015 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.LIGHT);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0015 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0016
     * @tc.name      testResourceLocaleMoreMatrix0016
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 module_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0016 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
      const key: string = 'module_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0016 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0017
     * @tc.name      testResourceLocaleMoreMatrix0017
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 EntryAbility_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0017 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
      const key: string = 'EntryAbility_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0017 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0018
     * @tc.name      testResourceLocaleMoreMatrix0018
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 EntryAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0018 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0018 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0019
     * @tc.name      testResourceLocaleMoreMatrix0019
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 Manual_mode 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0019 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
      const key: string = 'Manual_mode';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(4);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0019 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0020
     * @tc.name      testResourceLocaleMoreMatrix0020
     * @tc.desc      扩展 DARK 模式下 tr_Latn_TR 字符串 app_name 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0020 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('tr_Latn_TR', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0020 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0021
     * @tc.name      testResourceLocaleMoreMatrix0021
     * @tc.desc      扩展 LIGHT 模式下 pl_Latn_PL 字符串 module_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0021 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pl_Latn_PL', resourceManager.ColorMode.LIGHT);
      const key: string = 'module_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0021 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0022
     * @tc.name      testResourceLocaleMoreMatrix0022
     * @tc.desc      扩展 LIGHT 模式下 pl_Latn_PL 字符串 EntryAbility_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0022 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pl_Latn_PL', resourceManager.ColorMode.LIGHT);
      const key: string = 'EntryAbility_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0022 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0023
     * @tc.name      testResourceLocaleMoreMatrix0023
     * @tc.desc      扩展 LIGHT 模式下 pl_Latn_PL 字符串 EntryAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0023 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pl_Latn_PL', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0023 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0024
     * @tc.name      testResourceLocaleMoreMatrix0024
     * @tc.desc      扩展 LIGHT 模式下 pl_Latn_PL 字符串 Manual_mode 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0024 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pl_Latn_PL', resourceManager.ColorMode.LIGHT);
      const key: string = 'Manual_mode';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(4);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0024 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0025
     * @tc.name      testResourceLocaleMoreMatrix0025
     * @tc.desc      扩展 LIGHT 模式下 pl_Latn_PL 字符串 app_name 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0025 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pl_Latn_PL', resourceManager.ColorMode.LIGHT);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0025 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0026
     * @tc.name      testResourceLocaleMoreMatrix0026
     * @tc.desc      扩展 DARK 模式下 pl_Latn_PL 字符串 module_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0026 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pl_Latn_PL', resourceManager.ColorMode.DARK);
      const key: string = 'module_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0026 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0027
     * @tc.name      testResourceLocaleMoreMatrix0027
     * @tc.desc      扩展 DARK 模式下 pl_Latn_PL 字符串 EntryAbility_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0027 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pl_Latn_PL', resourceManager.ColorMode.DARK);
      const key: string = 'EntryAbility_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0027 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0028
     * @tc.name      testResourceLocaleMoreMatrix0028
     * @tc.desc      扩展 DARK 模式下 pl_Latn_PL 字符串 EntryAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0028 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pl_Latn_PL', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0028 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0029
     * @tc.name      testResourceLocaleMoreMatrix0029
     * @tc.desc      扩展 DARK 模式下 pl_Latn_PL 字符串 Manual_mode 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0029 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pl_Latn_PL', resourceManager.ColorMode.DARK);
      const key: string = 'Manual_mode';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(4);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0029 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0030
     * @tc.name      testResourceLocaleMoreMatrix0030
     * @tc.desc      扩展 DARK 模式下 pl_Latn_PL 字符串 app_name 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0030 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pl_Latn_PL', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0030 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0031
     * @tc.name      testResourceLocaleMoreMatrix0031
     * @tc.desc      扩展 LIGHT 模式下 nl_Latn_NL 字符串 module_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0031 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('nl_Latn_NL', resourceManager.ColorMode.LIGHT);
      const key: string = 'module_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0031 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0032
     * @tc.name      testResourceLocaleMoreMatrix0032
     * @tc.desc      扩展 LIGHT 模式下 nl_Latn_NL 字符串 EntryAbility_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0032 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('nl_Latn_NL', resourceManager.ColorMode.LIGHT);
      const key: string = 'EntryAbility_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0032 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0033
     * @tc.name      testResourceLocaleMoreMatrix0033
     * @tc.desc      扩展 LIGHT 模式下 nl_Latn_NL 字符串 EntryAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0033 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('nl_Latn_NL', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0033 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0034
     * @tc.name      testResourceLocaleMoreMatrix0034
     * @tc.desc      扩展 LIGHT 模式下 nl_Latn_NL 字符串 Manual_mode 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0034 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('nl_Latn_NL', resourceManager.ColorMode.LIGHT);
      const key: string = 'Manual_mode';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(4);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0034 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0035
     * @tc.name      testResourceLocaleMoreMatrix0035
     * @tc.desc      扩展 LIGHT 模式下 nl_Latn_NL 字符串 app_name 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0035 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('nl_Latn_NL', resourceManager.ColorMode.LIGHT);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0035 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0036
     * @tc.name      testResourceLocaleMoreMatrix0036
     * @tc.desc      扩展 DARK 模式下 nl_Latn_NL 字符串 module_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0036 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('nl_Latn_NL', resourceManager.ColorMode.DARK);
      const key: string = 'module_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(18);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('module description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0036 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0037
     * @tc.name      testResourceLocaleMoreMatrix0037
     * @tc.desc      扩展 DARK 模式下 nl_Latn_NL 字符串 EntryAbility_desc 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0037 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('nl_Latn_NL', resourceManager.ColorMode.DARK);
      const key: string = 'EntryAbility_desc';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(11);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0037 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0038
     * @tc.name      testResourceLocaleMoreMatrix0038
     * @tc.desc      扩展 DARK 模式下 nl_Latn_NL 字符串 EntryAbility_label 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0038 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('nl_Latn_NL', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0038 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0039
     * @tc.name      testResourceLocaleMoreMatrix0039
     * @tc.desc      扩展 DARK 模式下 nl_Latn_NL 字符串 Manual_mode 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0039 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('nl_Latn_NL', resourceManager.ColorMode.DARK);
      const key: string = 'Manual_mode';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(4);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('手动模式');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0039 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_RESOURCE_LOCALE_MORE_0040
     * @tc.name      testResourceLocaleMoreMatrix0040
     * @tc.desc      扩展 DARK 模式下 nl_Latn_NL 字符串 app_name 回落为 base 值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMoreMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0040 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('nl_Latn_NL', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('MyApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMoreMatrix0040 end');
    })
  })
}
