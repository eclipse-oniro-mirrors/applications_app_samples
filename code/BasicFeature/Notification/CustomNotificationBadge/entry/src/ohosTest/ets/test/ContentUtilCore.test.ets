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

// 契约层：notificationContentUtil 的内容类型解析与 5 种通知内容构造。
// 期望值来自 SDK 规范常量（ContentType 0~6）与源码分支推演，不复制被测实现。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { image } from '@kit.ImageKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationContentUtil } from '@ohos/notification';
import { createTestPixelMap, buildRepeatedText } from './helper/TestPixelMap';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotificationBadge]';
const LONG_TITLE_LENGTH: number = 1000;
const MANY_LINES: number = 100;

export default function contentUtilCoreTest() {
    describe('ContentUtilCore', () => {
        /**
         * @tc.number SUB_CNB_CONTENT_0001
         * @tc.name testContent0001
         * @tc.desc 合法值：notificationContentType 为基本文本时返回 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d', actual);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(actual).assertEqual(0);
            expect(actual).assertLess(notification.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW);
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0002
         * @tc.name testContent0002
         * @tc.desc 合法值：长文本类型返回 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d', actual);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(actual).assertEqual(1);
            expect(actual).assertLarger(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0003
         * @tc.name testContent0003
         * @tc.desc 合法值：图片类型返回 2
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d', actual);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            expect(actual).assertEqual(2);
            expect(actual).assertLarger(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0004
         * @tc.name testContent0004
         * @tc.desc 合法值：社交类型返回 3
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d', actual);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
            expect(actual).assertEqual(3);
            expect(actual).assertLarger(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0005
         * @tc.name testContent0005
         * @tc.desc 合法值：多行文本类型返回 4
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d', actual);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            expect(actual).assertEqual(4);
            expect(actual)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION + 1);
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0006
         * @tc.name testContent0006
         * @tc.desc 合法值：系统实况窗类型返回 5
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d', actual);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
            expect(actual).assertEqual(5);
            expect(actual)
                .assertLarger(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0007
         * @tc.name testContent0007
         * @tc.desc 边界值：实况窗类型返回 6（枚举上界）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d', actual);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW);
            expect(actual).assertEqual(6);
            expect(actual)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW + 1);
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0008
         * @tc.name testContent0008
         * @tc.desc 兼容分支：仅有废弃字段 contentType 时按原值返回
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let content: notification.NotificationContent = {
                // 废弃字段 contentType 的枚举来自旧模块（无 SYSTEM_LIVE_VIEW），此处用其真值 1
                contentType: 1
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d', actual);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(actual).assertEqual(1);
            expect(actual === notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0009
         * @tc.name testContent0009
         * @tc.desc 兼容分支：废弃字段 contentType 为多行文本时返回 4
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let content: notification.NotificationContent = {
                // 废弃字段 contentType 的枚举来自旧模块，多行文本真值为 4
                contentType: 4
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d', actual);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            expect(actual).assertEqual(4);
            expect(actual === notification.ContentType.NOTIFICATION_CONTENT_PICTURE).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0010
         * @tc.name testContent0010
         * @tc.desc 组合：新旧字段同时存在时以 notificationContentType 为准
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
                contentType: 4
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d', actual);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            expect(actual).assertEqual(2);
            expect(actual === notification.ContentType.NOTIFICATION_CONTENT_MULTILINE).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0011
         * @tc.name testContent0011
         * @tc.desc 非法输入：两个类型字段都缺省时回落为基本文本
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = {};
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d', actual);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(actual).assertEqual(0);
            expect(actual).assertLess(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0012
         * @tc.name testContent0012
         * @tc.desc 组合：显式 0 与废弃字段 6 并存时返回 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                contentType: 6
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d', actual);
            expect(actual).assertEqual(0);
            expect(actual === notification.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW).assertFalse();
            expect(actual)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0013
         * @tc.name testContent0013
         * @tc.desc 合法值：基本类型内容只设置类型与 normal 两个字段
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let basic: notification.NotificationBasicContent = {
                title: 'Title', text: 'Body', additionalText: 'Additional'
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initBasicNotificationContent(basic);
            hilog.info(DOMAIN, TAG, 'type=%{public}d', content.notificationContentType);
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(content.normal === undefined).assertFalse();
            expect(content.longText).assertUndefined();
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0014
         * @tc.name testContent0014
         * @tc.desc 合法值：基本类型内容三字段原样映射
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let basic: notification.NotificationBasicContent = {
                title: '通知标题', text: '通知正文', additionalText: '次要内容'
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initBasicNotificationContent(basic);
            let normal: notification.NotificationBasicContent =
                content.normal as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'title=%{public}s', normal.title);
            expect(normal.title).assertEqual('通知标题');
            expect(normal.text).assertEqual('通知正文');
            expect(normal.additionalText).assertEqual('次要内容');
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0015
         * @tc.name testContent0015
         * @tc.desc 边界值：基本类型缺省 additionalText 时保持 undefined（不做空串兜底）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let basic: notification.NotificationBasicContent = { title: 'OnlyTitle', text: 'OnlyBody' };
            let content: notification.NotificationContent =
                notificationContentUtil.initBasicNotificationContent(basic);
            let normal: notification.NotificationBasicContent =
                content.normal as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'additional=%{public}s', String(normal.additionalText));
            expect(normal.additionalText).assertUndefined();
            expect(normal.title).assertEqual('OnlyTitle');
            expect(normal.text).assertEqual('OnlyBody');
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0016
         * @tc.name testContent0016
         * @tc.desc 极值：标题长度 1000 的输入不被截断
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let longTitle: string = buildRepeatedText(LONG_TITLE_LENGTH);
            let basic: notification.NotificationBasicContent = {
                title: longTitle, text: 'Body', additionalText: ''
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initBasicNotificationContent(basic);
            let normal: notification.NotificationBasicContent =
                content.normal as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'titleLength=%{public}d', normal.title.length);
            expect(normal.title.length).assertEqual(LONG_TITLE_LENGTH);
            expect(normal.title).assertEqual(longTitle);
            expect(normal.title.length > 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0017
         * @tc.name testContent0017
         * @tc.desc 状态：两次构造返回不同容器对象但共享同一 basicContent 引用
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let first: notification.NotificationContent =
                notificationContentUtil.initBasicNotificationContent(basic);
            let second: notification.NotificationContent =
                notificationContentUtil.initBasicNotificationContent(basic);
            hilog.info(DOMAIN, TAG, 'sameContainer=%{public}s', String(first === second));
            expect(first === second).assertFalse();
            expect(first.normal === second.normal).assertTrue();
            expect(first.notificationContentType).assertEqual(second.notificationContentType);
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0018
         * @tc.name testContent0018
         * @tc.desc 状态：normal 与入参为同一引用，后续改写入参可见
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let basic: notification.NotificationBasicContent = { title: 'Before', text: 'Body' };
            let content: notification.NotificationContent =
                notificationContentUtil.initBasicNotificationContent(basic);
            basic.title = 'After';
            let normal: notification.NotificationBasicContent =
                content.normal as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'title=%{public}s', normal.title);
            expect(content.normal === basic).assertTrue();
            expect(normal.title).assertEqual('After');
            expect(normal.title === 'Before').assertFalse();
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0019
         * @tc.name testContent0019
         * @tc.desc 合法值：长文本内容类型为 1 且 normal 缺省
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationLongTextContent(basic, 'Long', 'Brief', 'Expanded');
            hilog.info(DOMAIN, TAG, 'type=%{public}d', content.notificationContentType);
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(content.normal).assertUndefined();
            expect(content.longText === undefined).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0020
         * @tc.name testContent0020
         * @tc.desc 合法值：长文本内容六个字段原样映射
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let basic: notification.NotificationBasicContent = {
                title: '标题', text: '正文', additionalText: '附加'
            };
            let content: notification.NotificationContent = notificationContentUtil.initNotificationLongTextContent(
                basic, '长文本正文', '概要文本', '展开标题');
            let longText: notification.NotificationLongTextContent =
                content.longText as notification.NotificationLongTextContent;
            hilog.info(DOMAIN, TAG, 'longText=%{public}s', longText.longText);
            expect(longText.title).assertEqual('标题');
            expect(longText.text).assertEqual('正文');
            expect(longText.additionalText).assertEqual('附加');
            expect(longText.longText).assertEqual('长文本正文');
            expect(longText.briefText).assertEqual('概要文本');
            expect(longText.expandedTitle).assertEqual('展开标题');
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0021
         * @tc.name testContent0021
         * @tc.desc 边界值：additionalText 为空串时保持空串
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let basic: notification.NotificationBasicContent = {
                title: 'T', text: 'B', additionalText: ''
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationLongTextContent(basic, 'Long', 'Brief', 'Expanded');
            let longText: notification.NotificationLongTextContent =
                content.longText as notification.NotificationLongTextContent;
            hilog.info(DOMAIN, TAG, 'additional=%{public}s', longText.additionalText);
            expect(longText.additionalText).assertEqual('');
            expect(longText.additionalText === undefined).assertFalse();
            expect(longText.longText).assertEqual('Long');
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0022
         * @tc.name testContent0022
         * @tc.desc 边界值：additionalText 缺省时兜底为空串（与基本类型不同）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationLongTextContent(basic, 'Long', 'Brief', 'Expanded');
            let longText: notification.NotificationLongTextContent =
                content.longText as notification.NotificationLongTextContent;
            hilog.info(DOMAIN, TAG, 'additional=%{public}s', longText.additionalText);
            expect(longText.additionalText).assertEqual('');
            expect(longText.additionalText === '').assertTrue();
            expect(longText.briefText).assertEqual('Brief');
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0023
         * @tc.name testContent0023
         * @tc.desc 边界值：additionalText 为单个空格时视为有效值保留
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let basic: notification.NotificationBasicContent = {
                title: 'T', text: 'B', additionalText: ' '
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationLongTextContent(basic, 'Long', 'Brief', 'Expanded');
            let longText: notification.NotificationLongTextContent =
                content.longText as notification.NotificationLongTextContent;
            let additional: string = longText.additionalText as string;
            hilog.info(DOMAIN, TAG, 'additionalLength=%{public}d', additional.length);
            expect(additional).assertEqual(' ');
            expect(additional.length).assertEqual(1);
            expect(additional === '').assertFalse();
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0024
         * @tc.name testContent0024
         * @tc.desc 边界值：长文本正文为空串时不校验，原样保留
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationLongTextContent(basic, '', '', '');
            let longText: notification.NotificationLongTextContent =
                content.longText as notification.NotificationLongTextContent;
            hilog.info(DOMAIN, TAG, 'longTextLength=%{public}d', longText.longText.length);
            expect(longText.longText).assertEqual('');
            expect(longText.briefText).assertEqual('');
            expect(longText.expandedTitle).assertEqual('');
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0025
         * @tc.name testContent0025
         * @tc.desc 极值：概要文本长度 500 不被截断
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let brief: string = buildRepeatedText(500);
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationLongTextContent(basic, 'Long', brief, 'Expanded');
            let longText: notification.NotificationLongTextContent =
                content.longText as notification.NotificationLongTextContent;
            hilog.info(DOMAIN, TAG, 'briefLength=%{public}d', longText.briefText.length);
            expect(longText.briefText.length).assertEqual(500);
            expect(longText.briefText).assertEqual(brief);
            expect(longText.briefText.length > 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0026
         * @tc.name testContent0026
         * @tc.desc 合法值：展开标题包含中文与符号时原样保留
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let expanded: string = '展开标题 #1 (含标点)';
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationLongTextContent(basic, 'Long', 'Brief', expanded);
            let longText: notification.NotificationLongTextContent =
                content.longText as notification.NotificationLongTextContent;
            hilog.info(DOMAIN, TAG, 'expanded=%{public}s', longText.expandedTitle);
            expect(longText.expandedTitle).assertEqual(expanded);
            expect(longText.expandedTitle.length).assertEqual(expanded.length);
            expect(longText.expandedTitle).assertContain('展开标题');
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0027
         * @tc.name testContent0027
         * @tc.desc 状态：长文本内容不携带多行与图片字段
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationLongTextContent(basic, 'Long', 'Brief', 'Expanded');
            hilog.info(DOMAIN, TAG, 'type=%{public}d', content.notificationContentType);
            expect(content.multiLine).assertUndefined();
            expect(content.picture).assertUndefined();
            expect(content.longText === undefined).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0028
         * @tc.name testContent0028
         * @tc.desc 合法值：多行文本内容类型为 4
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let lines: string[] = ['line0', 'line1'];
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationMultiLineContent(basic, 'Brief', 'LongTitle', lines);
            hilog.info(DOMAIN, TAG, 'type=%{public}d', content.notificationContentType);
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            expect(content.multiLine === undefined).assertFalse();
            expect(content.longText).assertUndefined();
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0029
         * @tc.name testContent0029
         * @tc.desc 状态：多行数组按引用透传，改写入参数组可见
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let lines: string[] = ['first'];
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationMultiLineContent(basic, 'Brief', 'LongTitle', lines);
            let multiLine: notification.NotificationMultiLineContent =
                content.multiLine as notification.NotificationMultiLineContent;
            lines.push('second');
            hilog.info(DOMAIN, TAG, 'linesLength=%{public}d', multiLine.lines.length);
            expect(multiLine.lines === lines).assertTrue();
            expect(multiLine.lines.length).assertEqual(2);
            expect(multiLine.lines[1]).assertEqual('second');
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0030
         * @tc.name testContent0030
         * @tc.desc 边界值：多行数组为空时不补默认行
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let lines: string[] = [];
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationMultiLineContent(basic, 'Brief', 'LongTitle', lines);
            let multiLine: notification.NotificationMultiLineContent =
                content.multiLine as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'linesLength=%{public}d', multiLine.lines.length);
            expect(multiLine.lines.length).assertEqual(0);
            expect(multiLine.briefText).assertEqual('Brief');
            expect(multiLine.longTitle).assertEqual('LongTitle');
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0031
         * @tc.name testContent0031
         * @tc.desc 合法值：单行数组保持 1 条
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let lines: string[] = ['single'];
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationMultiLineContent(basic, 'Brief', 'LongTitle', lines);
            let multiLine: notification.NotificationMultiLineContent =
                content.multiLine as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'line0=%{public}s', multiLine.lines[0]);
            expect(multiLine.lines.length).assertEqual(1);
            expect(multiLine.lines[0]).assertEqual('single');
            expect(multiLine.lines[0] === '').assertFalse();
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0032
         * @tc.name testContent0032
         * @tc.desc 合法值：4 行数组与页面常量一致时逐条保序
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let lines: string[] = ['line0', 'line1', 'line2', 'line3'];
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationMultiLineContent(basic, 'Brief', 'LongTitle', lines);
            let multiLine: notification.NotificationMultiLineContent =
                content.multiLine as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'linesLength=%{public}d', multiLine.lines.length);
            expect(multiLine.lines.length).assertEqual(4);
            expect(multiLine.lines[0]).assertEqual('line0');
            expect(multiLine.lines[3]).assertEqual('line3');
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0033
         * @tc.name testContent0033
         * @tc.desc 极值：100 行数组不截断，末行保持
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let lines: string[] = [];
            for (let i = 0; i < MANY_LINES; i++) {
                lines.push(`row-${i}`);
            }
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationMultiLineContent(basic, 'Brief', 'LongTitle', lines);
            let multiLine: notification.NotificationMultiLineContent =
                content.multiLine as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'linesLength=%{public}d', multiLine.lines.length);
            expect(multiLine.lines.length).assertEqual(MANY_LINES);
            expect(multiLine.lines[MANY_LINES - 1]).assertEqual('row-99');
            expect(multiLine.lines[0]).assertEqual('row-0');
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0034
         * @tc.name testContent0034
         * @tc.desc 合法值：多行内容 longTitle 与 briefText 分别映射
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let basic: notification.NotificationBasicContent = { title: '多行标题', text: '多行正文' };
            let lines: string[] = ['a', 'b'];
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationMultiLineContent(basic, '概要', '展开标题', lines);
            let multiLine: notification.NotificationMultiLineContent =
                content.multiLine as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'longTitle=%{public}s', multiLine.longTitle);
            expect(multiLine.title).assertEqual('多行标题');
            expect(multiLine.text).assertEqual('多行正文');
            expect(multiLine.longTitle).assertEqual('展开标题');
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0035
         * @tc.name testContent0035
         * @tc.desc 边界值：多行类型 additionalText 缺省时兜底为空串
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let lines: string[] = ['a'];
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationMultiLineContent(basic, 'Brief', 'LongTitle', lines);
            let multiLine: notification.NotificationMultiLineContent =
                content.multiLine as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'additional=%{public}s', multiLine.additionalText);
            expect(multiLine.additionalText).assertEqual('');
            expect(multiLine.additionalText === undefined).assertFalse();
            expect(multiLine.lines.length).assertEqual(1);
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0036
         * @tc.name testContent0036
         * @tc.desc 合法值：图片类型内容类型为 2
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let pixelMap: image.PixelMap = createTestPixelMap();
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationPictureContent(basic, 'Brief', 'Expanded', pixelMap);
            hilog.info(DOMAIN, TAG, 'type=%{public}d', content.notificationContentType);
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            expect(content.picture === undefined).assertFalse();
            expect(content.normal).assertUndefined();
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0037
         * @tc.name testContent0037
         * @tc.desc 状态：传入的 PixelMap 按引用透传
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let pixelMap: image.PixelMap = createTestPixelMap();
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationPictureContent(basic, 'Brief', 'Expanded', pixelMap);
            let picture: notification.NotificationPictureContent =
                content.picture as notification.NotificationPictureContent;
            hilog.info(DOMAIN, TAG, 'samePixelMap=%{public}s', String(picture.picture === pixelMap));
            expect(picture.picture === pixelMap).assertTrue();
            expect(picture.picture === undefined).assertFalse();
            expect(picture.briefText).assertEqual('Brief');
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0038
         * @tc.name testContent0038
         * @tc.desc 合法值：图片内容 briefText 与 expandedTitle 映射
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let pixelMap: image.PixelMap = createTestPixelMap();
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationPictureContent(basic, '图片概要', '图片展开', pixelMap);
            let picture: notification.NotificationPictureContent =
                content.picture as notification.NotificationPictureContent;
            hilog.info(DOMAIN, TAG, 'brief=%{public}s', picture.briefText);
            expect(picture.briefText).assertEqual('图片概要');
            expect(picture.expandedTitle).assertEqual('图片展开');
            expect(picture.expandedTitle === '').assertFalse();
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0039
         * @tc.name testContent0039
         * @tc.desc 边界值：图片类型 additionalText 缺省时兜底为空串
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let basic: notification.NotificationBasicContent = { title: 'T', text: 'B' };
            let pixelMap: image.PixelMap = createTestPixelMap();
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationPictureContent(basic, 'Brief', 'Expanded', pixelMap);
            let picture: notification.NotificationPictureContent =
                content.picture as notification.NotificationPictureContent;
            hilog.info(DOMAIN, TAG, 'additional=%{public}s', picture.additionalText);
            expect(picture.additionalText).assertEqual('');
            expect(picture.additionalText === undefined).assertFalse();
            expect(picture.title).assertEqual('T');
        });

        /**
         * @tc.number SUB_CNB_CONTENT_0040
         * @tc.name testContent0040
         * @tc.desc 合法值：社交类型内容复用 normal 且类型为 3
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let basic: notification.NotificationBasicContent = {
                title: '会话标题', text: '会话正文', additionalText: '会话附加'
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationConversationContent(basic);
            let normal: notification.NotificationBasicContent =
                content.normal as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'type=%{public}d', content.notificationContentType);
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
            expect(normal.title).assertEqual('会话标题');
            expect(content.normal === basic).assertTrue();
        });
    });
}
