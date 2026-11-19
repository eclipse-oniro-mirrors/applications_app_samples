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

// 发布链路本体 notificationUtil.publishNotification / cancelNotificationById /
// cancelAllNotifications。P8 后可经 lastPublishedRequest / lastNotificationSlot /
// lastCancelledIds 观测链路分支：id 覆写语义（id && id > 0）、取消记录的追加与清空。
// 期望值来源：main 修复后源码分支推演 + SlotType 规格常量。
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationUtil } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';
const SOUND_PATH: string = 'file:///system/etc/capture.ogg';

const BASE_ID: number = 9;

function buildPlainRequest(id: number): notification.NotificationRequest {
    let content: notification.NotificationContent = {
        notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: { title: 'title-' + id, text: 'text-' + id, additionalText: 'additional' }
    };
    return { id: id, content: content, notificationSlotType: notification.SlotType.CONTENT_INFORMATION };
}

async function sleep(ms: number): Promise<void> {
    return new Promise<void>((resolve: () => void) => setTimeout(resolve, ms));
}

/** 轮询等待发布记录指向给定请求引用（publish 链 fire-and-forget）。 */
async function waitRecorded(req: notification.NotificationRequest, timeoutMs: number = 4000): Promise<boolean> {
    const start: number = Date.now();
    while (Date.now() - start < timeoutMs) {
        if (notificationUtil.getLastPublishedRequest() === req) {
            return true;
        }
        await sleep(60);
    }
    return false;
}

async function publishQuietly(req: notification.NotificationRequest, id?: number): Promise<void> {
    try {
        await notificationUtil.publishNotification(req, id);
    } catch (error) {
        hilog.warn(DOMAIN, TAG, 'publish rejected after intent recorded');
    }
}

