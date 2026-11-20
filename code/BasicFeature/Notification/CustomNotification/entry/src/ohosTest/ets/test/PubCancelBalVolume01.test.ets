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

// 发布数量 n∈{1,2,3,5} × 取消数量 m∈{0,1,2,3} 组合档（4×4）。
// 断言只打 publish reject 也成立的观测点（发布记录在 publish 之前、取消 push 无条件）。
// 期望值来源：状态推演（取消记录按序累积 m 条、发布引用为第 n 只、m=0 无取消链）。
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

async function publishN(base: number, count: number): Promise<notification.NotificationRequest> {
    let lastReq: notification.NotificationRequest = buildPlainRequest(base);
    for (let i: number = 0; i < count; i++) {
        lastReq = buildPlainRequest(base + i);
        await notificationUtil.publishNotification(lastReq);
    }
    return lastReq;
}

async function cancelFirstM(base: number, count: number): Promise<void> {
    for (let i: number = 0; i < count; i++) {
        await notificationUtil.cancelNotificationById(base + i);
    }
}

export default function pubCancelBalVolume01Test() {
    describe('PubCancelBalVolume01', () => {
        beforeEach(async () => {
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0001
         * @tc.name testVPubBal0001
         * @tc.desc 1×0 档（发布 1 取消 0）——记录空、发布引用唯一只、槽位意图在
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVPubBal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0001 begin');
            let lastReq: notification.NotificationRequest = await publishN(71, 1);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 0);
            expect(cancelledIds.length).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot !== undefined));
            expect(slot !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0002
         * @tc.name testVPubBal0002
         * @tc.desc 1×1 档：记录 1 条末位为取消 id，发布引用保持唯一只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0002 begin');
            let lastReq: notification.NotificationRequest = await publishN(79, 1);
            await cancelFirstM(79, 1);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 79);
            expect(cancelledIds[0]).assertEqual(79);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0003
         * @tc.name testVPubBal0003
         * @tc.desc 1×2 档（取消多于发布）：记录 2 条按序，发布引用保持唯一只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0003 begin');
            let lastReq: notification.NotificationRequest = await publishN(87, 1);
            await cancelFirstM(87, 2);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 2);
            expect(cancelledIds.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[1], 88);
            expect(cancelledIds[1]).assertEqual(88);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0004
         * @tc.name testVPubBal0004
         * @tc.desc 1×3 档（取消多于发布）：记录 3 条按序，发布引用保持唯一只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0004 begin');
            let lastReq: notification.NotificationRequest = await publishN(95, 1);
            await cancelFirstM(95, 3);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 3);
            expect(cancelledIds.length).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[2], 97);
            expect(cancelledIds[2]).assertEqual(97);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0005
         * @tc.name testVPubBal0005
         * @tc.desc 2×0 档：记录空、发布引用为第 2 只、槽位意图在
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0005 begin');
            let lastReq: notification.NotificationRequest = await publishN(103, 2);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 0);
            expect(cancelledIds.length).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot !== undefined));
            expect(slot !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0006
         * @tc.name testVPubBal0006
         * @tc.desc 2×1 档：记录 1 条末位为取消 id，发布引用为第 2 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0006 begin');
            let lastReq: notification.NotificationRequest = await publishN(111, 2);
            await cancelFirstM(111, 1);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 111);
            expect(cancelledIds[0]).assertEqual(111);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0007
         * @tc.name testVPubBal0007
         * @tc.desc 2×2 档：记录 2 条按序，发布引用为第 2 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0007 begin');
            let lastReq: notification.NotificationRequest = await publishN(119, 2);
            await cancelFirstM(119, 2);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 2);
            expect(cancelledIds.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[1], 120);
            expect(cancelledIds[1]).assertEqual(120);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0008
         * @tc.name testVPubBal0008
         * @tc.desc 2×3 档（取消多于发布）：记录 3 条按序，发布引用为第 2 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0008 begin');
            let lastReq: notification.NotificationRequest = await publishN(127, 2);
            await cancelFirstM(127, 3);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 3);
            expect(cancelledIds.length).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[2], 129);
            expect(cancelledIds[2]).assertEqual(129);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0009
         * @tc.name testVPubBal0009
         * @tc.desc 3×0 档：记录空、发布引用为第 3 只、槽位意图在
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0009 begin');
            let lastReq: notification.NotificationRequest = await publishN(135, 3);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 0);
            expect(cancelledIds.length).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot !== undefined));
            expect(slot !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0010
         * @tc.name testVPubBal0010
         * @tc.desc 3×1 档：记录 1 条末位为取消 id，发布引用为第 3 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0010 begin');
            let lastReq: notification.NotificationRequest = await publishN(143, 3);
            await cancelFirstM(143, 1);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 143);
            expect(cancelledIds[0]).assertEqual(143);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0011
         * @tc.name testVPubBal0011
         * @tc.desc 3×2 档：记录 2 条按序，发布引用为第 3 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0011 begin');
            let lastReq: notification.NotificationRequest = await publishN(151, 3);
            await cancelFirstM(151, 2);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 2);
            expect(cancelledIds.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[1], 152);
            expect(cancelledIds[1]).assertEqual(152);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0012
         * @tc.name testVPubBal0012
         * @tc.desc 3×3 档：记录 3 条按序，发布引用为第 3 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0012 begin');
            let lastReq: notification.NotificationRequest = await publishN(159, 3);
            await cancelFirstM(159, 3);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 3);
            expect(cancelledIds.length).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[2], 161);
            expect(cancelledIds[2]).assertEqual(161);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0013
         * @tc.name testVPubBal0013
         * @tc.desc 5×0 档：记录空、发布引用为第 5 只、槽位意图在
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0013 begin');
            let lastReq: notification.NotificationRequest = await publishN(167, 5);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 0);
            expect(cancelledIds.length).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot !== undefined));
            expect(slot !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0014
         * @tc.name testVPubBal0014
         * @tc.desc 5×1 档：记录 1 条末位为取消 id，发布引用为第 5 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0014 begin');
            let lastReq: notification.NotificationRequest = await publishN(175, 5);
            await cancelFirstM(175, 1);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 175);
            expect(cancelledIds[0]).assertEqual(175);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0015
         * @tc.name testVPubBal0015
         * @tc.desc 5×2 档：记录 2 条按序，发布引用为第 5 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0015 begin');
            let lastReq: notification.NotificationRequest = await publishN(183, 5);
            await cancelFirstM(183, 2);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 2);
            expect(cancelledIds.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[1], 184);
            expect(cancelledIds[1]).assertEqual(184);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBBAL_0016
         * @tc.name testVPubBal0016
         * @tc.desc 5×3 满档：记录 3 条按序，发布引用为第 5 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPubBal0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0016 begin');
            let lastReq: notification.NotificationRequest = await publishN(191, 5);
            await cancelFirstM(191, 3);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 3);
            expect(cancelledIds.length).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[2], 193);
            expect(cancelledIds[2]).assertEqual(193);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === lastReq));
            expect(notificationUtil.getLastPublishedRequest() === lastReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPubBal0016 end');
        });
    });
}
