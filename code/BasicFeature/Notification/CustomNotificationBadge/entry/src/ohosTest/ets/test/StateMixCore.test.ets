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

// 契约层：notificationUtil（发布链）与 notificationManagement（本地分组/角标）的跨模块状态序列。
// 系统侧投递成功与否依赖设备授权，因此断言只取两种结果都成立的**不变量**：
// 角标读数恒等于各分组计数之和、越界内容类型永不入组、取消通知不清本地缓存、复位后计数归零。
import { describe, beforeAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import {
    notificationUtil, notificationManagement, notificationContentUtil, notificationRequestUtil
} from '@ohos/notification';
import { resetManagementState } from './helper/StateReset';
import { settleAsync } from './helper/TestContext';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotificationBadge]';
const SLOT_COUNT: number = 7;
const LONGTEXT_TYPE: number = 1;
const CONVERSATION_TYPE: number = 3;
const UNKNOWN_TYPE: number = 99;

function sumCounts(): number {
    let total: number = 0;
    for (let i = 0; i < notificationManagement.countsByType.length; i++) {
        total += notificationManagement.countsByType[i];
    }
    return total;
}

function buildBasicRequest(title: string): notification.NotificationRequest {
    let basic: notification.NotificationBasicContent = { title: title, text: 'Body', additionalText: '' };
    return notificationRequestUtil.initBasicNotificationRequest(
        notificationContentUtil.initBasicNotificationContent(basic));
}

function buildLongTextRequest(): notification.NotificationRequest {
    let basic: notification.NotificationBasicContent = { title: 'LongTitle', text: 'Body' };
    return notificationRequestUtil.initBasicNotificationRequest(
        notificationContentUtil.initNotificationLongTextContent(basic, 'Long', 'Brief', 'Expanded'));
}

function buildConversationRequest(): notification.NotificationRequest {
    let basic: notification.NotificationBasicContent = { title: 'Chat', text: 'Hello' };
    return notificationRequestUtil.initBasicNotificationRequest(
        notificationContentUtil.initNotificationConversationContent(basic));
}

async function publishQuietly(request: notification.NotificationRequest, group?: string): Promise<void> {
    try {
        await notificationUtil.publishNotification(request, group);
    } catch (err) {
        hilog.error(DOMAIN, TAG, 'publish rejected, error=%{public}s', JSON.stringify(err));
    }
}

export default function stateMixCoreTest() {
    describe('StateMixCore', () => {
        beforeAll(async () => {
            // 等 notificationManagement 构造期回调落地后再复位
            await settleAsync(300);
            resetManagementState();
        });

        beforeEach(() => {
            resetManagementState();
        });

        /**
         * @tc.number SUB_CNB_STATE_0001
         * @tc.name testState0001
         * @tc.desc 不变量：一次发布后角标读数恒等于各分组计数之和
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testState0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            await publishQuietly(buildBasicRequest('StateBasic'));
            let badge: number = notificationManagement.getBadgeNumber();
            let total: number = sumCounts();
            hilog.info(DOMAIN, TAG, 'badge=%{public}d total=%{public}d', badge, total);
            expect(badge).assertEqual(total);
            expect(total <= 1).assertTrue();
            expect(notificationManagement.countsByType.length).assertEqual(SLOT_COUNT);
        });

        /**
         * @tc.number SUB_CNB_STATE_0002
         * @tc.name testState0002
         * @tc.desc 不变量：连续发布 3 条后角标不超过 3 且与计数和一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            for (let i = 0; i < 3; i++) {
                await publishQuietly(buildBasicRequest(`StateSeq${i}`));
            }
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'badge=%{public}d total=%{public}d', badge, sumCounts());
            expect(badge).assertEqual(sumCounts());
            expect(badge).assertLessOrEqual(3);
            expect(badge >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_STATE_0003
         * @tc.name testState0003
         * @tc.desc 状态：社交类型发布若入组必然落在 3 号槽，否则整组为空
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = buildConversationRequest();
            await publishQuietly(request, 'CONVERSATION');
            let total: number = sumCounts();
            hilog.info(DOMAIN, TAG, 'total=%{public}d conversationCount=%{public}d', total,
                notificationManagement.countsByType[CONVERSATION_TYPE]);
            expect(total <= 1).assertTrue();
            if (total === 1) {
                expect(notificationManagement.countsByType[CONVERSATION_TYPE]).assertEqual(1);
            } else {
                expect(notificationManagement.countsByType[CONVERSATION_TYPE]).assertEqual(0);
                expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            }
            expect(request.groupName as string).assertEqual('CONVERSATION');
        });

        /**
         * @tc.number SUB_CNB_STATE_0004
         * @tc.name testState0004
         * @tc.desc 状态：复位后再发布，本地计数从零重新累计
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await publishQuietly(buildLongTextRequest());
            resetManagementState();
            let afterReset: number = sumCounts();
            await publishQuietly(buildLongTextRequest());
            let afterRepublish: number = sumCounts();
            hilog.info(DOMAIN, TAG, 'afterReset=%{public}d afterRepublish=%{public}d', afterReset, afterRepublish);
            expect(afterReset).assertEqual(0);
            expect(afterRepublish <= 1).assertTrue();
            expect(notificationManagement.getBadgeNumber()).assertEqual(afterRepublish);
        });

        /**
         * @tc.number SUB_CNB_STATE_0005
         * @tc.name testState0005
         * @tc.desc 状态：取消全部通知不清本地缓存，复位后才归零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            await publishQuietly(buildBasicRequest('CancelAllProbe'));
            let beforeCancel: number = notificationManagement.getBadgeNumber();
            await notificationUtil.cancelAllNotifications();
            let afterCancel: number = notificationManagement.getBadgeNumber();
            resetManagementState();
            let afterReset: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'before=%{public}d afterCancel=%{public}d afterReset=%{public}d',
                beforeCancel, afterCancel, afterReset);
            expect(afterCancel).assertEqual(beforeCancel);
            expect(afterReset).assertEqual(0);
            expect(afterReset < afterCancel + 1).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_STATE_0006
         * @tc.name testState0006
         * @tc.desc 不变量：未知内容类型即使发布成功也不入组，计数保持 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest({
                notificationContentType: UNKNOWN_TYPE as notification.ContentType
            });
            await publishQuietly(request, 'BASIC');
            hilog.info(DOMAIN, TAG, 'total=%{public}d badge=%{public}d', sumCounts(),
                notificationManagement.getBadgeNumber());
            expect(sumCounts()).assertEqual(0);
            expect(notificationManagement.getBadgeNumber()).assertEqual(0);
            expect(notificationManagement.countsByType[0]).assertEqual(0);
        });
    });
}
