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

// 取消记录域的边界、状态与跨链路行为。
// 期望值来源：状态推演（push 无条件、cancelAll 只清列表、取消链不动发布记录）。
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationUtil } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';
const BASE_ID: number = 9;

function buildPlainRequest(id: number): notification.NotificationRequest {
    let content: notification.NotificationContent = {
        notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: { title: 'title-' + id, text: 'text-' + id, additionalText: 'additional' }
    };
    return { id: id, content: content, notificationSlotType: notification.SlotType.CONTENT_INFORMATION };
}

export default function cancelIdReal01Test() {
    describe('CancelIdReal01', () => {
        beforeEach(async () => {
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_REAL_0001
         * @tc.name testVCancelReal0001
         * @tc.desc 取消 id=0 与 id=2147483648+1 越界档，push 无合法性检查一律记录
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVCancelReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancelReal0001 begin');
            await notificationUtil.cancelNotificationById(0);
            await notificationUtil.cancelNotificationById(2147483647);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 2);
            expect(cancelledIds.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 0);
            expect(cancelledIds[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[1], 2147483647);
            expect(cancelledIds[1]).assertEqual(2147483647);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancelReal0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_REAL_0002
         * @tc.name testVCancelReal0002
         * @tc.desc 重复取消同 id=5：push 不去重，记录两条且均值为 5（幂等追加）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancelReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancelReal0002 begin');
            await notificationUtil.cancelNotificationById(5);
            await notificationUtil.cancelNotificationById(5);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 2);
            expect(cancelledIds.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 5);
            expect(cancelledIds[0]).assertEqual(5);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[1], 5);
            expect(cancelledIds[1]).assertEqual(5);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancelReal0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_REAL_0003
         * @tc.name testVCancelReal0003
         * @tc.desc cancelAll 清空后取消记录重新起步：先记 1 条、清空、再取消后仅 1 条且末位为新 id
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancelReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancelReal0003 begin');
            await notificationUtil.cancelNotificationById(3);
            await notificationUtil.cancelAllNotifications();
            let cleared: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cleared.length, 0);
            expect(cleared.length).assertEqual(0);
            await notificationUtil.cancelNotificationById(11);
            let restarted: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', restarted.length, 1);
            expect(restarted.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', restarted[0], 11);
            expect(restarted[0]).assertEqual(11);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancelReal0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_REAL_0004
         * @tc.name testVCancelReal0004
         * @tc.desc 正负交替取消 7/-7/13：顺序与符号原样保持，负值不被过滤或取绝对值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancelReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancelReal0004 begin');
            await notificationUtil.cancelNotificationById(7);
            await notificationUtil.cancelNotificationById(-7);
            await notificationUtil.cancelNotificationById(13);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 3);
            expect(cancelledIds.length).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 7);
            expect(cancelledIds[0]).assertEqual(7);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[2], 13);
            expect(cancelledIds[2]).assertEqual(13);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancelReal0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_REAL_0005
         * @tc.name testVCancelReal0005
         * @tc.desc 发布-取消-发布-取消跨链路：取消记录按序 2 条，末次发布引用保持为第 2 只请求
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancelReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancelReal0005 begin');
            let firstReq: notification.NotificationRequest = buildPlainRequest(21);
            await notificationUtil.publishNotification(firstReq);
            await notificationUtil.cancelNotificationById(21);
            let secondReq: notification.NotificationRequest = buildPlainRequest(22);
            await notificationUtil.publishNotification(secondReq);
            await notificationUtil.cancelNotificationById(22);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 2);
            expect(cancelledIds.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[1], 22);
            expect(cancelledIds[1]).assertEqual(22);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === secondReq));
            expect(lastPublished === secondReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancelReal0005 end');
        });
    });
}
