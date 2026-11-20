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

// 契约层：notificationUtil 的发布与取消封装。
// publishNotification 先同步改写请求 id（进程内单调自增）与可选 groupName，再异步投递系统。
// 系统侧投递成功与否不做断言（跨进程副作用留给手工验证），只断言请求对象上的可观测改写、
// 调用不抛异常，以及取消接口的容错契约。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { image } from '@kit.ImageKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationUtil, notificationContentUtil, notificationRequestUtil } from '@ohos/notification';
import { createTestPixelMap, buildRepeatedText } from './helper/TestPixelMap';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotificationBadge]';
const HUGE_TITLE_LENGTH: number = 4000;
const HUGE_GROUP_LENGTH: number = 200;
const INVALID_ID: number = -7;

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

function buildPictureRequest(pixelMap: image.PixelMap): notification.NotificationRequest {
    let basic: notification.NotificationBasicContent = { title: 'PictureTitle', text: 'Body' };
    return notificationRequestUtil.initBasicNotificationRequest(
        notificationContentUtil.initNotificationPictureContent(basic, 'Brief', 'Expanded', pixelMap));
}

function readId(request: notification.NotificationRequest): number {
    return request.id as number;
}

function writeId(request: notification.NotificationRequest, id: number): void {
    request.id = id;
}

async function publishQuietly(request: notification.NotificationRequest, group?: string): Promise<void> {
    try {
        await notificationUtil.publishNotification(request, group);
    } catch (err) {
        hilog.error(DOMAIN, TAG, 'publish rejected, error=%{public}s', JSON.stringify(err));
    }
}

/**
 * 执行一次异步调用，返回空串表示未抛异常，否则返回异常描述。
 */
async function invokeAsyncQuietly(action: () => Promise<void>): Promise<string> {
    try {
        await action();
        return '';
    } catch (err) {
        return JSON.stringify(err);
    }
}

