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
import { resourceManager } from '@kit.LocalizationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TestContextHolder } from '../utils/TestContextHolder';
import {
  ID_INDEX_TITLE, ID_RESOURCES_TITLE, ID_OVERLAY_TITLE, ID_OVERLAY_MESSAGE, ID_OVERLAY_RESOURCE_TEXT,
  ID_OVERLAY_IMAGE, ID_DISABLE_BTN, ID_ENABLE_BTN, ID_ADD_BTN, ID_REMOVE_BTN, ID_GET_DENSITY_MEDIA,
  ID_GET_SYSTEM_MEDIA, RESOURCES_VALUE_IDS, OVERLAY_BUTTON_IDS, ID_STRING_VALUE, ID_FORMAT_STRING_VALUE,
  backToIndex, startApp, openResources, openOverlay, clickOverlayAction, scrollDown, scrollUp, textOf, idOf, idExists,
  waitId
} from './UiSupport';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';
/** Message the overlay page shows before any button is pressed. */
const INITIAL_MESSAGE: string = 'Test Overlay';
const KEY_TEST_STRING: string = 'test_string';
/** Message keys the two switch actions may resolve to, success or failure. */
const ENABLE_KEYS: string[] = ['enableSuccess', 'enableFailed'];
const DISABLE_KEYS: string[] = ['unEnableSuccess', 'unEnableFailed'];
/** Nodes the overlay page renders: four buttons, the image and two texts. */
const OVERLAY_NODE_COUNT: number = OVERLAY_BUTTON_IDS.length + 4;
function messageOf(driver: Driver): Promise<string> {
  return textOf(driver, ID_OVERLAY_MESSAGE);
}

function resourceTextOf(driver: Driver): Promise<string> {
  return textOf(driver, ID_OVERLAY_RESOURCE_TEXT);
}

/** Text of a string resource of the module under test, empty when unreadable. */
async function appString(key: string): Promise<string> {
  try {
    const manager: resourceManager.ResourceManager = TestContextHolder.resourceManagerOf('entry');
    return await manager.getStringByName(key);
  } catch (error) {
    return '';
  }
}

/** True when the rendered text equals one of the real resource strings. */
async function matchesAny(value: string, keys: string[]): Promise<boolean> {
  for (let index: number = 0; index < keys.length; index++) {
    if (await appString(keys[index]) === value) {
      return true;
    }
  }
  return false;
}

/** Number of the given node ids that are on screen right now. */
async function countExisting(driver: Driver, ids: string[]): Promise<number> {
  let found: number = 0;
  for (let index: number = 0; index < ids.length; index++) {
    if (await idExists(driver, ids[index])) {
      found++;
    }
  }
  return found;
}

/** Presses back once; falls back to the full recovery path when the page is slow. */
async function backToIndexByButton(driver: Driver): Promise<boolean> {
  await driver.pressBack();
  if (await waitId(driver, ID_INDEX_TITLE, 5000)) {
    return true;
  }
  return await backToIndex(driver);
}

/**
 * Multi step UI flows: page to page round trips, button sequences on the overlay
 * page and the agreement between rendered messages and the real resource texts.
 */
