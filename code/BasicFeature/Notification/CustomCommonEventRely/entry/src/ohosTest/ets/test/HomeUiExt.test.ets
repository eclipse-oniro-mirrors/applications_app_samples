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
import { Driver } from '@kit.TestKit';
import { CommonEventPublisher } from '../../../main/ets/feature/CommonEventPublisher';
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import {
    clickById,
    delay,
    isComponentExists,
    logBegin,
    logEnd,
    logPair,
    logStep,
    startHomeAbility,
    tryGetTextById,
    UI_IDLE_TIME,
    waitForComponent,
    waitForComponentAbsent,
    waitForTextById,
    waitForTextChanged
} from '../util/TestHelper';

const HOME_OPEN_DELAY: number = 1000;
const PUBLISH_GAP: number = 300;
const NEGATIVE_WAIT: number = 1200;
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
const ID_THIRD_ITEM: string = 'event_item_3';

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
 * Complements the home page suite with source labels, subscribe boundaries and record ordering.
 */
export default function homeUiExtTest() {
    describe('HomeUiExtTest', () => {
        let driver: Driver = Driver.create();

        /**
         * @tc.number    SUB_CCER_UI_0013
         * @tc.name      testHomeExt0013
         * @tc.desc      外部卡片来源事件接收后末条来源更新且条目按序号生成
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeExt0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeExt0013';
            logBegin(caseName);
            await openHomePage(driver);
            await resetRecords(driver);
            const initialSource: string = await tryGetTextById(driver, ID_LAST_SOURCE);
            await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            const counted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '1');
            logPair(caseName, 'received', counted.toString(), 'true');
            expect(counted).assertTrue();
            const source: string = await tryGetTextById(driver, ID_LAST_SOURCE);
            logPair(caseName, 'sourceChanged', (source !== initialSource).toString(), 'true');
            expect(source !== initialSource).assertTrue();
            logPair(caseName, 'source.length > 0', source.length.toString(), '>0');
            expect(source.length > 0).assertTrue();
            const itemExists: boolean = await isComponentExists(driver, ID_FIRST_ITEM);
            logPair(caseName, 'event_item_1', itemExists.toString(), 'true');
            expect(itemExists).assertTrue();
            await resetRecords(driver);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_UI_0014
         * @tc.name      testHomeExt0014
         * @tc.desc      取消订阅期间外部发布不计入接收数量，重新订阅后恢复计入
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeExt0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeExt0014';
            logBegin(caseName);
            await openHomePage(driver);
            await resetRecords(driver);
            const initialButton: string = await tryGetTextById(driver, ID_SUBSCRIBE_BUTTON);
            const firstClick: boolean = await clickById(driver, ID_SUBSCRIBE_BUTTON);
            logPair(caseName, 'unsubscribeClicked', firstClick.toString(), 'true');
            expect(firstClick).assertTrue();
            const toggled: string = await waitForTextChanged(driver, ID_SUBSCRIBE_BUTTON, initialButton);
            logPair(caseName, 'buttonToggled', (toggled !== initialButton).toString(), 'true');
            expect(toggled !== initialButton).assertTrue();
            await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            await delay(driver, NEGATIVE_WAIT);
            const countWhileUnsubscribed: string = await tryGetTextById(driver, ID_RECEIVED_COUNT);
            logPair(caseName, 'countWhileUnsubscribed', countWhileUnsubscribed, '0');
            expect(countWhileUnsubscribed).assertEqual('0');
            const secondClick: boolean = await clickById(driver, ID_SUBSCRIBE_BUTTON);
            logPair(caseName, 'resubscribeClicked', secondClick.toString(), 'true');
            expect(secondClick).assertTrue();
            const restored: boolean = await waitForTextById(driver, ID_SUBSCRIBE_BUTTON, initialButton);
            logPair(caseName, 'buttonRestored', restored.toString(), 'true');
            expect(restored).assertTrue();
            await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            const counted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '1');
            logPair(caseName, 'countedAfterResubscribe', counted.toString(), 'true');
            expect(counted).assertTrue();
            await resetRecords(driver);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_UI_0015
         * @tc.name      testHomeExt0015
         * @tc.desc      连续两条外部事件后末条数据更新为最新一条
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeExt0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeExt0015';
            logBegin(caseName);
            await openHomePage(driver);
            await resetRecords(driver);
            await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            const firstCounted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '1');
            logPair(caseName, 'firstReceived', firstCounted.toString(), 'true');
            expect(firstCounted).assertTrue();
            const firstData: string = await tryGetTextById(driver, ID_LAST_DATA);
            logPair(caseName, 'firstData', firstData, CommonEventConstants.DATA_IN_APP);
            expect(firstData).assertEqual(CommonEventConstants.DATA_IN_APP);
            await CommonEventPublisher.publish(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
            const secondCounted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '2');
            logPair(caseName, 'secondReceived', secondCounted.toString(), 'true');
            expect(secondCounted).assertTrue();
            const lastData: string = await tryGetTextById(driver, ID_LAST_DATA);
            logPair(caseName, 'lastData', lastData, CommonEventConstants.DATA_OUT_APP);
            expect(lastData).assertEqual(CommonEventConstants.DATA_OUT_APP);
            await resetRecords(driver);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_UI_0016
         * @tc.name      testHomeExt0016
         * @tc.desc      清空后末条数据与来源回到初始占位文本
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeExt0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeExt0016';
            logBegin(caseName);
            await openHomePage(driver);
            await resetRecords(driver);
            const initialData: string = await tryGetTextById(driver, ID_LAST_DATA);
            const initialSource: string = await tryGetTextById(driver, ID_LAST_SOURCE);
            await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            const counted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '1');
            logPair(caseName, 'received', counted.toString(), 'true');
            expect(counted).assertTrue();
            const cleared: boolean = await resetRecords(driver);
            logPair(caseName, 'recordsCleared', cleared.toString(), 'true');
            expect(cleared).assertTrue();
            const dataAfterClear: string = await tryGetTextById(driver, ID_LAST_DATA);
            logPair(caseName, 'dataRestored', (dataAfterClear === initialData).toString(), 'true');
            expect(dataAfterClear === initialData).assertTrue();
            const sourceAfterClear: string = await tryGetTextById(driver, ID_LAST_SOURCE);
            logPair(caseName, 'sourceRestored', (sourceAfterClear === initialSource).toString(), 'true');
            expect(sourceAfterClear === initialSource).assertTrue();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_UI_0017
         * @tc.name      testHomeExt0017
         * @tc.desc      发布与清空操作后状态提示随之变化且始终非空
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeExt0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeExt0017';
            logBegin(caseName);
            await openHomePage(driver);
            await resetRecords(driver);
            const initialStatus: string = await tryGetTextById(driver, ID_STATUS);
            const publishClicked: boolean = await clickById(driver, ID_PUBLISH_BUTTON);
            logPair(caseName, 'publishClicked', publishClicked.toString(), 'true');
            expect(publishClicked).assertTrue();
            const counted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '1');
            logPair(caseName, 'received', counted.toString(), 'true');
            expect(counted).assertTrue();
            const statusAfterPublish: string = await waitForTextChanged(driver, ID_STATUS, initialStatus);
            logPair(caseName, 'statusChangedByPublish', (statusAfterPublish !== initialStatus).toString(), 'true');
            expect(statusAfterPublish !== initialStatus).assertTrue();
            await resetRecords(driver);
            const statusAfterClear: string = await tryGetTextById(driver, ID_STATUS);
            logPair(caseName, 'statusChangedByClear', (statusAfterClear !== statusAfterPublish).toString(), 'true');
            expect(statusAfterClear !== statusAfterPublish).assertTrue();
            logPair(caseName, 'status.length > 0', statusAfterClear.length.toString(), '>0');
            expect(statusAfterClear.length > 0).assertTrue();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_UI_0018
         * @tc.name      testHomeExt0018
         * @tc.desc      三条外部事件后记录条目依序生成三项
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeExt0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeExt0018';
            logBegin(caseName);
            await openHomePage(driver);
            await resetRecords(driver);
            await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            await delay(driver, PUBLISH_GAP);
            await CommonEventPublisher.publish(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
            await delay(driver, PUBLISH_GAP);
            await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, 999);
            const counted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '3');
            logPair(caseName, 'receivedThree', counted.toString(), 'true');
            expect(counted).assertTrue();
            const firstItem: boolean = await isComponentExists(driver, ID_FIRST_ITEM);
            logPair(caseName, 'event_item_1', firstItem.toString(), 'true');
            expect(firstItem).assertTrue();
            const secondItem: boolean = await isComponentExists(driver, ID_SECOND_ITEM);
            logPair(caseName, 'event_item_2', secondItem.toString(), 'true');
            expect(secondItem).assertTrue();
            const thirdItem: boolean = await waitForComponent(driver, ID_THIRD_ITEM);
            logPair(caseName, 'event_item_3', thirdItem.toString(), 'true');
            expect(thirdItem).assertTrue();
            await resetRecords(driver);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_UI_0019
         * @tc.name      testHomeExt0019
         * @tc.desc      卡片来源与未知来源事件的末条来源文本各不相同且均非占位
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeExt0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeExt0019';
            logBegin(caseName);
            await openHomePage(driver);
            await resetRecords(driver);
            const initialSource: string = await tryGetTextById(driver, ID_LAST_SOURCE);
            await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            const formCounted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '1');
            logPair(caseName, 'formReceived', formCounted.toString(), 'true');
            expect(formCounted).assertTrue();
            const formSource: string = await tryGetTextById(driver, ID_LAST_SOURCE);
            logPair(caseName, 'formSource != placeholder', (formSource !== initialSource).toString(), 'true');
            expect(formSource !== initialSource).assertTrue();
            await CommonEventPublisher.publish(CommonEventConstants.DATA_OUT_APP, 999);
            const externalCounted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '2');
            logPair(caseName, 'externalReceived', externalCounted.toString(), 'true');
            expect(externalCounted).assertTrue();
            const externalSource: string = await tryGetTextById(driver, ID_LAST_SOURCE);
            logPair(caseName, 'externalSource != formSource', (externalSource !== formSource).toString(), 'true');
            expect(externalSource !== formSource).assertTrue();
            logPair(caseName, 'externalSource != placeholder', (externalSource !== initialSource).toString(), 'true');
            expect(externalSource !== initialSource).assertTrue();
            await resetRecords(driver);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_UI_0020
         * @tc.name      testHomeExt0020
         * @tc.desc      页面自发布与外部卡片事件交替后末条来源随最新事件切换
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeExt0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeExt0020';
            logBegin(caseName);
            await openHomePage(driver);
            await resetRecords(driver);
            const publishClicked: boolean = await clickById(driver, ID_PUBLISH_BUTTON);
            logPair(caseName, 'publishClicked', publishClicked.toString(), 'true');
            expect(publishClicked).assertTrue();
            const pageCounted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '1');
            logPair(caseName, 'pageEventReceived', pageCounted.toString(), 'true');
            expect(pageCounted).assertTrue();
            const pageSource: string = await tryGetTextById(driver, ID_LAST_SOURCE);
            await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            const formCounted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '2');
            logPair(caseName, 'formEventReceived', formCounted.toString(), 'true');
            expect(formCounted).assertTrue();
            const formSource: string = await tryGetTextById(driver, ID_LAST_SOURCE);
            logPair(caseName, 'sourceSwitched', (formSource !== pageSource).toString(), 'true');
            expect(formSource !== pageSource).assertTrue();
            logPair(caseName, 'formSource.length > 0', formSource.length.toString(), '>0');
            expect(formSource.length > 0).assertTrue();
            await resetRecords(driver);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_UI_0021
         * @tc.name      testHomeExt0021
         * @tc.desc      订阅状态文字随订阅切换更新并可复原
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeExt0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeExt0021';
            logBegin(caseName);
            await openHomePage(driver);
            const initialState: string = await tryGetTextById(driver, ID_SUBSCRIBE_STATE);
            const firstClick: boolean = await clickById(driver, ID_SUBSCRIBE_BUTTON);
            logPair(caseName, 'unsubscribeClicked', firstClick.toString(), 'true');
            expect(firstClick).assertTrue();
            const unsubscribedState: string = await waitForTextChanged(driver, ID_SUBSCRIBE_STATE, initialState);
            logPair(caseName, 'stateChanged', (unsubscribedState !== initialState).toString(), 'true');
            expect(unsubscribedState !== initialState).assertTrue();
            const secondClick: boolean = await clickById(driver, ID_SUBSCRIBE_BUTTON);
            logPair(caseName, 'resubscribeClicked', secondClick.toString(), 'true');
            expect(secondClick).assertTrue();
            const restored: boolean = await waitForTextById(driver, ID_SUBSCRIBE_STATE, initialState);
            logPair(caseName, 'stateRestored', restored.toString(), 'true');
            expect(restored).assertTrue();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_UI_0022
         * @tc.name      testHomeExt0022
         * @tc.desc      清空后条目序号复位，再次发布时仅首条条目出现
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeExt0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeExt0022';
            logBegin(caseName);
            await openHomePage(driver);
            await resetRecords(driver);
            await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            await delay(driver, PUBLISH_GAP);
            await CommonEventPublisher.publish(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
            const counted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '2');
            logPair(caseName, 'twoReceived', counted.toString(), 'true');
            expect(counted).assertTrue();
            const cleared: boolean = await resetRecords(driver);
            logPair(caseName, 'recordsCleared', cleared.toString(), 'true');
            expect(cleared).assertTrue();
            await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            const recount: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '1');
            logPair(caseName, 'restartedCount', recount.toString(), 'true');
            expect(recount).assertTrue();
            const firstItem: boolean = await waitForComponent(driver, ID_FIRST_ITEM);
            logPair(caseName, 'firstItemRestarted', firstItem.toString(), 'true');
            expect(firstItem).assertTrue();
            const secondAbsent: boolean = await waitForComponentAbsent(driver, ID_SECOND_ITEM, 1000);
            logPair(caseName, 'secondItemAbsent', secondAbsent.toString(), 'true');
            expect(secondAbsent).assertTrue();
            await resetRecords(driver);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_UI_0023
         * @tc.name      testHomeExt0023
         * @tc.desc      空数据事件发布成功但不计入接收数量也不产生条目
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeExt0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeExt0023';
            logBegin(caseName);
            await openHomePage(driver);
            await resetRecords(driver);
            await CommonEventPublisher.publish(CommonEventConstants.EMPTY_VALUE, EventSource.PAGE);
            logStep(caseName, 'empty data event published');
            await delay(driver, NEGATIVE_WAIT);
            const count: string = await tryGetTextById(driver, ID_RECEIVED_COUNT);
            logPair(caseName, 'countAfterEmptyData', count, '0');
            expect(count).assertEqual('0');
            const emptyShown: boolean = await isComponentExists(driver, ID_EMPTY_TEXT);
            logPair(caseName, 'empty_text', emptyShown.toString(), 'true');
            expect(emptyShown).assertTrue();
            const itemAbsent: boolean = await waitForComponentAbsent(driver, ID_FIRST_ITEM, 1000);
            logPair(caseName, 'firstItemAbsent', itemAbsent.toString(), 'true');
            expect(itemAbsent).assertTrue();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_UI_0024
         * @tc.name      testHomeExt0024
         * @tc.desc      再次拉起首页后已接收记录保持不丢失不重复
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testHomeExt0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testHomeExt0024';
            logBegin(caseName);
            await openHomePage(driver);
            await resetRecords(driver);
            await CommonEventPublisher.publish(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            await delay(driver, PUBLISH_GAP);
            await CommonEventPublisher.publish(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
            const counted: boolean = await waitForTextById(driver, ID_RECEIVED_COUNT, '2');
            logPair(caseName, 'twoReceived', counted.toString(), 'true');
            expect(counted).assertTrue();
            const lastBeforeRelaunch: string = await tryGetTextById(driver, ID_LAST_DATA);
            await openHomePage(driver);
            const countAfterRelaunch: string = await tryGetTextById(driver, ID_RECEIVED_COUNT);
            logPair(caseName, 'countAfterRelaunch', countAfterRelaunch, '2');
            expect(countAfterRelaunch).assertEqual('2');
            const lastAfterRelaunch: string = await tryGetTextById(driver, ID_LAST_DATA);
            logPair(caseName, 'lastKept', (lastAfterRelaunch === lastBeforeRelaunch).toString(), 'true');
            expect(lastAfterRelaunch === lastBeforeRelaunch).assertTrue();
            const itemsKept: boolean = await isComponentExists(driver, ID_SECOND_ITEM);
            logPair(caseName, 'recordsKept', itemsKept.toString(), 'true');
            expect(itemsKept).assertTrue();
            await resetRecords(driver);
            logEnd(caseName);
        })
    })
}