export default function publishCoreTest() {
    describe('PublishCore', () => {
        /**
         * @tc.number SUB_CNB_PUBLISH_0001
         * @tc.name testPublish0001
         * @tc.desc 合法值：发布后请求 id 被进程内自增计数覆盖为非负整数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testPublish0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            let request: notification.NotificationRequest = buildBasicRequest('Title');
            await publishQuietly(request);
            hilog.info(DOMAIN, TAG, 'id=%{public}d', readId(request));
            expect(readId(request) >= 0).assertTrue();
            expect(readId(request) % 1).assertEqual(0);
            expect(readId(request) === -1).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0002
         * @tc.name testPublish0002
         * @tc.desc 状态：连续两次发布后 id 依次加 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testPublish0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            let first: notification.NotificationRequest = buildBasicRequest('First');
            let second: notification.NotificationRequest = buildBasicRequest('Second');
            await publishQuietly(first);
            await publishQuietly(second);
            let firstId: number = readId(first);
            hilog.info(DOMAIN, TAG, 'first=%{public}d second=%{public}d', firstId, readId(second));
            expect(readId(second)).assertEqual(firstId + 1);
            expect(readId(second)).assertLarger(firstId);
            expect(firstId >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0003
         * @tc.name testPublish0003
         * @tc.desc 边界值：连续 3 次发布的 id 严格单调递增
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let ids: number[] = [];
            for (let i = 0; i < 3; i++) {
                let request: notification.NotificationRequest = buildBasicRequest(`Round${i}`);
                await publishQuietly(request);
                ids.push(readId(request));
            }
            hilog.info(DOMAIN, TAG, 'ids=%{public}d,%{public}d,%{public}d', ids[0], ids[1], ids[2]);
            expect(ids[1]).assertEqual(ids[0] + 1);
            expect(ids[2]).assertEqual(ids[1] + 1);
            expect(ids[0] < ids[2]).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0004
         * @tc.name testPublish0004
         * @tc.desc 组合：传入分组名时写入请求 groupName
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testPublish0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            let request: notification.NotificationRequest = buildBasicRequest('Grouped');
            await publishQuietly(request, 'CONVERSATION');
            let groupName: string = request.groupName as string;
            hilog.info(DOMAIN, TAG, 'groupName=%{public}s', groupName);
            expect(groupName).assertEqual('CONVERSATION');
            expect(groupName === undefined).assertFalse();
            expect(groupName.length > 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0005
         * @tc.name testPublish0005
         * @tc.desc 边界值：未传分组名时请求不带 groupName
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = buildBasicRequest('Ungrouped');
            await publishQuietly(request);
            hilog.info(DOMAIN, TAG, 'groupName=%{public}s', String(request.groupName));
            expect(request.groupName).assertUndefined();
            expect(request.groupName === 'CONVERSATION').assertFalse();
            expect(readId(request) >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0006
         * @tc.name testPublish0006
         * @tc.desc 边界值：分组名为空串时按未传处理，不写入 groupName
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = buildBasicRequest('EmptyGroup');
            await publishQuietly(request, '');
            hilog.info(DOMAIN, TAG, 'groupName=%{public}s', String(request.groupName));
            expect(request.groupName).assertUndefined();
            expect(request.groupName === '').assertFalse();
            expect(readId(request) >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0007
         * @tc.name testPublish0007
         * @tc.desc 状态：发布不改写基本文本内容
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = buildBasicRequest('KeepTitle');
            let contentRef: notification.NotificationContent = request.content;
            await publishQuietly(request);
            let normal: notification.NotificationBasicContent =
                request.content.normal as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'title=%{public}s', normal.title);
            expect(request.content === contentRef).assertTrue();
            expect(normal.title).assertEqual('KeepTitle');
            expect(notificationContentUtil.getContentTypeId(request.content))
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0008
         * @tc.name testPublish0008
         * @tc.desc 状态：长文本内容随发布保持类型与概要
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = buildLongTextRequest();
            await publishQuietly(request);
            let longText: notification.NotificationLongTextContent =
                request.content.longText as notification.NotificationLongTextContent;
            hilog.info(DOMAIN, TAG, 'brief=%{public}s', longText.briefText);
            expect(notificationContentUtil.getContentTypeId(request.content))
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(longText.briefText).assertEqual('Brief');
            expect(longText.longText).assertEqual('Long');
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0009
         * @tc.name testPublish0009
         * @tc.desc 状态：图片内容随发布保持类型且不入基本分组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let pixelMap: image.PixelMap = createTestPixelMap();
            let request: notification.NotificationRequest = buildPictureRequest(pixelMap);
            await publishQuietly(request);
            hilog.info(DOMAIN, TAG, 'type=%{public}d',
                notificationContentUtil.getContentTypeId(request.content));
            expect(notificationContentUtil.getContentTypeId(request.content))
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            expect(request.content.picture === undefined).assertFalse();
            expect(readId(request) >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0010
         * @tc.name testPublish0010
         * @tc.desc 状态：发布前设置的 id 被计数器覆盖
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = buildBasicRequest('Overwrite');
            writeId(request, 999);
            await publishQuietly(request);
            hilog.info(DOMAIN, TAG, 'id=%{public}d', readId(request));
            expect(readId(request) === 999).assertFalse();
            expect(readId(request) < 999).assertTrue();
            expect(readId(request) >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0011
         * @tc.name testPublish0011
         * @tc.desc 状态：发布前设置的负 id 同样被覆盖
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = buildBasicRequest('Negative');
            writeId(request, INVALID_ID);
            await publishQuietly(request);
            hilog.info(DOMAIN, TAG, 'id=%{public}d', readId(request));
            expect(readId(request)).assertLarger(INVALID_ID);
            expect(readId(request) >= 0).assertTrue();
            expect(readId(request) === INVALID_ID).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0012
         * @tc.name testPublish0012
         * @tc.desc 状态：发布前设置的 groupName 被新分组覆盖
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = buildBasicRequest('ReplaceGroup');
            request.groupName = 'PRE_GROUP';
            await publishQuietly(request, 'BASIC');
            let groupName: string = request.groupName as string;
            hilog.info(DOMAIN, TAG, 'groupName=%{public}s', groupName);
            expect(groupName).assertEqual('BASIC');
            expect(groupName === 'PRE_GROUP').assertFalse();
            expect(readId(request) >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0013
         * @tc.name testPublish0013
         * @tc.desc 边界值：未分组发布不清理请求上已有的 groupName
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = buildBasicRequest('KeepGroup');
            request.groupName = 'PRE_GROUP';
            await publishQuietly(request);
            let groupName: string = request.groupName as string;
            hilog.info(DOMAIN, TAG, 'groupName=%{public}s', groupName);
            expect(groupName).assertEqual('PRE_GROUP');
            expect(groupName.length > 0).assertTrue();
            expect(readId(request) >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0014
         * @tc.name testPublish0014
         * @tc.desc 非法输入：内容对象为空时不抛异常且 id 仍推进
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest({});
            await publishQuietly(request);
            hilog.info(DOMAIN, TAG, 'id=%{public}d type=%{public}d', readId(request),
                notificationContentUtil.getContentTypeId(request.content));
            expect(readId(request) >= 0).assertTrue();
            expect(notificationContentUtil.getContentTypeId(request.content))
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(request.notificationSlotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0015
         * @tc.name testPublish0015
         * @tc.desc 非法输入：未知内容类型 99 原样透传，不抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest({
                notificationContentType: 99 as notification.ContentType
            });
            await publishQuietly(request);
            hilog.info(DOMAIN, TAG, 'type=%{public}d', notificationContentUtil.getContentTypeId(request.content));
            expect(notificationContentUtil.getContentTypeId(request.content)).assertEqual(99);
            expect(readId(request) >= 0).assertTrue();
            expect(request.content === undefined).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0016
         * @tc.name testPublish0016
         * @tc.desc 非法输入：负内容类型 -1 透传后不抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest({
                notificationContentType: -1 as notification.ContentType
            });
            await publishQuietly(request);
            hilog.info(DOMAIN, TAG, 'type=%{public}d', notificationContentUtil.getContentTypeId(request.content));
            expect(notificationContentUtil.getContentTypeId(request.content)).assertEqual(-1);
            expect(notificationContentUtil.getContentTypeId(request.content) < 0).assertTrue();
            expect(readId(request) >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0017
         * @tc.name testPublish0017
         * @tc.desc 极值：4000 字符标题随发布完整保留
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let hugeTitle: string = buildRepeatedText(HUGE_TITLE_LENGTH);
            let request: notification.NotificationRequest = buildBasicRequest(hugeTitle);
            await publishQuietly(request);
            let normal: notification.NotificationBasicContent =
                request.content.normal as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'titleLength=%{public}d', normal.title.length);
            expect(normal.title.length).assertEqual(HUGE_TITLE_LENGTH);
            expect(normal.title).assertEqual(hugeTitle);
            expect(readId(request) >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0018
         * @tc.name testPublish0018
         * @tc.desc 组合：分组名 BASIC 原样写入
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = buildBasicRequest('BasicGroup');
            await publishQuietly(request, 'BASIC');
            let groupName: string = request.groupName as string;
            hilog.info(DOMAIN, TAG, 'groupName=%{public}s', groupName);
            expect(groupName).assertEqual('BASIC');
            expect(groupName.startsWith('BAS')).assertTrue();
            expect(groupName === 'CONVERSATION').assertFalse();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0019
         * @tc.name testPublish0019
         * @tc.desc 组合：分组名 CONVERSATION 与内容类型 CONVERSATION 可共存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let basic: notification.NotificationBasicContent = { title: 'Chat', text: 'Hello' };
            let request: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(
                notificationContentUtil.initNotificationConversationContent(basic));
            await publishQuietly(request, 'CONVERSATION');
            let groupName: string = request.groupName as string;
            hilog.info(DOMAIN, TAG, 'groupName=%{public}s type=%{public}d', groupName,
                notificationContentUtil.getContentTypeId(request.content));
            expect(groupName).assertEqual('CONVERSATION');
            expect(notificationContentUtil.getContentTypeId(request.content))
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
            expect(readId(request) >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0020
         * @tc.name testPublish0020
         * @tc.desc 边界值：分组名为单字符时按非空处理
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = buildBasicRequest('SingleCharGroup');
            await publishQuietly(request, 'G');
            let groupName: string = request.groupName as string;
            hilog.info(DOMAIN, TAG, 'groupName=%{public}s', groupName);
            expect(groupName).assertEqual('G');
            expect(groupName.length).assertEqual(1);
            expect(groupName === '').assertFalse();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0021
         * @tc.name testPublish0021
         * @tc.desc 极值：200 字符分组名完整写入
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let hugeGroup: string = buildRepeatedText(HUGE_GROUP_LENGTH);
            let request: notification.NotificationRequest = buildBasicRequest('HugeGroup');
            await publishQuietly(request, hugeGroup);
            let groupName: string = request.groupName as string;
            hilog.info(DOMAIN, TAG, 'groupLength=%{public}d', groupName.length);
            expect(groupName.length).assertEqual(HUGE_GROUP_LENGTH);
            expect(groupName).assertEqual(hugeGroup);
            expect(readId(request) >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0022
         * @tc.name testPublish0022
         * @tc.desc 状态：请求槽位在发布后保持 CONTENT_INFORMATION
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = buildBasicRequest('Slot');
            await publishQuietly(request, 'BASIC');
            hilog.info(DOMAIN, TAG, 'slot=%{public}d', request.notificationSlotType);
            expect(request.notificationSlotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            expect(request.notificationSlotType === notification.SlotType.SOCIAL_COMMUNICATION).assertFalse();
            expect(readId(request) >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0023
         * @tc.name testPublish0023
         * @tc.desc 组合：两次发布使用不同分组时各自写入
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let first: notification.NotificationRequest = buildBasicRequest('MultiGroup1');
            let second: notification.NotificationRequest = buildBasicRequest('MultiGroup2');
            await publishQuietly(first, 'LONG_TEXT');
            await publishQuietly(second, 'MULTI_LINE');
            let firstGroup: string = first.groupName as string;
            let secondGroup: string = second.groupName as string;
            hilog.info(DOMAIN, TAG, 'groups=%{public}s,%{public}s', firstGroup, secondGroup);
            expect(firstGroup).assertEqual('LONG_TEXT');
            expect(secondGroup).assertEqual('MULTI_LINE');
            expect(firstGroup === secondGroup).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0024
         * @tc.name testPublish0024
         * @tc.desc 状态：连续 5 次发布后 id 累计推进 5
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPublish0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            let firstRequest: notification.NotificationRequest = buildBasicRequest('Seq0');
            await publishQuietly(firstRequest);
            let baseId: number = readId(firstRequest);
            let lastRequest: notification.NotificationRequest = firstRequest;
            for (let i = 1; i < 5; i++) {
                lastRequest = buildBasicRequest(`Seq${i}`);
                await publishQuietly(lastRequest);
            }
            hilog.info(DOMAIN, TAG, 'base=%{public}d last=%{public}d', baseId, readId(lastRequest));
            expect(readId(lastRequest)).assertEqual(baseId + 4);
            expect(readId(lastRequest) - baseId).assertEqual(4);
            expect(readId(lastRequest)).assertLarger(baseId);
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0025
         * @tc.name testPublish0025
         * @tc.desc 容错：取消不存在 id 的通知不抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let errorText: string = await invokeAsyncQuietly(async () => {
                await notificationUtil.cancelNotificationById(987654);
            });
            let probe: notification.NotificationRequest = buildBasicRequest('AfterCancel');
            await publishQuietly(probe);
            hilog.info(DOMAIN, TAG, 'errorText=%{public}s probeId=%{public}d', errorText, readId(probe));
            expect(errorText).assertEqual('');
            expect(errorText.length).assertEqual(0);
            expect(readId(probe) >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0026
         * @tc.name testPublish0026
         * @tc.desc 容错：取消负 id 的通知不抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let errorText: string = await invokeAsyncQuietly(async () => {
                await notificationUtil.cancelNotificationById(INVALID_ID);
            });
            let allError: string = await invokeAsyncQuietly(async () => {
                await notificationUtil.cancelAllNotifications();
            });
            hilog.info(DOMAIN, TAG, 'errorText=%{public}s allError=%{public}s', errorText, allError);
            expect(errorText).assertEqual('');
            expect(allError).assertEqual('');
            expect(INVALID_ID < 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0027
         * @tc.name testPublish0027
         * @tc.desc 容错：取消全部通知不抛异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let errorText: string = await invokeAsyncQuietly(async () => {
                await notificationUtil.cancelAllNotifications();
            });
            let probe: notification.NotificationRequest = buildBasicRequest('AfterCancelAll');
            await publishQuietly(probe, 'BASIC');
            hilog.info(DOMAIN, TAG, 'errorText=%{public}s probeId=%{public}d', errorText, readId(probe));
            expect(errorText).assertEqual('');
            expect(errorText.length).assertEqual(0);
            expect(probe.groupName as string).assertEqual('BASIC');
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0028
         * @tc.name testPublish0028
         * @tc.desc 状态：发布仅改写 id 与分组，不改内容类型字段
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let basic: notification.NotificationBasicContent = { title: 'TypeKeep', text: 'Body' };
            let request: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(
                notificationContentUtil.initNotificationMultiLineContent(basic, 'Brief', 'LongTitle',
                    ['l0', 'l1']));
            await publishQuietly(request, 'MULTI_LINE');
            let multiLine: notification.NotificationMultiLineContent =
                request.content.multiLine as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'lines=%{public}d', multiLine.lines.length);
            expect(notificationContentUtil.getContentTypeId(request.content))
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            expect(multiLine.lines.length).assertEqual(2);
            expect(request.groupName as string).assertEqual('MULTI_LINE');
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0029
         * @tc.name testPublish0029
         * @tc.desc 边界值：分组名为数字串时按非空处理
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = buildBasicRequest('DigitGroup');
            await publishQuietly(request, '0');
            let groupName: string = request.groupName as string;
            hilog.info(DOMAIN, TAG, 'groupName=%{public}s', groupName);
            expect(groupName).assertEqual('0');
            expect(groupName.length).assertEqual(1);
            expect(groupName === undefined).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_PUBLISH_0030
         * @tc.name testPublish0030
         * @tc.desc 边界值：显式传 undefined 分组等同于未分组
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPublish0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let request: notification.NotificationRequest = buildBasicRequest('UndefinedGroup');
            await publishQuietly(request, undefined);
            hilog.info(DOMAIN, TAG, 'groupName=%{public}s', String(request.groupName));
            expect(request.groupName).assertUndefined();
            expect(request.groupName === 'undefined').assertFalse();
            expect(readId(request) >= 0).assertTrue();
        });
    });
}
