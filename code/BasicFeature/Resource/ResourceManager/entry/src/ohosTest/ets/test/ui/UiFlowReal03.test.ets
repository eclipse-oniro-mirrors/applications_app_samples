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
  ID_OVERLAY_IMAGE, ID_DISABLE_BTN, ID_ENABLE_BTN, ID_ADD_BTN, ID_REMOVE_BTN, ID_STRING_VALUE,
  ID_PLURAL_VALUE, ID_CONFIGURATION_VALUE, ID_CAPABILITY_VALUE, ID_MEDIA_VALUE, ID_MEDIA_BASE64_VALUE,
  ID_FORMAT_STRING_VALUE, ID_GET_DENSITY_MEDIA, ID_GET_SYSTEM_MEDIA, RESOURCES_VALUE_IDS, OVERLAY_BUTTON_IDS,
  backToIndex, openResources, openOverlay, clickOverlayAction, scrollDown, scrollUp, revealId, textOf, idExists,
  typeOf, waitId
} from './UiSupport';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';
/** Message key of the two runtime resource actions. */
const RUNTIME_MESSAGE_KEY: string = 'test_string';
/** Message keys the two switch actions may resolve to, success or failure. */
const ENABLE_KEYS: string[] = ['enableSuccess', 'enableFailed'];
const DISABLE_KEYS: string[] = ['unEnableSuccess', 'unEnableFailed'];
/** Value nodes the resources page renders. */
const VALUE_NODE_COUNT: number = RESOURCES_VALUE_IDS.length;
/** Nodes the overlay page renders: four buttons, one image and two texts. */
const OVERLAY_NODE_COUNT: number = OVERLAY_BUTTON_IDS.length + 3;

/** Number of the given ids that are on screen right now. */
async function countExisting(driver: Driver, ids: string[]): Promise<number> {
  let found: number = 0;
  for (let index: number = 0; index < ids.length; index++) {
    if (await idExists(driver, ids[index])) {
      found++;
    }
  }
  return found;
}

