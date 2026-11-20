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

// 契约层：entry main 的发布入口 NotificationOperations。
// 期望值来源：运行时按资源名从 entry 模块资源表取值（跟随设备语言），资源名清单：
// basic_notification / long_text_notification / multiline_notification / picture_notification /
// conversation_notification / notification_content / notification_additional / notification_long_text /
// notification_brief_text / notification_expanded_title；ContentType 用规格常量；
// MULTI_LINE_CONTENT 冻结为 ['line0','line1','line2','line3']。
// 发布方法在系统侧投递成功与否不做断言，只断言其触发的构造结果与不抛异常。
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { image } from '@kit.ImageKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationContentUtil } from '@ohos/notification';
import NotificationOperations from '../../../../src/main/ets/feature/NotificationOperations';
import { getTestContext, settleAsync } from './helper/TestContext';
import { createTestPixelMap } from './helper/TestPixelMap';
import { entryString } from './helper/EntryResources';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotificationBadge]';

// 文案基线在 beforeAll 里按资源名填充，避免把 base 目录英文写死后在中文设备上误判
let TITLE_BASIC: string = '';
let TITLE_LONG_TEXT: string = '';
let TITLE_MULTILINE: string = '';
let TITLE_PICTURE: string = '';
let TITLE_CONVERSATION: string = '';
let TEXT_CONTENT: string = '';
let TEXT_ADDITIONAL: string = '';
let TEXT_LONG_TEXT: string = '';
let TEXT_BRIEF: string = '';
let TEXT_EXPANDED: string = '';
const BASIC_CONTENT_FIELD_COUNT: number = 3;
const MULTILINE_LINE_COUNT: number = 4;

function initTextBaseline(): void {
    TITLE_BASIC = entryString('basic_notification');
    TITLE_LONG_TEXT = entryString('long_text_notification');
    TITLE_MULTILINE = entryString('multiline_notification');
    TITLE_PICTURE = entryString('picture_notification');
    TITLE_CONVERSATION = entryString('conversation_notification');
    TEXT_CONTENT = entryString('notification_content');
    TEXT_ADDITIONAL = entryString('notification_additional');
    TEXT_LONG_TEXT = entryString('notification_long_text');
    TEXT_BRIEF = entryString('notification_brief_text');
    TEXT_EXPANDED = entryString('notification_expanded_title');
}

let operations: NotificationOperations | undefined = undefined;

function getOperations(): NotificationOperations {
    if (operations === undefined) {
        operations = new NotificationOperations(getTestContext());
    }
    return operations as NotificationOperations;
}

function readBasic(content: notification.NotificationContent): notification.NotificationBasicContent {
    return content.normal as notification.NotificationBasicContent;
}

function readLongText(content: notification.NotificationContent): notification.NotificationLongTextContent {
    return content.longText as notification.NotificationLongTextContent;
}

function readMultiLine(content: notification.NotificationContent): notification.NotificationMultiLineContent {
    return content.multiLine as notification.NotificationMultiLineContent;
}

