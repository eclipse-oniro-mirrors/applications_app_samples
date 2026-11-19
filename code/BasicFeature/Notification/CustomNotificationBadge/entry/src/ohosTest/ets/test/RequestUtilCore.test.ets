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

// 契约层：notificationRequestUtil 的 NotificationRequest 构造。
// 期望值来自 SDK 规范常量（SlotType.CONTENT_INFORMATION = 3）与源码字段映射，不复制被测实现。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationContentUtil, notificationRequestUtil } from '@ohos/notification';
import { buildRepeatedText } from './helper/TestPixelMap';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotificationBadge]';
const FIXED_REQUEST_ID: number = 1;
const CONTENT_INFORMATION_SLOT: number = 3;
const REQUEST_FIELD_COUNT: number = 3;
const UNKNOWN_CONTENT_TYPE: number = 99;
const HUGE_TITLE_LENGTH: number = 4000;

function buildBasicContent(title: string, text: string): notification.NotificationContent {
    let normal: notification.NotificationBasicContent = {
        title: title, text: text, additionalText: ''
    };
    return notificationContentUtil.initBasicNotificationContent(normal);
}

export default function requestUtilCoreTest() {
    describe('RequestUtilCore', () => {
        /**
         * @tc.number SUB_CNB_REQUEST_0001
         * @tc.name testRequest0001
         * @tc.desc 合法值：通知类型槽固定为 CONTENT_INFORMATION
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testRequest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = buildBasicContent('Title', 'Body');
            let request: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(content);
            hilog.info(DOMAIN, TAG, 'slot=%{public}d', request.notificationSlotType);
            expect(request.notificationSlotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            expect(request.notificationSlotType).assertEqual(CONTENT_INFORMATION_SLOT);
            expect(request.notificationSlotType === notification.SlotType.SOCIAL_COMMUNICATION).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_REQUEST_0002
         * @tc.name testRequest0002
         * @tc.desc 合法值：通知 id 固定为 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testRequest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = buildBasicContent('Title', 'Body');
            let request: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(content);
            hilog.info(DOMAIN, TAG, 'id=%{public}d', request.id);
            expect(request.id).assertEqual(FIXED_REQUEST_ID);
            expect(request.id).assertLarger(0);
            expect(request.id === 0).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_REQUEST_0003
         * @tc.name testRequest0003
         * @tc.desc 状态：入参内容按引用透传，不做深拷贝
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testRequest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = buildBasicContent('Title', 'Body');
            let request: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(content);
            hilog.info(DOMAIN, TAG, 'sameContent=%{public}s', String(request.content === content));
            expect(request.content === content).assertTrue();
            expect(request.content.normal === content.normal).assertTrue();
            expect(notificationContentUtil.getContentTypeId(request.content))
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
        });

        /**
         * @tc.number SUB_CNB_REQUEST_0004
         * @tc.name testRequest0004
         * @tc.desc 组合：0~4 五种内容类型均能原样承载
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let carriedTypes: number[] = [
                notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
                notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
                notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION,
                notification.ContentType.NOTIFICATION_CONTENT_MULTILINE
            ];
            let matchedCount: number = 0;
            for (let i = 0; i < carriedTypes.length; i++) {
                let content: notification.NotificationContent = {
                    notificationContentType: carriedTypes[i]
                };
                let request: notification.NotificationRequest =
                    notificationRequestUtil.initBasicNotificationRequest(content);
                let actualType: number = notificationContentUtil.getContentTypeId(request.content);
                if (actualType === carriedTypes[i]) {
                    matchedCount += 1;
                }
                expect(actualType).assertEqual(carriedTypes[i]);
            }
            hilog.info(DOMAIN, TAG, 'matched=%{public}d', matchedCount);
            expect(matchedCount).assertEqual(carriedTypes.length);
            expect(matchedCount).assertEqual(5);
        });

        /**
         * @tc.number SUB_CNB_REQUEST_0005
         * @tc.name testRequest0005
         * @tc.desc 边界值：内容对象为空时请求仍构造成功
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let content: notification.NotificationContent = {};
            let request: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(content);
            hilog.info(DOMAIN, TAG, 'type=%{public}d',
                notificationContentUtil.getContentTypeId(request.content));
            expect(request.content === content).assertTrue();
            expect(notificationContentUtil.getContentTypeId(request.content))
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(request.id).assertEqual(FIXED_REQUEST_ID);
        });

        /**
         * @tc.number SUB_CNB_REQUEST_0006
         * @tc.name testRequest0006
         * @tc.desc 状态：两次构造返回不同容器但 id 与内容引用一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let content: notification.NotificationContent = buildBasicContent('Title', 'Body');
            let first: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(content);
            let second: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(content);
            hilog.info(DOMAIN, TAG, 'sameRequest=%{public}s', String(first === second));
            expect(first === second).assertFalse();
            expect(first.id).assertEqual(second.id);
            expect(first.content === second.content).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_REQUEST_0007
         * @tc.name testRequest0007
         * @tc.desc 状态：构造后修改入参内容，请求内可见改动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let content: notification.NotificationContent = buildBasicContent('Before', 'Body');
            let request: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(content);
            content.notificationContentType = notification.ContentType.NOTIFICATION_CONTENT_MULTILINE;
            let actualType: number = notificationContentUtil.getContentTypeId(request.content);
            hilog.info(DOMAIN, TAG, 'actualType=%{public}d', actualType);
            expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            expect(actualType === notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT).assertFalse();
            expect(request.content === content).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_REQUEST_0008
         * @tc.name testRequest0008
         * @tc.desc 兼容分支：仅设置废弃字段 contentType 时请求内容保留该值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let content: notification.NotificationContent = {
                // 废弃字段 contentType 的枚举来自旧模块，图片类型真值为 2
                contentType: 2
            };
            let request: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(content);
            let actualType: number = notificationContentUtil.getContentTypeId(request.content);
            hilog.info(DOMAIN, TAG, 'actualType=%{public}d', actualType);
            expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            expect(actualType).assertEqual(2);
            expect(request.content.contentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
        });

        /**
         * @tc.number SUB_CNB_REQUEST_0009
         * @tc.name testRequest0009
         * @tc.desc 组合：内容类型不同时 id 与槽位保持恒定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let longTextRequest: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest({
                    notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT
                });
            let conversationRequest: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest({
                    notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION
                });
            hilog.info(DOMAIN, TAG, 'ids=%{public}d,%{public}d',
                longTextRequest.id, conversationRequest.id);
            expect(longTextRequest.id).assertEqual(conversationRequest.id);
            expect(conversationRequest.id).assertEqual(FIXED_REQUEST_ID);
            expect(conversationRequest.notificationSlotType)
                .assertEqual(longTextRequest.notificationSlotType);
        });

        /**
         * @tc.number SUB_CNB_REQUEST_0010
         * @tc.name testRequest0010
         * @tc.desc 结构：请求对象只填充槽位、id、内容三个字段
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let content: notification.NotificationContent = buildBasicContent('Title', 'Body');
            let request: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(content);
            let fields: string[] = Object.keys(request);
            hilog.info(DOMAIN, TAG, 'fieldCount=%{public}d', fields.length);
            expect(fields.length).assertEqual(REQUEST_FIELD_COUNT);
            expect(fields.indexOf('content') >= 0).assertTrue();
            expect(fields.indexOf('id') >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_REQUEST_0011
         * @tc.name testRequest0011
         * @tc.desc 非法输入：未知内容类型 99 不做校验，原样透传
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let content: notification.NotificationContent = {
                notificationContentType: UNKNOWN_CONTENT_TYPE
            };
            let request: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(content);
            let actualType: number = notificationContentUtil.getContentTypeId(request.content);
            hilog.info(DOMAIN, TAG, 'actualType=%{public}d', actualType);
            expect(actualType).assertEqual(UNKNOWN_CONTENT_TYPE);
            expect(actualType > notification.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW).assertTrue();
            expect(request.id).assertEqual(FIXED_REQUEST_ID);
        });

        /**
         * @tc.number SUB_CNB_REQUEST_0012
         * @tc.name testRequest0012
         * @tc.desc 极值：4000 字符标题随请求完整透传
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let hugeTitle: string = buildRepeatedText(HUGE_TITLE_LENGTH);
            let content: notification.NotificationContent = buildBasicContent(hugeTitle, 'Body');
            let request: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(content);
            let normal: notification.NotificationBasicContent =
                request.content.normal as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'titleLength=%{public}d', normal.title.length);
            expect(normal.title.length).assertEqual(HUGE_TITLE_LENGTH);
            expect(normal.title).assertEqual(hugeTitle);
            expect(request.content === content).assertTrue();
        });
    });
}
