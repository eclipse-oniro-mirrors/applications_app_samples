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

// cancelNotificationById 的取消 id 输入域逐值记录语义。
// 有效/无效 id 一律 push（main 冻结规则：push 无合法性检查），发布记录引用不受取消链影响。
// 期望值来源：状态推演（记录追加长度 1、末位为输入 id、发布记录引用不变）。
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

export default function cancelIdVolume01Test() {
    describe('CancelIdVolume01', () => {
        beforeEach(async () => {
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0001
         * @tc.name testVCancel0001
         * @tc.desc 取消 id=0 下边界（非法值仍记录），发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVCancel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0001 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(0);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, 0);
            expect(lastId).assertEqual(0);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0002
         * @tc.name testVCancel0002
         * @tc.desc 取消 id=1 档：记录追加 1 条且末位为 1，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0002 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(1);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, 1);
            expect(lastId).assertEqual(1);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0003
         * @tc.name testVCancel0003
         * @tc.desc 取消 id=2 档：记录追加 1 条且末位为 2，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0003 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(2);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, 2);
            expect(lastId).assertEqual(2);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0004
         * @tc.name testVCancel0004
         * @tc.desc 取消 id=3 档：记录追加 1 条且末位为 3，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0004 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(3);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, 3);
            expect(lastId).assertEqual(3);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0005
         * @tc.name testVCancel0005
         * @tc.desc 取消 id=7 档：记录追加 1 条且末位为 7，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0005 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(7);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, 7);
            expect(lastId).assertEqual(7);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0006
         * @tc.name testVCancel0006
         * @tc.desc 取消 id=13 档：记录追加 1 条且末位为 13，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0006 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(13);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, 13);
            expect(lastId).assertEqual(13);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0007
         * @tc.name testVCancel0007
         * @tc.desc 取消 id=99 档：记录追加 1 条且末位为 99，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0007 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(99);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, 99);
            expect(lastId).assertEqual(99);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0008
         * @tc.name testVCancel0008
         * @tc.desc 取消 id=999 档：记录追加 1 条且末位为 999，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0008 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(999);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, 999);
            expect(lastId).assertEqual(999);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0009
         * @tc.name testVCancel0009
         * @tc.desc 取消 id=1000 档：记录追加 1 条且末位为 1000，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0009 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(1000);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, 1000);
            expect(lastId).assertEqual(1000);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0010
         * @tc.name testVCancel0010
         * @tc.desc 取消 id=65535 档：记录追加 1 条且末位为 65535，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0010 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(65535);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, 65535);
            expect(lastId).assertEqual(65535);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0011
         * @tc.name testVCancel0011
         * @tc.desc 取消 id=2147483647 档（正数上边界）：记录仍追加，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0011 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(2147483647);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, 2147483647);
            expect(lastId).assertEqual(2147483647);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0012
         * @tc.name testVCancel0012
         * @tc.desc 取消 id=-1 档（非法负值仍记录）：末位为 -1，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0012 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(-1);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, -1);
            expect(lastId).assertEqual(-1);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0013
         * @tc.name testVCancel0013
         * @tc.desc 取消 id=-2 档（非法负值仍记录）：末位为 -2，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0013 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(-2);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, -2);
            expect(lastId).assertEqual(-2);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0014
         * @tc.name testVCancel0014
         * @tc.desc 取消 id=-7 档（非法负值仍记录）：末位为 -7，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0014 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(-7);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, -7);
            expect(lastId).assertEqual(-7);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0015
         * @tc.name testVCancel0015
         * @tc.desc 取消 id=-13 档（非法负值仍记录）：末位为 -13，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0015 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(-13);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, -13);
            expect(lastId).assertEqual(-13);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0016
         * @tc.name testVCancel0016
         * @tc.desc 取消 id=-99 档（非法负值仍记录）：末位为 -99，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0016 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(-99);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, -99);
            expect(lastId).assertEqual(-99);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0016 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0017
         * @tc.name testVCancel0017
         * @tc.desc 取消 id=-999 档（非法负值仍记录）：末位为 -999，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0017 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(-999);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, -999);
            expect(lastId).assertEqual(-999);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0017 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0018
         * @tc.name testVCancel0018
         * @tc.desc 取消 id=-65535 档（非法负值仍记录）：末位为 -65535，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0018 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(-65535);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, -65535);
            expect(lastId).assertEqual(-65535);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0018 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0019
         * @tc.name testVCancel0019
         * @tc.desc 取消 id=-2147483647 档（非法负值仍记录）：末位为 -2147483647，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0019 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(-2147483647);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, -2147483647);
            expect(lastId).assertEqual(-2147483647);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0019 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VCANCEL_0020
         * @tc.name testVCancel0020
         * @tc.desc 取消 id=-2147483648 档（负数下边界仍记录）：末位为 -2147483648，发布记录引用不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVCancel0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0020 begin');
            let request: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await notificationUtil.publishNotification(request);
            let before: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await notificationUtil.cancelNotificationById(-2147483648);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            let lastId: number = cancelledIds[cancelledIds.length - 1];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', lastId, -2147483648);
            expect(lastId).assertEqual(-2147483648);
            let after: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(after === before));
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVCancel0020 end');
        });
    });
}
