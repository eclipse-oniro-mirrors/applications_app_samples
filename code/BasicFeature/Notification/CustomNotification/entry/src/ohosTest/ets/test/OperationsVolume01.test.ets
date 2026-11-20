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

// 发布入口在提示音/振动开关组合下的槽位意图联动。
// 期望值来源：状态推演（promptTone/vibrationEffect 开关决定 slot 的 sound/vibration 字段）。
// beforeEach 复位开关，16 例之间零依赖。
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationUtil } from '@ohos/notification';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import NotificationOperations from '../../../../src/main/ets/feature/NotificationOperations';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';

// NOTIFICATION_ID 冻结基线（NotificationOperations.ets 私有枚举值）
const ID_BASIC: number = 1;
const ID_LONG_TEXT: number = 2;
const ID_MULTI_LINE: number = 3;
const ID_WANTAGENT: number = 6;

const SOUND_PATH: string = 'file:///system/etc/capture.ogg';

async function sleep(ms: number): Promise<void> {
    return new Promise<void>((resolve: () => void) => setTimeout(resolve, ms));
}

async function waitNewPublished(id: number, beforeRef: notification.NotificationRequest | undefined,
    timeoutMs: number = 4000): Promise<boolean> {
    const start: number = Date.now();
    while (Date.now() - start < timeoutMs) {
        const req: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
        if (req !== undefined && req.id === id && req !== beforeRef) {
            return true;
        }
        await sleep(60);
    }
    return false;
}

let operations: NotificationOperations =
    new NotificationOperations(abilityDelegatorRegistry.getAbilityDelegator().getAppContext());