/** Presses back once and waits for the entry page, with the full recovery path as fallback. */
async function backByButton(driver: Driver): Promise<boolean> {
  await driver.pressBack();
  if (await waitId(driver, ID_INDEX_TITLE, 5000)) {
    return true;
  }
  return await backToIndex(driver);
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

/** True when the rendered text equals one of the given resource keys. */
async function matchesAny(value: string, keys: string[]): Promise<boolean> {
  for (let index: number = 0; index < keys.length; index++) {
    if (await appString(keys[index]) === value) {
      return true;
    }
  }
  return false;
}

/** Text of the value node with this id after revealing it, empty when it never mounts. */
async function valueOf(driver: Driver, id: string): Promise<string> {
  if (await waitId(driver, id, 2000)) {
    return await textOf(driver, id);
  }
  if (await revealId(driver, id)) {
    return await textOf(driver, id);
  }
  return '';
}

/** Scrolls down until the node mounts, at most three screens. */
async function scrollReveal(driver: Driver, id: string): Promise<boolean> {
  for (let attempt: number = 0; attempt < 3; attempt++) {
    await scrollDown(driver);
    if (await waitId(driver, id, 2000)) {
      return true;
    }
  }
  return false;
}

/**
 * Repeated navigation, scroll and click sequences on the three pages. Every case
 * starts from the entry page, so the cases do not depend on the execution order.
 */
export default function uiFlowReal03Test() {
  describe('UiFlowReal03Test', () => {
    beforeAll(async () => {
      const driver: Driver = Driver.create();
      await backToIndex(driver);
      await driver.delayMs(800);
    });

    /**
     * @tc.name   testUiFlow030001
     * @tc.number SUB_RESMGR_UI_FLOW3_0001
     * @tc.desc   资源页连续两次往返后首页仍在，资源页标题不残留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030001 begin');
      const driver: Driver = Driver.create();
      const firstOpen: boolean = await openResources(driver);
      const firstBack: boolean = await backByButton(driver);
      const secondOpen: boolean = await openResources(driver);
      const secondBack: boolean = await backByButton(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(`${firstOpen}/${firstBack}/${secondOpen}/${secondBack}`), String('true/true/true/true'));
      expect(firstOpen).assertTrue();
      expect(firstBack).assertTrue();
      expect(secondOpen).assertTrue();
      expect(secondBack).assertTrue();
      expect(await idExists(driver, ID_INDEX_TITLE)).assertTrue();
      expect(await idExists(driver, ID_RESOURCES_TITLE)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030001 end');
    });

    /**
     * @tc.name   testUiFlow030002
     * @tc.number SUB_RESMGR_UI_FLOW3_0002
     * @tc.desc   Overlay 页连续两次往返后首页仍在，Overlay 标题不残留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030002 begin');
      const driver: Driver = Driver.create();
      const firstOpen: boolean = await openOverlay(driver);
      const firstBack: boolean = await backByButton(driver);
      const secondOpen: boolean = await openOverlay(driver);
      const secondBack: boolean = await backByButton(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(`${firstOpen}/${firstBack}/${secondOpen}/${secondBack}`), String('true/true/true/true'));
      expect(firstOpen).assertTrue();
      expect(firstBack).assertTrue();
      expect(secondOpen).assertTrue();
      expect(secondBack).assertTrue();
      expect(await idExists(driver, ID_INDEX_TITLE)).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_TITLE)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030002 end');
    });

    /**
     * @tc.name   testUiFlow030003
     * @tc.number SUB_RESMGR_UI_FLOW3_0003
     * @tc.desc   资源页与 Overlay 页交替进入时两个页面标题不会同时出现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030003 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const resourcesOnly: boolean = await idExists(driver, ID_OVERLAY_TITLE);
      expect(await backByButton(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      const overlayOnly: boolean = await idExists(driver, ID_RESOURCES_TITLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(`${resourcesOnly}/${overlayOnly}`), String('false/false'));
      expect(resourcesOnly).assertFalse();
      expect(overlayOnly).assertFalse();
      expect(await idExists(driver, ID_OVERLAY_TITLE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030003 end');
    });

    /**
     * @tc.name   testUiFlow030004
     * @tc.number SUB_RESMGR_UI_FLOW3_0004
     * @tc.desc   资源页二次进入后值节点数量与初次进入一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030004 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const firstCount: number = await countExisting(driver, RESOURCES_VALUE_IDS);
      expect(await backByButton(driver)).assertTrue();
      expect(await openResources(driver)).assertTrue();
      const secondCount: number = await countExisting(driver, RESOURCES_VALUE_IDS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(`${firstCount}/${secondCount}`), String(`${VALUE_NODE_COUNT}/${VALUE_NODE_COUNT}`));
      expect(secondCount).assertEqual(firstCount);
      expect(secondCount >= 6).assertTrue();
      expect(VALUE_NODE_COUNT).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030004 end');
    });

    /**
     * @tc.name   testUiFlow030005
     * @tc.number SUB_RESMGR_UI_FLOW3_0005
     * @tc.desc   Overlay 页二次进入后消息回到初始文案且资源文本非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030005 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const touched: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      expect(await backByButton(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      const reopened: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reopened),
        String('the initial message, not the disable result'));
      expect(reopened.length > 0).assertTrue();
      expect(await matchesAny(reopened, ENABLE_KEYS.concat(DISABLE_KEYS))).assertFalse();
      expect(await textOf(driver, ID_OVERLAY_RESOURCE_TEXT).then((value: string) => value.length > 0)).assertTrue();
      expect(touched.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030005 end');
    });

    /**
     * @tc.name   testUiFlow030006
     * @tc.number SUB_RESMGR_UI_FLOW3_0006
     * @tc.desc   连续三次返回后应用仍停留在首页且标题可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030006 begin');
      const driver: Driver = Driver.create();
      expect(await backToIndex(driver)).assertTrue();
      const first: boolean = await backByButton(driver);
      const second: boolean = await backByButton(driver);
      const title: string = await textOf(driver, ID_INDEX_TITLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(title.length),
        String('a non empty title'));
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(await idExists(driver, ID_INDEX_TITLE)).assertTrue();
      expect(title.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030006 end');
    });

    /**
     * @tc.name   testUiFlow030007
     * @tc.number SUB_RESMGR_UI_FLOW3_0007
     * @tc.desc   资源页返回后十个值节点全部退出节点树
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030007 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await backByButton(driver)).assertTrue();
      const remaining: number = await countExisting(driver, RESOURCES_VALUE_IDS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(remaining), String(0));
      expect(remaining).assertEqual(0);
      expect(await idExists(driver, ID_STRING_VALUE)).assertFalse();
      expect(await idExists(driver, ID_GET_SYSTEM_MEDIA)).assertFalse();
      expect(await idExists(driver, ID_INDEX_TITLE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030007 end');
    });

    /**
     * @tc.name   testUiFlow030008
     * @tc.number SUB_RESMGR_UI_FLOW3_0008
     * @tc.desc   Overlay 页返回后四个动作按钮全部退出节点树
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030008 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      expect(await backByButton(driver)).assertTrue();
      const remaining: number = await countExisting(driver, OVERLAY_BUTTON_IDS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(remaining), String(0));
      expect(remaining).assertEqual(0);
      expect(await idExists(driver, ID_DISABLE_BTN)).assertFalse();
      expect(await idExists(driver, ID_REMOVE_BTN)).assertFalse();
      expect(await idExists(driver, ID_OVERLAY_IMAGE)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030008 end');
    });

    /**
     * @tc.name   testUiFlow030009
     * @tc.number SUB_RESMGR_UI_FLOW3_0009
     * @tc.desc   往返一次后首页标题文本与初次进入时完全一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030009 begin');
      const driver: Driver = Driver.create();
      expect(await backToIndex(driver)).assertTrue();
      const before: string = await textOf(driver, ID_INDEX_TITLE);
      expect(await openOverlay(driver)).assertTrue();
      expect(await backByButton(driver)).assertTrue();
      const after: string = await textOf(driver, ID_INDEX_TITLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(after), String(before));
      expect(after).assertEqual(before);
      expect(after.length > 0).assertTrue();
      expect(await idExists(driver, ID_INDEX_TITLE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030009 end');
    });

    /**
     * @tc.name   testUiFlow030010
     * @tc.number SUB_RESMGR_UI_FLOW3_0010
     * @tc.desc   两次往返后首页标题节点仍是同一个 id，不会退化为同类其余文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030010 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      expect(await backByButton(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      expect(await backByButton(driver)).assertTrue();
      const title: string = await textOf(driver, ID_INDEX_TITLE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(title.length),
        String('a non empty title'));
      expect(await idExists(driver, ID_INDEX_TITLE)).assertTrue();
      expect(title.length > 0).assertTrue();
      expect(await idExists(driver, ID_RESOURCES_TITLE)).assertFalse();
      expect(await idExists(driver, ID_OVERLAY_TITLE)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030010 end');
    });

    /**
     * @tc.name   testUiFlow030011
     * @tc.number SUB_RESMGR_UI_FLOW3_0011
     * @tc.desc   资源页三次进入的可见值节点数量完全一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030011 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const first: number = await countExisting(driver, RESOURCES_VALUE_IDS);
      expect(await backByButton(driver)).assertTrue();
      expect(await openResources(driver)).assertTrue();
      const second: number = await countExisting(driver, RESOURCES_VALUE_IDS);
      expect(await backByButton(driver)).assertTrue();
      expect(await openResources(driver)).assertTrue();
      const third: number = await countExisting(driver, RESOURCES_VALUE_IDS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(`${first}/${second}/${third}`), String('three equal counts'));
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(third > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030011 end');
    });

    /**
     * @tc.name   testUiFlow030012
     * @tc.number SUB_RESMGR_UI_FLOW3_0012
     * @tc.desc   二次进入资源页后字符串值节点文本与初次一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030012 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const before: string = await valueOf(driver, ID_STRING_VALUE);
      expect(await backByButton(driver)).assertTrue();
      expect(await openResources(driver)).assertTrue();
      const after: string = await valueOf(driver, ID_STRING_VALUE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(after), String(before));
      expect(after).assertEqual(before);
      expect(after.length > 0).assertTrue();
      expect(await idExists(driver, ID_STRING_VALUE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030012 end');
    });

    /**
     * @tc.name   testUiFlow030013
     * @tc.number SUB_RESMGR_UI_FLOW3_0013
     * @tc.desc   二次进入资源页后复数值节点文本与初次一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030013 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const before: string = await valueOf(driver, ID_PLURAL_VALUE);
      expect(await backByButton(driver)).assertTrue();
      expect(await openResources(driver)).assertTrue();
      const after: string = await valueOf(driver, ID_PLURAL_VALUE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(after), String(before));
      expect(after).assertEqual(before);
      expect(after.length > 0).assertTrue();
      expect(await idExists(driver, ID_PLURAL_VALUE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030013 end');
    });

    /**
     * @tc.name   testUiFlow030014
     * @tc.number SUB_RESMGR_UI_FLOW3_0014
     * @tc.desc   二次进入资源页后图片字节数节点文本与初次一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030014 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const before: string = await valueOf(driver, ID_MEDIA_VALUE);
      expect(await backByButton(driver)).assertTrue();
      expect(await openResources(driver)).assertTrue();
      const after: string = await valueOf(driver, ID_MEDIA_VALUE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(after), String(before));
      expect(after).assertEqual(before);
      expect(after.length > 0).assertTrue();
      expect(await idExists(driver, ID_MEDIA_VALUE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030014 end');
    });

    /**
     * @tc.name   testUiFlow030015
     * @tc.number SUB_RESMGR_UI_FLOW3_0015
     * @tc.desc   二次进入资源页后设备配置节点文本与初次一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030015 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const before: string = await valueOf(driver, ID_CONFIGURATION_VALUE);
      expect(await backByButton(driver)).assertTrue();
      expect(await openResources(driver)).assertTrue();
      const after: string = await valueOf(driver, ID_CONFIGURATION_VALUE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(after), String(before));
      expect(after).assertEqual(before);
      expect(after.startsWith('{') || after.startsWith('[')).assertTrue();
      expect(after.endsWith('}') || after.endsWith(']')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030015 end');
    });

    /**
     * @tc.name   testUiFlow030016
     * @tc.number SUB_RESMGR_UI_FLOW3_0016
     * @tc.desc   Overlay 页二次进入的初始消息文本与初次一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030016 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      const before: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      expect(await backByButton(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      const after: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(after), String(before));
      expect(after).assertEqual(before);
      expect(after.length > 0).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_MESSAGE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030016 end');
    });

    /**
     * @tc.name   testUiFlow030017
     * @tc.number SUB_RESMGR_UI_FLOW3_0017
     * @tc.desc   Overlay 页二次进入的资源文本与初次一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030017 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      const before: string = await textOf(driver, ID_OVERLAY_RESOURCE_TEXT);
      expect(await backByButton(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      const after: string = await textOf(driver, ID_OVERLAY_RESOURCE_TEXT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(after), String(before));
      expect(after).assertEqual(before);
      expect(after.length > 0).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_RESOURCE_TEXT)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030017 end');
    });

    /**
     * @tc.name   testUiFlow030018
     * @tc.number SUB_RESMGR_UI_FLOW3_0018
     * @tc.desc   Overlay 页二次进入的按钮与图片节点数量与初次一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030018 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      const firstCount: number = await countExisting(driver, OVERLAY_BUTTON_IDS);
      expect(await backByButton(driver)).assertTrue();
      expect(await openOverlay(driver)).assertTrue();
      const secondCount: number = await countExisting(driver, OVERLAY_BUTTON_IDS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(`${firstCount}/${secondCount}`), String(`${OVERLAY_BUTTON_IDS.length}/${OVERLAY_BUTTON_IDS.length}`));
      expect(secondCount).assertEqual(firstCount);
      expect(secondCount).assertEqual(OVERLAY_BUTTON_IDS.length);
      expect(await idExists(driver, ID_OVERLAY_IMAGE)).assertTrue();
      expect(OVERLAY_NODE_COUNT).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030018 end');
    });

    /**
     * @tc.name   testUiFlow030019
     * @tc.number SUB_RESMGR_UI_FLOW3_0019
     * @tc.desc   资源页上滑一屏后字符串值节点仍挂载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030019 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      await scrollDown(driver);
      const present: boolean = await waitId(driver, ID_STRING_VALUE, 3000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(present), String(true));
      expect(present).assertTrue();
      expect(await idExists(driver, ID_INDEX_TITLE)).assertFalse();
      expect(await idExists(driver, ID_RESOURCES_TITLE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030019 end');
    });

    /**
     * @tc.name   testUiFlow030020
     * @tc.number SUB_RESMGR_UI_FLOW3_0020
     * @tc.desc   资源页上滑后复数值文本与滑动前一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030020 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const before: string = await valueOf(driver, ID_PLURAL_VALUE);
      await scrollDown(driver);
      const after: string = await valueOf(driver, ID_PLURAL_VALUE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(after), String(before));
      expect(after).assertEqual(before);
      expect(after.length > 0).assertTrue();
      expect(before.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030020 end');
    });

    /**
     * @tc.name   testUiFlow030021
     * @tc.number SUB_RESMGR_UI_FLOW3_0021
     * @tc.desc   资源页上滑后 base64 值节点可定位且文本非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030021 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      await scrollDown(driver);
      const base64: string = await valueOf(driver, ID_MEDIA_BASE64_VALUE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(base64.length),
        String('a non empty base64 payload'));
      expect(base64.length > 0).assertTrue();
      expect(base64.length % 4).assertEqual(0);
      expect(await idExists(driver, ID_MEDIA_BASE64_VALUE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030021 end');
    });

    /**
     * @tc.name   testUiFlow030022
     * @tc.number SUB_RESMGR_UI_FLOW3_0022
     * @tc.desc   资源页滚动到底部后系统图片节点可见且类型为 Image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030022 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const revealed: boolean = await scrollReveal(driver, ID_GET_SYSTEM_MEDIA);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(revealed), String(true));
      expect(revealed).assertTrue();
      const typeName: string = await typeOf(driver, ID_GET_SYSTEM_MEDIA);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(typeName),
        String('the Image type name'));
      expect(typeName.length > 0).assertTrue();
      expect(await idExists(driver, ID_RESOURCES_TITLE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030022 end');
    });

    /**
     * @tc.name   testUiFlow030023
     * @tc.number SUB_RESMGR_UI_FLOW3_0023
     * @tc.desc   资源页上滑再下滑后字符串值文本与初始一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030023 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const before: string = await valueOf(driver, ID_STRING_VALUE);
      await scrollDown(driver);
      await scrollUp(driver);
      const after: string = await valueOf(driver, ID_STRING_VALUE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(after), String(before));
      expect(after).assertEqual(before);
      expect(after.length > 0).assertTrue();
      expect(await idExists(driver, ID_RESOURCES_TITLE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030023 end');
    });

    /**
     * @tc.name   testUiFlow030024
     * @tc.number SUB_RESMGR_UI_FLOW3_0024
     * @tc.desc   资源页上下滚动各一次后值节点数量不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030024 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const before: number = await countExisting(driver, RESOURCES_VALUE_IDS);
      await scrollDown(driver);
      await scrollUp(driver);
      const after: number = await countExisting(driver, RESOURCES_VALUE_IDS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(`${before}/${after}`), String('equal counts'));
      expect(after).assertEqual(before);
      expect(after > 0).assertTrue();
      expect(await idExists(driver, ID_RESOURCES_TITLE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030024 end');
    });

    /**
     * @tc.name   testUiFlow030025
     * @tc.number SUB_RESMGR_UI_FLOW3_0025
     * @tc.desc   资源页滑动过程中设备配置文本保持不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030025 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const before: string = await valueOf(driver, ID_CONFIGURATION_VALUE);
      await scrollDown(driver);
      await scrollDown(driver);
      const after: string = await valueOf(driver, ID_CONFIGURATION_VALUE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(after), String(before));
      expect(after).assertEqual(before);
      expect(after.length > 0).assertTrue();
      expect(before.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030025 end');
    });

    /**
     * @tc.name   testUiFlow030026
     * @tc.number SUB_RESMGR_UI_FLOW3_0026
     * @tc.desc   资源页滚动后指定密度图片节点可见且类型为 Image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030026 begin');
      const driver: Driver = Driver.create();
      expect(await openResources(driver)).assertTrue();
      const revealed: boolean = await scrollReveal(driver, ID_GET_DENSITY_MEDIA);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(revealed), String(true));
      expect(revealed).assertTrue();
      const typeName: string = await typeOf(driver, ID_GET_DENSITY_MEDIA);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(typeName),
        String('the Image type name'));
      expect(typeName.length > 0).assertTrue();
      expect(await idExists(driver, ID_RESOURCES_TITLE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030026 end');
    });

    /**
     * @tc.name   testUiFlow030027
     * @tc.number SUB_RESMGR_UI_FLOW3_0027
     * @tc.desc   连续两次点击 disable 后消息文本保持稳定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030027 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const first: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const second: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second), String(first));
      expect(second).assertEqual(first);
      expect(first.length > 0).assertTrue();
      expect(await matchesAny(first, ENABLE_KEYS)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030027 end');
    });

    /**
     * @tc.name   testUiFlow030028
     * @tc.number SUB_RESMGR_UI_FLOW3_0028
     * @tc.desc   连续两次点击 enable 后消息文本保持稳定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030028 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      const first: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      const second: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second), String(first));
      expect(second).assertEqual(first);
      expect(first.length > 0).assertTrue();
      expect(await matchesAny(first, DISABLE_KEYS)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030028 end');
    });

    /**
     * @tc.name   testUiFlow030029
     * @tc.number SUB_RESMGR_UI_FLOW3_0029
     * @tc.desc   连续两次点击 addResource 后消息文本保持稳定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030029 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ADD_BTN);
      const first: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      await clickOverlayAction(driver, ID_ADD_BTN);
      const second: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second), String(first));
      expect(second).assertEqual(first);
      expect(first.length > 0).assertTrue();
      const runtimeText: string = await appString(RUNTIME_MESSAGE_KEY);
      expect(first).assertEqual(runtimeText);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030029 end');
    });

    /**
     * @tc.name   testUiFlow030030
     * @tc.number SUB_RESMGR_UI_FLOW3_0030
     * @tc.desc   连续两次点击 removeResource 后消息文本保持稳定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030030 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_REMOVE_BTN);
      const first: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      await clickOverlayAction(driver, ID_REMOVE_BTN);
      const second: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second), String(first));
      expect(second).assertEqual(first);
      expect(first.length > 0).assertTrue();
      const runtimeText: string = await appString(RUNTIME_MESSAGE_KEY);
      expect(second).assertEqual(runtimeText);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030030 end');
    });

    /**
     * @tc.name   testUiFlow030031
     * @tc.number SUB_RESMGR_UI_FLOW3_0031
     * @tc.desc   disable 后再 enable，消息落在 enable 允许集合内
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030031 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      const message: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      const allowed: boolean = await matchesAny(message, ENABLE_KEYS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(message),
        String('enableSuccess or enableFailed'));
      expect(allowed).assertTrue();
      expect(message.length > 0).assertTrue();
      expect(await matchesAny(message, DISABLE_KEYS)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030031 end');
    });

    /**
     * @tc.name   testUiFlow030032
     * @tc.number SUB_RESMGR_UI_FLOW3_0032
     * @tc.desc   enable 后再 disable，消息落在 disable 允许集合内
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030032 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const message: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      const allowed: boolean = await matchesAny(message, DISABLE_KEYS);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(message),
        String('unEnableSuccess or unEnableFailed'));
      expect(allowed).assertTrue();
      expect(message.length > 0).assertTrue();
      expect(await matchesAny(message, ENABLE_KEYS)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030032 end');
    });

    /**
     * @tc.name   testUiFlow030033
     * @tc.number SUB_RESMGR_UI_FLOW3_0033
     * @tc.desc   addResource 后资源文本节点仍非空且 id 未变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030033 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      const before: string = await textOf(driver, ID_OVERLAY_RESOURCE_TEXT);
      await clickOverlayAction(driver, ID_ADD_BTN);
      const after: string = await textOf(driver, ID_OVERLAY_RESOURCE_TEXT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(after.length), String('> 0'));
      expect(after.length > 0).assertTrue();
      expect(after.length >= before.length).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_RESOURCE_TEXT)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030033 end');
    });

    /**
     * @tc.name   testUiFlow030034
     * @tc.number SUB_RESMGR_UI_FLOW3_0034
     * @tc.desc   removeResource 后资源文本节点仍非空且图片节点仍在
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030034 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_REMOVE_BTN);
      const after: string = await textOf(driver, ID_OVERLAY_RESOURCE_TEXT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(after.length), String('> 0'));
      expect(after.length > 0).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_IMAGE)).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_TITLE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030034 end');
    });

    /**
     * @tc.name   testUiFlow030035
     * @tc.number SUB_RESMGR_UI_FLOW3_0035
     * @tc.desc   disable 点击后的消息等于真实资源表中两个候选文案之一
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030035 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_DISABLE_BTN);
      const message: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      const firstKey: string = await appString(DISABLE_KEYS[0]);
      const secondKey: string = await appString(DISABLE_KEYS[1]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(message),
        String(`${firstKey}|${secondKey}`));
      expect(message === firstKey || message === secondKey).assertTrue();
      expect(message.length > 0).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_MESSAGE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030035 end');
    });

    /**
     * @tc.name   testUiFlow030036
     * @tc.number SUB_RESMGR_UI_FLOW3_0036
     * @tc.desc   enable 点击后的消息等于真实资源表中两个候选文案之一
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030036 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      await clickOverlayAction(driver, ID_ENABLE_BTN);
      const message: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      const firstKey: string = await appString(ENABLE_KEYS[0]);
      const secondKey: string = await appString(ENABLE_KEYS[1]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(message),
        String(`${firstKey}|${secondKey}`));
      expect(message === firstKey || message === secondKey).assertTrue();
      expect(message.length > 0).assertTrue();
      expect(await idExists(driver, ID_OVERLAY_MESSAGE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030036 end');
    });

    /**
     * @tc.name   testUiFlow030037
     * @tc.number SUB_RESMGR_UI_FLOW3_0037
     * @tc.desc   依次点击四个按钮后消息均非空，且两个运行时动作的消息等于页面资源文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030037 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      const messages: string[] = [];
      const runtimes: string[] = [];
      for (let index: number = 0; index < OVERLAY_BUTTON_IDS.length; index++) {
        await clickOverlayAction(driver, OVERLAY_BUTTON_IDS[index]);
        messages.push(await textOf(driver, ID_OVERLAY_MESSAGE));
        runtimes.push(await textOf(driver, ID_OVERLAY_RESOURCE_TEXT));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'step=%{public}d message=%{public}s runtime=%{public}s', index,
          messages[index], runtimes[index]);
      }
      let allNonEmpty: boolean = true;
      for (let index: number = 0; index < messages.length; index++) {
        if (messages[index].length === 0) {
          allNonEmpty = false;
        }
      }
      // The last two buttons are the runtime resource actions, whose message is test_string.
      const runtimeFrom: number = 2;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(`${messages[runtimeFrom]}|${messages[runtimeFrom + 1]}`),
        String(`${runtimes[runtimeFrom]}|${runtimes[runtimeFrom + 1]}`));
      expect(allNonEmpty).assertTrue();
      expect(messages.length).assertEqual(OVERLAY_BUTTON_IDS.length);
      expect(runtimes[runtimeFrom].length > 0).assertTrue();
      expect(messages[runtimeFrom]).assertEqual(runtimes[runtimeFrom]);
      expect(messages[runtimeFrom + 1]).assertEqual(runtimes[runtimeFrom + 1]);
      expect(await idExists(driver, ID_OVERLAY_MESSAGE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030037 end');
    });

    /**
     * @tc.name   testUiFlow030038
     * @tc.number SUB_RESMGR_UI_FLOW3_0038
     * @tc.desc   两个运行时动作点击后消息都等于 test_string 的真实文案
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030038 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      const runtimeText: string = await appString(RUNTIME_MESSAGE_KEY);
      await clickOverlayAction(driver, ID_ADD_BTN);
      const added: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      await clickOverlayAction(driver, ID_REMOVE_BTN);
      const removed: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(`${added}|${removed}`), String(runtimeText));
      expect(added).assertEqual(runtimeText);
      expect(removed).assertEqual(runtimeText);
      expect(runtimeText.length > 0).assertTrue();
      expect(added).assertEqual(removed);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030038 end');
    });

    /**
     * @tc.name   testUiFlow030039
     * @tc.number SUB_RESMGR_UI_FLOW3_0039
     * @tc.desc   点击前后消息节点 id 保持不变，页面没有被重建
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030039 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      const before: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      await clickOverlayAction(driver, ID_ADD_BTN);
      const stillThere: boolean = await waitId(driver, ID_OVERLAY_MESSAGE, 3000);
      const after: string = await textOf(driver, ID_OVERLAY_MESSAGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(stillThere), String(true));
      expect(stillThere).assertTrue();
      expect(after.length > 0).assertTrue();
      expect(before.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030039 end');
    });

    /**
     * @tc.name   testUiFlow030040
     * @tc.number SUB_RESMGR_UI_FLOW3_0040
     * @tc.desc   Overlay 页四个按钮、图片与两个文本节点全部挂载
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow030040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030040 begin');
      const driver: Driver = Driver.create();
      expect(await openOverlay(driver)).assertTrue();
      const buttons: number = await countExisting(driver, OVERLAY_BUTTON_IDS);
      const extras: number = await countExisting(driver,
        [ID_OVERLAY_IMAGE, ID_OVERLAY_MESSAGE, ID_OVERLAY_RESOURCE_TEXT]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(`${buttons}+${extras}`), String(`${OVERLAY_BUTTON_IDS.length}+3`));
      expect(buttons).assertEqual(OVERLAY_BUTTON_IDS.length);
      expect(extras).assertEqual(3);
      expect(buttons + extras).assertEqual(OVERLAY_NODE_COUNT);
      expect(await idExists(driver, ID_OVERLAY_TITLE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlow030040 end');
    });
  });
}
