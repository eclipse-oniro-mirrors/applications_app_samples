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
import { commonEventManager } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import { CommonEventPublisher } from '../../../main/ets/feature/CommonEventPublisher';
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import {
  clickById,
  delay,
  EventCollector,
  isComponentExists,
  logBegin,
  logEnd,
  logPair,
  logStep,
  sleep,
  startHomeAbility,
  tryGetTextById,
  UI_IDLE_TIME,
  waitForComponent,
  waitForComponentAbsent,
  waitForTextById,
  waitForTextChanged
} from '../util/TestHelper';

const HOME_OPEN_DELAY: number = 1000;
const SUBSCRIBE_DELAY: number = 300;
const ID_HOME_TITLE: string = 'home_title';
const ID_EVENT_NAME: string = 'event_name_text';
const ID_PUBLISHER: string = 'publisher_text';
const ID_WIDGET: string = 'widget_text';
const ID_PERMISSION: string = 'permission_text';
const ID_SUBSCRIBE_STATE: string = 'subscribe_state_text';
const ID_RECEIVED_COUNT: string = 'received_count_text';
const ID_LAST_DATA: string = 'last_event_data_text';
const ID_LAST_SOURCE: string = 'last_event_source_text';
const ID_STATUS: string = 'status_text';
const ID_SUBSCRIBE_BUTTON: string = 'subscribe_button';
const ID_PUBLISH_BUTTON: string = 'publish_button';
const ID_CLEAR_BUTTON: string = 'clear_button';
const ID_EMPTY_TEXT: string = 'empty_text';
const ID_FIRST_ITEM: string = 'event_item_1';
const ID_SECOND_ITEM: string = 'event_item_2';

/**
 * Opens the home page of this sample and waits until it is rendered.
 */
async function openHomePage(driver: Driver): Promise<void> {
  await startHomeAbility();
  await delay(driver, HOME_OPEN_DELAY);
}

/**
 * Clears the received records through the clear button.
 */
async function resetRecords(driver: Driver): Promise<boolean> {
  let clicked: boolean = await clickById(driver, ID_CLEAR_BUTTON);
  if (!clicked) {
    return false;
  }
  await delay(driver, UI_IDLE_TIME);
  return await waitForTextById(driver, ID_RECEIVED_COUNT, '0');
}

/**
 * Clicks the publish button and waits until the received count reaches the expected value.
 */
async function publishViaButton(driver: Driver, expectedCount: number): Promise<boolean> {
  let clicked: boolean = await clickById(driver, ID_PUBLISH_BUTTON);
  if (!clicked) {
    return false;
  }
  return await waitForTextById(driver, ID_RECEIVED_COUNT, expectedCount.toString());
}

/**
 * Verifies the home page of this sample, which is the entry of the subscription and publishing features.
 */
