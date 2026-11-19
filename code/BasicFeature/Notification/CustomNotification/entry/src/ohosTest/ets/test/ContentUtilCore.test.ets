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

// notificationContentUtil 的通知内容构造与内容类型解析。
// 期望值来自 SDK 规格常量（notificationManager.ContentType / 字段可选性）与源码分支推演，
// 不复制被测实现的计算过程。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { image } from '@kit.ImageKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationContentUtil } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';

function buildRepeatedText(count: number): string {
    let result: string = '';
    for (let i: number = 0; i < count; i++) {
        result += 'L';
    }
    return result;
}

function buildLines(count: number): string[] {
    let result: string[] = [];
    for (let i: number = 0; i < count; i++) {
        result.push(`line-${i}`);
    }
    return result;
}

export default function contentUtilCoreTest() {
    describe('ContentUtilCore', () => {
        /**
         * @tc.number SUB_CustomNotification_CONTENT_0001
         * @tc.name testContent0001
         * @tc.desc 合法值：仅 notificationContentType 为基本文本时原值返回
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0001 begin');
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual,
                notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(actual).assertEqual(0);
            expect(actual >= notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0002
         * @tc.name testContent0002
         * @tc.desc 合法值：长文本类型按 notificationContentType 原值返回
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0002 begin');
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual,
                notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(actual).assertEqual(1);
            expect(actual)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT + 1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0003
         * @tc.name testContent0003
         * @tc.desc 合法值：图片类型按 notificationContentType 原值返回
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0003 begin');
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual,
                notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            expect(actual).assertEqual(2);
            expect(actual)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT + 1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0004
         * @tc.name testContent0004
         * @tc.desc 合法值：多行文本类型按 notificationContentType 原值返回
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0004 begin');
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual,
                notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            expect(actual)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            expect(actual)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE + 2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0005
         * @tc.name testContent0005
         * @tc.desc 边界值：应用未使用的会话类型同样被原值穿透，不落入默认分支
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0005 begin');
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual,
                notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
            expect(actual).assertEqual(3);
            expect(actual)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT + 3);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0006
         * @tc.name testContent0006
         * @tc.desc 极值：实况窗类型（枚举上界）被原值穿透，不被钳制为其它类型
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0006 begin');
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual,
                notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
            expect(actual > notification.ContentType.NOTIFICATION_CONTENT_MULTILINE).assertTrue();
            expect(actual)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT + 4 + 1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0007
         * @tc.name testContent0007
         * @tc.desc 状态：新字段缺省时回退读取废弃字段 contentType
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0007 begin');
            let content: notification.NotificationContent = {
                contentType: 1
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual,
                notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(actual).assertEqual(1);
            expect(actual).assertEqual(content.contentType);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0008
         * @tc.name testContent0008
         * @tc.desc 边界值：废弃字段值为 0（falsy）时也走回退分支，返回 0 而非默认类型
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0008 begin');
            let content: notification.NotificationContent = {
                contentType: 0
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual, 0);
            expect(actual).assertEqual(0);
            expect(content.contentType !== undefined).assertTrue();
            expect(actual === content.contentType).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0009
         * @tc.name testContent0009
         * @tc.desc 组合值：两个字段同时存在且冲突时优先新字段 notificationContentType
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0009 begin');
            let content: notification.NotificationContent = {
                notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
                contentType: 0
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual,
                notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            expect(actual).assertEqual(2);
            expect(actual).assertEqual(content.notificationContentType);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0010
         * @tc.name testContent0010
         * @tc.desc 组合值：新字段为 0（falsy）而废弃字段为 1，结果必须是 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContent0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0010 begin');
            let content: notification.NotificationContent = {
                notificationContentType: 0,
                contentType: 1
            };
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual, 0);
            expect(actual).assertEqual(0);
            expect(actual === content.notificationContentType).assertTrue();
            expect(actual === content.contentType).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0011
         * @tc.name testContent0011
         * @tc.desc 非法值：两个类型字段都缺省时返回基本文本类型作为兜底
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0011 begin');
            let content: notification.NotificationContent = {};
            let actual: number = notificationContentUtil.getContentTypeId(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual,
                notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(actual).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(content.notificationContentType === undefined).assertTrue();
            expect(content.contentType === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0012
         * @tc.name testContent0012
         * @tc.desc 极值：越界类型值（负数与超出枚举上界）原样返回，锁定"不做范围校验"的行为
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContent0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0012 begin');
            let negativeContent: notification.NotificationContent = { notificationContentType: -1 };
            let outOfRangeContent: notification.NotificationContent = { notificationContentType: 99 };
            let negativeActual: number = notificationContentUtil.getContentTypeId(negativeContent);
            let outOfRangeActual: number = notificationContentUtil.getContentTypeId(outOfRangeContent);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d,%{public}d expected=%{public}d,%{public}d',
                negativeActual, outOfRangeActual, -1, 99);
            expect(negativeActual).assertEqual(-1);
            expect(outOfRangeActual).assertEqual(99);
            expect(outOfRangeActual > notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW)
                .assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0013
         * @tc.name testContent0013
         * @tc.desc 合法值：基本内容构造保留三字段并标记为基本文本类型
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0013 begin');
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text',
                additionalText: 'Additional'
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initBasicNotificationContent(basic);
            let normal: notification.NotificationBasicContent =
                content.normal as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `${content.notificationContentType}`, 'BASIC_TEXT');
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(normal.title).assertEqual('Title');
            expect(normal.text).assertEqual('Text');
            expect(normal.additionalText).assertEqual('Additional');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0014
         * @tc.name testContent0014
         * @tc.desc 边界值：additionalText 缺省时不被补成空串
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0014 begin');
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text'
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initBasicNotificationContent(basic);
            let normal: notification.NotificationBasicContent =
                content.normal as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `${normal.additionalText}`, 'undefined');
            expect(normal.additionalText === undefined).assertTrue();
            expect(normal.additionalText !== '').assertTrue();
            expect(normal.title).assertEqual('Title');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0015
         * @tc.name testContent0015
         * @tc.desc 边界值：三字段全为空串时保持空串不被替换
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0015 begin');
            let basic: notification.NotificationBasicContent = {
                title: '',
                text: '',
                additionalText: ''
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initBasicNotificationContent(basic);
            let normal: notification.NotificationBasicContent =
                content.normal as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `${normal.title}`, 'empty');
            expect(normal.title).assertEqual('');
            expect(normal.text).assertEqual('');
            expect(normal.additionalText).assertEqual('');
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0016
         * @tc.name testContent0016
         * @tc.desc 极值：超长正文（2048 字符）完整保留，不被截断
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContent0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0016 begin');
            let longBody: string = buildRepeatedText(2048);
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: longBody,
                additionalText: 'Additional'
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initBasicNotificationContent(basic);
            let normal: notification.NotificationBasicContent =
                content.normal as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', normal.text, longBody);
            expect(normal.text).assertEqual(longBody);
            expect(normal.text === longBody).assertTrue();
            expect(normal.additionalText).assertEqual('Additional');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0016 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0017
         * @tc.name testContent0017
         * @tc.desc 合法值：长文本内容映射六个字段且标记为长文本类型
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0017 begin');
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text',
                additionalText: 'Additional'
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationLongTextContent(basic, 'LongBody', 'Brief', 'Expanded');
            let longTextContent: notification.NotificationLongTextContent =
                content.longText as notification.NotificationLongTextContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                longTextContent.longText, 'LongBody');
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(longTextContent.title).assertEqual('Title');
            expect(longTextContent.text).assertEqual('Text');
            expect(longTextContent.additionalText).assertEqual('Additional');
            expect(longTextContent.longText).assertEqual('LongBody');
            expect(longTextContent.briefText).assertEqual('Brief');
            expect(longTextContent.expandedTitle).assertEqual('Expanded');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0017 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0018
         * @tc.name testContent0018
         * @tc.desc 边界值：长文本的 additionalText 缺省时回退为空串
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0018 begin');
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text'
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationLongTextContent(basic, 'LongBody', 'Brief', 'Expanded');
            let longTextContent: notification.NotificationLongTextContent =
                content.longText as notification.NotificationLongTextContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `"${longTextContent.additionalText}"`, '""');
            expect(longTextContent.additionalText).assertEqual('');
            expect(longTextContent.additionalText === '').assertTrue();
            expect(longTextContent.longText).assertEqual('LongBody');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0018 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0019
         * @tc.name testContent0019
         * @tc.desc 合法值：长文本的 additionalText 非空时原值透传
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0019 begin');
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text',
                additionalText: 'Additional'
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationLongTextContent(basic, 'LongBody', 'Brief', 'Expanded');
            let longTextContent: notification.NotificationLongTextContent =
                content.longText as notification.NotificationLongTextContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                longTextContent.additionalText, 'Additional');
            expect(longTextContent.additionalText).assertEqual('Additional');
            expect(longTextContent.additionalText !== '').assertTrue();
            expect(longTextContent.text).assertEqual('Text');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0019 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0020
         * @tc.name testContent0020
         * @tc.desc 边界值：additionalText 为空串时与缺省值区分（均为空串但分支不同）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContent0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0020 begin');
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text',
                additionalText: ''
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationLongTextContent(basic, 'LongBody', 'Brief', 'Expanded');
            let longTextContent: notification.NotificationLongTextContent =
                content.longText as notification.NotificationLongTextContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `"${longTextContent.additionalText}"`, '""');
            expect(longTextContent.additionalText).assertEqual('');
            expect(basic.additionalText === '').assertTrue();
            expect(longTextContent.longText).assertEqual('LongBody');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0020 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0021
         * @tc.name testContent0021
         * @tc.desc 极值：超长 longText（1536 字符）与空 briefText/expandedTitle 组合
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContent0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0021 begin');
            let longBody: string = buildRepeatedText(1536);
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text',
                additionalText: 'Additional'
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationLongTextContent(basic, longBody, '', '');
            let longTextContent: notification.NotificationLongTextContent =
                content.longText as notification.NotificationLongTextContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `len=${longTextContent.longText.length}`, 'len=1536');
            expect(longTextContent.longText).assertEqual(longBody);
            expect(longTextContent.longText.length).assertEqual(1536);
            expect(longTextContent.briefText).assertEqual('');
            expect(longTextContent.expandedTitle).assertEqual('');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0021 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0022
         * @tc.name testContent0022
         * @tc.desc 合法值：多行文本按输入顺序完整保留四行
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0022 begin');
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text',
                additionalText: 'Additional'
            };
            let lines: string[] = ['line0', 'line1', 'line2', 'line3'];
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationMultiLineContent(basic, 'Brief', 'LongTitle', lines);
            let multiLineContent: notification.NotificationMultiLineContent =
                content.multiLine as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', multiLineContent.lines.length, 4);
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            expect(multiLineContent.lines.length).assertEqual(4);
            expect(multiLineContent.lines[0]).assertEqual('line0');
            expect(multiLineContent.lines[3]).assertEqual('line3');
            expect(multiLineContent.longTitle).assertEqual('LongTitle');
            expect(multiLineContent.briefText).assertEqual('Brief');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0022 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0023
         * @tc.name testContent0023
         * @tc.desc 边界值：多行文本接受空数组，长度保持 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0023 begin');
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text'
            };
            let lines: string[] = [];
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationMultiLineContent(basic, 'Brief', 'LongTitle', lines);
            let multiLineContent: notification.NotificationMultiLineContent =
                content.multiLine as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', multiLineContent.lines.length, 0);
            expect(multiLineContent.lines.length).assertEqual(0);
            expect(multiLineContent.lines.length === 0).assertTrue();
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0023 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0024
         * @tc.name testContent0024
         * @tc.desc 边界值：多行文本含一条空串时长度仍为 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0024 begin');
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text'
            };
            let lines: string[] = [''];
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationMultiLineContent(basic, 'Brief', 'LongTitle', lines);
            let multiLineContent: notification.NotificationMultiLineContent =
                content.multiLine as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', multiLineContent.lines.length, 1);
            expect(multiLineContent.lines.length).assertEqual(1);
            expect(multiLineContent.lines[0]).assertEqual('');
            expect(multiLineContent.lines[0] === '').assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0024 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0025
         * @tc.name testContent0025
         * @tc.desc 边界值：多行文本的 additionalText 缺省时回退为空串
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0025 begin');
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text'
            };
            let lines: string[] = ['line0'];
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationMultiLineContent(basic, 'Brief', 'LongTitle', lines);
            let multiLineContent: notification.NotificationMultiLineContent =
                content.multiLine as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `"${multiLineContent.additionalText}"`, '""');
            expect(multiLineContent.additionalText).assertEqual('');
            expect(multiLineContent.additionalText === '').assertTrue();
            expect(multiLineContent.lines.length).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0025 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0026
         * @tc.name testContent0026
         * @tc.desc 极值：多行文本 100 行时顺序与首尾元素保持
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContent0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0026 begin');
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text'
            };
            let lines: string[] = buildLines(100);
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationMultiLineContent(basic, 'Brief', 'LongTitle', lines);
            let multiLineContent: notification.NotificationMultiLineContent =
                content.multiLine as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', multiLineContent.lines.length, 100);
            expect(multiLineContent.lines.length).assertEqual(100);
            expect(multiLineContent.lines[0]).assertEqual('line-0');
            expect(multiLineContent.lines[99]).assertEqual('line-99');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0026 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0027
         * @tc.name testContent0027
         * @tc.desc 合法值：图片内容映射五字段并标记为图片类型
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContent0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0027 begin');
            let options: image.InitializationOptions = { size: { width: 2, height: 2 } };
            let pixelMap: image.PixelMap = image.createPixelMapSync(options);
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text',
                additionalText: 'Additional'
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationPictureContent(basic, 'Brief', 'Expanded', pixelMap);
            let pictureContent: notification.NotificationPictureContent =
                content.picture as notification.NotificationPictureContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                pictureContent.title, 'Title');
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            expect(pictureContent.title).assertEqual('Title');
            expect(pictureContent.text).assertEqual('Text');
            expect(pictureContent.additionalText).assertEqual('Additional');
            expect(pictureContent.briefText).assertEqual('Brief');
            expect(pictureContent.expandedTitle).assertEqual('Expanded');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0027 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0028
         * @tc.name testContent0028
         * @tc.desc 边界值：图片内容的 additionalText 缺省时回退为空串
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0028 begin');
            let options: image.InitializationOptions = { size: { width: 2, height: 2 } };
            let pixelMap: image.PixelMap = image.createPixelMapSync(options);
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text'
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationPictureContent(basic, 'Brief', 'Expanded', pixelMap);
            let pictureContent: notification.NotificationPictureContent =
                content.picture as notification.NotificationPictureContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `"${pictureContent.additionalText}"`, '""');
            expect(pictureContent.additionalText).assertEqual('');
            expect(pictureContent.additionalText === '').assertTrue();
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0028 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0029
         * @tc.name testContent0029
         * @tc.desc 状态：PixelMap 实例被原样挂载，未被替换或丢弃
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContent0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0029 begin');
            let options: image.InitializationOptions = { size: { width: 2, height: 2 } };
            let pixelMap: image.PixelMap = image.createPixelMapSync(options);
            let basic: notification.NotificationBasicContent = {
                title: 'Title',
                text: 'Text',
                additionalText: 'Additional'
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationPictureContent(basic, 'Brief', 'Expanded', pixelMap);
            let pictureContent: notification.NotificationPictureContent =
                content.picture as notification.NotificationPictureContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', 'PixelMap', 'PixelMap present');
            expect(pictureContent.picture === pixelMap).assertTrue();
            expect(pictureContent.picture !== undefined).assertTrue();
            expect(pictureContent.briefText).assertEqual('Brief');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0029 end');
        });

        /**
         * @tc.number SUB_CustomNotification_CONTENT_0030
         * @tc.name testContent0030
         * @tc.desc 边界值：图片内容的 expandedTitle 与 briefText 允许空串并保持空串
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContent0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0030 begin');
            let options: image.InitializationOptions = { size: { width: 2, height: 2 } };
            let pixelMap: image.PixelMap = image.createPixelMapSync(options);
            let basic: notification.NotificationBasicContent = {
                title: '',
                text: '',
                additionalText: ''
            };
            let content: notification.NotificationContent =
                notificationContentUtil.initNotificationPictureContent(basic, '', '', pixelMap);
            let pictureContent: notification.NotificationPictureContent =
                content.picture as notification.NotificationPictureContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `"${pictureContent.expandedTitle}"`, '""');
            expect(pictureContent.expandedTitle).assertEqual('');
            expect(pictureContent.briefText).assertEqual('');
            expect(pictureContent.title).assertEqual('');
            expect(pictureContent.picture === pixelMap).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContent0030 end');
        });
    });
}
