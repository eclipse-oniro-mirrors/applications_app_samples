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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { resourceManager } from '@kit.LocalizationKit';
import { loadOverrideResourceManager } from './TestHelper';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_AbilityFeature_Resource]';

export default function resourceLocaleMatrixTest(): void {
  describe('AbilityFeatureResourceLocaleMatrixTest', () => {
    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0001
     * @tc.name      testResourceLocaleMatrix0001
     * @tc.desc      中文环境下 entry 模块字符串 module_desc 取值为 "系统的基础新特性示例"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0001 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('module_desc');
      expect(value).assertEqual('系统的基础新特性示例');
      expect(value.length).assertEqual(10);
      expect(await manager.getStringByName('module_desc')).assertEqual('系统的基础新特性示例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0001 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0002
     * @tc.name      testResourceLocaleMatrix0002
     * @tc.desc      中文环境下 entry 模块字符串 EntryAbility_desc 取值为 "首页Ability"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0002 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('EntryAbility_desc');
      expect(value).assertEqual('首页Ability');
      expect(value.length).assertEqual(9);
      expect(await manager.getStringByName('EntryAbility_desc')).assertEqual('首页Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0002 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0003
     * @tc.name      testResourceLocaleMatrix0003
     * @tc.desc      中文环境下 entry 模块字符串 EntryAbility_label 取值为 "基础能力增强"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0003 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('EntryAbility_label');
      expect(value).assertEqual('基础能力增强');
      expect(value.length).assertEqual(6);
      expect(await manager.getStringByName('EntryAbility_label')).assertEqual('基础能力增强');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0003 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0004
     * @tc.name      testResourceLocaleMatrix0004
     * @tc.desc      中文环境下 entry 模块字符串 NewAbility_desc 取值为 "Ability用于被启动"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0004 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('NewAbility_desc');
      expect(value).assertEqual('Ability用于被启动');
      expect(value.length).assertEqual(12);
      expect(await manager.getStringByName('NewAbility_desc')).assertEqual('Ability用于被启动');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0004 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0005
     * @tc.name      testResourceLocaleMatrix0005
     * @tc.desc      中文环境下 entry 模块字符串 NewAbility_label 取值为 "NewAbility"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0005 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('NewAbility_label');
      expect(value).assertEqual('NewAbility');
      expect(value.length).assertEqual(10);
      expect(await manager.getStringByName('NewAbility_label')).assertEqual('NewAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0005 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0006
     * @tc.name      testResourceLocaleMatrix0006
     * @tc.desc      中文环境下 entry 模块字符串 Set_Chinese_language 取值为 "设置中文语言"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0006 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Set_Chinese_language');
      expect(value).assertEqual('设置中文语言');
      expect(value.length).assertEqual(6);
      expect(await manager.getStringByName('Set_Chinese_language')).assertEqual('设置中文语言');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0006 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0007
     * @tc.name      testResourceLocaleMatrix0007
     * @tc.desc      中文环境下 entry 模块字符串 Set_English_Language 取值为 "设置英文语言"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0007 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Set_English_Language');
      expect(value).assertEqual('设置英文语言');
      expect(value.length).assertEqual(6);
      expect(await manager.getStringByName('Set_English_Language')).assertEqual('设置英文语言');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0007 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0008
     * @tc.name      testResourceLocaleMatrix0008
     * @tc.desc      中文环境下 entry 模块字符串 Set_Dark_Mode 取值为 "设置深色模式"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0008 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Set_Dark_Mode');
      expect(value).assertEqual('设置深色模式');
      expect(value.length).assertEqual(6);
      expect(await manager.getStringByName('Set_Dark_Mode')).assertEqual('设置深色模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0008 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0009
     * @tc.name      testResourceLocaleMatrix0009
     * @tc.desc      中文环境下 entry 模块字符串 Set_Light_Mode 取值为 "设置浅色模式"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0009 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Set_Light_Mode');
      expect(value).assertEqual('设置浅色模式');
      expect(value.length).assertEqual(6);
      expect(await manager.getStringByName('Set_Light_Mode')).assertEqual('设置浅色模式');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0009 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0010
     * @tc.name      testResourceLocaleMatrix0010
     * @tc.desc      中文环境下 entry 模块字符串 Implicit_Launch_not_Popup 取值为 "隐式启动不弹窗"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0010 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Implicit_Launch_not_Popup');
      expect(value).assertEqual('隐式启动不弹窗');
      expect(value.length).assertEqual(7);
      expect(await manager.getStringByName('Implicit_Launch_not_Popup')).assertEqual('隐式启动不弹窗');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0010 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0011
     * @tc.name      testResourceLocaleMatrix0011
     * @tc.desc      中文环境下 entry 模块字符串 Implicit_Launch_Popup 取值为 "隐式启动弹窗"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0011 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Implicit_Launch_Popup');
      expect(value).assertEqual('隐式启动弹窗');
      expect(value.length).assertEqual(6);
      expect(await manager.getStringByName('Implicit_Launch_Popup')).assertEqual('隐式启动弹窗');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0011 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0012
     * @tc.name      testResourceLocaleMatrix0012
     * @tc.desc      中文环境下 entry 模块字符串 CreateStorageData 取值为 "创建数据"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0012 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('CreateStorageData');
      expect(value).assertEqual('创建数据');
      expect(value.length).assertEqual(4);
      expect(await manager.getStringByName('CreateStorageData')).assertEqual('创建数据');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0012 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0013
     * @tc.name      testResourceLocaleMatrix0013
     * @tc.desc      中文环境下 entry 模块字符串 CheckStorageData 取值为 "检查数据"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0013 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('CheckStorageData');
      expect(value).assertEqual('检查数据');
      expect(value.length).assertEqual(4);
      expect(await manager.getStringByName('CheckStorageData')).assertEqual('检查数据');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0013 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0014
     * @tc.name      testResourceLocaleMatrix0014
     * @tc.desc      中文环境下 entry 模块字符串 ClearStorageData 取值为 "清理数据"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0014 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('ClearStorageData');
      expect(value).assertEqual('清理数据');
      expect(value.length).assertEqual(4);
      expect(await manager.getStringByName('ClearStorageData')).assertEqual('清理数据');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0014 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0015
     * @tc.name      testResourceLocaleMatrix0015
     * @tc.desc      中文环境下 entry 模块字符串 system_BasicCharacter_Demo 取值为 "基础能力增强"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0015 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('system_BasicCharacter_Demo');
      expect(value).assertEqual('基础能力增强');
      expect(value.length).assertEqual(6);
      expect(await manager.getStringByName('system_BasicCharacter_Demo')).assertEqual('基础能力增强');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0015 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0016
     * @tc.name      testResourceLocaleMatrix0016
     * @tc.desc      中文环境下 entry 模块字符串 toggle 取值为 "toggle"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0016 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('toggle');
      expect(value).assertEqual('toggle');
      expect(value.length).assertEqual(6);
      expect(await manager.getStringByName('toggle')).assertEqual('toggle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0016 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0017
     * @tc.name      testResourceLocaleMatrix0017
     * @tc.desc      中文环境下 entry 模块字符串 arrow 取值为 "arrow"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0017 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('arrow');
      expect(value).assertEqual('arrow');
      expect(value.length).assertEqual(5);
      expect(await manager.getStringByName('arrow')).assertEqual('arrow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0017 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0018
     * @tc.name      testResourceLocaleMatrix0018
     * @tc.desc      中文环境下 entry 模块字符串 create_File_Success 取值为 "创建缓存文件成功"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0018 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('create_File_Success');
      expect(value).assertEqual('创建缓存文件成功');
      expect(value.length).assertEqual(8);
      expect(await manager.getStringByName('create_File_Success')).assertEqual('创建缓存文件成功');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0018 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0019
     * @tc.name      testResourceLocaleMatrix0019
     * @tc.desc      中文环境下 entry 模块字符串 search_File_Success 取值为 "查询到缓存文件"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0019 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('search_File_Success');
      expect(value).assertEqual('查询到缓存文件');
      expect(value.length).assertEqual(7);
      expect(await manager.getStringByName('search_File_Success')).assertEqual('查询到缓存文件');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0019 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0020
     * @tc.name      testResourceLocaleMatrix0020
     * @tc.desc      中文环境下 entry 模块字符串 search_File_Failed 取值为 "未找到缓存文件"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0020 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('search_File_Failed');
      expect(value).assertEqual('未找到缓存文件');
      expect(value.length).assertEqual(7);
      expect(await manager.getStringByName('search_File_Failed')).assertEqual('未找到缓存文件');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0020 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0021
     * @tc.name      testResourceLocaleMatrix0021
     * @tc.desc      中文环境下 entry 模块字符串 clean_Data_Success 取值为 "清理数据成功"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0021 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('clean_Data_Success');
      expect(value).assertEqual('清理数据成功');
      expect(value.length).assertEqual(6);
      expect(await manager.getStringByName('clean_Data_Success')).assertEqual('清理数据成功');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0021 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0022
     * @tc.name      testResourceLocaleMatrix0022
     * @tc.desc      中文环境下 entry 模块字符串 clean_Data_Failed 取值为 "未找到缓存文件，"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0022 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('clean_Data_Failed');
      expect(value).assertEqual('未找到缓存文件，');
      expect(value.length).assertEqual(8);
      expect(await manager.getStringByName('clean_Data_Failed')).assertEqual('未找到缓存文件，');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0022 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0023
     * @tc.name      testResourceLocaleMatrix0023
     * @tc.desc      中文环境下 entry 模块字符串 start_animation 取值为 "启动动画"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0023 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('start_animation');
      expect(value).assertEqual('启动动画');
      expect(value.length).assertEqual(4);
      expect(await manager.getStringByName('start_animation')).assertEqual('启动动画');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0023 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0024
     * @tc.name      testResourceLocaleMatrix0024
     * @tc.desc      中文环境下 entry 模块字符串 setStartOptionsPage 取值为 "设置StartOptions启动Ability"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0024 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('setStartOptionsPage');
      expect(value).assertEqual('设置StartOptions启动Ability');
      expect(value.length).assertEqual(23);
      expect(await manager.getStringByName('setStartOptionsPage')).assertEqual('设置StartOptions启动Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0024 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0025
     * @tc.name      testResourceLocaleMatrix0025
     * @tc.desc      中文环境下 entry 模块字符串 empty 取值为 "暂无内容"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0025 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('empty');
      expect(value).assertEqual('暂无内容');
      expect(value.length).assertEqual(4);
      expect(await manager.getStringByName('empty')).assertEqual('暂无内容');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0025 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0026
     * @tc.name      testResourceLocaleMatrix0026
     * @tc.desc      中文环境下 entry 模块字符串 switchDarkSuccess 取值为 "切换深色模式成功"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0026 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('switchDarkSuccess');
      expect(value).assertEqual('切换深色模式成功');
      expect(value.length).assertEqual(8);
      expect(await manager.getStringByName('switchDarkSuccess')).assertEqual('切换深色模式成功');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0026 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0027
     * @tc.name      testResourceLocaleMatrix0027
     * @tc.desc      中文环境下 entry 模块字符串 switchLightSuccess 取值为 "切换浅色模式成功"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0027 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('switchLightSuccess');
      expect(value).assertEqual('切换浅色模式成功');
      expect(value.length).assertEqual(8);
      expect(await manager.getStringByName('switchLightSuccess')).assertEqual('切换浅色模式成功');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0027 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0028
     * @tc.name      testResourceLocaleMatrix0028
     * @tc.desc      中文环境下 entry 模块字符串 open 取值为 "开启"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0028 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('open');
      expect(value).assertEqual('开启');
      expect(value.length).assertEqual(2);
      expect(await manager.getStringByName('open')).assertEqual('开启');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0028 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0029
     * @tc.name      testResourceLocaleMatrix0029
     * @tc.desc      中文环境下 entry 模块字符串 close 取值为 "关闭"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0029 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('close');
      expect(value).assertEqual('关闭');
      expect(value.length).assertEqual(2);
      expect(await manager.getStringByName('close')).assertEqual('关闭');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0029 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0030
     * @tc.name      testResourceLocaleMatrix0030
     * @tc.desc      英文环境下 entry 模块字符串 module_desc 取值为 "Basic capabilities are enhanced"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0030 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('module_desc');
      expect(value).assertEqual('Basic capabilities are enhanced');
      expect(value.length).assertEqual(31);
      expect(await manager.getStringByName('module_desc')).assertEqual('Basic capabilities are enhanced');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0030 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0031
     * @tc.name      testResourceLocaleMatrix0031
     * @tc.desc      英文环境下 entry 模块字符串 EntryAbility_desc 取值为 "Home Ability"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0031 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('EntryAbility_desc');
      expect(value).assertEqual('Home Ability');
      expect(value.length).assertEqual(12);
      expect(await manager.getStringByName('EntryAbility_desc')).assertEqual('Home Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0031 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0032
     * @tc.name      testResourceLocaleMatrix0032
     * @tc.desc      英文环境下 entry 模块字符串 EntryAbility_label 取值为 "SystemBasicAbilityFeature"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0032 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('EntryAbility_label');
      expect(value).assertEqual('SystemBasicAbilityFeature');
      expect(value.length).assertEqual(25);
      expect(await manager.getStringByName('EntryAbility_label')).assertEqual('SystemBasicAbilityFeature');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0032 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0033
     * @tc.name      testResourceLocaleMatrix0033
     * @tc.desc      英文环境下 entry 模块字符串 NewAbility_desc 取值为 "Ability used by start"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0033 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('NewAbility_desc');
      expect(value).assertEqual('Ability used by start');
      expect(value.length).assertEqual(21);
      expect(await manager.getStringByName('NewAbility_desc')).assertEqual('Ability used by start');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0033 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0034
     * @tc.name      testResourceLocaleMatrix0034
     * @tc.desc      英文环境下 entry 模块字符串 NewAbility_label 取值为 "NewAbility"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0034 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('NewAbility_label');
      expect(value).assertEqual('NewAbility');
      expect(value.length).assertEqual(10);
      expect(await manager.getStringByName('NewAbility_label')).assertEqual('NewAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0034 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0035
     * @tc.name      testResourceLocaleMatrix0035
     * @tc.desc      英文环境下 entry 模块字符串 Set_Chinese_language 取值为 "Set Chinese language"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0035 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Set_Chinese_language');
      expect(value).assertEqual('Set Chinese language');
      expect(value.length).assertEqual(20);
      expect(await manager.getStringByName('Set_Chinese_language')).assertEqual('Set Chinese language');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0035 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0036
     * @tc.name      testResourceLocaleMatrix0036
     * @tc.desc      英文环境下 entry 模块字符串 Set_English_Language 取值为 "Set English Language"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0036 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Set_English_Language');
      expect(value).assertEqual('Set English Language');
      expect(value.length).assertEqual(20);
      expect(await manager.getStringByName('Set_English_Language')).assertEqual('Set English Language');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0036 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0037
     * @tc.name      testResourceLocaleMatrix0037
     * @tc.desc      英文环境下 entry 模块字符串 Set_Dark_Mode 取值为 "Set Dark Mode"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0037 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Set_Dark_Mode');
      expect(value).assertEqual('Set Dark Mode');
      expect(value.length).assertEqual(13);
      expect(await manager.getStringByName('Set_Dark_Mode')).assertEqual('Set Dark Mode');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0037 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0038
     * @tc.name      testResourceLocaleMatrix0038
     * @tc.desc      英文环境下 entry 模块字符串 Set_Light_Mode 取值为 "Set Light Mode"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0038 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Set_Light_Mode');
      expect(value).assertEqual('Set Light Mode');
      expect(value.length).assertEqual(14);
      expect(await manager.getStringByName('Set_Light_Mode')).assertEqual('Set Light Mode');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0038 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0039
     * @tc.name      testResourceLocaleMatrix0039
     * @tc.desc      英文环境下 entry 模块字符串 Implicit_Launch_not_Popup 取值为 "Implicit Launch not Popup"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0039 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Implicit_Launch_not_Popup');
      expect(value).assertEqual('Implicit Launch not Popup');
      expect(value.length).assertEqual(25);
      expect(await manager.getStringByName('Implicit_Launch_not_Popup')).assertEqual('Implicit Launch not Popup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0039 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0040
     * @tc.name      testResourceLocaleMatrix0040
     * @tc.desc      英文环境下 entry 模块字符串 Implicit_Launch_Popup 取值为 "Implicit Launch Popup"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0040 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Implicit_Launch_Popup');
      expect(value).assertEqual('Implicit Launch Popup');
      expect(value.length).assertEqual(21);
      expect(await manager.getStringByName('Implicit_Launch_Popup')).assertEqual('Implicit Launch Popup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0040 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0041
     * @tc.name      testResourceLocaleMatrix0041
     * @tc.desc      英文环境下 entry 模块字符串 CreateStorageData 取值为 "Create Storage Data"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0041 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('CreateStorageData');
      expect(value).assertEqual('Create Storage Data');
      expect(value.length).assertEqual(19);
      expect(await manager.getStringByName('CreateStorageData')).assertEqual('Create Storage Data');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0041 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0042
     * @tc.name      testResourceLocaleMatrix0042
     * @tc.desc      英文环境下 entry 模块字符串 CheckStorageData 取值为 "Check Storage Data"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0042 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('CheckStorageData');
      expect(value).assertEqual('Check Storage Data');
      expect(value.length).assertEqual(18);
      expect(await manager.getStringByName('CheckStorageData')).assertEqual('Check Storage Data');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0042 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0043
     * @tc.name      testResourceLocaleMatrix0043
     * @tc.desc      英文环境下 entry 模块字符串 ClearStorageData 取值为 "Clear Storage Data"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0043 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('ClearStorageData');
      expect(value).assertEqual('Clear Storage Data');
      expect(value.length).assertEqual(18);
      expect(await manager.getStringByName('ClearStorageData')).assertEqual('Clear Storage Data');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0043 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0044
     * @tc.name      testResourceLocaleMatrix0044
     * @tc.desc      英文环境下 entry 模块字符串 system_BasicCharacter_Demo 取值为 "Basic capabilities are enhanced"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0044 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('system_BasicCharacter_Demo');
      expect(value).assertEqual('Basic capabilities are enhanced');
      expect(value.length).assertEqual(31);
      expect(await manager.getStringByName('system_BasicCharacter_Demo')).assertEqual('Basic capabilities are enhanced');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0044 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0045
     * @tc.name      testResourceLocaleMatrix0045
     * @tc.desc      英文环境下 entry 模块字符串 toggle 取值为 "toggle"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0045 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('toggle');
      expect(value).assertEqual('toggle');
      expect(value.length).assertEqual(6);
      expect(await manager.getStringByName('toggle')).assertEqual('toggle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0045 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0046
     * @tc.name      testResourceLocaleMatrix0046
     * @tc.desc      英文环境下 entry 模块字符串 arrow 取值为 "arrow"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0046 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('arrow');
      expect(value).assertEqual('arrow');
      expect(value.length).assertEqual(5);
      expect(await manager.getStringByName('arrow')).assertEqual('arrow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0046 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0047
     * @tc.name      testResourceLocaleMatrix0047
     * @tc.desc      英文环境下 entry 模块字符串 create_File_Success 取值为 "createFileSuccess"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0047 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('create_File_Success');
      expect(value).assertEqual('createFileSuccess');
      expect(value.length).assertEqual(17);
      expect(await manager.getStringByName('create_File_Success')).assertEqual('createFileSuccess');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0047 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0048
     * @tc.name      testResourceLocaleMatrix0048
     * @tc.desc      英文环境下 entry 模块字符串 search_File_Success 取值为 "searchFileSuccess"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0048 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('search_File_Success');
      expect(value).assertEqual('searchFileSuccess');
      expect(value.length).assertEqual(17);
      expect(await manager.getStringByName('search_File_Success')).assertEqual('searchFileSuccess');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0048 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0049
     * @tc.name      testResourceLocaleMatrix0049
     * @tc.desc      英文环境下 entry 模块字符串 search_File_Failed 取值为 "searchFileFailed"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0049 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('search_File_Failed');
      expect(value).assertEqual('searchFileFailed');
      expect(value.length).assertEqual(16);
      expect(await manager.getStringByName('search_File_Failed')).assertEqual('searchFileFailed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0049 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0050
     * @tc.name      testResourceLocaleMatrix0050
     * @tc.desc      英文环境下 entry 模块字符串 clean_Data_Success 取值为 "cleanDataSuccess"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0050 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('clean_Data_Success');
      expect(value).assertEqual('cleanDataSuccess');
      expect(value.length).assertEqual(16);
      expect(await manager.getStringByName('clean_Data_Success')).assertEqual('cleanDataSuccess');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0050 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0051
     * @tc.name      testResourceLocaleMatrix0051
     * @tc.desc      英文环境下 entry 模块字符串 clean_Data_Failed 取值为 "cleanDataFailed"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0051 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('clean_Data_Failed');
      expect(value).assertEqual('cleanDataFailed');
      expect(value.length).assertEqual(15);
      expect(await manager.getStringByName('clean_Data_Failed')).assertEqual('cleanDataFailed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0051 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0052
     * @tc.name      testResourceLocaleMatrix0052
     * @tc.desc      英文环境下 entry 模块字符串 start_animation 取值为 "start animation"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0052 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('start_animation');
      expect(value).assertEqual('start animation');
      expect(value.length).assertEqual(15);
      expect(await manager.getStringByName('start_animation')).assertEqual('start animation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0052 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0053
     * @tc.name      testResourceLocaleMatrix0053
     * @tc.desc      英文环境下 entry 模块字符串 setStartOptionsPage 取值为 "Set StartOptions StartAbility"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0053 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('setStartOptionsPage');
      expect(value).assertEqual('Set StartOptions StartAbility');
      expect(value.length).assertEqual(29);
      expect(await manager.getStringByName('setStartOptionsPage')).assertEqual('Set StartOptions StartAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0053 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0054
     * @tc.name      testResourceLocaleMatrix0054
     * @tc.desc      英文环境下 entry 模块字符串 empty 取值为 "empty"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0054 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('empty');
      expect(value).assertEqual('empty');
      expect(value.length).assertEqual(5);
      expect(await manager.getStringByName('empty')).assertEqual('empty');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0054 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0055
     * @tc.name      testResourceLocaleMatrix0055
     * @tc.desc      英文环境下 entry 模块字符串 switchDarkSuccess 取值为 "switch DarkMode Success"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0055 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('switchDarkSuccess');
      expect(value).assertEqual('switch DarkMode Success');
      expect(value.length).assertEqual(23);
      expect(await manager.getStringByName('switchDarkSuccess')).assertEqual('switch DarkMode Success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0055 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0056
     * @tc.name      testResourceLocaleMatrix0056
     * @tc.desc      英文环境下 entry 模块字符串 switchLightSuccess 取值为 "switch LightMode Success"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0056 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('switchLightSuccess');
      expect(value).assertEqual('switch LightMode Success');
      expect(value.length).assertEqual(24);
      expect(await manager.getStringByName('switchLightSuccess')).assertEqual('switch LightMode Success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0056 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0057
     * @tc.name      testResourceLocaleMatrix0057
     * @tc.desc      英文环境下 entry 模块字符串 open 取值为 "open"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0057 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('open');
      expect(value).assertEqual('open');
      expect(value.length).assertEqual(4);
      expect(await manager.getStringByName('open')).assertEqual('open');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0057 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0058
     * @tc.name      testResourceLocaleMatrix0058
     * @tc.desc      英文环境下 entry 模块字符串 close 取值为 "close"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0058 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('en_Latn_US', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('close');
      expect(value).assertEqual('close');
      expect(value.length).assertEqual(5);
      expect(await manager.getStringByName('close')).assertEqual('close');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0058 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0059
     * @tc.name      testResourceLocaleMatrix0059
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 module_desc 取值为 "Basic capabilities are enhanced"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0059 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('module_desc');
      expect(value).assertEqual('Basic capabilities are enhanced');
      expect(value.length).assertEqual(31);
      expect(await manager.getStringByName('module_desc')).assertEqual('Basic capabilities are enhanced');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0059 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0060
     * @tc.name      testResourceLocaleMatrix0060
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 EntryAbility_desc 取值为 "Home Ability"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0060 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('EntryAbility_desc');
      expect(value).assertEqual('Home Ability');
      expect(value.length).assertEqual(12);
      expect(await manager.getStringByName('EntryAbility_desc')).assertEqual('Home Ability');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0060 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0061
     * @tc.name      testResourceLocaleMatrix0061
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 EntryAbility_label 取值为 "Basic capabilities are enhanced"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0061 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('EntryAbility_label');
      expect(value).assertEqual('Basic capabilities are enhanced');
      expect(value.length).assertEqual(31);
      expect(await manager.getStringByName('EntryAbility_label')).assertEqual('Basic capabilities are enhanced');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0061 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0062
     * @tc.name      testResourceLocaleMatrix0062
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 NewAbility_desc 取值为 "Ability used by start"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0062 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('NewAbility_desc');
      expect(value).assertEqual('Ability used by start');
      expect(value.length).assertEqual(21);
      expect(await manager.getStringByName('NewAbility_desc')).assertEqual('Ability used by start');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0062 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0063
     * @tc.name      testResourceLocaleMatrix0063
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 NewAbility_label 取值为 "NewAbility"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0063 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('NewAbility_label');
      expect(value).assertEqual('NewAbility');
      expect(value.length).assertEqual(10);
      expect(await manager.getStringByName('NewAbility_label')).assertEqual('NewAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0063 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0064
     * @tc.name      testResourceLocaleMatrix0064
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 Set_Chinese_language 取值为 "Set Chinese language"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0064 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Set_Chinese_language');
      expect(value).assertEqual('Set Chinese language');
      expect(value.length).assertEqual(20);
      expect(await manager.getStringByName('Set_Chinese_language')).assertEqual('Set Chinese language');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0064 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0065
     * @tc.name      testResourceLocaleMatrix0065
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 Set_English_Language 取值为 "Set English Language"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0065 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Set_English_Language');
      expect(value).assertEqual('Set English Language');
      expect(value.length).assertEqual(20);
      expect(await manager.getStringByName('Set_English_Language')).assertEqual('Set English Language');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0065 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0066
     * @tc.name      testResourceLocaleMatrix0066
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 Set_Dark_Mode 取值为 "Set Dark Mode"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0066 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Set_Dark_Mode');
      expect(value).assertEqual('Set Dark Mode');
      expect(value.length).assertEqual(13);
      expect(await manager.getStringByName('Set_Dark_Mode')).assertEqual('Set Dark Mode');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0066 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0067
     * @tc.name      testResourceLocaleMatrix0067
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 Set_Light_Mode 取值为 "Set Light Mode"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0067 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Set_Light_Mode');
      expect(value).assertEqual('Set Light Mode');
      expect(value.length).assertEqual(14);
      expect(await manager.getStringByName('Set_Light_Mode')).assertEqual('Set Light Mode');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0067 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0068
     * @tc.name      testResourceLocaleMatrix0068
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 Implicit_Launch_not_Popup 取值为 "Implicit Launch not Popup"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0068 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Implicit_Launch_not_Popup');
      expect(value).assertEqual('Implicit Launch not Popup');
      expect(value.length).assertEqual(25);
      expect(await manager.getStringByName('Implicit_Launch_not_Popup')).assertEqual('Implicit Launch not Popup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0068 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0069
     * @tc.name      testResourceLocaleMatrix0069
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 Implicit_Launch_Popup 取值为 "Implicit Launch Popup"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0069 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('Implicit_Launch_Popup');
      expect(value).assertEqual('Implicit Launch Popup');
      expect(value.length).assertEqual(21);
      expect(await manager.getStringByName('Implicit_Launch_Popup')).assertEqual('Implicit Launch Popup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0069 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0070
     * @tc.name      testResourceLocaleMatrix0070
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 CreateStorageData 取值为 "Create Storage Data"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0070 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('CreateStorageData');
      expect(value).assertEqual('Create Storage Data');
      expect(value.length).assertEqual(19);
      expect(await manager.getStringByName('CreateStorageData')).assertEqual('Create Storage Data');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0070 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0071
     * @tc.name      testResourceLocaleMatrix0071
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 CheckStorageData 取值为 "Check Storage Data"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0071 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('CheckStorageData');
      expect(value).assertEqual('Check Storage Data');
      expect(value.length).assertEqual(18);
      expect(await manager.getStringByName('CheckStorageData')).assertEqual('Check Storage Data');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0071 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0072
     * @tc.name      testResourceLocaleMatrix0072
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 ClearStorageData 取值为 "Clear Storage Data"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0072 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('ClearStorageData');
      expect(value).assertEqual('Clear Storage Data');
      expect(value.length).assertEqual(18);
      expect(await manager.getStringByName('ClearStorageData')).assertEqual('Clear Storage Data');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0072 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0073
     * @tc.name      testResourceLocaleMatrix0073
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 system_BasicCharacter_Demo 取值为 "Basic capabilities are enhanced"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0073 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('system_BasicCharacter_Demo');
      expect(value).assertEqual('Basic capabilities are enhanced');
      expect(value.length).assertEqual(31);
      expect(await manager.getStringByName('system_BasicCharacter_Demo')).assertEqual('Basic capabilities are enhanced');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0073 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0074
     * @tc.name      testResourceLocaleMatrix0074
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 toggle 取值为 "toggle"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0074 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('toggle');
      expect(value).assertEqual('toggle');
      expect(value.length).assertEqual(6);
      expect(await manager.getStringByName('toggle')).assertEqual('toggle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0074 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0075
     * @tc.name      testResourceLocaleMatrix0075
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 arrow 取值为 "arrow"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0075 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('arrow');
      expect(value).assertEqual('arrow');
      expect(value.length).assertEqual(5);
      expect(await manager.getStringByName('arrow')).assertEqual('arrow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0075 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0076
     * @tc.name      testResourceLocaleMatrix0076
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 create_File_Success 取值为 "createFileSuccess"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0076 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('create_File_Success');
      expect(value).assertEqual('createFileSuccess');
      expect(value.length).assertEqual(17);
      expect(await manager.getStringByName('create_File_Success')).assertEqual('createFileSuccess');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0076 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0077
     * @tc.name      testResourceLocaleMatrix0077
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 search_File_Success 取值为 "searchFileSuccess"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0077 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('search_File_Success');
      expect(value).assertEqual('searchFileSuccess');
      expect(value.length).assertEqual(17);
      expect(await manager.getStringByName('search_File_Success')).assertEqual('searchFileSuccess');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0077 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0078
     * @tc.name      testResourceLocaleMatrix0078
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 search_File_Failed 取值为 "searchFileFailed"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0078 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('search_File_Failed');
      expect(value).assertEqual('searchFileFailed');
      expect(value.length).assertEqual(16);
      expect(await manager.getStringByName('search_File_Failed')).assertEqual('searchFileFailed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0078 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0079
     * @tc.name      testResourceLocaleMatrix0079
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 clean_Data_Success 取值为 "cleanDataSuccess"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0079 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('clean_Data_Success');
      expect(value).assertEqual('cleanDataSuccess');
      expect(value.length).assertEqual(16);
      expect(await manager.getStringByName('clean_Data_Success')).assertEqual('cleanDataSuccess');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0079 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0080
     * @tc.name      testResourceLocaleMatrix0080
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 clean_Data_Failed 取值为 "cleanDataFailed"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0080 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('clean_Data_Failed');
      expect(value).assertEqual('cleanDataFailed');
      expect(value.length).assertEqual(15);
      expect(await manager.getStringByName('clean_Data_Failed')).assertEqual('cleanDataFailed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0080 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0081
     * @tc.name      testResourceLocaleMatrix0081
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 start_animation 取值为 "start animation"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0081 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('start_animation');
      expect(value).assertEqual('start animation');
      expect(value.length).assertEqual(15);
      expect(await manager.getStringByName('start_animation')).assertEqual('start animation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0081 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0082
     * @tc.name      testResourceLocaleMatrix0082
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 setStartOptionsPage 取值为 "Set StartOptions StartAbility"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0082 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('setStartOptionsPage');
      expect(value).assertEqual('Set StartOptions StartAbility');
      expect(value.length).assertEqual(29);
      expect(await manager.getStringByName('setStartOptionsPage')).assertEqual('Set StartOptions StartAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0082 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0083
     * @tc.name      testResourceLocaleMatrix0083
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 empty 取值为 "empty"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0083 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('empty');
      expect(value).assertEqual('empty');
      expect(value.length).assertEqual(5);
      expect(await manager.getStringByName('empty')).assertEqual('empty');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0083 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0084
     * @tc.name      testResourceLocaleMatrix0084
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 switchDarkSuccess 取值为 "switch DarkMode Success"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0084 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('switchDarkSuccess');
      expect(value).assertEqual('switch DarkMode Success');
      expect(value.length).assertEqual(23);
      expect(await manager.getStringByName('switchDarkSuccess')).assertEqual('switch DarkMode Success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0084 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0085
     * @tc.name      testResourceLocaleMatrix0085
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 switchLightSuccess 取值为 "switch LightMode Success"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0085 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('switchLightSuccess');
      expect(value).assertEqual('switch LightMode Success');
      expect(value.length).assertEqual(24);
      expect(await manager.getStringByName('switchLightSuccess')).assertEqual('switch LightMode Success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0085 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0086
     * @tc.name      testResourceLocaleMatrix0086
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 open 取值为 "open"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0086 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('open');
      expect(value).assertEqual('open');
      expect(value.length).assertEqual(4);
      expect(await manager.getStringByName('open')).assertEqual('open');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0086 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0087
     * @tc.name      testResourceLocaleMatrix0087
     * @tc.desc      无对应资源目录的法语（回落 base）环境下 entry 模块字符串 close 取值为 "close"，同步与异步接口结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0087 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('fr_Latn_FR', resourceManager.ColorMode.LIGHT);
      const value: string = manager.getStringByNameSync('close');
      expect(value).assertEqual('close');
      expect(value.length).assertEqual(5);
      expect(await manager.getStringByName('close')).assertEqual('close');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0087 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0088
     * @tc.name      testResourceLocaleMatrix0088
     * @tc.desc      浅色下颜色 start_window_background 解析为 0xFFFFFFFF，不透明且 RGB 与 #FFFFFF 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0088 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const color: number = manager.getColorByNameSync('start_window_background');
      expect(color).assertEqual(0xFFFFFFFF);
      expect(color >>> 24).assertEqual(0xFF);
      expect(color & 0xFFFFFF).assertEqual(0xFFFFFF);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0088 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0089
     * @tc.name      testResourceLocaleMatrix0089
     * @tc.desc      浅色下颜色 background 解析为 0xFFFAFAFA，不透明且 RGB 与 #FAFAFA 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0089 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const color: number = manager.getColorByNameSync('background');
      expect(color).assertEqual(0xFFFAFAFA);
      expect(color >>> 24).assertEqual(0xFF);
      expect(color & 0xFFFFFF).assertEqual(0xFAFAFA);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0089 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0090
     * @tc.name      testResourceLocaleMatrix0090
     * @tc.desc      浅色下颜色 line_color 解析为 0xFF182431，不透明且 RGB 与 #182431 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0090 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const color: number = manager.getColorByNameSync('line_color');
      expect(color).assertEqual(0xFF182431);
      expect(color >>> 24).assertEqual(0xFF);
      expect(color & 0xFFFFFF).assertEqual(0x182431);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0090 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0091
     * @tc.name      testResourceLocaleMatrix0091
     * @tc.desc      浅色下颜色 text_color 解析为 0xFF182431，不透明且 RGB 与 #182431 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0091 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const color: number = manager.getColorByNameSync('text_color');
      expect(color).assertEqual(0xFF182431);
      expect(color >>> 24).assertEqual(0xFF);
      expect(color & 0xFFFFFF).assertEqual(0x182431);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0091 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0092
     * @tc.name      testResourceLocaleMatrix0092
     * @tc.desc      浅色下颜色 button_color 解析为 0xFF182431，不透明且 RGB 与 #182431 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0092 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const color: number = manager.getColorByNameSync('button_color');
      expect(color).assertEqual(0xFF182431);
      expect(color >>> 24).assertEqual(0xFF);
      expect(color & 0xFFFFFF).assertEqual(0x182431);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0092 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0093
     * @tc.name      testResourceLocaleMatrix0093
     * @tc.desc      深色（无 dark 目录，回落 base）下颜色 start_window_background 解析为 0xFFFFFFFF，不透明且 RGB 与 #FFFFFF 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0093 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const color: number = manager.getColorByNameSync('start_window_background');
      expect(color).assertEqual(0xFFFFFFFF);
      expect(color >>> 24).assertEqual(0xFF);
      expect(color & 0xFFFFFF).assertEqual(0xFFFFFF);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0093 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0094
     * @tc.name      testResourceLocaleMatrix0094
     * @tc.desc      深色（无 dark 目录，回落 base）下颜色 background 解析为 0xFFFAFAFA，不透明且 RGB 与 #FAFAFA 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0094 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const color: number = manager.getColorByNameSync('background');
      expect(color).assertEqual(0xFFFAFAFA);
      expect(color >>> 24).assertEqual(0xFF);
      expect(color & 0xFFFFFF).assertEqual(0xFAFAFA);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0094 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0095
     * @tc.name      testResourceLocaleMatrix0095
     * @tc.desc      深色（无 dark 目录，回落 base）下颜色 line_color 解析为 0xFF182431，不透明且 RGB 与 #182431 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0095 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const color: number = manager.getColorByNameSync('line_color');
      expect(color).assertEqual(0xFF182431);
      expect(color >>> 24).assertEqual(0xFF);
      expect(color & 0xFFFFFF).assertEqual(0x182431);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0095 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0096
     * @tc.name      testResourceLocaleMatrix0096
     * @tc.desc      深色（无 dark 目录，回落 base）下颜色 text_color 解析为 0xFF182431，不透明且 RGB 与 #182431 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0096 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const color: number = manager.getColorByNameSync('text_color');
      expect(color).assertEqual(0xFF182431);
      expect(color >>> 24).assertEqual(0xFF);
      expect(color & 0xFFFFFF).assertEqual(0x182431);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0096 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_RESOURCE_0097
     * @tc.name      testResourceLocaleMatrix0097
     * @tc.desc      深色（无 dark 目录，回落 base）下颜色 button_color 解析为 0xFF182431，不透明且 RGB 与 #182431 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0097 begin');
      const manager: resourceManager.ResourceManager = await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const color: number = manager.getColorByNameSync('button_color');
      expect(color).assertEqual(0xFF182431);
      expect(color >>> 24).assertEqual(0xFF);
      expect(color & 0xFFFFFF).assertEqual(0x182431);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0097 end');
      done();
    })
  })
}