export default function uiFlowReal02Test() {
  describe('UiFlowReal02Test', () => {
    beforeAll(async () => {
      const driver: Driver = Driver.create();
      await startApp(driver);
      await driver.delayMs(1000);
    });

    /**
     * @tc.name   testUiFlow0001
     * @tc.number SUB_RESMGR_UI_FLOW_0001
     * @tc.desc   资源页返回首页后资源页标题退出，首页标题恢复且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0001 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await backToIndexByButton(driver)).assertTrue();
      expect(await idExists(driver, ID_RESOURCES_TITLE)).assertFalse();
      const title: string = await textOf(driver, ID_INDEX_TITLE);
      expect(title.length > 0).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0002
     * @tc.number SUB_RESMGR_UI_FLOW_0002
     * @tc.desc   Overlay 页返回首页后 Overlay 标题与消息节点全部退出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0002 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      expect(await backToIndexByButton(driver)).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_TITLE)).assertFalse();
      expect(await idExists(driver, ID_OVERLAY_MESSAGE)).assertFalse();
    });

    /**
     * @tc.name   testUiFlow0003
     * @tc.number SUB_RESMGR_UI_FLOW_0003
     * @tc.desc   从资源页返回后直接进入 Overlay 页，Overlay 页可正常打开
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0003 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await backToIndexByButton(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      expect(await idOf(driver, ID_OVERLAY_TITLE)).assertEqual(ID_OVERLAY_TITLE);
    });

    /**
     * @tc.name   testUiFlow0004
     * @tc.number SUB_RESMGR_UI_FLOW_0004
     * @tc.desc   从 Overlay 页返回后直接进入资源页，资源页标题节点 id 正确
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0004 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      expect(await backToIndexByButton(driver)).assertTrue();
      expect(await openResources(driver)).assertTrue();
      expect(await idOf(driver, ID_RESOURCES_TITLE)).assertEqual(ID_RESOURCES_TITLE);
    });

    /**
     * @tc.name   testUiFlow0005
     * @tc.number SUB_RESMGR_UI_FLOW_0005
     * @tc.desc   连续两轮进出两个子页后，首页标题文本与起始值一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0005 begin');
      const driver: Driver = Driver.create();
      expect(await backToIndex(driver)).assertTrue();
      const start: string = await textOf(driver, ID_INDEX_TITLE);
      expect(await openResources(driver)).assertTrue();
      expect(await backToIndexByButton(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      expect(await backToIndexByButton(driver)).assertTrue();
      const end: string = await textOf(driver, ID_INDEX_TITLE);
      expect(end).assertEqual(start);
      expect(end.length > 0).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0006
     * @tc.number SUB_RESMGR_UI_FLOW_0006
     * @tc.desc   点击去使能按钮后消息等于两段去使能文案之一，且不再是初始消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0006 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const message: string = await messageOf(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'disable message=[%{public}s]', message);
      expect(message.length > 0).assertTrue();
      expect(await matchesAny(message, DISABLE_KEYS)).assertTrue();
      expect(message === INITIAL_MESSAGE).assertFalse();
    });

    /**
     * @tc.name   testUiFlow0007
     * @tc.number SUB_RESMGR_UI_FLOW_0007
     * @tc.desc   点击使能按钮后消息等于两段使能文案之一，且不再是初始消息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0007 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      const message: string = await messageOf(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'enable message=[%{public}s]', message);
      expect(message.length > 0).assertTrue();
      expect(await matchesAny(message, ENABLE_KEYS)).assertTrue();
      expect(message === INITIAL_MESSAGE).assertFalse();
    });

    /**
     * @tc.name   testUiFlow0008
     * @tc.number SUB_RESMGR_UI_FLOW_0008
     * @tc.desc   同一页面内先去使能再使能，两次消息不同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0008 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const disableMessage: string = await messageOf(driver);
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      const enableMessage: string = await messageOf(driver);
      expect(disableMessage.length > 0).assertTrue();
      expect(enableMessage.length > 0).assertTrue();
      expect(disableMessage === enableMessage).assertFalse();
    });

    /**
     * @tc.name   testUiFlow0009
     * @tc.number SUB_RESMGR_UI_FLOW_0009
     * @tc.desc   加载资源后消息、叠加文本与真实字符串资源三者相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0009 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ADD_BTN);
      const message: string = await messageOf(driver);
      const resources: string = await resourceTextOf(driver);
      const expected: string = await appString(KEY_TEST_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'message=[%{public}s] resources=[%{public}s]', message, resources);
      expect(expected.length > 0).assertTrue();
      expect(message).assertEqual(expected);
      expect(resources).assertEqual(expected);
    });

    /**
     * @tc.name   testUiFlow0010
     * @tc.number SUB_RESMGR_UI_FLOW_0010
     * @tc.desc   移除资源后消息仍等于叠加文本与真实字符串资源
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0010 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_REMOVE_BTN);
      const message: string = await messageOf(driver);
      const resources: string = await resourceTextOf(driver);
      expect(message).assertEqual(resources);
      expect(message).assertEqual(await appString(KEY_TEST_STRING));
      expect(message.length > 0).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0011
     * @tc.number SUB_RESMGR_UI_FLOW_0011
     * @tc.desc   先去使能再使能的序列中，第二步消息落在使能文案集合内
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0011 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const first: string = await messageOf(driver);
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      const second: string = await messageOf(driver);
      expect(await matchesAny(second, ENABLE_KEYS)).assertTrue();
      expect(second === first).assertFalse();
      expect(await matchesAny(first, DISABLE_KEYS)).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0012
     * @tc.number SUB_RESMGR_UI_FLOW_0012
     * @tc.desc   先使能再去使能的序列中，第二步消息落在去使能文案集合内
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0012 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      const first: string = await messageOf(driver);
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const second: string = await messageOf(driver);
      expect(await matchesAny(second, DISABLE_KEYS)).assertTrue();
      expect(second === first).assertFalse();
      expect(await matchesAny(first, ENABLE_KEYS)).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0013
     * @tc.number SUB_RESMGR_UI_FLOW_0013
     * @tc.desc   去使能、使能、再去使能三步后，第三步消息与第一步相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0013 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const first: string = await messageOf(driver);
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      const second: string = await messageOf(driver);
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const third: string = await messageOf(driver);
      expect(third).assertEqual(first);
      expect(second === third).assertFalse();
      expect(third.length > 0).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0014
     * @tc.number SUB_RESMGR_UI_FLOW_0014
     * @tc.desc   加载、移除、再加载三步的消息都等于资源文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0014 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      const expected: string = await appString(KEY_TEST_STRING);
      await clickOverlayAction(driver, ID_ADD_BTN);
      const first: string = await messageOf(driver);
      await clickOverlayAction(driver, ID_REMOVE_BTN);
      const second: string = await messageOf(driver);
      await clickOverlayAction(driver, ID_ADD_BTN);
      const third: string = await messageOf(driver);
      expect(first).assertEqual(expected);
      expect(second).assertEqual(expected);
      expect(third).assertEqual(expected);
      expect(expected.length > 0).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0015
     * @tc.number SUB_RESMGR_UI_FLOW_0015
     * @tc.desc   去使能之后加载资源，消息被资源文本覆盖，说明后一个动作生效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0015 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const first: string = await messageOf(driver);
      await clickOverlayAction(driver, ID_ADD_BTN);
      const second: string = await messageOf(driver);
      expect(second).assertEqual(await appString(KEY_TEST_STRING));
      expect(second === first).assertFalse();
      expect(second).assertEqual(await resourceTextOf(driver));
    });

    /**
     * @tc.name   testUiFlow0016
     * @tc.number SUB_RESMGR_UI_FLOW_0016
     * @tc.desc   加载资源之后点击使能，消息切回使能文案集合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0016 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ADD_BTN);
      const first: string = await messageOf(driver);
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      const second: string = await messageOf(driver);
      expect(await matchesAny(second, ENABLE_KEYS)).assertTrue();
      expect(second === first).assertFalse();
      expect(second.length > 0).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0017
     * @tc.number SUB_RESMGR_UI_FLOW_0017
     * @tc.desc   四个按钮依次点击后，最后一步消息等于资源文本而不是开关文案
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0017 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      await clickOverlayAction(driver, ID_ADD_BTN);
      await clickOverlayAction(driver, ID_REMOVE_BTN);
      const message: string = await messageOf(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'after four actions message=[%{public}s]', message);
      expect(message).assertEqual(await appString(KEY_TEST_STRING));
      expect(message === INITIAL_MESSAGE).assertFalse();
      expect(message.length > 0).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0018
     * @tc.number SUB_RESMGR_UI_FLOW_0018
     * @tc.desc   四个按钮依次点击后页面六个固定节点仍然全部存在
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0018 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      await clickOverlayAction(driver, ID_ADD_BTN);
      await clickOverlayAction(driver, ID_REMOVE_BTN);
      const nodes: string[] = [ID_OVERLAY_TITLE, ID_OVERLAY_MESSAGE, ID_OVERLAY_RESOURCE_TEXT,
        ID_OVERLAY_IMAGE, ID_DISABLE_BTN, ID_ENABLE_BTN, ID_ADD_BTN, ID_REMOVE_BTN];
      const found: number = await countExisting(driver, nodes);
      expect(found).assertEqual(nodes.length);
      expect(found).assertEqual(OVERLAY_NODE_COUNT);
      expect(await idExists(driver, ID_OVERLAY_RESOURCE_TEXT)).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0019
     * @tc.number SUB_RESMGR_UI_FLOW_0019
     * @tc.desc   连续四次动作每一步之后消息都非空，且至少出现两种不同文案
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0019 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      const buttons: string[] = [ID_DISABLE_BTN, ID_ENABLE_BTN, ID_ADD_BTN, ID_REMOVE_BTN];
      const seen: string[] = [];
      let nonEmpty: number = 0;
      for (let index: number = 0; index < buttons.length; index++) {
        await clickOverlayAction(driver, buttons[index]);
        const message: string = await messageOf(driver);
        if (message.length > 0) {
          nonEmpty++;
        }
        if (seen.indexOf(message) === -1) {
          seen.push(message);
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'non empty=%{public}d distinct=%{public}d',
        nonEmpty, seen.length);
      expect(nonEmpty).assertEqual(buttons.length);
      expect(seen.length > 1).assertTrue();
      expect(seen.indexOf(INITIAL_MESSAGE) === -1).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0020
     * @tc.number SUB_RESMGR_UI_FLOW_0020
     * @tc.desc   动作之后返回首页，Overlay 页消息与资源文本节点全部退出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0020 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ADD_BTN);
      expect(await backToIndexByButton(driver)).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_MESSAGE)).assertFalse();
      expect(await idExists(driver, ID_OVERLAY_RESOURCE_TEXT)).assertFalse();
    });

    /**
     * @tc.name   testUiFlow0021
     * @tc.number SUB_RESMGR_UI_FLOW_0021
     * @tc.desc   动作之后重新进入 Overlay 页，消息恢复为页面初始值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0021 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      expect(await backToIndexByButton(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      expect(await messageOf(driver)).assertEqual(INITIAL_MESSAGE);
      expect(await idExists(driver, ID_OVERLAY_MESSAGE)).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0022
     * @tc.number SUB_RESMGR_UI_FLOW_0022
     * @tc.desc   跨页动作不污染资源页：返回再进入后字符串取值与动作前相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0022 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const before: string = await textOf(driver, ID_STRING_VALUE);
      expect(await backToIndexByButton(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ADD_BTN);
      expect(await backToIndexByButton(driver)).assertTrue();
      expect(await openResources(driver)).assertTrue();
      const after: string = await textOf(driver, ID_STRING_VALUE);
      expect(before.length > 0).assertTrue();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.name   testUiFlow0023
     * @tc.number SUB_RESMGR_UI_FLOW_0023
     * @tc.desc   资源页上滑后密度图片与系统资源图片两个节点仍然存在
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0023 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      await scrollDown(driver);
      expect(await idExists(driver, ID_GET_DENSITY_MEDIA)).assertTrue();
      expect(await idExists(driver, ID_GET_SYSTEM_MEDIA)).assertTrue();
      expect(await idOf(driver, ID_GET_SYSTEM_MEDIA)).assertEqual(ID_GET_SYSTEM_MEDIA);
    });

    /**
     * @tc.name   testUiFlow0024
     * @tc.number SUB_RESMGR_UI_FLOW_0024
     * @tc.desc   资源页上滑并回滚到顶部后格式化字符串取值保持不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0024 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const before: string = await textOf(driver, ID_FORMAT_STRING_VALUE);
      await scrollDown(driver);
      await scrollDown(driver);
      await scrollUp(driver);
      await scrollUp(driver);
      await scrollUp(driver);
      expect(await waitId(driver, ID_STRING_VALUE, 5000)).assertTrue();
      const after: string = await textOf(driver, ID_FORMAT_STRING_VALUE);
      expect(after).assertEqual(before);
      expect(before.indexOf('%s') === -1).assertTrue();
      expect(after.length > 0).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0025
     * @tc.number SUB_RESMGR_UI_FLOW_0025
     * @tc.desc   首页到资源页回到首页再到 Overlay 动作后返回，首页标题始终不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0025 begin');
      const driver: Driver = Driver.create();
      expect(await backToIndex(driver)).assertTrue();
      const start: string = await textOf(driver, ID_INDEX_TITLE);
      expect(await openResources(driver)).assertTrue();
      expect(await backToIndexByButton(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      expect(await backToIndexByButton(driver)).assertTrue();
      expect(await textOf(driver, ID_INDEX_TITLE)).assertEqual(start);
      expect(start.length > 0).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0026
     * @tc.number SUB_RESMGR_UI_FLOW_0026
     * @tc.desc   两个子页标题互斥：进入任一页时另一页的标题节点都不在屏幕上
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0026 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_TITLE)).assertFalse();
      expect(await idExists(driver, ID_OVERLAY_MESSAGE)).assertFalse();
      expect(await backToIndexByButton(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      expect(await idExists(driver, ID_RESOURCES_TITLE)).assertFalse();
    });

    /**
     * @tc.name   testUiFlow0027
     * @tc.number SUB_RESMGR_UI_FLOW_0027
     * @tc.desc   连续三轮进出资源页，字符串取值每轮都非空且完全相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0027 begin');
      const driver: Driver = Driver.create();
      const values: string[] = [];
      for (let round: number = 0; round < 3; round++) {
        expect(await openResources(driver)).assertTrue();
        values.push(await textOf(driver, ID_STRING_VALUE));
        expect(await backToIndexByButton(driver)).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'three rounds collected %{public}d values', values.length);
      expect(values.length).assertEqual(3);
      expect(values[1]).assertEqual(values[0]);
      expect(values[2]).assertEqual(values[0]);
      expect(values[0].length > 0).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0028
     * @tc.number SUB_RESMGR_UI_FLOW_0028
     * @tc.desc   连续三轮进出 Overlay 页，每次打开时消息都是初始值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0028 begin');
      const driver: Driver = Driver.create();
      let initialCount: number = 0;
      for (let round: number = 0; round < 3; round++) {
        expect(await openOverlay(driver)).assertTrue();
        if ((await messageOf(driver)) === INITIAL_MESSAGE) {
          initialCount++;
        }
        expect(await backToIndexByButton(driver)).assertTrue();
      }
      expect(initialCount).assertEqual(3);
      expect(INITIAL_MESSAGE.length > 0).assertTrue();
      expect(await backToIndex(driver)).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0029
     * @tc.number SUB_RESMGR_UI_FLOW_0029
     * @tc.desc   动作前后去使能按钮的节点 id 与可点击性保持不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0029 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      const beforeId: string = await idOf(driver, ID_DISABLE_BTN);
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const afterId: string = await idOf(driver, ID_DISABLE_BTN);
      expect(afterId).assertEqual(beforeId);
      expect(afterId).assertEqual(ID_DISABLE_BTN);
      expect(await idExists(driver, ID_ENABLE_BTN)).assertTrue();
    });

    /**
     * @tc.name   testUiFlow0030
     * @tc.number SUB_RESMGR_UI_FLOW_0030
     * @tc.desc   资源页十个取值节点全部存在而 Overlay 页节点全退出，切到 Overlay 页后结论相反
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow0030 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const resourceNodes: number = await countExisting(driver, RESOURCES_VALUE_IDS);
      const overlayNodesOnResources: number = await countExisting(driver, OVERLAY_BUTTON_IDS);
      expect(resourceNodes).assertEqual(RESOURCES_VALUE_IDS.length);
      expect(overlayNodesOnResources).assertEqual(0);
      expect(await backToIndexByButton(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      const overlayNodes: number = await countExisting(driver, OVERLAY_BUTTON_IDS);
      const resourceNodesOnOverlay: number = await countExisting(driver, RESOURCES_VALUE_IDS);
      expect(overlayNodes).assertEqual(OVERLAY_BUTTON_IDS.length);
      expect(resourceNodesOnOverlay).assertEqual(0);
      expect(overlayNodes).assertEqual(4);
    });
  });
}
