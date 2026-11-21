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

// 数量组合域的边界组合、slot 引用不变性与两链独立性。
// 期望值来源：状态推演（取消 push 无条件且不触碰发布记录与槽位意图、发布引用为第 n 只）。
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationUtil } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';

function buildPlainRequest(id: number): notification.NotificationRequest {
    let content: notification.NotificationContent = {
        notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: { title: 'title-' + id, text: 'text-' + id, additionalText: 'additional' }
    };
    return { id: id, content: content, notificationSlotType: notification.SlotType.CONTENT_INFORMATION };
}

export default function pubCancelBalReal01Test() {
    describe('PubCancelBalReal01', () => {
        beforeEach(async () => {
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_REAL_0001
         * @tc.name testVPubBalReal0001
         * @tc.desc 1×3 边界组合（取消多于发布）——记录逐位全断且发布引用保持唯一只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVPubBalReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBalReal0001 begin');
            let request: notification.NotificationRequest = buildPlainRequest(211);
            await notificationUtil.publishNotification(request);
            await notificationUtil.cancelNotificationById(211);
            await notificationUtil.cancelNotificationById(212);
            await notificationUtil.cancelNotificationById(213);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 211);
            expect(cancelledIds[0]).assertEqual(211);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[1], 212);
            expect(cancelledIds[1]).assertEqual(212);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[2], 213);
            expect(cancelledIds[2]).assertEqual(213);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === request));
            expect(notificationUtil.getLastPublishedRequest() === request).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBalReal0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_REAL_0002
         * @tc.name testVPubBalReal0002
         * @tc.desc 取消链不触碰槽位意图：发布后快照 slot，取消 3 条后 slot 引用身份不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBalReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBalReal0002 begin');
            await notificationUtil.publishNotification(buildPlainRequest(221));
            let slotBefore: notification.NotificationSlot | undefined =
                notificationUtil.getLastNotificationSlot();
            await notificationUtil.cancelNotificationById(221);
            await notificationUtil.cancelNotificationById(222);
            await notificationUtil.cancelNotificationById(223);
            let slotAfter: notification.NotificationSlot | undefined =
                notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slotAfter === slotBefore));
            expect(slotAfter === slotBefore).assertTrue();
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 3);
            expect(cancelledIds.length).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[2], 223);
            expect(cancelledIds[2]).assertEqual(223);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBalReal0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_REAL_0003
         * @tc.name testVPubBalReal0003
         * @tc.desc 负向纯取消（发布 0 只、取消 id 与发布无交集）：两链独立——发布引用与槽位意图均不被触碰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBalReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBalReal0003 begin');
            let before: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            let slotBefore: notification.NotificationSlot | undefined =
                notificationUtil.getLastNotificationSlot();
            await notificationUtil.cancelNotificationById(231);
            await notificationUtil.cancelNotificationById(232);
            await notificationUtil.cancelNotificationById(233);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 3);
            expect(cancelledIds.length).assertEqual(3);
            let after: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            let slotAfter: notification.NotificationSlot | undefined =
                notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slotAfter === slotBefore));
            expect(slotAfter === slotBefore).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBalReal0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_REAL_0004
         * @tc.name testVPubBalReal0004
         * @tc.desc 5×3 满档跨链路（showcase）：记录 3 条逐位、发布引用为第 5 只（id 与引用双重）、slot 意图在
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBalReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBalReal0004 begin');
            let lastReq: notification.NotificationRequest = buildPlainRequest(245);
            for (let i: number = 0; i < 4; i++) {
                await notificationUtil.publishNotification(buildPlainRequest(241 + i));
            }
            await notificationUtil.publishNotification(lastReq);
            await notificationUtil.cancelNotificationById(241);
            await notificationUtil.cancelNotificationById(242);
            await notificationUtil.cancelNotificationById(243);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 3);
            expect(cancelledIds.length).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[2], 243);
            expect(cancelledIds[2]).assertEqual(243);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === lastReq));
            expect(lastPublished === lastReq).assertTrue();
            let lastRequest: notification.NotificationRequest =
                lastPublished as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastRequest.id, 245);
            expect(lastRequest.id).assertEqual(245);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBalReal0004 end');
        });
    });
}