export default function operationsVolume01Test() {
    describe('OperationsVolume01', () => {
        beforeEach(async () => {
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0001
         * @tc.name testVOperations0001
         * @tc.desc 双开关全关发布基本通知：请求 id 与槽位意图均不含声音振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0001 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishBasicNotification();
            let arrived: boolean = await waitNewPublished(ID_BASIC, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.sound === undefined));
            expect(slot.sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === undefined));
            expect(slot.vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0002
         * @tc.name testVOperations0002
         * @tc.desc 仅提示音开启发布基本通知：槽位意图携带系统提示音路径
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0002 begin');
            notificationUtil.promptTone(true);
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishBasicNotification();
            let arrived: boolean = await waitNewPublished(ID_BASIC, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', slot.sound, SOUND_PATH);
            expect(slot.sound).assertEqual(SOUND_PATH);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === undefined));
            expect(slot.vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0003
         * @tc.name testVOperations0003
         * @tc.desc 仅振动开启发布基本通知：槽位意图携带振动强度档
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0003 begin');
            notificationUtil.vibrationEffect(true);
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishBasicNotification();
            let arrived: boolean = await waitNewPublished(ID_BASIC, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === true));
            expect(slot.vibrationEnabled === true).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.sound === undefined));
            expect(slot.sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0004
         * @tc.name testVOperations0004
         * @tc.desc 双开关全开发布基本通知：槽位意图同时携带声音与振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0004 begin');
            notificationUtil.promptTone(true);
            notificationUtil.vibrationEffect(true);
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishBasicNotification();
            let arrived: boolean = await waitNewPublished(ID_BASIC, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', slot.sound, SOUND_PATH);
            expect(slot.sound).assertEqual(SOUND_PATH);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === true));
            expect(slot.vibrationEnabled === true).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0005
         * @tc.name testVOperations0005
         * @tc.desc 双开关全关发布长文本通知：槽位意图不含声音振动且 id 为长文本冻结值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0005 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishLongTextNotification();
            let arrived: boolean = await waitNewPublished(ID_LONG_TEXT, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_LONG_TEXT);
            expect(request.id).assertEqual(ID_LONG_TEXT);
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.sound === undefined));
            expect(slot.sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0006
         * @tc.name testVOperations0006
         * @tc.desc 仅提示音开启发布长文本通知：槽位意图携带提示音路径
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0006 begin');
            notificationUtil.promptTone(true);
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishLongTextNotification();
            let arrived: boolean = await waitNewPublished(ID_LONG_TEXT, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', slot.sound, SOUND_PATH);
            expect(slot.sound).assertEqual(SOUND_PATH);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === undefined));
            expect(slot.vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0007
         * @tc.name testVOperations0007
         * @tc.desc 仅振动开启发布长文本通知：槽位意图携带振动档且无声音
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0007 begin');
            notificationUtil.vibrationEffect(true);
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishLongTextNotification();
            let arrived: boolean = await waitNewPublished(ID_LONG_TEXT, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === true));
            expect(slot.vibrationEnabled === true).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.sound === undefined));
            expect(slot.sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0008
         * @tc.name testVOperations0008
         * @tc.desc 双开关全开发布长文本通知：槽位意图同时携带声音与振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0008 begin');
            notificationUtil.promptTone(true);
            notificationUtil.vibrationEffect(true);
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishLongTextNotification();
            let arrived: boolean = await waitNewPublished(ID_LONG_TEXT, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', slot.sound, SOUND_PATH);
            expect(slot.sound).assertEqual(SOUND_PATH);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === true));
            expect(slot.vibrationEnabled === true).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0009
         * @tc.name testVOperations0009
         * @tc.desc 双开关全关发布多行通知：槽位意图不含声音振动且 id 为多行冻结值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0009 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishMultiLineNotification();
            let arrived: boolean = await waitNewPublished(ID_MULTI_LINE, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_MULTI_LINE);
            expect(request.id).assertEqual(ID_MULTI_LINE);
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.sound === undefined));
            expect(slot.sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0010
         * @tc.name testVOperations0010
         * @tc.desc 仅提示音开启发布多行通知：槽位意图携带提示音路径
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0010 begin');
            notificationUtil.promptTone(true);
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishMultiLineNotification();
            let arrived: boolean = await waitNewPublished(ID_MULTI_LINE, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', slot.sound, SOUND_PATH);
            expect(slot.sound).assertEqual(SOUND_PATH);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === undefined));
            expect(slot.vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0011
         * @tc.name testVOperations0011
         * @tc.desc 仅振动开启发布多行通知：槽位意图携带振动档且无声音
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0011 begin');
            notificationUtil.vibrationEffect(true);
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishMultiLineNotification();
            let arrived: boolean = await waitNewPublished(ID_MULTI_LINE, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === true));
            expect(slot.vibrationEnabled === true).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.sound === undefined));
            expect(slot.sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0012
         * @tc.name testVOperations0012
         * @tc.desc 双开关全开发布多行通知：槽位意图同时携带声音与振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0012 begin');
            notificationUtil.promptTone(true);
            notificationUtil.vibrationEffect(true);
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishMultiLineNotification();
            let arrived: boolean = await waitNewPublished(ID_MULTI_LINE, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', slot.sound, SOUND_PATH);
            expect(slot.sound).assertEqual(SOUND_PATH);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === true));
            expect(slot.vibrationEnabled === true).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0013
         * @tc.name testVOperations0013
         * @tc.desc 双开关全关发布点击跳转通知：槽位意图不含声音振动且 id 为跳转冻结值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0013 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await operations.publishNotificationWithWantAgent();
            let arrived: boolean = await waitNewPublished(ID_WANTAGENT, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_WANTAGENT);
            expect(request.id).assertEqual(ID_WANTAGENT);
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.sound === undefined));
            expect(slot.sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0014
         * @tc.name testVOperations0014
         * @tc.desc 仅提示音开启发布点击跳转通知：槽位意图携带提示音路径
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0014 begin');
            notificationUtil.promptTone(true);
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await operations.publishNotificationWithWantAgent();
            let arrived: boolean = await waitNewPublished(ID_WANTAGENT, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', slot.sound, SOUND_PATH);
            expect(slot.sound).assertEqual(SOUND_PATH);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === undefined));
            expect(slot.vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0015
         * @tc.name testVOperations0015
         * @tc.desc 仅振动开启发布点击跳转通知：槽位意图携带振动档且无声音
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0015 begin');
            notificationUtil.vibrationEffect(true);
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await operations.publishNotificationWithWantAgent();
            let arrived: boolean = await waitNewPublished(ID_WANTAGENT, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === true));
            expect(slot.vibrationEnabled === true).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.sound === undefined));
            expect(slot.sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_0016
         * @tc.name testVOperations0016
         * @tc.desc 双开关全开发布点击跳转通知：槽位意图同时携带声音与振动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperations0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0016 begin');
            notificationUtil.promptTone(true);
            notificationUtil.vibrationEffect(true);
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await operations.publishNotificationWithWantAgent();
            let arrived: boolean = await waitNewPublished(ID_WANTAGENT, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', slot.sound, SOUND_PATH);
            expect(slot.sound).assertEqual(SOUND_PATH);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === true));
            expect(slot.vibrationEnabled === true).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperations0016 end');
        });
    });
}
