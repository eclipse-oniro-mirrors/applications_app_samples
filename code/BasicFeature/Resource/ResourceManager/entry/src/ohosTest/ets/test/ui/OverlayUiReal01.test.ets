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
  ID_INDEX_TITLE, ID_OVERLAY_TITLE, ID_OVERLAY_MESSAGE, ID_OVERLAY_RESOURCE_TEXT, ID_OVERLAY_IMAGE,
  ID_DISABLE_BTN, ID_ENABLE_BTN, ID_ADD_BTN, ID_REMOVE_BTN, OVERLAY_BUTTON_IDS,
  backToIndex, startApp, openOverlay, clickOverlayAction, textOf, idOf, typeOf, clickableOf, idExists, textExists
} from './UiSupport';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';
/** Initial message of a freshly created overlay page, straight from the page state. */
const INITIAL_MESSAGE: string = 'Test Overlay';
/** Action names rendered on the four buttons, they are code literals not resources. */
const ACTION_LABELS: string[] = ['disable', 'enable', 'addResource', 'removeResource'];

/**
 * Overlay page behaviour. The message after an action is checked against the
 * resource text rendered by the same page, so no translated literal is required.
 */
export default function overlayUiReal01Test() {
  describe('OverlayUiReal01Test', () => {
    beforeAll(async () => {
      const driver: Driver = Driver.create();
      await startApp(driver);
    });

    /**
     * @tc.name   testOverlayUi0001
     * @tc.number SUB_RESMGR_UI_OVERLAY_0001
     * @tc.desc   Overlay 页标题存在，节点 id 与选择器一致，文本非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0001 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      expect(await idOf(driver, ID_OVERLAY_TITLE)).assertEqual(ID_OVERLAY_TITLE);
      expect((await textOf(driver, ID_OVERLAY_TITLE)).length > 0).assertTrue();
    });

    /**
     * @tc.name   testOverlayUi0002
     * @tc.number SUB_RESMGR_UI_OVERLAY_0002
     * @tc.desc   Overlay 页标题与首页标题渲染同一个 title 资源
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0002 begin');
      const driver: Driver = Driver.create();
      expect(await backToIndex(driver)).assertTrue();
      const indexTitle: string = await textOf(driver, ID_INDEX_TITLE);
      expect(await openOverlay(driver)).assertTrue();
      expect(await textOf(driver, ID_OVERLAY_TITLE)).assertEqual(indexTitle);
    });

    /**
     * @tc.name   testOverlayUi0003
     * @tc.number SUB_RESMGR_UI_OVERLAY_0003
     * @tc.desc   新打开的 Overlay 页消息是页面初始值 Test Overlay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0003 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      expect(await idOf(driver, ID_OVERLAY_MESSAGE)).assertEqual(ID_OVERLAY_MESSAGE);
      expect(await textOf(driver, ID_OVERLAY_MESSAGE)).assertEqual(INITIAL_MESSAGE);
    });

    /**
     * @tc.name   testOverlayUi0004
     * @tc.number SUB_RESMGR_UI_OVERLAY_0004
     * @tc.desc   资源文本节点存在，id 与选择器一致，文本非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0004 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      expect(await idOf(driver, ID_OVERLAY_RESOURCE_TEXT)).assertEqual(ID_OVERLAY_RESOURCE_TEXT);
      expect((await textOf(driver, ID_OVERLAY_RESOURCE_TEXT)).length > 0).assertTrue();
    });

    /**
     * @tc.name   testOverlayUi0005
     * @tc.number SUB_RESMGR_UI_OVERLAY_0005
     * @tc.desc   初始消息与叠加后的资源文本是两个不同的取值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0005 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      const message: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      const resourceText: string = await textOf(driver, ID_OVERLAY_RESOURCE_TEXT);
      expect(message === resourceText).assertFalse();
      expect(message).assertEqual(INITIAL_MESSAGE);
      expect(resourceText.length > 0).assertTrue();
    });

    /**
     * @tc.name   testOverlayUi0006
     * @tc.number SUB_RESMGR_UI_OVERLAY_0006
     * @tc.desc   叠加图片节点存在，id 与选择器一致，类型名非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0006 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_IMAGE)).assertTrue();
      expect(await idOf(driver, ID_OVERLAY_IMAGE)).assertEqual(ID_OVERLAY_IMAGE);
      expect((await typeOf(driver, ID_OVERLAY_IMAGE)).length > 0).assertTrue();
    });

    /**
     * @tc.name   testOverlayUi0007
     * @tc.number SUB_RESMGR_UI_OVERLAY_0007
     * @tc.desc   四个动作按钮全部存在，按钮 id 与选择器逐一对应
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0007 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      let found: number = 0;
      for (let index: number = 0; index < OVERLAY_BUTTON_IDS.length; index++) {
        const id: string = OVERLAY_BUTTON_IDS[index];
        if (await idOf(driver, id) === id) {
          found++;
        }
      }
      expect(found).assertEqual(OVERLAY_BUTTON_IDS.length);
      expect(found > 0).assertTrue();
    });

    /**
     * @tc.name   testOverlayUi0008
     * @tc.number SUB_RESMGR_UI_OVERLAY_0008
     * @tc.desc   四个动作按钮都可点击
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0008 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      expect(await clickableOf(driver, ID_DISABLE_BTN)).assertTrue();
      expect(await clickableOf(driver, ID_ENABLE_BTN)).assertTrue();
      expect(await clickableOf(driver, ID_ADD_BTN)).assertTrue();
      expect(await clickableOf(driver, ID_REMOVE_BTN)).assertTrue();
    });

    /**
     * @tc.name   testOverlayUi0009
     * @tc.number SUB_RESMGR_UI_OVERLAY_0009
     * @tc.desc   四个按钮的文案按 disable/enable/addResource/removeResource 依次渲染
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0009 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      let matched: number = 0;
      for (let index: number = 0; index < ACTION_LABELS.length; index++) {
        if (await textExists(driver, ACTION_LABELS[index])) {
          matched++;
        }
      }
      expect(matched).assertEqual(ACTION_LABELS.length);
      expect(matched > 0).assertTrue();
      expect(await idExists(driver, ID_DISABLE_BTN)).assertTrue();
    });

    /**
     * @tc.name   testOverlayUi0010
     * @tc.number SUB_RESMGR_UI_OVERLAY_0010
     * @tc.desc   点击 addResource 后消息变为资源文本，与叠加文本相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0010 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ADD_BTN);
      const message: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      const resourceText: string = await textOf(driver, ID_OVERLAY_RESOURCE_TEXT);
      expect(message).assertEqual(resourceText);
      expect(message.length > 0).assertTrue();
      expect(message === INITIAL_MESSAGE).assertFalse();
    });

    /**
     * @tc.name   testOverlayUi0011
     * @tc.number SUB_RESMGR_UI_OVERLAY_0011
     * @tc.desc   点击 removeResource 后消息同样回到资源文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0011 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_REMOVE_BTN);
      const message: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      const resourceText: string = await textOf(driver, ID_OVERLAY_RESOURCE_TEXT);
      expect(message).assertEqual(resourceText);
      expect(message.length > 0).assertTrue();
    });

    /**
     * @tc.name   testOverlayUi0012
     * @tc.number SUB_RESMGR_UI_OVERLAY_0012
     * @tc.desc   点击 disable 后消息离开初始值，且不等于资源文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0012 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const message: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      const resourceText: string = await textOf(driver, ID_OVERLAY_RESOURCE_TEXT);
      expect(message.length > 0).assertTrue();
      expect(message === INITIAL_MESSAGE).assertFalse();
      expect(message === resourceText).assertFalse();
    });

    /**
     * @tc.name   testOverlayUi0013
     * @tc.number SUB_RESMGR_UI_OVERLAY_0013
     * @tc.desc   点击 enable 后消息离开初始值，且不等于资源文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0013 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      const message: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      const resourceText: string = await textOf(driver, ID_OVERLAY_RESOURCE_TEXT);
      expect(message.length > 0).assertTrue();
      expect(message === INITIAL_MESSAGE).assertFalse();
      expect(message === resourceText).assertFalse();
    });

    /**
     * @tc.name   testOverlayUi0014
     * @tc.number SUB_RESMGR_UI_OVERLAY_0014
     * @tc.desc   disable 与 enable 映射到两组不同的资源文案
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0014 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const afterDisable: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      const afterEnable: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      expect(afterDisable === afterEnable).assertFalse();
      expect(afterDisable.length > 0).assertTrue();
      expect(afterEnable.length > 0).assertTrue();
    });

    /**
     * @tc.name   testOverlayUi0015
     * @tc.number SUB_RESMGR_UI_OVERLAY_0015
     * @tc.desc   连续两次 disable 得到的消息相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0015 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const first: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const second: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      expect(second).assertEqual(first);
      expect(first.length > 0).assertTrue();
    });

    /**
     * @tc.name   testOverlayUi0016
     * @tc.number SUB_RESMGR_UI_OVERLAY_0016
     * @tc.desc   连续两次 addResource 的消息都等于资源文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0016 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ADD_BTN);
      const first: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      await clickOverlayAction(driver, ID_ADD_BTN);
      const second: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      const resourceText: string = await textOf(driver, ID_OVERLAY_RESOURCE_TEXT);
      expect(first).assertEqual(resourceText);
      expect(second).assertEqual(resourceText);
    });

    /**
     * @tc.name   testOverlayUi0017
     * @tc.number SUB_RESMGR_UI_OVERLAY_0017
     * @tc.desc   addResource 之后资源文本与图片节点仍正常渲染
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0017 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ADD_BTN);
      expect((await textOf(driver, ID_OVERLAY_RESOURCE_TEXT)).length > 0).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_IMAGE)).assertTrue();
      expect(await idOf(driver, ID_OVERLAY_RESOURCE_TEXT)).assertEqual(ID_OVERLAY_RESOURCE_TEXT);
    });

    /**
     * @tc.name   testOverlayUi0018
     * @tc.number SUB_RESMGR_UI_OVERLAY_0018
     * @tc.desc   disable 之后图片与四个按钮仍在，页面未因回调被破坏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0018 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      expect(await idExists(driver, ID_OVERLAY_IMAGE)).assertTrue();
      expect(await idExists(driver, ID_ENABLE_BTN)).assertTrue();
      expect(await idExists(driver, ID_REMOVE_BTN)).assertTrue();
    });

    /**
     * @tc.name   testOverlayUi0019
     * @tc.number SUB_RESMGR_UI_OVERLAY_0019
     * @tc.desc   Overlay 页返回后回到首页，Overlay 页节点全部退出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0019 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      expect(await backToIndex(driver)).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_TITLE)).assertFalse();
      expect(await idExists(driver, ID_OVERLAY_MESSAGE)).assertFalse();
      expect(await idExists(driver, ID_INDEX_TITLE)).assertTrue();
    });

    /**
     * @tc.name   testOverlayUi0020
     * @tc.number SUB_RESMGR_UI_OVERLAY_0020
     * @tc.desc   再次进入 Overlay 页后四个按钮与初始消息全部恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0020 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ADD_BTN);
      expect(await backToIndex(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      expect(await textOf(driver, ID_OVERLAY_MESSAGE)).assertEqual(INITIAL_MESSAGE);
    });

    /**
     * @tc.name   testOverlayUi0021
     * @tc.number SUB_RESMGR_UI_OVERLAY_0021
     * @tc.desc   Overlay 页八个节点一次性全部存在
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0021 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      const ids: string[] = [
        ID_OVERLAY_TITLE, ID_OVERLAY_MESSAGE, ID_OVERLAY_RESOURCE_TEXT, ID_OVERLAY_IMAGE,
        ID_DISABLE_BTN, ID_ENABLE_BTN, ID_ADD_BTN, ID_REMOVE_BTN
      ];
      let found: number = 0;
      for (let index: number = 0; index < ids.length; index++) {
        if (await idExists(driver, ids[index])) {
          found++;
        }
      }
      expect(found).assertEqual(ids.length);
      expect(found > 4).assertTrue();
    });

    /**
     * @tc.name   testOverlayUi0022
     * @tc.number SUB_RESMGR_UI_OVERLAY_0022
     * @tc.desc   连续三次进入/退出 Overlay 页，每次都能重新打开
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverlayUi0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOverlayUi0022 begin');
      const driver: Driver = Driver.create();
      let visits: number = 0;
      for (let round: number = 0; round < 3; round++) {
        const opened: boolean = await openOverlay(driver);
        if (opened) {
          visits++;
        }
        await backToIndex(driver);
      }
      expect(visits).assertEqual(3);
      expect(await idExists(driver, ID_INDEX_TITLE)).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_TITLE)).assertFalse();
    });
  });
}