export default function operationsCoreTest() {
    describe('OperationsCore', () => {
        beforeAll(async () => {
            await settleAsync(50);
            initTextBaseline();
            getOperations();
        });

        /**
         * @tc.number SUB_CNB_OPS_0001
         * @tc.name testOperations0001
         * @tc.desc 初始状态：基本内容快照的正文与附加文案来自资源冻结值，标题为空串
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let snapshot: notification.NotificationBasicContent = getOperations().getBasicContent();
            hilog.info(DOMAIN, TAG, 'text=%{public}s additional=%{public}s', snapshot.text, snapshot.additionalText);
            expect(snapshot.text).assertEqual(TEXT_CONTENT);
            expect(snapshot.additionalText).assertEqual(TEXT_ADDITIONAL);
            expect(snapshot.title).assertEqual('');
        });

        /**
         * @tc.number SUB_CNB_OPS_0002
         * @tc.name testOperations0002
         * @tc.desc 状态：快照是副本，改写快照不影响内部基本内容
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let snapshot: notification.NotificationBasicContent = getOperations().getBasicContent();
            snapshot.text = 'TamperedText';
            let fresh: notification.NotificationBasicContent = getOperations().getBasicContent();
            hilog.info(DOMAIN, TAG, 'snapshot=%{public}s fresh=%{public}s', snapshot.text, fresh.text);
            expect(fresh.text).assertEqual(TEXT_CONTENT);
            expect(fresh.text === 'TamperedText').assertFalse();
            expect(snapshot === fresh).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_OPS_0003
         * @tc.name testOperations0003
         * @tc.desc 状态：快照只暴露三个字段
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let snapshot: notification.NotificationBasicContent = getOperations().getBasicContent();
            let fields: string[] = Object.keys(snapshot);
            hilog.info(DOMAIN, TAG, 'fieldCount=%{public}d', fields.length);
            expect(fields.length).assertEqual(BASIC_CONTENT_FIELD_COUNT);
            expect(fields.indexOf('title') >= 0).assertTrue();
            expect(fields.indexOf('additionalText') >= 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_OPS_0004
         * @tc.name testOperations0004
         * @tc.desc 合法值：基本类型内容类型为 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = getOperations().buildBasicContent();
            hilog.info(DOMAIN, TAG, 'type=%{public}d', content.notificationContentType);
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(notificationContentUtil.getContentTypeId(content)).assertEqual(0);
            expect(content.longText).assertUndefined();
        });

        /**
         * @tc.number SUB_CNB_OPS_0005
         * @tc.name testOperations0005
         * @tc.desc 合法值：基本类型标题取 basic_notification 资源值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = getOperations().buildBasicContent();
            let basic: notification.NotificationBasicContent = readBasic(content);
            hilog.info(DOMAIN, TAG, 'title=%{public}s', basic.title);
            expect(basic.title).assertEqual(TITLE_BASIC);
            expect(basic.text).assertEqual(TEXT_CONTENT);
            expect(basic.additionalText).assertEqual(TEXT_ADDITIONAL);
        });

        /**
         * @tc.number SUB_CNB_OPS_0006
         * @tc.name testOperations0006
         * @tc.desc 状态：构造后快照反映最新标题
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            getOperations().buildBasicContent();
            let snapshot: notification.NotificationBasicContent = getOperations().getBasicContent();
            hilog.info(DOMAIN, TAG, 'title=%{public}s', snapshot.title);
            expect(snapshot.title).assertEqual(TITLE_BASIC);
            expect(snapshot.title === '').assertFalse();
            expect(snapshot.text).assertEqual(TEXT_CONTENT);
        });

        /**
         * @tc.number SUB_CNB_OPS_0007
         * @tc.name testOperations0007
         * @tc.desc 状态：基本类型内容的 normal 与内部基本内容共享引用
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let content: notification.NotificationContent = getOperations().buildBasicContent();
            let snapshot: notification.NotificationBasicContent = getOperations().getBasicContent();
            hilog.info(DOMAIN, TAG, 'title=%{public}s', readBasic(content).title);
            expect(readBasic(content).title).assertEqual(snapshot.title);
            expect(readBasic(content).text).assertEqual(snapshot.text);
            expect(readBasic(content).additionalText).assertEqual(snapshot.additionalText);
        });

        /**
         * @tc.number SUB_CNB_OPS_0008
         * @tc.name testOperations0008
         * @tc.desc 合法值：长文本内容类型为 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = getOperations().buildLongTextContent();
            hilog.info(DOMAIN, TAG, 'type=%{public}d', content.notificationContentType);
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(notificationContentUtil.getContentTypeId(content)).assertEqual(1);
            expect(content.normal).assertUndefined();
        });

        /**
         * @tc.number SUB_CNB_OPS_0009
         * @tc.name testOperations0009
         * @tc.desc 合法值：长文本标题取 long_text_notification 资源值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let longText: notification.NotificationLongTextContent =
                readLongText(getOperations().buildLongTextContent());
            hilog.info(DOMAIN, TAG, 'title=%{public}s', longText.title);
            expect(longText.title).assertEqual(TITLE_LONG_TEXT);
            expect(longText.text).assertEqual(TEXT_CONTENT);
            expect(longText.additionalText).assertEqual(TEXT_ADDITIONAL);
        });

        /**
         * @tc.number SUB_CNB_OPS_0010
         * @tc.name testOperations0010
         * @tc.desc 合法值：长文本正文取 notification_long_text 资源值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let longText: notification.NotificationLongTextContent =
                readLongText(getOperations().buildLongTextContent());
            hilog.info(DOMAIN, TAG, 'longText=%{public}s', longText.longText);
            expect(longText.longText).assertEqual(TEXT_LONG_TEXT);
            expect(longText.longText.length).assertEqual(TEXT_LONG_TEXT.length);
            expect(longText.longText === TEXT_CONTENT).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_OPS_0011
         * @tc.name testOperations0011
         * @tc.desc 合法值：长文本概要取 notification_brief_text 资源值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let longText: notification.NotificationLongTextContent =
                readLongText(getOperations().buildLongTextContent());
            hilog.info(DOMAIN, TAG, 'brief=%{public}s', longText.briefText);
            expect(longText.briefText).assertEqual(TEXT_BRIEF);
            expect(longText.briefText.length > 0).assertTrue();
            expect(longText.briefText.length > TEXT_LONG_TEXT.length).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_OPS_0012
         * @tc.name testOperations0012
         * @tc.desc 合法值：长文本展开标题取 notification_expanded_title 资源值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let longText: notification.NotificationLongTextContent =
                readLongText(getOperations().buildLongTextContent());
            hilog.info(DOMAIN, TAG, 'expanded=%{public}s', longText.expandedTitle);
            expect(longText.expandedTitle).assertEqual(TEXT_EXPANDED);
            expect(longText.expandedTitle === TEXT_BRIEF).assertFalse();
            expect(longText.expandedTitle.length > 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_OPS_0013
         * @tc.name testOperations0013
         * @tc.desc 合法值：多行文本内容类型为 4
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = getOperations().buildMultiLineContent();
            hilog.info(DOMAIN, TAG, 'type=%{public}d', content.notificationContentType);
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            expect(notificationContentUtil.getContentTypeId(content)).assertEqual(4);
            expect(content.longText).assertUndefined();
        });

        /**
         * @tc.number SUB_CNB_OPS_0014
         * @tc.name testOperations0014
         * @tc.desc 合法值：多行文本标题取 multiline_notification 资源值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let multiLine: notification.NotificationMultiLineContent =
                readMultiLine(getOperations().buildMultiLineContent());
            hilog.info(DOMAIN, TAG, 'title=%{public}s', multiLine.title);
            expect(multiLine.title).assertEqual(TITLE_MULTILINE);
            expect(multiLine.text).assertEqual(TEXT_CONTENT);
            expect(multiLine.additionalText).assertEqual(TEXT_ADDITIONAL);
        });

        /**
         * @tc.number SUB_CNB_OPS_0015
         * @tc.name testOperations0015
         * @tc.desc 合法值：多行内容固定为 4 行且首末行来自冻结常量
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let multiLine: notification.NotificationMultiLineContent =
                readMultiLine(getOperations().buildMultiLineContent());
            hilog.info(DOMAIN, TAG, 'lines=%{public}d first=%{public}s last=%{public}s',
                multiLine.lines.length, multiLine.lines[0], multiLine.lines[MULTILINE_LINE_COUNT - 1]);
            expect(multiLine.lines.length).assertEqual(MULTILINE_LINE_COUNT);
            expect(multiLine.lines[0]).assertEqual('line0');
            expect(multiLine.lines[MULTILINE_LINE_COUNT - 1]).assertEqual('line3');
        });

        /**
         * @tc.number SUB_CNB_OPS_0016
         * @tc.name testOperations0016
         * @tc.desc 合法值：多行内容的行为 line0 到 line3 依次递增
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let multiLine: notification.NotificationMultiLineContent =
                readMultiLine(getOperations().buildMultiLineContent());
            let orderedCount: number = 0;
            for (let i = 0; i < multiLine.lines.length; i++) {
                if (multiLine.lines[i] === `line${i}`) {
                    orderedCount += 1;
                }
            }
            hilog.info(DOMAIN, TAG, 'orderedCount=%{public}d', orderedCount);
            expect(orderedCount).assertEqual(MULTILINE_LINE_COUNT);
            expect(orderedCount).assertEqual(multiLine.lines.length);
            expect(multiLine.lines[1]).assertEqual('line1');
        });

        /**
         * @tc.number SUB_CNB_OPS_0017
         * @tc.name testOperations0017
         * @tc.desc 合法值：多行内容的概要取 notification_brief_text 资源值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let multiLine: notification.NotificationMultiLineContent =
                readMultiLine(getOperations().buildMultiLineContent());
            hilog.info(DOMAIN, TAG, 'brief=%{public}s', multiLine.briefText);
            expect(multiLine.briefText).assertEqual(TEXT_BRIEF);
            expect(multiLine.briefText === TEXT_EXPANDED).assertFalse();
            expect(multiLine.briefText.length > 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_OPS_0018
         * @tc.name testOperations0018
         * @tc.desc 合法值：多行内容的展开标题取 notification_expanded_title 资源值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let multiLine: notification.NotificationMultiLineContent =
                readMultiLine(getOperations().buildMultiLineContent());
            hilog.info(DOMAIN, TAG, 'longTitle=%{public}s', multiLine.longTitle);
            expect(multiLine.longTitle).assertEqual(TEXT_EXPANDED);
            expect(multiLine.longTitle === TEXT_BRIEF).assertFalse();
            expect(multiLine.longTitle.length > 0).assertTrue();
        });

        /**
         * @tc.number SUB_CNB_OPS_0019
         * @tc.name testOperations0019
         * @tc.desc 合法值：图片内容类型为 2
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let pixelMap: image.PixelMap = createTestPixelMap();
            let content: notification.NotificationContent = getOperations().buildPictureContent(pixelMap);
            hilog.info(DOMAIN, TAG, 'type=%{public}d', content.notificationContentType);
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            expect(notificationContentUtil.getContentTypeId(content)).assertEqual(2);
            expect(content.multiLine).assertUndefined();
        });

        /**
         * @tc.number SUB_CNB_OPS_0020
         * @tc.name testOperations0020
         * @tc.desc 合法值：图片标题取 picture_notification 资源值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let pixelMap: image.PixelMap = createTestPixelMap();
            let picture: notification.NotificationPictureContent =
                getOperations().buildPictureContent(pixelMap).picture as notification.NotificationPictureContent;
            hilog.info(DOMAIN, TAG, 'title=%{public}s', picture.title);
            expect(picture.title).assertEqual(TITLE_PICTURE);
            expect(picture.text).assertEqual(TEXT_CONTENT);
            expect(picture.additionalText).assertEqual(TEXT_ADDITIONAL);
        });

        /**
         * @tc.number SUB_CNB_OPS_0021
         * @tc.name testOperations0021
         * @tc.desc 状态：传入的 PixelMap 按引用透传进图片内容
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let pixelMap: image.PixelMap = createTestPixelMap();
            let picture: notification.NotificationPictureContent =
                getOperations().buildPictureContent(pixelMap).picture as notification.NotificationPictureContent;
            hilog.info(DOMAIN, TAG, 'samePixelMap=%{public}s', String(picture.picture === pixelMap));
            expect(picture.picture === pixelMap).assertTrue();
            expect(picture.picture === undefined).assertFalse();
            expect(picture.title).assertEqual(TITLE_PICTURE);
        });

        /**
         * @tc.number SUB_CNB_OPS_0022
         * @tc.name testOperations0022
         * @tc.desc 合法值：图片内容的概要取 notification_brief_text 资源值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let pixelMap: image.PixelMap = createTestPixelMap();
            let picture: notification.NotificationPictureContent =
                getOperations().buildPictureContent(pixelMap).picture as notification.NotificationPictureContent;
            hilog.info(DOMAIN, TAG, 'brief=%{public}s', picture.briefText);
            expect(picture.briefText).assertEqual(TEXT_BRIEF);
            expect(picture.briefText.length > 0).assertTrue();
            expect(picture.briefText === TEXT_EXPANDED).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_OPS_0023
         * @tc.name testOperations0023
         * @tc.desc 合法值：图片内容的展开标题取 notification_expanded_title 资源值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            let pixelMap: image.PixelMap = createTestPixelMap();
            let picture: notification.NotificationPictureContent =
                getOperations().buildPictureContent(pixelMap).picture as notification.NotificationPictureContent;
            hilog.info(DOMAIN, TAG, 'expanded=%{public}s', picture.expandedTitle);
            expect(picture.expandedTitle).assertEqual(TEXT_EXPANDED);
            expect(picture.expandedTitle.length > 0).assertTrue();
            expect(picture.expandedTitle === TEXT_BRIEF).assertFalse();
        });

        /**
         * @tc.number SUB_CNB_OPS_0024
         * @tc.name testOperations0024
         * @tc.desc 合法值：社交内容类型为 3
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = getOperations().buildConversationContent();
            hilog.info(DOMAIN, TAG, 'type=%{public}d', content.notificationContentType);
            expect(content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
            expect(notificationContentUtil.getContentTypeId(content)).assertEqual(3);
            expect(content.longText).assertUndefined();
        });

        /**
         * @tc.number SUB_CNB_OPS_0025
         * @tc.name testOperations0025
         * @tc.desc 合法值：社交标题取 conversation_notification 资源值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            let content: notification.NotificationContent = getOperations().buildConversationContent();
            let basic: notification.NotificationBasicContent = readBasic(content);
            hilog.info(DOMAIN, TAG, 'title=%{public}s', basic.title);
            expect(basic.title).assertEqual(TITLE_CONVERSATION);
            expect(basic.text).assertEqual(TEXT_CONTENT);
            expect(basic.additionalText).assertEqual(TEXT_ADDITIONAL);
        });

        /**
         * @tc.number SUB_CNB_OPS_0026
         * @tc.name testOperations0026
         * @tc.desc 状态：五种构造依次调用后标题为最后一种的资源值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            getOperations().buildBasicContent();
            getOperations().buildLongTextContent();
            getOperations().buildMultiLineContent();
            let snapshot: notification.NotificationBasicContent = getOperations().getBasicContent();
            hilog.info(DOMAIN, TAG, 'title=%{public}s', snapshot.title);
            expect(snapshot.title).assertEqual(TITLE_MULTILINE);
            expect(snapshot.title === TITLE_BASIC).assertFalse();
            expect(snapshot.text).assertEqual(TEXT_CONTENT);
        });

        /**
         * @tc.number SUB_CNB_OPS_0027
         * @tc.name testOperations0027
         * @tc.desc 容错：发布基本类型通知不抛异常并刷新标题
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let errorText: string = '';
            try {
                getOperations().publishBasicNotification();
            } catch (err) {
                errorText = JSON.stringify(err);
            }
            await settleAsync(60);
            let snapshot: notification.NotificationBasicContent = getOperations().getBasicContent();
            hilog.info(DOMAIN, TAG, 'errorText=%{public}s title=%{public}s', errorText, snapshot.title);
            expect(errorText).assertEqual('');
            expect(snapshot.title).assertEqual(TITLE_BASIC);
            expect(snapshot.text).assertEqual(TEXT_CONTENT);
        });

        /**
         * @tc.number SUB_CNB_OPS_0028
         * @tc.name testOperations0028
         * @tc.desc 容错：发布长文本通知不抛异常并刷新标题
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let errorText: string = '';
            try {
                getOperations().publishLongTextNotification();
            } catch (err) {
                errorText = JSON.stringify(err);
            }
            await settleAsync(60);
            let snapshot: notification.NotificationBasicContent = getOperations().getBasicContent();
            hilog.info(DOMAIN, TAG, 'errorText=%{public}s title=%{public}s', errorText, snapshot.title);
            expect(errorText).assertEqual('');
            expect(snapshot.title).assertEqual(TITLE_LONG_TEXT);
            expect(snapshot.text).assertEqual(TEXT_CONTENT);
        });

        /**
         * @tc.number SUB_CNB_OPS_0029
         * @tc.name testOperations0029
         * @tc.desc 容错：发布多行文本通知不抛异常并刷新标题
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let errorText: string = '';
            try {
                getOperations().publishMultiLineNotification();
            } catch (err) {
                errorText = JSON.stringify(err);
            }
            await settleAsync(60);
            let snapshot: notification.NotificationBasicContent = getOperations().getBasicContent();
            hilog.info(DOMAIN, TAG, 'errorText=%{public}s title=%{public}s', errorText, snapshot.title);
            expect(errorText).assertEqual('');
            expect(snapshot.title).assertEqual(TITLE_MULTILINE);
            expect(snapshot.text).assertEqual(TEXT_CONTENT);
        });

        /**
         * @tc.number SUB_CNB_OPS_0030
         * @tc.name testOperations0030
         * @tc.desc 容错：发布社交通知不抛异常并刷新标题
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            let errorText: string = '';
            try {
                await getOperations().publishConversationNotification();
            } catch (err) {
                errorText = JSON.stringify(err);
            }
            await settleAsync(60);
            let snapshot: notification.NotificationBasicContent = getOperations().getBasicContent();
            hilog.info(DOMAIN, TAG, 'errorText=%{public}s title=%{public}s', errorText, snapshot.title);
            expect(errorText).assertEqual('');
            expect(snapshot.title).assertEqual(TITLE_CONVERSATION);
            expect(snapshot.text).assertEqual(TEXT_CONTENT);
        });
    });
}
