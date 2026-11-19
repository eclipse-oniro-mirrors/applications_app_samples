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
const TAG: string = '[Sample_UniversalLink]';

export default function resourceLocaleExtendedTest(): void {
  describe('UniversalLinkResourceLocaleExtendedTest', () => {
    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0001
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
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0002
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
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0003
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
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0004
     * @tc.name      testResourceLocaleExtended0004
     * @tc.desc      深色模式下 中文 字符串 UniversalLink 回落为 "UniversalLink开发示例"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0004 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'UniversalLink';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UniversalLink开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(17);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink开发示例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0004 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0005
     * @tc.name      testResourceLocaleExtended0005
     * @tc.desc      深色模式下 中文 字符串 UIAbilityContext_openLink 回落为 "openLink(promise)拉起应用"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0005 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('openLink(promise)拉起应用');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('openLink(promise)拉起应用');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0005 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0006
     * @tc.name      testResourceLocaleExtended0006
     * @tc.desc      深色模式下 中文 字符串 UIAbilityContext_openLink_withResult 回落为 "openLink(callback)拉起应用"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0006 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink_withResult';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('openLink(callback)拉起应用');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(22);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('openLink(callback)拉起应用');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0006 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0007
     * @tc.name      testResourceLocaleExtended0007
     * @tc.desc      深色模式下 中文 字符串 OpenLinkTitle 回落为 "UniversalLink方式拉起Ability成功"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0007 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'OpenLinkTitle';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UniversalLink方式拉起Ability成功');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(26);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink方式拉起Ability成功');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0007 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0008
     * @tc.name      testResourceLocaleExtended0008
     * @tc.desc      深色模式下 中文 字符串 app_name 回落为 "UniversalLink"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0008 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0008 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0009
     * @tc.name      testResourceLocaleExtended0009
     * @tc.desc      深色模式下 英文 字符串 module_desc 回落为 "module description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0009 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0009 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0010
     * @tc.name      testResourceLocaleExtended0010
     * @tc.desc      深色模式下 英文 字符串 EntryAbility_desc 回落为 "description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0010 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0010 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0011
     * @tc.name      testResourceLocaleExtended0011
     * @tc.desc      深色模式下 英文 字符串 EntryAbility_label 回落为 "label"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0011 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0011 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0012
     * @tc.name      testResourceLocaleExtended0012
     * @tc.desc      深色模式下 英文 字符串 UniversalLink 回落为 "UniversalLink example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0012 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'UniversalLink';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0012 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0013
     * @tc.name      testResourceLocaleExtended0013
     * @tc.desc      深色模式下 英文 字符串 UIAbilityContext_openLink 回落为 "UIAbilityContext.openLink"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0013 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0013 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0014
     * @tc.name      testResourceLocaleExtended0014
     * @tc.desc      深色模式下 英文 字符串 UIAbilityContext_openLink_withResult 回落为 "UIAbilityContext.openLink with result"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0014 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink_withResult';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0014 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0015
     * @tc.name      testResourceLocaleExtended0015
     * @tc.desc      深色模式下 英文 字符串 OpenLinkTitle 回落为 "OpenLink Ability"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0015 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'OpenLinkTitle';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0015 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0016
     * @tc.name      testResourceLocaleExtended0016
     * @tc.desc      深色模式下 英文 字符串 app_name 回落为 "UniversalLink"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleExtended0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0016 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0016 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0017
     * @tc.name      testResourceLocaleExtended0017
     * @tc.desc      深色模式下 法语 字符串 module_desc 回落为 "module description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0017 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0017 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0018
     * @tc.name      testResourceLocaleExtended0018
     * @tc.desc      深色模式下 法语 字符串 EntryAbility_desc 回落为 "description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0018 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0018 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0019
     * @tc.name      testResourceLocaleExtended0019
     * @tc.desc      深色模式下 法语 字符串 EntryAbility_label 回落为 "label"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0019 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0019 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0020
     * @tc.name      testResourceLocaleExtended0020
     * @tc.desc      深色模式下 法语 字符串 UniversalLink 回落为 "UniversalLink example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0020 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'UniversalLink';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0020 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0021
     * @tc.name      testResourceLocaleExtended0021
     * @tc.desc      深色模式下 法语 字符串 UIAbilityContext_openLink 回落为 "UIAbilityContext.openLink"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0021 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0021 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0022
     * @tc.name      testResourceLocaleExtended0022
     * @tc.desc      深色模式下 法语 字符串 UIAbilityContext_openLink_withResult 回落为 "UIAbilityContext.openLink with result"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0022 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink_withResult';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0022 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0023
     * @tc.name      testResourceLocaleExtended0023
     * @tc.desc      深色模式下 法语 字符串 OpenLinkTitle 回落为 "OpenLink Ability"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0023 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'OpenLinkTitle';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0023 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0024
     * @tc.name      testResourceLocaleExtended0024
     * @tc.desc      深色模式下 法语 字符串 app_name 回落为 "UniversalLink"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0024 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0024 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0025
     * @tc.name      testResourceLocaleExtended0025
     * @tc.desc      深色模式下 日语 字符串 module_desc 回落为 "module description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0025 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0025 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0026
     * @tc.name      testResourceLocaleExtended0026
     * @tc.desc      深色模式下 日语 字符串 EntryAbility_desc 回落为 "description"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0026 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0026 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0027
     * @tc.name      testResourceLocaleExtended0027
     * @tc.desc      深色模式下 日语 字符串 EntryAbility_label 回落为 "label"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0027 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0027 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0028
     * @tc.name      testResourceLocaleExtended0028
     * @tc.desc      深色模式下 日语 字符串 UniversalLink 回落为 "UniversalLink example"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0028 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'UniversalLink';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0028 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0029
     * @tc.name      testResourceLocaleExtended0029
     * @tc.desc      深色模式下 日语 字符串 UIAbilityContext_openLink 回落为 "UIAbilityContext.openLink"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0029 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0029 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0030
     * @tc.name      testResourceLocaleExtended0030
     * @tc.desc      深色模式下 日语 字符串 UIAbilityContext_openLink_withResult 回落为 "UIAbilityContext.openLink with result"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0030 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink_withResult';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0030 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0031
     * @tc.name      testResourceLocaleExtended0031
     * @tc.desc      深色模式下 日语 字符串 OpenLinkTitle 回落为 "OpenLink Ability"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0031 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'OpenLinkTitle';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0031 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_EXTENDED_0032
     * @tc.name      testResourceLocaleExtended0032
     * @tc.desc      深色模式下 日语 字符串 app_name 回落为 "UniversalLink"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleExtended0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0032 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ja_Jpan_JP', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const value: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 value=${value}`);
      expect(value).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 value.length=${value.length}`);
      expect(value.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleExtended0032 end');
    })
  })
}
