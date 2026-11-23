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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  ID_INDEX_TITLE, ID_RESOURCES_TITLE, ID_OVERLAY_TITLE, RESOURCES_VALUE_IDS,
  ID_GET_DENSITY_MEDIA, ID_GET_SYSTEM_MEDIA,
  backToIndex, startApp, openResources, scrollDown, revealId, textOf, idOf, typeOf, idExists, isDigits
} from './UiSupport';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

/**
 * Resources page behaviour. Every value is checked against a property of its own
 * source (JSON shape, decimal digits, base64 length ratio, placeholder replaced),
 * never against a translated literal, so the cases hold in any display language.
 */
export default function basicResourcesUiReal01Test() {
  describe('BasicResourcesUiReal01Test', () => {
    beforeAll(async () => {
      const driver: Driver = Driver.create();
      await startApp(driver);
    });

    /**
     * @tc.name   testBasicResourcesUi0001
     * @tc.number SUB_RESMGR_UI_RESOURCES_0001
     * @tc.desc   资源页标题存在，节点 id 与选择器一致，文本非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0001 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await idOf(driver, ID_RESOURCES_TITLE)).assertEqual(ID_RESOURCES_TITLE);
      expect((await textOf(driver, ID_RESOURCES_TITLE)).length > 0).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0002
     * @tc.number SUB_RESMGR_UI_RESOURCES_0002
     * @tc.desc   资源页与首页的标题渲染同一个 title 资源
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0002 begin');
      const driver: Driver = Driver.create();
      expect(await backToIndex(driver)).assertTrue();
      const indexTitle: string = await textOf(driver, ID_INDEX_TITLE);
      expect(await openResources(driver)).assertTrue();
      expect(await textOf(driver, ID_RESOURCES_TITLE)).assertEqual(indexTitle);
    });

    /**
     * @tc.name   testBasicResourcesUi0003
     * @tc.number SUB_RESMGR_UI_RESOURCES_0003
     * @tc.desc   字符串取值节点存在，id 与选择器一致，文本非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0003 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await idOf(driver, 'stringValue')).assertEqual('stringValue');
      const value: string = await textOf(driver, 'stringValue');
      expect(value.length > 0).assertTrue();
      expect(value).assertEqual(value.trim());
    });

    /**
     * @tc.name   testBasicResourcesUi0004
     * @tc.number SUB_RESMGR_UI_RESOURCES_0004
     * @tc.desc   字符串数组取值被序列化为 JSON 数组文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0004 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await idOf(driver, 'stringArrayValue')).assertEqual('stringArrayValue');
      const value: string = await textOf(driver, 'stringArrayValue');
      expect(value.startsWith('[')).assertTrue();
      expect(value.endsWith(']')).assertTrue();
      expect(value.length > 2).assertTrue();
      expect(value.startsWith('{')).assertFalse();
    });

    /**
     * @tc.name   testBasicResourcesUi0005
     * @tc.number SUB_RESMGR_UI_RESOURCES_0005
     * @tc.desc   字符串与字符串数组是两个不同的资源，取值文本不相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0005 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const single: string = await textOf(driver, 'stringValue');
      const multiple: string = await textOf(driver, 'stringArrayValue');
      expect(single === multiple).assertFalse();
      expect(single.length > 0).assertTrue();
      expect(multiple.length > 0).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0006
     * @tc.number SUB_RESMGR_UI_RESOURCES_0006
     * @tc.desc   复数取值节点存在，id 与选择器一致，文本非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0006 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await idOf(driver, 'pluralValue')).assertEqual('pluralValue');
      const value: string = await textOf(driver, 'pluralValue');
      const single: string = await textOf(driver, 'stringValue');
      expect(value.length > 0).assertTrue();
      expect(value === single).assertFalse();
    });

    /**
     * @tc.name   testBasicResourcesUi0007
     * @tc.number SUB_RESMGR_UI_RESOURCES_0007
     * @tc.desc   设备状态取值被序列化为 JSON 对象文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0007 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await idOf(driver, 'configurationValue')).assertEqual('configurationValue');
      const value: string = await textOf(driver, 'configurationValue');
      expect(value.startsWith('{')).assertTrue();
      expect(value.endsWith('}')).assertTrue();
      expect(value.length > 2).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0008
     * @tc.number SUB_RESMGR_UI_RESOURCES_0008
     * @tc.desc   设备能力取值被序列化为 JSON 对象文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0008 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await idOf(driver, 'capabilityValue')).assertEqual('capabilityValue');
      const value: string = await textOf(driver, 'capabilityValue');
      expect(value.startsWith('{')).assertTrue();
      expect(value.endsWith('}')).assertTrue();
      expect(value.length > 2).assertTrue();
      expect(value.indexOf(':') > 0).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0009
     * @tc.number SUB_RESMGR_UI_RESOURCES_0009
     * @tc.desc   设备状态与设备能力来自不同接口，序列化结果不相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0009 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const configuration: string = await textOf(driver, 'configurationValue');
      const capability: string = await textOf(driver, 'capabilityValue');
      expect(configuration === capability).assertFalse();
      expect(configuration.length > 2).assertTrue();
      expect(capability.length > 2).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0010
     * @tc.number SUB_RESMGR_UI_RESOURCES_0010
     * @tc.desc   图片资源字节数渲染为十进制数字且大于零
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0010 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const value: string = await textOf(driver, 'mediaValue');
      expect(isDigits(value)).assertTrue();
      const bytes: number = Number(value);
      expect(Number.isInteger(bytes)).assertTrue();
      expect(bytes > 0).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0011
     * @tc.number SUB_RESMGR_UI_RESOURCES_0011
     * @tc.desc   图片资源 base64 长度渲染为十进制数字且大于零
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0011 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const value: string = await textOf(driver, 'mediaBase64Value');
      expect(isDigits(value)).assertTrue();
      const encoded: number = Number(value);
      expect(Number.isInteger(encoded)).assertTrue();
      expect(encoded > 0).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0012
     * @tc.number SUB_RESMGR_UI_RESOURCES_0012
     * @tc.desc   base64 长度必须大于原始字节数（4 字符表示 3 字节）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0012 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const bytes: number = Number(await textOf(driver, 'mediaValue'));
      const encoded: number = Number(await textOf(driver, 'mediaBase64Value'));
      expect(encoded > bytes).assertTrue();
      expect(bytes > 0).assertTrue();
      expect(encoded > 0).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0013
     * @tc.number SUB_RESMGR_UI_RESOURCES_0013
     * @tc.desc   格式化字符串已替换占位符，渲染结果不含 %s 且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0013 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await idOf(driver, 'formatStringValue')).assertEqual('formatStringValue');
      const value: string = await textOf(driver, 'formatStringValue');
      expect(value.length > 0).assertTrue();
      expect(value.indexOf('%s') === -1).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0014
     * @tc.number SUB_RESMGR_UI_RESOURCES_0014
     * @tc.desc   指定屏幕密度图片节点存在，id 与选择器一致，类型名非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0014 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await revealId(driver, ID_GET_DENSITY_MEDIA)).assertTrue();
      expect(await idExists(driver, ID_GET_DENSITY_MEDIA)).assertTrue();
      expect(await idOf(driver, ID_GET_DENSITY_MEDIA)).assertEqual(ID_GET_DENSITY_MEDIA);
      expect((await typeOf(driver, ID_GET_DENSITY_MEDIA)).length > 0).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0015
     * @tc.number SUB_RESMGR_UI_RESOURCES_0015
     * @tc.desc   系统资源图片节点存在，id 与选择器一致，类型名非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0015 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      await scrollDown(driver);
      expect(await revealId(driver, ID_GET_SYSTEM_MEDIA)).assertTrue();
      expect(await idExists(driver, ID_GET_SYSTEM_MEDIA)).assertTrue();
      expect(await idOf(driver, ID_GET_SYSTEM_MEDIA)).assertEqual(ID_GET_SYSTEM_MEDIA);
      expect((await typeOf(driver, ID_GET_SYSTEM_MEDIA)).length > 0).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0016
     * @tc.number SUB_RESMGR_UI_RESOURCES_0016
     * @tc.desc   资源页十个取值节点全部存在且 id 与选择器逐一对应
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0016 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      let found: number = 0;
      for (let index: number = 0; index < RESOURCES_VALUE_IDS.length; index++) {
        const id: string = RESOURCES_VALUE_IDS[index];
        const present: boolean = await idExists(driver, id);
        if (!present && index >= 7) {
          await revealId(driver, id);
        }
        if (await idExists(driver, id)) {
          found++;
        }
      }
      expect(found).assertEqual(RESOURCES_VALUE_IDS.length);
      expect(found > 8).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0017
     * @tc.number SUB_RESMGR_UI_RESOURCES_0017
     * @tc.desc   资源页所有文本取值节点渲染内容非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0017 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const textIds: string[] = [
        'stringValue', 'stringArrayValue', 'pluralValue', 'configurationValue',
        'capabilityValue', 'mediaValue', 'mediaBase64Value', 'formatStringValue'
      ];
      let nonEmpty: number = 0;
      for (let index: number = 0; index < textIds.length; index++) {
        const value: string = await textOf(driver, textIds[index]);
        if (value.length > 0) {
          nonEmpty++;
        }
      }
      expect(nonEmpty).assertEqual(textIds.length);
      expect(nonEmpty > 0).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0018
     * @tc.number SUB_RESMGR_UI_RESOURCES_0018
     * @tc.desc   两次进入资源页，字符串取值保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0018 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const firstVisit: string = await textOf(driver, 'stringValue');
      expect(await backToIndex(driver)).assertTrue();
      expect(await openResources(driver)).assertTrue();
      expect(await textOf(driver, 'stringValue')).assertEqual(firstVisit);
    });

    /**
     * @tc.name   testBasicResourcesUi0019
     * @tc.number SUB_RESMGR_UI_RESOURCES_0019
     * @tc.desc   两次进入资源页，图片字节数与 base64 长度保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0019 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const firstBytes: string = await textOf(driver, 'mediaValue');
      const firstEncoded: string = await textOf(driver, 'mediaBase64Value');
      expect(await backToIndex(driver)).assertTrue();
      expect(await openResources(driver)).assertTrue();
      expect(await textOf(driver, 'mediaValue')).assertEqual(firstBytes);
      expect(await textOf(driver, 'mediaBase64Value')).assertEqual(firstEncoded);
    });

    /**
     * @tc.name   testBasicResourcesUi0020
     * @tc.number SUB_RESMGR_UI_RESOURCES_0020
     * @tc.desc   两次进入资源页，格式化字符串渲染结果保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0020 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const firstVisit: string = await textOf(driver, 'formatStringValue');
      expect(await backToIndex(driver)).assertTrue();
      expect(await openResources(driver)).assertTrue();
      const secondVisit: string = await textOf(driver, 'formatStringValue');
      expect(secondVisit).assertEqual(firstVisit);
      expect(secondVisit.indexOf('%s') === -1).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0021
     * @tc.number SUB_RESMGR_UI_RESOURCES_0021
     * @tc.desc   从资源页返回后首页恢复，资源页与 Overlay 页都不在前台
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0021 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await backToIndex(driver)).assertTrue();
      expect(await idExists(driver, ID_RESOURCES_TITLE)).assertFalse();
      expect(await idExists(driver, ID_OVERLAY_TITLE)).assertFalse();
      expect(await idExists(driver, ID_INDEX_TITLE)).assertTrue();
    });

    /**
     * @tc.name   testBasicResourcesUi0022
     * @tc.number SUB_RESMGR_UI_RESOURCES_0022
     * @tc.desc   从资源页返回首页后资源页节点退出，首页标题恢复且文本非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBasicResourcesUi0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBasicResourcesUi0022 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await backToIndex(driver)).assertTrue();
      expect(await idExists(driver, ID_INDEX_TITLE)).assertTrue();
      const indexTitle: string = await textOf(driver, ID_INDEX_TITLE);
      expect(indexTitle.length > 0).assertTrue();
      expect(await idExists(driver, 'stringValue')).assertFalse();
    });
  });
}
