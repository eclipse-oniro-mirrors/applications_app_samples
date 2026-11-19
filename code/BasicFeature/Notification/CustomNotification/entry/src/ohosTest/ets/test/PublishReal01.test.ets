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

// 0/1 边界对、发布-取消主流程、重复取消记录、
// 清空后重新累积、同引用重复发布。期望值来源：状态推演。
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

async function sleep(ms: number): Promise<void> {
    return new Promise<void>((resolve: () => void) => setTimeout(resolve, ms));
}

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
        hilog.warn(DOMAIN, TAG, 'publish rejected after the request was recorded');
    }
}

export default function publishReal01Test() {
    describe('PublishReal01', () => {
        beforeEach(async () => {
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_REAL_0001
         * @tc.name testVPublishReal0001
         * @tc.desc 0/1 交界边界对：id=0 不覆写而 id=1 覆写为最小正值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVPublishReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishReal0001 begin');
            let zeroReq: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await publishQuietly(zeroReq, 0);
            let zeroRecorded: boolean = await waitRecorded(zeroReq);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(zeroRecorded));
            expect(zeroRecorded).assertTrue();
            let zeroRequest: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', zeroRequest.id, BASE_ID);
            expect(zeroRequest.id).assertEqual(BASE_ID);
            let oneReq: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await publishQuietly(oneReq, 1);
            let oneRecorded: boolean = await waitRecorded(oneReq);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(oneRecorded));
            expect(oneRecorded).assertTrue();
            let oneRequest: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', oneRequest.id, 1);
            expect(oneRequest.id).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishReal0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_REAL_0002
         * @tc.name testVPublishReal0002
         * @tc.desc 主流程：发布覆写 id 后按同 id 取消，两条记录各自就位
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testVPublishReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishReal0002 begin');
            let req: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await publishQuietly(req, 55);
            let recorded: boolean = await waitRecorded(req);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(recorded));
            expect(recorded).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, 55);
            expect(request.id).assertEqual(55);
            await notificationUtil.cancelNotificationById(55);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 1);
            expect(cancelledIds.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 55);
            expect(cancelledIds[0]).assertEqual(55);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishReal0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_REAL_0003
         * @tc.name testVPublishReal0003
         * @tc.desc 负例（记录幂等性）：重复取消同一 id 两次，记录追加两条同值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublishReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishReal0003 begin');
            await notificationUtil.cancelNotificationById(77);
            await notificationUtil.cancelNotificationById(77);
            let cancelledIds: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds.length, 2);
            expect(cancelledIds.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[0], 77);
            expect(cancelledIds[0]).assertEqual(77);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cancelledIds[1], 77);
            expect(cancelledIds[1]).assertEqual(77);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishReal0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_REAL_0004
         * @tc.name testVPublishReal0004
         * @tc.desc 状态重置：全量取消清空后新取消记录从单条重新累积
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVPublishReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishReal0004 begin');
            await notificationUtil.cancelNotificationById(81);
            await notificationUtil.cancelNotificationById(82);
            await notificationUtil.cancelAllNotifications();
            let cleared: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', cleared.length, 0);
            expect(cleared.length).assertEqual(0);
            await notificationUtil.cancelNotificationById(83);
            let resumed: number[] = notificationUtil.getLastCancelledIds();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', resumed.length, 1);
            expect(resumed.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', resumed[0], 83);
            expect(resumed[0]).assertEqual(83);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishReal0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_REAL_0005
         * @tc.name testVPublishReal0005
         * @tc.desc showcase: 同一请求引用重复发布两次：记录引用稳定且 id 不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVPublishReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishReal0005 begin');
            let req: notification.NotificationRequest = buildPlainRequest(BASE_ID);
            await publishQuietly(req, 66);
            let firstRecorded: boolean = await waitRecorded(req);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(firstRecorded));
            expect(firstRecorded).assertTrue();
            await publishQuietly(req, 66);
            let secondRecorded: boolean = await waitRecorded(req);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(secondRecorded));
            expect(secondRecorded).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastPublishedRequest() === req));
            expect(notificationUtil.getLastPublishedRequest() === req).assertTrue();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, 66);
            expect(request.id).assertEqual(66);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublishReal0005 end');
        });
    });
}
