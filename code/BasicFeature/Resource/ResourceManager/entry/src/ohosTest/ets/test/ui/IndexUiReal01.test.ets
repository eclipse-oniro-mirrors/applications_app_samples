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
  ID_INDEX_TITLE, ID_RESOURCES_BTN, ID_OVERLAY_BTN, ID_RESOURCES_TITLE, ID_OVERLAY_TITLE, ID_OVERLAY_MESSAGE,
  backToIndex, startApp, openResources, openOverlay, textOf, idOf, typeOf, clickableOf, idExists
} from './UiSupport';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

/**
 * Entry page behaviour: the two entry buttons, navigating into each child page and
 * coming back. Texts are compared against each other (the same resource string is
 * rendered by every page title) so the cases hold in any display language.
 */
export default function indexUiReal01Test() {
  describe('IndexUiReal01Test', () => {
    beforeAll(async () => {
      const driver: Driver = Driver.create();
      await startApp(driver);
    });

    /**
     * @tc.name   testIndexUi0001
     * @tc.number SUB_RESMGR_UI_INDEX_0001
     * @tc.desc   首页标题存在，节点 id 与选择器一致，文本非空且无首尾空白
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIndexUi0001 begin');
      const driver: Driver = Driver.create();
      expect(await backToIndex(driver)).assertTrue();
      expect(await idOf(driver, ID_INDEX_TITLE)).assertEqual(ID_INDEX_TITLE);
      const title: string = await textOf(driver, ID_INDEX_TITLE);
      expect(title.length > 0).assertTrue();
      expect(title).assertEqual(title.trim());
    });

    /**
     * @tc.name   testIndexUi0002
     * @tc.number SUB_RESMGR_UI_INDEX_0002
     * @tc.desc   资源入口按钮可点击，文本非空且节点 id 与选择器一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIndexUi0002 begin');
      const driver: Driver = Driver.create();
      expect(await backToIndex(driver)).assertTrue();
      expect(await idOf(driver, ID_RESOURCES_BTN)).assertEqual(ID_RESOURCES_BTN);
      expect(await clickableOf(driver, ID_RESOURCES_BTN)).assertTrue();
      const label: string = await textOf(driver, ID_RESOURCES_BTN);
      expect(label.length > 0).assertTrue();
    });

    /**
     * @tc.name   testIndexUi0003
     * @tc.number SUB_RESMGR_UI_INDEX_0003
     * @tc.desc   Overlay 入口按钮可点击，文本非空且节点 id 与选择器一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIndexUi0003 begin');
      const driver: Driver = Driver.create();
      expect(await backToIndex(driver)).assertTrue();
      expect(await idOf(driver, ID_OVERLAY_BTN)).assertEqual(ID_OVERLAY_BTN);
      expect(await clickableOf(driver, ID_OVERLAY_BTN)).assertTrue();
      const label: string = await textOf(driver, ID_OVERLAY_BTN);
      expect(label.length > 0).assertTrue();
    });

    /**
     * @tc.name   testIndexUi0004
     * @tc.number SUB_RESMGR_UI_INDEX_0004
     * @tc.desc   两个入口按钮的文案互不相同，也都不等于页面标题
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIndexUi0004 begin');
      const driver: Driver = Driver.create();
      expect(await backToIndex(driver)).assertTrue();
      const title: string = await textOf(driver, ID_INDEX_TITLE);
      const resourcesLabel: string = await textOf(driver, ID_RESOURCES_BTN);
      const overlayLabel: string = await textOf(driver, ID_OVERLAY_BTN);
      expect(resourcesLabel === overlayLabel).assertFalse();
      expect(resourcesLabel === title).assertFalse();
      expect(overlayLabel === title).assertFalse();
      expect(resourcesLabel.length > 0 && overlayLabel.length > 0).assertTrue();
    });

    /**
     * @tc.name   testIndexUi0005
     * @tc.number SUB_RESMGR_UI_INDEX_0005
     * @tc.desc   两个入口按钮属于同一种组件类型，类型名非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIndexUi0005 begin');
      const driver: Driver = Driver.create();
      expect(await backToIndex(driver)).assertTrue();
      const resourcesType: string = await typeOf(driver, ID_RESOURCES_BTN);
      const overlayType: string = await typeOf(driver, ID_OVERLAY_BTN);
      expect(resourcesType.length > 0).assertTrue();
      expect(resourcesType).assertEqual(overlayType);
    });

    /**
     * @tc.name   testIndexUi0006
     * @tc.number SUB_RESMGR_UI_INDEX_0006
     * @tc.desc   点击资源入口后进入资源页，两页标题渲染同一个 title 资源
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIndexUi0006 begin');
      const driver: Driver = Driver.create();
      expect(await backToIndex(driver)).assertTrue();
      const indexTitle: string = await textOf(driver, ID_INDEX_TITLE);
      expect(await openResources(driver)).assertTrue();
      expect(await idOf(driver, ID_RESOURCES_TITLE)).assertEqual(ID_RESOURCES_TITLE);
      expect(await textOf(driver, ID_RESOURCES_TITLE)).assertEqual(indexTitle);
    });

    /**
     * @tc.name   testIndexUi0007
     * @tc.number SUB_RESMGR_UI_INDEX_0007
     * @tc.desc   资源页返回首页后标题文本保持不变，两个入口按钮仍在
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIndexUi0007 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const resourcesTitle: string = await textOf(driver, ID_RESOURCES_TITLE);
      expect(await backToIndex(driver)).assertTrue();
      expect(await idExists(driver, ID_RESOURCES_BTN)).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_BTN)).assertTrue();
      expect(await textOf(driver, ID_INDEX_TITLE)).assertEqual(resourcesTitle);
    });

    /**
     * @tc.name   testIndexUi0008
     * @tc.number SUB_RESMGR_UI_INDEX_0008
     * @tc.desc   点击 Overlay 入口后进入 Overlay 页，标题与首页一致且消息节点存在
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIndexUi0008 begin');
      const driver: Driver = Driver.create();
      expect(await backToIndex(driver)).assertTrue();
      const indexTitle: string = await textOf(driver, ID_INDEX_TITLE);
      expect(await openOverlay(driver)).assertTrue();
      expect(await textOf(driver, ID_OVERLAY_TITLE)).assertEqual(indexTitle);
      expect(await idExists(driver, ID_OVERLAY_MESSAGE)).assertTrue();
    });

    /**
     * @tc.name   testIndexUi0009
     * @tc.number SUB_RESMGR_UI_INDEX_0009
     * @tc.desc   Overlay 页返回首页后 Overlay 页退出，首页标题与入口恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIndexUi0009 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      expect(await backToIndex(driver)).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_TITLE)).assertFalse();
      expect(await idExists(driver, ID_INDEX_TITLE)).assertTrue();
      expect((await textOf(driver, ID_INDEX_TITLE)).length > 0).assertTrue();
    });

    /**
     * @tc.name   testIndexUi0010
     * @tc.number SUB_RESMGR_UI_INDEX_0010
     * @tc.desc   连续两轮进入资源页，标题文本在两次访问中保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIndexUi0010 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const firstVisit: string = await textOf(driver, ID_RESOURCES_TITLE);
      expect(await backToIndex(driver)).assertTrue();
      expect(await openResources(driver)).assertTrue();
      expect(await textOf(driver, ID_RESOURCES_TITLE)).assertEqual(firstVisit);
    });

    /**
     * @tc.name   testIndexUi0011
     * @tc.number SUB_RESMGR_UI_INDEX_0011
     * @tc.desc   连续两轮进入 Overlay 页，标题文本在两次访问中保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexUi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIndexUi0011 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      const firstVisit: string = await textOf(driver, ID_OVERLAY_TITLE);
      expect(await backToIndex(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      expect(await textOf(driver, ID_OVERLAY_TITLE)).assertEqual(firstVisit);
    });

    /**
     * @tc.name   testIndexUi0012
     * @tc.number SUB_RESMGR_UI_INDEX_0012
     * @tc.desc   三个页面的标题渲染同一个 title 资源，文本逐页相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexUi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIndexUi0012 begin');
      const driver: Driver = Driver.create();
      expect(await backToIndex(driver)).assertTrue();
      const indexTitle: string = await textOf(driver, ID_INDEX_TITLE);
      expect(await openResources(driver)).assertTrue();
      const resourcesTitle: string = await textOf(driver, ID_RESOURCES_TITLE);
      expect(await openOverlay(driver)).assertTrue();
      const overlayTitle: string = await textOf(driver, ID_OVERLAY_TITLE);
      expect(resourcesTitle).assertEqual(indexTitle);
      expect(overlayTitle).assertEqual(indexTitle);
    });

    /**
     * @tc.name   testIndexUi0013
     * @tc.number SUB_RESMGR_UI_INDEX_0013
     * @tc.desc   多次导航返回后入口按钮的节点 id 不被复用或改写
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIndexUi0013 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await backToIndex(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      expect(await backToIndex(driver)).assertTrue();
      expect(await idOf(driver, ID_RESOURCES_BTN)).assertEqual(ID_RESOURCES_BTN);
      expect(await idOf(driver, ID_OVERLAY_BTN)).assertEqual(ID_OVERLAY_BTN);
    });

    /**
     * @tc.name   testIndexUi0014
     * @tc.number SUB_RESMGR_UI_INDEX_0014
     * @tc.desc   同一进程内重复进入资源页都可成功，入口按钮始终可点击
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIndexUi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIndexUi0014 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await backToIndex(driver)).assertTrue();
      expect(await clickableOf(driver, ID_RESOURCES_BTN)).assertTrue();
      expect(await openResources(driver)).assertTrue();
      const title: string = await textOf(driver, ID_RESOURCES_TITLE);
      expect(title.length > 0).assertTrue();
    });
  });
}
