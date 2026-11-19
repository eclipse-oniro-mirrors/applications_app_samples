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

export default function resourceLocaleHugeMatrixTailTest(): void {
  describe('UniversalLinkResourceLocaleHugeMatrixTailTest', () => {
    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0074
     * @tc.name      testResourceLocaleHugeMatrix0074
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 EntryAbility_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0074 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0074 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0075
     * @tc.name      testResourceLocaleHugeMatrix0075
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 EntryAbility_label 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0075 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0075 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0076
     * @tc.name      testResourceLocaleHugeMatrix0076
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 UniversalLink 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0076 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
      const key: string = 'UniversalLink';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0076 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0077
     * @tc.name      testResourceLocaleHugeMatrix0077
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 UIAbilityContext_openLink 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0077 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0077 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0078
     * @tc.name      testResourceLocaleHugeMatrix0078
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 UIAbilityContext_openLink_withResult 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0078 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink_withResult';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0078 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0079
     * @tc.name      testResourceLocaleHugeMatrix0079
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 OpenLinkTitle 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0079 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
      const key: string = 'OpenLinkTitle';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0079 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0080
     * @tc.name      testResourceLocaleHugeMatrix0080
     * @tc.desc      DARK 模式下 de_Latn_DE 字符串 app_name 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0080 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('de_Latn_DE', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0080 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0081
     * @tc.name      testResourceLocaleHugeMatrix0081
     * @tc.desc      LIGHT 模式下 ko_Kore_KR 字符串 module_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0081 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0081 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0082
     * @tc.name      testResourceLocaleHugeMatrix0082
     * @tc.desc      LIGHT 模式下 ko_Kore_KR 字符串 EntryAbility_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0082 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0082 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0083
     * @tc.name      testResourceLocaleHugeMatrix0083
     * @tc.desc      LIGHT 模式下 ko_Kore_KR 字符串 EntryAbility_label 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0083 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0083 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0084
     * @tc.name      testResourceLocaleHugeMatrix0084
     * @tc.desc      LIGHT 模式下 ko_Kore_KR 字符串 UniversalLink 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0084 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.LIGHT);
      const key: string = 'UniversalLink';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0084 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0085
     * @tc.name      testResourceLocaleHugeMatrix0085
     * @tc.desc      LIGHT 模式下 ko_Kore_KR 字符串 UIAbilityContext_openLink 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0085 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.LIGHT);
      const key: string = 'UIAbilityContext_openLink';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0085 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0086
     * @tc.name      testResourceLocaleHugeMatrix0086
     * @tc.desc      LIGHT 模式下 ko_Kore_KR 字符串 UIAbilityContext_openLink_withResult 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0086 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.LIGHT);
      const key: string = 'UIAbilityContext_openLink_withResult';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0086 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0087
     * @tc.name      testResourceLocaleHugeMatrix0087
     * @tc.desc      LIGHT 模式下 ko_Kore_KR 字符串 OpenLinkTitle 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0087 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.LIGHT);
      const key: string = 'OpenLinkTitle';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0087 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0088
     * @tc.name      testResourceLocaleHugeMatrix0088
     * @tc.desc      LIGHT 模式下 ko_Kore_KR 字符串 app_name 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0088 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.LIGHT);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0088 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0089
     * @tc.name      testResourceLocaleHugeMatrix0089
     * @tc.desc      DARK 模式下 ko_Kore_KR 字符串 module_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0089 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0089 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0090
     * @tc.name      testResourceLocaleHugeMatrix0090
     * @tc.desc      DARK 模式下 ko_Kore_KR 字符串 EntryAbility_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0090 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0090 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0091
     * @tc.name      testResourceLocaleHugeMatrix0091
     * @tc.desc      DARK 模式下 ko_Kore_KR 字符串 EntryAbility_label 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0091 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0091 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0092
     * @tc.name      testResourceLocaleHugeMatrix0092
     * @tc.desc      DARK 模式下 ko_Kore_KR 字符串 UniversalLink 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0092 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.DARK);
      const key: string = 'UniversalLink';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0092 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0093
     * @tc.name      testResourceLocaleHugeMatrix0093
     * @tc.desc      DARK 模式下 ko_Kore_KR 字符串 UIAbilityContext_openLink 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0093 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0093 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0094
     * @tc.name      testResourceLocaleHugeMatrix0094
     * @tc.desc      DARK 模式下 ko_Kore_KR 字符串 UIAbilityContext_openLink_withResult 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0094 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink_withResult';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0094 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0095
     * @tc.name      testResourceLocaleHugeMatrix0095
     * @tc.desc      DARK 模式下 ko_Kore_KR 字符串 OpenLinkTitle 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0095 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.DARK);
      const key: string = 'OpenLinkTitle';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0095 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0096
     * @tc.name      testResourceLocaleHugeMatrix0096
     * @tc.desc      DARK 模式下 ko_Kore_KR 字符串 app_name 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0096 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ko_Kore_KR', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0096 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0097
     * @tc.name      testResourceLocaleHugeMatrix0097
     * @tc.desc      LIGHT 模式下 ru_Latn_RU 字符串 module_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0097 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0097 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0098
     * @tc.name      testResourceLocaleHugeMatrix0098
     * @tc.desc      LIGHT 模式下 ru_Latn_RU 字符串 EntryAbility_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0098 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0098 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0099
     * @tc.name      testResourceLocaleHugeMatrix0099
     * @tc.desc      LIGHT 模式下 ru_Latn_RU 字符串 EntryAbility_label 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0099 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0099 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0100
     * @tc.name      testResourceLocaleHugeMatrix0100
     * @tc.desc      LIGHT 模式下 ru_Latn_RU 字符串 UniversalLink 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0100 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.LIGHT);
      const key: string = 'UniversalLink';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0100 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0101
     * @tc.name      testResourceLocaleHugeMatrix0101
     * @tc.desc      LIGHT 模式下 ru_Latn_RU 字符串 UIAbilityContext_openLink 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0101 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.LIGHT);
      const key: string = 'UIAbilityContext_openLink';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0101 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0102
     * @tc.name      testResourceLocaleHugeMatrix0102
     * @tc.desc      LIGHT 模式下 ru_Latn_RU 字符串 UIAbilityContext_openLink_withResult 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0102 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.LIGHT);
      const key: string = 'UIAbilityContext_openLink_withResult';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0102 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0103
     * @tc.name      testResourceLocaleHugeMatrix0103
     * @tc.desc      LIGHT 模式下 ru_Latn_RU 字符串 OpenLinkTitle 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0103 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.LIGHT);
      const key: string = 'OpenLinkTitle';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0103 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0104
     * @tc.name      testResourceLocaleHugeMatrix0104
     * @tc.desc      LIGHT 模式下 ru_Latn_RU 字符串 app_name 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0104 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.LIGHT);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0104 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0105
     * @tc.name      testResourceLocaleHugeMatrix0105
     * @tc.desc      DARK 模式下 ru_Latn_RU 字符串 module_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0105 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0105 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0106
     * @tc.name      testResourceLocaleHugeMatrix0106
     * @tc.desc      DARK 模式下 ru_Latn_RU 字符串 EntryAbility_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0106 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0106 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0107
     * @tc.name      testResourceLocaleHugeMatrix0107
     * @tc.desc      DARK 模式下 ru_Latn_RU 字符串 EntryAbility_label 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0107 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0107 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0108
     * @tc.name      testResourceLocaleHugeMatrix0108
     * @tc.desc      DARK 模式下 ru_Latn_RU 字符串 UniversalLink 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0108 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.DARK);
      const key: string = 'UniversalLink';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0108 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0109
     * @tc.name      testResourceLocaleHugeMatrix0109
     * @tc.desc      DARK 模式下 ru_Latn_RU 字符串 UIAbilityContext_openLink 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0109 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0109 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0110
     * @tc.name      testResourceLocaleHugeMatrix0110
     * @tc.desc      DARK 模式下 ru_Latn_RU 字符串 UIAbilityContext_openLink_withResult 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0110 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink_withResult';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0110 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0111
     * @tc.name      testResourceLocaleHugeMatrix0111
     * @tc.desc      DARK 模式下 ru_Latn_RU 字符串 OpenLinkTitle 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0111 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.DARK);
      const key: string = 'OpenLinkTitle';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0111 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0112
     * @tc.name      testResourceLocaleHugeMatrix0112
     * @tc.desc      DARK 模式下 ru_Latn_RU 字符串 app_name 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0112 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('ru_Latn_RU', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0112 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0113
     * @tc.name      testResourceLocaleHugeMatrix0113
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 module_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0113 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0113 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0114
     * @tc.name      testResourceLocaleHugeMatrix0114
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 EntryAbility_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0114 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0114 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0115
     * @tc.name      testResourceLocaleHugeMatrix0115
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 EntryAbility_label 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0115 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0115 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0116
     * @tc.name      testResourceLocaleHugeMatrix0116
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 UniversalLink 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0116 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'UniversalLink';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0116 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0117
     * @tc.name      testResourceLocaleHugeMatrix0117
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 UIAbilityContext_openLink 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0117 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'UIAbilityContext_openLink';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0117 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0118
     * @tc.name      testResourceLocaleHugeMatrix0118
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 UIAbilityContext_openLink_withResult 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0118 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'UIAbilityContext_openLink_withResult';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0118 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0119
     * @tc.name      testResourceLocaleHugeMatrix0119
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 OpenLinkTitle 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0119 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'OpenLinkTitle';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0119 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0120
     * @tc.name      testResourceLocaleHugeMatrix0120
     * @tc.desc      LIGHT 模式下 pt_Latn_BR 字符串 app_name 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0120 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.LIGHT);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0120 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0121
     * @tc.name      testResourceLocaleHugeMatrix0121
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 module_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0121 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0121 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0122
     * @tc.name      testResourceLocaleHugeMatrix0122
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 EntryAbility_desc 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0122 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0122 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0123
     * @tc.name      testResourceLocaleHugeMatrix0123
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 EntryAbility_label 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0123 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0123 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0124
     * @tc.name      testResourceLocaleHugeMatrix0124
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 UniversalLink 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0124 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'UniversalLink';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(21);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink example');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0124 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0125
     * @tc.name      testResourceLocaleHugeMatrix0125
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 UIAbilityContext_openLink 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0125 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(25);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0125 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0126
     * @tc.name      testResourceLocaleHugeMatrix0126
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 UIAbilityContext_openLink_withResult 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0126 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'UIAbilityContext_openLink_withResult';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(37);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UIAbilityContext.openLink with result');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0126 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0127
     * @tc.name      testResourceLocaleHugeMatrix0127
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 OpenLinkTitle 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0127 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'OpenLinkTitle';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(16);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('OpenLink Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0127 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_RESOURCE_LOCALE_HUGE_0128
     * @tc.name      testResourceLocaleHugeMatrix0128
     * @tc.desc      DARK 模式下 pt_Latn_BR 字符串 app_name 与期望值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleHugeMatrix0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0128 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('pt_Latn_BR', resourceManager.ColorMode.DARK);
      const key: string = 'app_name';
      const syncValue: string = manager.getStringByNameSync(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 syncValue=${syncValue}`);
      expect(syncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 syncValue.length=${syncValue.length}`);
      expect(syncValue.length).assertEqual(13);
      const asyncValue: string = await manager.getStringByName(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 asyncValue=${asyncValue}`);
      expect(asyncValue).assertEqual('UniversalLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 asyncValue.length=${asyncValue.length}`);
      expect(asyncValue.length).assertEqual(syncValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleHugeMatrix0128 end');
    })
  })
}
