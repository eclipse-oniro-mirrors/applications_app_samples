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

// notificationManagement.addNotification 直调的类型混合分布向量。
// 单类型/双类型/三类型/全谱/空分布逐向量展开；直调不经系统 publish，确定性成立。
// 期望值来源：状态推演（countsByType 逐槽计数、badge 等于总数、分组长度等于槽计数）。
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationManagement } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';
const T_BASIC: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT;
const T_LONG: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT;
const T_MULTI: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_MULTILINE;
const T_PICTURE: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_PICTURE;
const T_CONVERSATION: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION;
const T_SYSTEM_LIVE: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW;
const T_LIVE: notification.ContentType = notification.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW;

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

async function addMix(types: notification.ContentType[]): Promise<void> {
    for (let i: number = 0; i < types.length; i++) {
        await addQuietly(buildRequest(i, types[i]));
    }
}

export default function mgmtMixVolume01Test() {
    describe('MgmtMixVolume01', () => {
        beforeEach(async () => {
            await notificationManagement.resetTypeNotificationState();
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0001
         * @tc.name testVMgmtMix0001
         * @tc.desc 空分布（0 条）计数全零、角标 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVMgmtMix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0001 begin');
            await addMix([]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 0);
            expect(badge).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[0], 0);
            expect(counts[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[6], 0);
            expect(counts[6]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0002
         * @tc.name testVMgmtMix0002
         * @tc.desc 单类型 basic 1 条：槽 0 计 1、角标 1、分组长度 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0002 begin');
            await addMix([T_BASIC]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let result: notification.NotificationRequest[][] =
                (await notificationManagement.getAllNotifications()).groupNotifications;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 1);
            expect(badge).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[0], 1);
            expect(counts[0]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', result[0].length, 1);
            expect(result[0].length).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0003
         * @tc.name testVMgmtMix0003
         * @tc.desc 单类型 longText 1 条：槽 1 计 1、角标 1、分组长度 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0003 begin');
            await addMix([T_LONG]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let result: notification.NotificationRequest[][] =
                (await notificationManagement.getAllNotifications()).groupNotifications;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 1);
            expect(badge).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[1], 1);
            expect(counts[1]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', result[1].length, 1);
            expect(result[1].length).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0004
         * @tc.name testVMgmtMix0004
         * @tc.desc 单类型 multiLine 1 条：槽 4（MULTILINE 枚举值）计 1、角标 1、分组长度 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0004 begin');
            await addMix([T_MULTI]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let result: notification.NotificationRequest[][] =
                (await notificationManagement.getAllNotifications()).groupNotifications;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 1);
            expect(badge).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[T_MULTI], 1);
            expect(counts[T_MULTI]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', result[T_MULTI].length, 1);
            expect(result[T_MULTI].length).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0005
         * @tc.name testVMgmtMix0005
         * @tc.desc 单类型 picture 1 条：槽 2（PICTURE 枚举值）计 1、角标 1、分组长度 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0005 begin');
            await addMix([T_PICTURE]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let result: notification.NotificationRequest[][] =
                (await notificationManagement.getAllNotifications()).groupNotifications;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 1);
            expect(badge).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[T_PICTURE], 1);
            expect(counts[T_PICTURE]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', result[T_PICTURE].length, 1);
            expect(result[T_PICTURE].length).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0006
         * @tc.name testVMgmtMix0006
         * @tc.desc 单类型 conversation 1 条：槽 3（CONVERSATION 枚举值）计 1、角标 1、分组长度 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0006 begin');
            await addMix([T_CONVERSATION]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let result: notification.NotificationRequest[][] =
                (await notificationManagement.getAllNotifications()).groupNotifications;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 1);
            expect(badge).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[T_CONVERSATION], 1);
            expect(counts[T_CONVERSATION]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', result[T_CONVERSATION].length, 1);
            expect(result[T_CONVERSATION].length).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0007
         * @tc.name testVMgmtMix0007
         * @tc.desc 单类型 systemLiveView 1 条：槽 5 计 1、角标 1、分组长度 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0007 begin');
            await addMix([T_SYSTEM_LIVE]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let result: notification.NotificationRequest[][] =
                (await notificationManagement.getAllNotifications()).groupNotifications;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 1);
            expect(badge).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[5], 1);
            expect(counts[5]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', result[5].length, 1);
            expect(result[5].length).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0008
         * @tc.name testVMgmtMix0008
         * @tc.desc 单类型 liveView（第 7 枚举）1 条：槽 6 计 1、角标 1、分组长度 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0008 begin');
            await addMix([T_LIVE]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let result: notification.NotificationRequest[][] =
                (await notificationManagement.getAllNotifications()).groupNotifications;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 1);
            expect(badge).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[6], 1);
            expect(counts[6]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', result[6].length, 1);
            expect(result[6].length).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0009
         * @tc.name testVMgmtMix0009
         * @tc.desc 双类型分布 (basic,longText)：槽 0/1 各计 1、角标 2
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0009 begin');
            await addMix([T_BASIC, T_LONG]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 2);
            expect(badge).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[0], 1);
            expect(counts[0]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[1], 1);
            expect(counts[1]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0010
         * @tc.name testVMgmtMix0010
         * @tc.desc 双类型分布 (multiLine,picture)：槽 4/2 各计 1、角标 2
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0010 begin');
            await addMix([T_MULTI, T_PICTURE]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 2);
            expect(badge).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[T_MULTI], 1);
            expect(counts[T_MULTI]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[T_PICTURE], 1);
            expect(counts[T_PICTURE]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0011
         * @tc.name testVMgmtMix0011
         * @tc.desc 双类型分布 (conversation,liveView)：槽 3/6 各计 1、角标 2
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0011 begin');
            await addMix([T_CONVERSATION, T_LIVE]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 2);
            expect(badge).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[T_CONVERSATION], 1);
            expect(counts[T_CONVERSATION]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[6], 1);
            expect(counts[6]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0012
         * @tc.name testVMgmtMix0012
         * @tc.desc 三类型分布 (basic,longText,multiLine)：槽 0/1/4 各计 1、角标 3
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0012 begin');
            await addMix([T_BASIC, T_LONG, T_MULTI]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 3);
            expect(badge).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[0], 1);
            expect(counts[0]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[T_MULTI], 1);
            expect(counts[T_MULTI]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0013
         * @tc.name testVMgmtMix0013
         * @tc.desc 三类型分布 (picture,conversation,liveView)：槽 2/3/6 各计 1、角标 3
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0013 begin');
            await addMix([T_PICTURE, T_CONVERSATION, T_LIVE]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 3);
            expect(badge).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[T_PICTURE], 1);
            expect(counts[T_PICTURE]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[T_CONVERSATION], 1);
            expect(counts[T_CONVERSATION]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0014
         * @tc.name testVMgmtMix0014
         * @tc.desc 全谱分布 7 类各 1：七槽各计 1、角标 7
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0014 begin');
            await addMix([T_BASIC, T_LONG, T_MULTI, T_PICTURE, T_CONVERSATION, T_SYSTEM_LIVE, T_LIVE]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 7);
            expect(badge).assertEqual(7);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[5], 1);
            expect(counts[5]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[6], 1);
            expect(counts[6]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0015
         * @tc.name testVMgmtMix0015
         * @tc.desc 重复类型分布 (basic×2,longText)：槽 0 计 2、槽 1 计 1、角标 3
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0015 begin');
            await addMix([T_BASIC, T_BASIC, T_LONG]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 3);
            expect(badge).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[0], 2);
            expect(counts[0]).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[1], 1);
            expect(counts[1]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VMGTMIX_0016
         * @tc.name testVMgmtMix0016
         * @tc.desc 重复类型分布 (basic,picture×2,conversation)：槽 2 计 2、槽 0/3 各计 1、角标 4
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVMgmtMix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0016 begin');
            await addMix([T_BASIC, T_PICTURE, T_PICTURE, T_CONVERSATION]);
            let counts: number[] = (await notificationManagement.getAllNotifications()).countsByType;
            let badge: number = notificationManagement.getBadgeNumber();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', badge, 4);
            expect(badge).assertEqual(4);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[T_PICTURE], 2);
            expect(counts[T_PICTURE]).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', counts[T_CONVERSATION], 1);
            expect(counts[T_CONVERSATION]).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVMgmtMix0016 end');
        });
    });
}