export default function homeUiTest() {
  describe('HomeUiTest', () => {
    let driver: Driver = Driver.create();

    /**
     * @tc.number    SUB_CCER_UI_0001
     * @tc.name      testHomeContract0001
     * @tc.desc      首页展示与宿主约定的事件名、包名、卡片名与权限
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testHomeContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testHomeContract0001';
      logBegin(caseName);
      await openHomePage(driver);
      await driver.assertComponentExist(ON.id(ID_HOME_TITLE));
      logStep(caseName, 'home page rendered');
      const eventName: string = await tryGetTextById(driver, ID_EVENT_NAME);
      logPair(caseName, 'event_name_text', eventName, CommonEventConstants.EVENT_NAME);
      expect(eventName).assertEqual(CommonEventConstants.EVENT_NAME);
      const publisher: string = await tryGetTextById(driver, ID_PUBLISHER);
      logPair(caseName, 'publisher_text', publisher, CommonEventConstants.BUNDLE_NAME);
      expect(publisher).assertEqual(CommonEventConstants.BUNDLE_NAME);
      const widget: string = await tryGetTextById(driver, ID_WIDGET);
      logPair(caseName, 'widget_text', widget, CommonEventConstants.FORM_NAME);
      expect(widget).assertEqual(CommonEventConstants.FORM_NAME);
      const permission: string = await tryGetTextById(driver, ID_PERMISSION);
      logPair(caseName, 'permission_text', permission, 'ohos.permission.REQUIRE_FORM');
      expect(permission).assertEqual('ohos.permission.REQUIRE_FORM');
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_UI_0002
     * @tc.name      testHomeControls0002
     * @tc.desc      首页展示订阅、发布、清空三个操作入口与状态区域
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testHomeControls0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testHomeControls0002';
      logBegin(caseName);
      await openHomePage(driver);
      const subscribeExists: boolean = await isComponentExists(driver, ID_SUBSCRIBE_BUTTON);
      logPair(caseName, 'subscribe_button', subscribeExists.toString(), 'true');
      expect(subscribeExists).assertTrue();
      const publishExists: boolean = await isComponentExists(driver, ID_PUBLISH_BUTTON);
      logPair(caseName, 'publish_button', publishExists.toString(), 'true');
      expect(publishExists).assertTrue();
      const clearExists: boolean = await isComponentExists(driver, ID_CLEAR_BUTTON);
      logPair(caseName, 'clear_button', clearExists.toString(), 'true');
      expect(clearExists).assertTrue();
      const statusText: string = await tryGetTextById(driver, ID_STATUS);
      logPair(caseName, 'status_text.length > 0', statusText.length.toString(), '>0');
      expect(statusText.length > 0).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_UI_0003
     * @tc.name      testAutoSubscription0003
     * @tc.desc      首页进入后自动订阅，外部发布的事件被计入接收数量
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testAutoSubscription0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testAutoSubscription0003';
      logBegin(caseName);
      await openHomePage(driver);
      const cleared: boolean = await resetRecords(driver);
      logPair(caseName, 'recordsCleared', cleared.toString(), 'true');
      expect(cleared).assertTrue();
      await CommonEventPublisher.publish(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
      logStep(caseName, 'event published by the page itself');
      const counted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '1');
      const actualCount: string = await tryGetTextById(driver, ID_RECEIVED_COUNT);
      logPair(caseName, 'received_count_text', actualCount, '1');
      expect(counted).assertTrue();
      const lastData: string = await tryGetTextById(driver, ID_LAST_DATA);
      logPair(caseName, 'last_event_data_text', lastData, CommonEventConstants.DATA_OUT_APP);
      expect(lastData).assertEqual(CommonEventConstants.DATA_OUT_APP);
      const itemExists: boolean = await isComponentExists(driver, ID_FIRST_ITEM);
      logPair(caseName, 'event_item_1', itemExists.toString(), 'true');
      expect(itemExists).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_UI_0004
     * @tc.name      testPublishButton0004
     * @tc.desc      点击发布按钮后页面收到事件并展示事件数据与来源
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPublishButton0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPublishButton0004';
      logBegin(caseName);
      await openHomePage(driver);
      const cleared: boolean = await resetRecords(driver);
      logPair(caseName, 'recordsCleared', cleared.toString(), 'true');
      expect(cleared).assertTrue();
      const previousSource: string = await tryGetTextById(driver, ID_LAST_SOURCE);
      const published: boolean = await publishViaButton(driver, 1);
      logPair(caseName, 'receivedAfterPublish', published.toString(), 'true');
      expect(published).assertTrue();
      const lastData: string = await tryGetTextById(driver, ID_LAST_DATA);
      logPair(caseName, 'last_event_data_text', lastData, CommonEventConstants.DATA_OUT_APP);
      expect(lastData).assertEqual(CommonEventConstants.DATA_OUT_APP);
      const source: string = await waitForTextChanged(driver, ID_LAST_SOURCE, previousSource);
      logPair(caseName, 'lastEventSourceChanged', (source !== previousSource).toString(), 'true');
      expect(source !== previousSource).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_UI_0005
     * @tc.name      testRecordItem0005
     * @tc.desc      发布成功后接收记录列表新增一条记录
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testRecordItem0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testRecordItem0005';
      logBegin(caseName);
      await openHomePage(driver);
      const cleared: boolean = await resetRecords(driver);
      logPair(caseName, 'recordsCleared', cleared.toString(), 'true');
      expect(cleared).assertTrue();
      const itemAbsent: boolean = await waitForComponentAbsent(driver, ID_FIRST_ITEM, 1000);
      logPair(caseName, 'firstItemAbsentAfterClear', itemAbsent.toString(), 'true');
      expect(itemAbsent).assertTrue();
      const published: boolean = await publishViaButton(driver, 1);
      logPair(caseName, 'published', published.toString(), 'true');
      expect(published).assertTrue();
      const itemExists: boolean = await waitForComponent(driver, ID_FIRST_ITEM);
      logPair(caseName, 'event_item_1', itemExists.toString(), 'true');
      expect(itemExists).assertTrue();
      const emptyExists: boolean = await isComponentExists(driver, ID_EMPTY_TEXT);
      logPair(caseName, 'empty_text', emptyExists.toString(), 'false');
      expect(emptyExists).assertFalse();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_UI_0006
     * @tc.name      testClearRecords0006
     * @tc.desc      点击清空按钮后接收数量归零并显示空记录提示
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testClearRecords0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testClearRecords0006';
      logBegin(caseName);
      await openHomePage(driver);
      await resetRecords(driver);
      const published: boolean = await publishViaButton(driver, 1);
      logPair(caseName, 'published', published.toString(), 'true');
      expect(published).assertTrue();
      const cleared: boolean = await resetRecords(driver);
      const count: string = await tryGetTextById(driver, ID_RECEIVED_COUNT);
      logPair(caseName, 'received_count_text', count, '0');
      expect(cleared).assertTrue();
      const emptyShown: boolean = await waitForComponent(driver, ID_EMPTY_TEXT);
      logPair(caseName, 'empty_text', emptyShown.toString(), 'true');
      expect(emptyShown).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_UI_0007
     * @tc.name      testSubscribeToggle0007
     * @tc.desc      点击订阅按钮可在订阅与取消订阅之间切换
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testSubscribeToggle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSubscribeToggle0007';
      logBegin(caseName);
      await openHomePage(driver);
      const initialText: string = await tryGetTextById(driver, ID_SUBSCRIBE_BUTTON);
      logPair(caseName, 'initialButtonText.length > 0', initialText.length.toString(), '>0');
      expect(initialText.length > 0).assertTrue();
      const firstClick: boolean = await clickById(driver, ID_SUBSCRIBE_BUTTON);
      expect(firstClick).assertTrue();
      const toggledText: string = await waitForTextChanged(driver, ID_SUBSCRIBE_BUTTON, initialText);
      logPair(caseName, 'textAfterFirstClick != initial', (toggledText !== initialText).toString(), 'true');
      expect(toggledText !== initialText).assertTrue();
      const secondClick: boolean = await clickById(driver, ID_SUBSCRIBE_BUTTON);
      expect(secondClick).assertTrue();
      const restored: boolean = await waitForTextById(driver, ID_SUBSCRIBE_BUTTON, initialText);
      logPair(caseName, 'textRestored', restored.toString(), 'true');
      expect(restored).assertTrue();
      const stateText: string = await tryGetTextById(driver, ID_SUBSCRIBE_STATE);
      logPair(caseName, 'subscribe_state_text.length > 0', stateText.length.toString(), '>0');
      expect(stateText.length > 0).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_UI_0008
     * @tc.name      testStatusAfterPublish0008
     * @tc.desc      发布事件后状态提示随操作更新
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testStatusAfterPublish0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testStatusAfterPublish0008';
      logBegin(caseName);
      await openHomePage(driver);
      await resetRecords(driver);
      const previousStatus: string = await tryGetTextById(driver, ID_STATUS);
      const published: boolean = await publishViaButton(driver, 1);
      logPair(caseName, 'published', published.toString(), 'true');
      expect(published).assertTrue();
      const status: string = await waitForTextChanged(driver, ID_STATUS, previousStatus);
      logPair(caseName, 'statusChanged', (status !== previousStatus).toString(), 'true');
      expect(status !== previousStatus).assertTrue();
      logPair(caseName, 'status.length > 0', status.length.toString(), '>0');
      expect(status.length > 0).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_UI_0009
     * @tc.name      testPublishTwice0009
     * @tc.desc      连续点击两次发布按钮后接收数量为 2 且出现第二条记录
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPublishTwice0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPublishTwice0009';
      logBegin(caseName);
      await openHomePage(driver);
      const cleared: boolean = await resetRecords(driver);
      logPair(caseName, 'recordsCleared', cleared.toString(), 'true');
      expect(cleared).assertTrue();
      const firstPublished: boolean = await publishViaButton(driver, 1);
      logPair(caseName, 'firstPublish', firstPublished.toString(), 'true');
      expect(firstPublished).assertTrue();
      const secondPublished: boolean = await publishViaButton(driver, 2);
      const count: string = await tryGetTextById(driver, ID_RECEIVED_COUNT);
      logPair(caseName, 'received_count_text', count, '2');
      expect(secondPublished).assertTrue();
      const secondItem: boolean = await waitForComponent(driver, ID_SECOND_ITEM);
      logPair(caseName, 'event_item_2', secondItem.toString(), 'true');
      expect(secondItem).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_UI_0010
     * @tc.name      testExternalEventShown0010
     * @tc.desc      外部发布 InApp 数据时首页展示该事件数据
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testExternalEventShown0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExternalEventShown0010';
      logBegin(caseName);
      await openHomePage(driver);
      const cleared: boolean = await resetRecords(driver);
      logPair(caseName, 'recordsCleared', cleared.toString(), 'true');
      expect(cleared).assertTrue();
      await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.UNKNOWN);
      logStep(caseName, 'InApp event published by an external publisher');
      const counted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '1');
      logPair(caseName, 'received', counted.toString(), 'true');
      expect(counted).assertTrue();
      const lastData: string = await tryGetTextById(driver, ID_LAST_DATA);
      logPair(caseName, 'last_event_data_text', lastData, CommonEventConstants.DATA_IN_APP);
      expect(lastData).assertEqual(CommonEventConstants.DATA_IN_APP);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_UI_0011
     * @tc.name      testPagePublishDelivered0011
     * @tc.desc      点击发布按钮后独立订阅者收到携带页面来源码的事件
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testPagePublishDelivered0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPagePublishDelivered0011';
      logBegin(caseName);
      await openHomePage(driver);
      const collector: EventCollector = new EventCollector();
      await collector.start();
      await sleep(SUBSCRIBE_DELAY);
      try {
        const cleared: boolean = await resetRecords(driver);
        logPair(caseName, 'recordsCleared', cleared.toString(), 'true');
        expect(cleared).assertTrue();
        const published: boolean = await publishViaButton(driver, 1);
        logPair(caseName, 'published', published.toString(), 'true');
        expect(published).assertTrue();
        const received: boolean = await collector.waitForCount(1);
        logPair(caseName, 'collectorCount', collector.getCount().toString(), '>=1');
        expect(received).assertTrue();
        const event: commonEventManager.CommonEventData | null = collector.getEventAt(0);
        logPair(caseName, 'event.data', event?.data ?? '', CommonEventConstants.DATA_OUT_APP);
        expect(event?.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
        logPair(caseName, 'event.code', (event?.code ?? 0).toString(), EventSource.PAGE.toString());
        expect(event?.code).assertEqual(EventSource.PAGE);
      } finally {
        await collector.stop();
      }
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_UI_0012
     * @tc.name      testSequenceRestartAfterClear0012
     * @tc.desc      清空记录后再次发布时记录序号从 1 重新开始
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testSequenceRestartAfterClear0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSequenceRestartAfterClear0012';
      logBegin(caseName);
      await openHomePage(driver);
      await resetRecords(driver);
      const firstPublished: boolean = await publishViaButton(driver, 1);
      logPair(caseName, 'firstPublish', firstPublished.toString(), 'true');
      expect(firstPublished).assertTrue();
      const firstItem: boolean = await waitForComponent(driver, ID_FIRST_ITEM);
      logPair(caseName, 'firstItemShown', firstItem.toString(), 'true');
      expect(firstItem).assertTrue();
      const cleared: boolean = await resetRecords(driver);
      logPair(caseName, 'recordsCleared', cleared.toString(), 'true');
      expect(cleared).assertTrue();
      const itemRemoved: boolean = await waitForComponentAbsent(driver, ID_FIRST_ITEM);
      logPair(caseName, 'firstItemRemoved', itemRemoved.toString(), 'true');
      expect(itemRemoved).assertTrue();
      const republished: boolean = await publishViaButton(driver, 1);
      logPair(caseName, 'republished', republished.toString(), 'true');
      expect(republished).assertTrue();
      const restarted: boolean = await waitForComponent(driver, ID_FIRST_ITEM);
      logPair(caseName, 'sequenceRestartedAtOne', restarted.toString(), 'true');
      expect(restarted).assertTrue();
      logEnd(caseName);
    })
  })
}
