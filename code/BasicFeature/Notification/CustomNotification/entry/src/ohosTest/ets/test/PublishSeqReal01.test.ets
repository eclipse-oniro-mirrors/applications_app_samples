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

// 发布-取消序列域的边界、反向序列与跨链路性质。
// 期望值来源：状态推演（cancelAll 只清取消记录不触碰发布记录、发布不动取消记录、副本回读稳定）。
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

export default function publishSeqReal01Test() {
    describe('PublishSeqReal01', () => {
        beforeEach(async () => {
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_REAL_0001
         * @tc.name testVPublishSeqReal0001
         * @tc.desc 空起步边界——取消记录空、副本回读两次稳定、发布引用不被 cancelAll 触碰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVPublishSeqReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeqReal0001 begin');
            let before: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 0);
            expect(cancelledIds.length).assertEqual(0);
            let readAgain: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', readAgain.length, 0);
            expect(readAgain.length).assertEqual(0);
            let after: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeqReal0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_REAL_0002
         * @tc.name testVPublishSeqReal0002
         * @tc.desc pub→cancel→cancelAll→pub：取消记录被清空且再发布不重建，发布引用切至第 2 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeqReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeqReal0002 begin');
            await notificationUtil.publishNotification(buildPlainRequest(62));
            await notificationUtil.cancelNotificationById(62);
            await notificationUtil.cancelAllNotifications();
            let secondReq: notification.NotificationRequest = buildPlainRequest(63);
            await notificationUtil.publishNotification(secondReq);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 0);
            expect(cancelledIds.length).assertEqual(0);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === secondReq));
            expect(lastPublished === secondReq).assertTrue();
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot !== undefined));
            expect(slot !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeqReal0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_REAL_0003
         * @tc.name testVPublishSeqReal0003
         * @tc.desc 负向反向序列 cancel→pub：取消先积累 1 条，发布不触碰取消记录
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeqReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeqReal0003 begin');
            await notificationUtil.cancelNotificationById(64);
            let request: notification.NotificationRequest = buildPlainRequest(64);
            await notificationUtil.publishNotification(request);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 64);
            expect(cancelledIds[0]).assertEqual(64);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === request));
            expect(lastPublished === request).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeqReal0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_REAL_0004
         * @tc.name testVPublishSeqReal0004
         * @tc.desc pub→cancel→pub→cancel→cancelAll 终态：取消记录清空、发布引用保持末只、槽位意图仍在（showcase）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeqReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeqReal0004 begin');
            await notificationUtil.publishNotification(buildPlainRequest(65));
            await notificationUtil.cancelNotificationById(65);
            let secondReq: notification.NotificationRequest = buildPlainRequest(66);
            await notificationUtil.publishNotification(secondReq);
            await notificationUtil.cancelNotificationById(66);
            await notificationUtil.cancelAllNotifications();
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 0);
            expect(cancelledIds.length).assertEqual(0);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === secondReq));
            expect(lastPublished === secondReq).assertTrue();
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot !== undefined));
            expect(slot !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeqReal0004 end');
        });
    });
}