export default function publishChainCoreTest() {
    describe('PublishChainCore', () => {
        beforeEach(async () => {
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_PUBLISH_0001
         * @tc.name testPublish0001
         * @tc.desc 无 id 调用：request.id 保持原值且引用被原样记录
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testPublish0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0001 begin');
            let req: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await publishQuietly(req);
            let recorded: boolean = await waitRecorded(req);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(recorded));
            expect(recorded).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, BASE_ID);
            expect(request.id).assertEqual(BASE_ID);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === req));
            expect(notificationUtil.getLastPublishedRequest() === req).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_PUBLISH_0002
         * @tc.name testPublish0002
         * @tc.desc 正 id=5：发布前覆写 request.id 为 5
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testPublish0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0002 begin');
            let req: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await publishQuietly(req, 5);
            let recorded: boolean = await waitRecorded(req);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(recorded));
            expect(recorded).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, 5);
            expect(request.id).assertEqual(5);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', req.id, 5);
            expect(req.id).assertEqual(5);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_PUBLISH_0003
         * @tc.name testPublish0003
         * @tc.desc 边界 id=0：不覆写，request.id 保持原值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0003 begin');
            let req: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await publishQuietly(req, 0);
            let recorded: boolean = await waitRecorded(req);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(recorded));
            expect(recorded).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, BASE_ID);
            expect(request.id).assertEqual(BASE_ID);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', req.id, BASE_ID);
            expect(req.id).assertEqual(BASE_ID);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_PUBLISH_0004
         * @tc.name testPublish0004
         * @tc.desc 负 id=-1：不覆写，request.id 保持原值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0004 begin');
            let req: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await publishQuietly(req, -1);
            let recorded: boolean = await waitRecorded(req);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(recorded));
            expect(recorded).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, BASE_ID);
            expect(request.id).assertEqual(BASE_ID);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', req.id, BASE_ID);
            expect(req.id).assertEqual(BASE_ID);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_PUBLISH_0005
         * @tc.name testPublish0005
         * @tc.desc 较大正 id=999：覆写生效
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0005 begin');
            let req: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await publishQuietly(req, 999);
            let recorded: boolean = await waitRecorded(req);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(recorded));
            expect(recorded).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, 999);
            expect(request.id).assertEqual(999);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', req.id, 999);
            expect(req.id).assertEqual(999);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_PUBLISH_0006
         * @tc.name testPublish0006
         * @tc.desc 覆写不改引用：观测记录与传入请求为同一对象
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0006 begin');
            let req: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await publishQuietly(req, 7);
            let recorded: boolean = await waitRecorded(req);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(recorded));
            expect(recorded).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === req));
            expect(notificationUtil.getLastPublishedRequest() === req).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, 7);
            expect(request.id).assertEqual(7);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_PUBLISH_0007
         * @tc.name testPublish0007
         * @tc.desc 发布链同时组装槽位意图：类型与级别为默认规格常量
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0007 begin');
            let req: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await publishQuietly(req);
            let recorded: boolean = await waitRecorded(req);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(recorded));
            expect(recorded).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            let slotType: notification.SlotType = (slot.notificationType) as notification.SlotType;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                slotType, notification.SlotType.CONTENT_INFORMATION);
            expect(slotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            let slotLevel: notification.SlotLevel = (slot.notificationLevel) as notification.SlotLevel;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                slotLevel, notification.SlotLevel.LEVEL_DEFAULT);
            expect(slotLevel).assertEqual(notification.SlotLevel.LEVEL_DEFAULT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_PUBLISH_0008
         * @tc.name testPublish0008
         * @tc.desc 按 id 取消：取消记录追加该 id
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testPublish0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0008 begin');
            let beforeSnapshot: number[] = notificationUtil.getLastCancelledIds();
            await notificationUtil.cancelNotificationById(11);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 11);
            expect(cancelledIds[0]).assertEqual(11);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(cancelledIds !== beforeSnapshot));
            expect(cancelledIds !== beforeSnapshot).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_PUBLISH_0009
         * @tc.name testPublish0009
         * @tc.desc 连续取消两个 id：记录按调用顺序追加
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0009 begin');
            await notificationUtil.cancelNotificationById(21);
            await notificationUtil.cancelNotificationById(22);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 2);
            expect(cancelledIds.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 21);
            expect(cancelledIds[0]).assertEqual(21);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[1], 22);
            expect(cancelledIds[1]).assertEqual(22);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_PUBLISH_0010
         * @tc.name testPublish0010
         * @tc.desc 全量取消：取消记录同步清空
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0010 begin');
            await notificationUtil.cancelNotificationById(31);
            await notificationUtil.cancelNotificationById(32);
            let beforeCancelAll: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', beforeCancelAll.length, 2);
            expect(beforeCancelAll.length).assertEqual(2);
            await notificationUtil.cancelAllNotifications();
            let afterCancelAll: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', afterCancelAll.length, 0);
            expect(afterCancelAll.length).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(afterCancelAll !== beforeCancelAll));
            expect(afterCancelAll !== beforeCancelAll).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_PUBLISH_0011
         * @tc.name testPublish0011
         * @tc.desc 组合状态：取消后发布，取消记录保持且发布记录更新
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPublish0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0011 begin');
            await notificationUtil.cancelNotificationById(41);
            let req: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await publishQuietly(req, 42);
            let recorded: boolean = await waitRecorded(req);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(recorded));
            expect(recorded).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, 42);
            expect(request.id).assertEqual(42);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 41);
            expect(cancelledIds[0]).assertEqual(41);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_PUBLISH_0012
         * @tc.name testPublish0012
         * @tc.desc 提示音开启直调发布：槽位意图携带系统提示音路径
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0012 begin');
            notificationUtil.promptTone(true);
            let req: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await publishQuietly(req);
            let recorded: boolean = await waitRecorded(req);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(recorded));
            expect(recorded).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', slot.sound, SOUND_PATH);
            expect(slot.sound).assertEqual(SOUND_PATH);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === undefined));
            expect(slot.vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPublish0012 end');
        });
    });
}
