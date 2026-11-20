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

// publishNotification 的 id 输入域逐值覆写语义。
// 有效正 id（>0）覆写 request.id，无效 id（0 与负值）保持原值 BASE_ID。
// 期望值来源：main 修复后源码分支推演（if id && id > 0）。
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

/** arrange + act：发布指定 id 并等待记录到达，返回被记录的请求（未到达返回 undefined）。 */
async function publishWithId(inputId: number): Promise<notification.NotificationRequest | undefined> {
    let req: notification.NotificationRequest = buildPlainRequest(BASE_ID);
    await publishQuietly(req, inputId);
    let recorded: boolean = await waitRecorded(req);
    if (!recorded) {
        return undefined;
    }
    return notificationUtil.getLastPublishedRequest();
}

export default function publishVolume01Test() {
    describe('PublishVolume01', () => {
        beforeEach(async () => {
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0001
         * @tc.name testVPublish0001
         * @tc.desc 有效最小正 id=1 覆写为 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0001 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(1);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, 1);
            expect(recorded.id).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0002
         * @tc.name testVPublish0002
         * @tc.desc 有效 id=2 覆写为 2
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0002 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(2);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, 2);
            expect(recorded.id).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0003
         * @tc.name testVPublish0003
         * @tc.desc 有效 id=3 覆写为 3
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0003 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(3);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, 3);
            expect(recorded.id).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0004
         * @tc.name testVPublish0004
         * @tc.desc 有效 id=7 覆写为 7
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0004 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(7);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, 7);
            expect(recorded.id).assertEqual(7);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0005
         * @tc.name testVPublish0005
         * @tc.desc 有效 id=13 覆写为 13
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0005 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(13);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, 13);
            expect(recorded.id).assertEqual(13);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0006
         * @tc.name testVPublish0006
         * @tc.desc 有效 id=99 覆写为 99
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0006 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(99);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, 99);
            expect(recorded.id).assertEqual(99);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0007
         * @tc.name testVPublish0007
         * @tc.desc 有效 id=999 覆写为 999
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0007 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(999);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, 999);
            expect(recorded.id).assertEqual(999);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0008
         * @tc.name testVPublish0008
         * @tc.desc 有效极大 id=2147483647 覆写为同值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0008 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(2147483647);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, 2147483647);
            expect(recorded.id).assertEqual(2147483647);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0009
         * @tc.name testVPublish0009
         * @tc.desc 无效边界 id=0：保持原值不覆写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0009 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(0);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, BASE_ID);
            expect(recorded.id).assertEqual(BASE_ID);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0010
         * @tc.name testVPublish0010
         * @tc.desc 无效 id=-1：保持原值不覆写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0010 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(-1);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, BASE_ID);
            expect(recorded.id).assertEqual(BASE_ID);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0011
         * @tc.name testVPublish0011
         * @tc.desc 无效 id=-2：保持原值不覆写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0011 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(-2);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, BASE_ID);
            expect(recorded.id).assertEqual(BASE_ID);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0012
         * @tc.name testVPublish0012
         * @tc.desc 无效 id=-7：保持原值不覆写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0012 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(-7);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, BASE_ID);
            expect(recorded.id).assertEqual(BASE_ID);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0013
         * @tc.name testVPublish0013
         * @tc.desc 无效 id=-13：保持原值不覆写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0013 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(-13);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, BASE_ID);
            expect(recorded.id).assertEqual(BASE_ID);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0014
         * @tc.name testVPublish0014
         * @tc.desc 无效 id=-99：保持原值不覆写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0014 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(-99);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, BASE_ID);
            expect(recorded.id).assertEqual(BASE_ID);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0015
         * @tc.name testVPublish0015
         * @tc.desc 无效 id=-999：保持原值不覆写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0015 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(-999);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, BASE_ID);
            expect(recorded.id).assertEqual(BASE_ID);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VPUBLISH_0016
         * @tc.name testVPublish0016
         * @tc.desc 无效极小 id=-2147483648：保持原值不覆写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVPublish0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0016 begin');
            let request: notification.NotificationRequest | undefined = await publishWithId(-2147483648);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== undefined));
            expect(request !== undefined).assertTrue();
            let recorded: notification.NotificationRequest = request as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', recorded.id, BASE_ID);
            expect(recorded.id).assertEqual(BASE_ID);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(notificationUtil.getLastNotificationSlot() !== undefined));
            expect(notificationUtil.getLastNotificationSlot() !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVPublish0016 end');
        });
    });
}
