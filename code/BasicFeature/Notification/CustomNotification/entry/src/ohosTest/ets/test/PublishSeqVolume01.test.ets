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

// 发布链与取消链的状态序列（发布/取消/cancelAll ≤5 步组合）。
// 断言只打 publish reject 也成立的观测点（发布记录在 publish 之前、取消 push 无条件）。
// 期望值来源：状态推演（取消记录按序累积、cancelAll 清空、发布记录引用身份）。
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

export default function publishSeqVolume01Test() {
    describe('PublishSeqVolume01', () => {
        beforeEach(async () => {
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0001
         * @tc.name testVPublishSeq0001
         * @tc.desc pub→cancelAll→cancel 清空后起步：记录 1 条且末位为取消 id，发布引用保持
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVPublishSeq0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0001 begin');
            let request: notification.NotificationRequest = buildPlainRequest(31);
            await notificationUtil.publishNotification(request);
            await notificationUtil.cancelAllNotifications();
            await notificationUtil.cancelNotificationById(31);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 31);
            expect(cancelledIds[0]).assertEqual(31);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === request));
            expect(lastPublished === request).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0002
         * @tc.name testVPublishSeq0002
         * @tc.desc pub→cancel 序列：记录 1 条且末位为取消 id，发布引用保持
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0002 begin');
            let request: notification.NotificationRequest = buildPlainRequest(32);
            await notificationUtil.publishNotification(request);
            await notificationUtil.cancelNotificationById(32);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 32);
            expect(cancelledIds[0]).assertEqual(32);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === request));
            expect(lastPublished === request).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0003
         * @tc.name testVPublishSeq0003
         * @tc.desc pub→cancelAll 序列：取消记录清空，发布记录引用与 id 均保持
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0003 begin');
            let request: notification.NotificationRequest = buildPlainRequest(33);
            await notificationUtil.publishNotification(request);
            await notificationUtil.cancelAllNotifications();
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 0);
            expect(cancelledIds.length).assertEqual(0);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === request));
            expect(lastPublished === request).assertTrue();
            let lastRequest: notification.NotificationRequest =
                lastPublished as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastRequest.id, 33);
            expect(lastRequest.id).assertEqual(33);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0004
         * @tc.name testVPublishSeq0004
         * @tc.desc pub×2→cancel 序列：记录 1 条、末位为取消 id、发布引用为第 2 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0004 begin');
            let firstReq: notification.NotificationRequest = buildPlainRequest(34);
            let secondReq: notification.NotificationRequest = buildPlainRequest(35);
            await notificationUtil.publishNotification(firstReq);
            await notificationUtil.publishNotification(secondReq);
            await notificationUtil.cancelNotificationById(34);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 34);
            expect(cancelledIds[0]).assertEqual(34);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === secondReq));
            expect(lastPublished === secondReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0005
         * @tc.name testVPublishSeq0005
         * @tc.desc pub→cancel→cancel 同 id 序列：记录 2 条均值为该 id，发布引用保持
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0005 begin');
            let request: notification.NotificationRequest = buildPlainRequest(36);
            await notificationUtil.publishNotification(request);
            await notificationUtil.cancelNotificationById(36);
            await notificationUtil.cancelNotificationById(36);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 2);
            expect(cancelledIds.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 36);
            expect(cancelledIds[0]).assertEqual(36);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === request));
            expect(lastPublished === request).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0006
         * @tc.name testVPublishSeq0006
         * @tc.desc cancel→pub 反向序列：取消先积累 1 条、发布后记录仍在，发布引用为新请求
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0006 begin');
            await notificationUtil.cancelNotificationById(37);
            let request: notification.NotificationRequest = buildPlainRequest(37);
            await notificationUtil.publishNotification(request);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 37);
            expect(cancelledIds[0]).assertEqual(37);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === request));
            expect(lastPublished === request).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0007
         * @tc.name testVPublishSeq0007
         * @tc.desc pub→cancel→pub 序列：取消记录保留 1 条，发布引用更替为第 2 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0007 begin');
            let firstReq: notification.NotificationRequest = buildPlainRequest(38);
            await notificationUtil.publishNotification(firstReq);
            await notificationUtil.cancelNotificationById(38);
            let secondReq: notification.NotificationRequest = buildPlainRequest(39);
            await notificationUtil.publishNotification(secondReq);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 38);
            expect(cancelledIds[0]).assertEqual(38);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === secondReq));
            expect(lastPublished === secondReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0008
         * @tc.name testVPublishSeq0008
         * @tc.desc pub×3→cancelAll→cancel 序列：清空后起步 1 条，发布引用为第 3 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0008 begin');
            await notificationUtil.publishNotification(buildPlainRequest(40));
            await notificationUtil.publishNotification(buildPlainRequest(41));
            let thirdReq: notification.NotificationRequest = buildPlainRequest(42);
            await notificationUtil.publishNotification(thirdReq);
            await notificationUtil.cancelAllNotifications();
            await notificationUtil.cancelNotificationById(42);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 42);
            expect(cancelledIds[0]).assertEqual(42);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === thirdReq));
            expect(lastPublished === thirdReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0009
         * @tc.name testVPublishSeq0009
         * @tc.desc pub→cancelAll→pub 序列：取消记录仍空（发布不动记录），发布引用为第 2 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0009 begin');
            await notificationUtil.publishNotification(buildPlainRequest(43));
            await notificationUtil.cancelAllNotifications();
            let secondReq: notification.NotificationRequest = buildPlainRequest(44);
            await notificationUtil.publishNotification(secondReq);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 0);
            expect(cancelledIds.length).assertEqual(0);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === secondReq));
            expect(lastPublished === secondReq).assertTrue();
            let lastRequest: notification.NotificationRequest =
                lastPublished as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastRequest.id, 44);
            expect(lastRequest.id).assertEqual(44);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0010
         * @tc.name testVPublishSeq0010
         * @tc.desc pub→cancel×3 不同 id 序列：记录 3 条按序、末位为末个取消 id，发布引用保持
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0010 begin');
            let request: notification.NotificationRequest = buildPlainRequest(45);
            await notificationUtil.publishNotification(request);
            await notificationUtil.cancelNotificationById(45);
            await notificationUtil.cancelNotificationById(46);
            await notificationUtil.cancelNotificationById(47);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 3);
            expect(cancelledIds.length).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[2], 47);
            expect(cancelledIds[2]).assertEqual(47);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === request));
            expect(lastPublished === request).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0011
         * @tc.name testVPublishSeq0011
         * @tc.desc pub×2→cancelAll→cancel×2 序列：清空后 2 条按序，发布引用为第 2 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0011 begin');
            await notificationUtil.publishNotification(buildPlainRequest(48));
            let secondReq: notification.NotificationRequest = buildPlainRequest(49);
            await notificationUtil.publishNotification(secondReq);
            await notificationUtil.cancelAllNotifications();
            await notificationUtil.cancelNotificationById(48);
            await notificationUtil.cancelNotificationById(49);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 2);
            expect(cancelledIds.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[1], 49);
            expect(cancelledIds[1]).assertEqual(49);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === secondReq));
            expect(lastPublished === secondReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0012
         * @tc.name testVPublishSeq0012
         * @tc.desc pub→cancel→cancelAll 终态清空序列：记录空、发布引用与 id 保持
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0012 begin');
            let request: notification.NotificationRequest = buildPlainRequest(50);
            await notificationUtil.publishNotification(request);
            await notificationUtil.cancelNotificationById(50);
            await notificationUtil.cancelAllNotifications();
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 0);
            expect(cancelledIds.length).assertEqual(0);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === request));
            expect(lastPublished === request).assertTrue();
            let lastRequest: notification.NotificationRequest =
                lastPublished as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastRequest.id, 50);
            expect(lastRequest.id).assertEqual(50);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0013
         * @tc.name testVPublishSeq0013
         * @tc.desc pub→cancel→cancelAll→cancel 循环序列：清空后起步 1 条，发布引用保持
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0013 begin');
            let request: notification.NotificationRequest = buildPlainRequest(51);
            await notificationUtil.publishNotification(request);
            await notificationUtil.cancelNotificationById(51);
            await notificationUtil.cancelAllNotifications();
            await notificationUtil.cancelNotificationById(51);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 51);
            expect(cancelledIds[0]).assertEqual(51);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === request));
            expect(lastPublished === request).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0014
         * @tc.name testVPublishSeq0014
         * @tc.desc pub×2→cancel 末只 id 序列：记录 1 条、末位为末只 id、发布引用为第 2 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0014 begin');
            await notificationUtil.publishNotification(buildPlainRequest(52));
            let secondReq: notification.NotificationRequest = buildPlainRequest(53);
            await notificationUtil.publishNotification(secondReq);
            await notificationUtil.cancelNotificationById(53);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 53);
            expect(cancelledIds[0]).assertEqual(53);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === secondReq));
            expect(lastPublished === secondReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0015
         * @tc.name testVPublishSeq0015
         * @tc.desc 负向 cancelAll 幂等：取消记录空、发布引用不被触碰（after===before 超集兼容）、重起步 1 条
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0015 begin');
            let before: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelAllNotifications();
            await notificationUtil.cancelAllNotifications();
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 0);
            expect(cancelledIds.length).assertEqual(0);
            let after: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            await notificationUtil.cancelNotificationById(60);
            let restarted: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', restarted.length, 1);
            expect(restarted.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBSEQ_0016
         * @tc.name testVPublishSeq0016
         * @tc.desc pub→cancel→pub→cancel 交错序列：记录 2 条末位为末次取消 id，发布引用为第 2 只
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishSeq0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0016 begin');
            await notificationUtil.publishNotification(buildPlainRequest(54));
            await notificationUtil.cancelNotificationById(54);
            let secondReq: notification.NotificationRequest = buildPlainRequest(55);
            await notificationUtil.publishNotification(secondReq);
            await notificationUtil.cancelNotificationById(55);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 2);
            expect(cancelledIds.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[1], 55);
            expect(cancelledIds[1]).assertEqual(55);
            let lastPublished: notification.NotificationRequest | undefined =
                notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(lastPublished === secondReq));
            expect(lastPublished === secondReq).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishSeq0016 end');
        });
    });
}
