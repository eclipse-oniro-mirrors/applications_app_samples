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

// 类型混合分布域的边界、全谱、越界与取消语义。
// 期望值来源：状态推演（空分布全零、全谱各槽 1、越界分量不入槽、cancelNotificationType 同步清空分组与计数并扣减角标）。
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationManagement } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';

function buildRequest(id: number, contentType: notification.ContentType): notification.NotificationRequest {
    let content: notification.NotificationContent = { notificationContentType: contentType };
    return { id: id, content: content, notificationSlotType: notification.SlotType.CONTENT_INFORMATION };
}

async function addQuietly(request: notification.NotificationRequest): Promise<void> {
    try {
        await notificationManagement.addNotification(request);
    } catch (error) {
        hilog.warn(DOMAIN, TAG, 'setBadgeNumber rejected after local state updated');
    }
}

export default function mgmtMixReal01Test() {
    describe('MgmtMixReal01', () => {
        beforeEach(async () => {
            await notificationManagement.resetTypeNotificationState();
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_REAL_0001
         * @tc.name testVMgmtMixReal0001
         * @tc.desc 空分布边界——重置后各槽计数全零、角标 0、分组空数组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVMgmtMixReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMixReal0001 begin');
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let result: notification.NotificationRequest[][] =
                (await notificationManagement.getAllNotifications()).groupNotifications;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 0);
            expect(badge).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[0], 0);
            expect(counts[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', result[0].length, 0);
            expect(result[0].length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMixReal0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_REAL_0002
         * @tc.name testVMgmtMixReal0002
         * @tc.desc 全谱 7 类各 1 条：角标 7、首末槽各计 1，类型轴完整贯通（showcase）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMixReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMixReal0002 begin');
            await addQuietly(buildRequest(1, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(2, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            await addQuietly(buildRequest(3, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            await addQuietly(buildRequest(4, notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
            await addQuietly(buildRequest(5, notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
            await addQuietly(buildRequest(6, notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
            await addQuietly(buildRequest(7, notification.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW));
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 7);
            expect(badge).assertEqual(7);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[0], 1);
            expect(counts[0]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[6], 1);
            expect(counts[6]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMixReal0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_REAL_0003
         * @tc.name testVMgmtMixReal0003
         * @tc.desc 同类型堆积：5 条 basic 全入槽 0——角标 5、槽 0 计 5、分组长度 5
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMixReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMixReal0003 begin');
            for (let i: number = 0; i < 5; i++) {
                await addQuietly(buildRequest(11 + i, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            }
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let result: notification.NotificationRequest[][] =
                (await notificationManagement.getAllNotifications()).groupNotifications;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 5);
            expect(badge).assertEqual(5);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[0], 5);
            expect(counts[0]).assertEqual(5);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', result[0].length, 5);
            expect(result[0].length).assertEqual(5);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMixReal0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_REAL_0004
         * @tc.name testVMgmtMixReal0004
         * @tc.desc 负向分布含越界分量：3 合法 + typeId=99 越界 1 条——越界不入槽，角标仅 3
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMixReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMixReal0004 begin');
            await addQuietly(buildRequest(21, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(22, 99 as notification.ContentType));
            await addQuietly(buildRequest(23, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            await addQuietly(buildRequest(24, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 3);
            expect(badge).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[0], 1);
            expect(counts[0]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                counts[notification.ContentType.NOTIFICATION_CONTENT_MULTILINE], 1);
            expect(counts[notification.ContentType.NOTIFICATION_CONTENT_MULTILINE]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMixReal0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_REAL_0005
         * @tc.name testVMgmtMixReal0005
         * @tc.desc cancelNotificationType 清单类型：槽 0 归零、槽 1 保持、角标同步扣减
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMixReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMixReal0005 begin');
            await addQuietly(buildRequest(31, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
            await addQuietly(buildRequest(32, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
            await notificationManagement.cancelNotificationType(0);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[0], 0);
            expect(counts[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[1], 1);
            expect(counts[1]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 1);
            expect(badge).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMixReal0005 end');
        });
    });
}
