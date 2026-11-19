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

export default function resourceLocaleMatrixTailTest(): void {
  describe('AbilityRuntimeResourceLocaleMatrixTailTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0249
     * @tc.name      testResourceLocaleMatrix0249
     * @tc.desc      浅色下颜色 start_window_background 解析为 0xFFFFFFFF，不透明且 RGB 与 #FFFFFF 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0249 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0249 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0250
     * @tc.name      testResourceLocaleMatrix0250
     * @tc.desc      浅色下颜色 backGrounding 解析为 0xFFF1F3F5，不透明且 RGB 与 #f1f3f5 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0250 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const color: number = manager.getColorByNameSync('backGrounding');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 color=${color}`);
      expect(color).assertEqual(0xFFF1F3F5);
      const actual2: number = color >>> 24;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0xFF);
      const actual3: number = color & 0xFFFFFF;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0xF1F3F5);
      const actual4: number = await manager.getColorByName('backGrounding');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(0xFFF1F3F5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0250 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0251
     * @tc.name      testResourceLocaleMatrix0251
     * @tc.desc      浅色下颜色 text_color 解析为 0xFF182431，不透明且 RGB 与 #182431 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0251 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.LIGHT);
      const color: number = manager.getColorByNameSync('text_color');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 color=${color}`);
      expect(color).assertEqual(0xFF182431);
      const actual2: number = color >>> 24;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0xFF);
      const actual3: number = color & 0xFFFFFF;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0x182431);
      const actual4: number = await manager.getColorByName('text_color');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(0xFF182431);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0251 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0252
     * @tc.name      testResourceLocaleMatrix0252
     * @tc.desc      深色（无 dark 目录，回落 base）下颜色 start_window_background 解析为 0xFFFFFFFF，不透明且 RGB 与 #FFFFFF 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0252 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0252 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0253
     * @tc.name      testResourceLocaleMatrix0253
     * @tc.desc      深色（无 dark 目录，回落 base）下颜色 backGrounding 解析为 0xFFF1F3F5，不透明且 RGB 与 #f1f3f5 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0253 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const color: number = manager.getColorByNameSync('backGrounding');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 color=${color}`);
      expect(color).assertEqual(0xFFF1F3F5);
      const actual2: number = color >>> 24;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0xFF);
      const actual3: number = color & 0xFFFFFF;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0xF1F3F5);
      const actual4: number = await manager.getColorByName('backGrounding');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(0xFFF1F3F5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0253 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0254
     * @tc.name      testResourceLocaleMatrix0254
     * @tc.desc      深色（无 dark 目录，回落 base）下颜色 text_color 解析为 0xFF182431，不透明且 RGB 与 #182431 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0254 begin');
      const manager: resourceManager.ResourceManager =
        await loadOverrideResourceManager('zh_Hans_CN', resourceManager.ColorMode.DARK);
      const color: number = manager.getColorByNameSync('text_color');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 color=${color}`);
      expect(color).assertEqual(0xFF182431);
      const actual2: number = color >>> 24;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0xFF);
      const actual3: number = color & 0xFFFFFF;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0x182431);
      const actual4: number = await manager.getColorByName('text_color');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(0xFF182431);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0254 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0255
     * @tc.name      testResourceLocaleMatrix0255
     * @tc.desc      媒体资源 startIcon 读取为 20093 字节，同步与异步接口内容一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0255 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const content: Uint8Array = manager.getMediaByNameSync('startIcon');
      const again: Uint8Array = await manager.getMediaByName('startIcon');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 content.length=${content.length}`);
      expect(content.length).assertEqual(20093);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 again.length=${again.length}`);
      expect(again.length).assertEqual(20093);
      const actual3: string | number | boolean = again[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(content[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0255 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0256
     * @tc.name      testResourceLocaleMatrix0256
     * @tc.desc      媒体资源 background 读取为 57364 字节，同步与异步接口内容一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0256 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const content: Uint8Array = manager.getMediaByNameSync('background');
      const again: Uint8Array = await manager.getMediaByName('background');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 content.length=${content.length}`);
      expect(content.length).assertEqual(57364);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 again.length=${again.length}`);
      expect(again.length).assertEqual(57364);
      const actual3: string | number | boolean = again[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(content[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0256 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0257
     * @tc.name      testResourceLocaleMatrix0257
     * @tc.desc      媒体资源 foreground 读取为 12430 字节，同步与异步接口内容一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0257 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const content: Uint8Array = manager.getMediaByNameSync('foreground');
      const again: Uint8Array = await manager.getMediaByName('foreground');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 content.length=${content.length}`);
      expect(content.length).assertEqual(12430);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 again.length=${again.length}`);
      expect(again.length).assertEqual(12430);
      const actual3: string | number | boolean = again[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(content[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0257 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0258
     * @tc.name      testResourceLocaleMatrix0258
     * @tc.desc      媒体资源 ic_arrow 读取为 1400 字节，同步与异步接口内容一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResourceLocaleMatrix0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0258 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const content: Uint8Array = manager.getMediaByNameSync('ic_arrow');
      const again: Uint8Array = await manager.getMediaByName('ic_arrow');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 content.length=${content.length}`);
      expect(content.length).assertEqual(1400);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 again.length=${again.length}`);
      expect(again.length).assertEqual(1400);
      const actual3: string | number | boolean = again[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(content[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0258 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0259
     * @tc.name      testResourceLocaleMatrix0259
     * @tc.desc      媒体资源 layered_image 读取为 81 字节，同步与异步接口内容一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0259 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const content: Uint8Array = manager.getMediaByNameSync('layered_image');
      const again: Uint8Array = await manager.getMediaByName('layered_image');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 content.length=${content.length}`);
      expect(content.length).assertEqual(81);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 again.length=${again.length}`);
      expect(again.length).assertEqual(81);
      const actual3: string | number | boolean = again[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(content[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0259 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0260
     * @tc.name      testResourceLocaleMatrix0260
     * @tc.desc      媒体资源 app_icon 读取为 2777 字节，同步与异步接口内容一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0260 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const content: Uint8Array = manager.getMediaByNameSync('app_icon');
      const again: Uint8Array = await manager.getMediaByName('app_icon');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 content.length=${content.length}`);
      expect(content.length).assertEqual(2777);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 again.length=${again.length}`);
      expect(again.length).assertEqual(2777);
      const actual3: string | number | boolean = again[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(content[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0260 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0261
     * @tc.name      testResourceLocaleMatrix0261
     * @tc.desc      按名称读取不存在的字符串 no_such_string 抛 9001003，正常资源仍可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0261 begin');
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
      const actual2: string = manager.getStringByNameSync('EntryAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0261 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0262
     * @tc.name      testResourceLocaleMatrix0262
     * @tc.desc      按名称读取不存在的大小写不同的字符串名 Main_Title 抛 9001003，正常资源仍可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0262 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      let code: string = '';
      try {
        manager.getStringByNameSync('Main_Title');
      } catch (error) {
        // 资源管理的错误码在真机上是字符串
        expect(typeof (error as BusinessError).code).assertEqual('string');
        code = String((error as BusinessError).code);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual('9001003');
      const actual2: string = manager.getStringByNameSync('EntryAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0262 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0263
     * @tc.name      testResourceLocaleMatrix0263
     * @tc.desc      按名称读取不存在的颜色 no_such_color 抛 9001003，正常资源仍可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0263 begin');
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
      const actual2: string = manager.getStringByNameSync('EntryAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0263 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0264
     * @tc.name      testResourceLocaleMatrix0264
     * @tc.desc      按名称读取不存在的只存在于其他示例里的颜色 text_color_dark 抛 9001003，正常资源仍可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0264 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      let code: string = '';
      try {
        manager.getColorByNameSync('text_color_dark');
      } catch (error) {
        // 资源管理的错误码在真机上是字符串
        expect(typeof (error as BusinessError).code).assertEqual('string');
        code = String((error as BusinessError).code);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual('9001003');
      const actual2: string = manager.getStringByNameSync('EntryAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0264 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0265
     * @tc.name      testResourceLocaleMatrix0265
     * @tc.desc      按名称读取不存在的媒体 no_such_media 抛 9001003，正常资源仍可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0265 begin');
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
      const actual2: string = manager.getStringByNameSync('EntryAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0265 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0266
     * @tc.name      testResourceLocaleMatrix0266
     * @tc.desc      按名称读取不存在的带扩展名的媒体名 startIcon.png 抛 9001003，正常资源仍可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0266 begin');
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
      const actual2: string = manager.getStringByNameSync('EntryAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('label');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0266 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0267
     * @tc.name      testResourceLocaleMatrix0267
     * @tc.desc      rawfile 下的 font/Roboto-Regular.ttf 可读取，字节数与源文件一致，开头是 TrueType 版本号
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testResourceLocaleMatrix0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0267 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const content: Uint8Array = manager.getRawFileContentSync('font/Roboto-Regular.ttf');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 content.length=${content.length}`);
      expect(content.length).assertEqual(2370304);
      const actual2: number = content[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = content[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const actual4: number = (await manager.getRawFileContent('font/Roboto-Regular.ttf')).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(content.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0267 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_RESOURCE_0268
     * @tc.name      testResourceLocaleMatrix0268
     * @tc.desc      rawfile 目录列表只有 font 一个子目录，font 目录下只有 Roboto-Regular.ttf
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testResourceLocaleMatrix0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0268 begin');
      const manager: resourceManager.ResourceManager = await lightManager('zh_Hans_CN');
      const top: string[] = manager.getRawFileListSync('');
      const fonts: string[] = manager.getRawFileListSync('font');
      const actual1: string = top.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('font');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 fonts.length=${fonts.length}`);
      expect(fonts.length).assertEqual(1);
      const actual3: string = fonts[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('Roboto-Regular.ttf');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResourceLocaleMatrix0268 end');
    })
  })
}
