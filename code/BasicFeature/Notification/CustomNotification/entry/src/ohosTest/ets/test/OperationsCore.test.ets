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

// entry main 发布入口 NotificationOperations 的六种发布方法。
// 发布方法内部 fire-and-forget 调用 notificationUtil.publishNotification，
// 统一经 P8 新增的观测点（lastPublishedRequest / lastNotificationSlot）断言发布意图。
// 期望值来源：NOTIFICATION_ID 冻结常量（1~6）、string.json 冻结数据表、SlotType 规格常量。
import { describe, beforeAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationContentUtil, notificationRequestUtil, notificationUtil } from '@ohos/notification';
import { image } from '@kit.ImageKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import NotificationOperations from '../../../../src/main/ets/feature/NotificationOperations';
import { getString } from '../util/ResourceUtil';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';

// NOTIFICATION_ID 冻结基线（NotificationOperations.ets 私有枚举值）
const ID_BASIC: number = 1;
const ID_LONG_TEXT: number = 2;
const ID_MULTI_LINE: number = 3;
const ID_PICTURE: number = 4;
const ID_BUTTON: number = 5;
const ID_WANTAGENT: number = 6;

// string.json 冻结数据表基线：不写成英文字面量，改为按当前设备语言取自与 main 同名同值的资源。
// main 的标题/正文均走 context.resourceManager，中文环境下返回「基本型通知」等文案，
// 写死英文会在中文设备上恒失败（真机首轮 OperationsCore 9 例失败根因）。
let TITLE_BASIC: string = '';
let TEXT_CONTENT: string = '';
let TEXT_ADDITIONAL: string = '';
let TITLE_LONG_TEXT: string = '';
let TEXT_LONG_TEXT: string = '';
let TEXT_BRIEF: string = '';
let TEXT_EXPANDED: string = '';
let TITLE_MULTILINE: string = '';
let TITLE_PICTURE: string = '';
let TITLE_BUTTONS: string = '';
let TITLE_FIRST_BUTTON: string = '';
let TITLE_SECOND_BUTTON: string = '';
let TITLE_CLICKABLE: string = '';

async function sleep(ms: number): Promise<void> {
    return new Promise<void>((resolve: () => void) => setTimeout(resolve, ms));
}

/**
 * 轮询等待新的发布请求到达（id 匹配且引用不同于发布前的快照）。
 * 发布链 fire-and-forget：调用方发布后必须等待，不能立即断言。
 */
async function waitNewPublished(id: number, beforeRef: notification.NotificationRequest | undefined,
    timeoutMs: number = 4000): Promise<boolean> {
    const start: number = Date.now();
    while (Date.now() - start < timeoutMs) {
        const req: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
        if (req !== undefined && req.id === id && req !== beforeRef) {
            return true;
        }
        await sleep(60);
    }
    return false;
}

let operations: NotificationOperations =
    new NotificationOperations(abilityDelegatorRegistry.getAbilityDelegator().getAppContext());

/**
 * 图片内容装配：注入的 context 在测试进程里取不到 app.media（真机日志 9001001
 * "Failed to get media data in getMediaFunc"，而 App 进程点同一按钮发布成功），
 * 因此图片类型改为在测试侧自建 1x1 像素图，经同一个发布链观察请求产物。
 */
async function publishPictureContent(): Promise<void> {
    let basic: notification.NotificationBasicContent = {
        title: TITLE_PICTURE,
        text: TEXT_CONTENT,
        additionalText: TEXT_ADDITIONAL
    };
    let pixelMap: image.PixelMap = image.createPixelMapSync({ size: { width: 1, height: 1 } });
    let content: notification.NotificationContent =
        notificationContentUtil.initNotificationPictureContent(basic, TEXT_BRIEF, TEXT_EXPANDED, pixelMap);
    await notificationUtil.publishNotification(notificationRequestUtil.initBasicNotificationRequest(content),
        ID_PICTURE);
}

export default function operationsCoreTest() {
    describe('OperationsCore', () => {
        beforeAll(() => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'OperationsCore beforeAll');
            TITLE_BASIC = getString($r('app.string.basic_notification'));
            TEXT_CONTENT = getString($r('app.string.notification_content'));
            TEXT_ADDITIONAL = getString($r('app.string.notification_additional'));
            TITLE_LONG_TEXT = getString($r('app.string.long_text_notification'));
            TEXT_LONG_TEXT = getString($r('app.string.notification_long_text'));
            TEXT_BRIEF = getString($r('app.string.notification_brief_text'));
            TEXT_EXPANDED = getString($r('app.string.notification_expanded_title'));
            TITLE_MULTILINE = getString($r('app.string.multiline_notification'));
            TITLE_PICTURE = getString($r('app.string.picture_notification'));
            TITLE_BUTTONS = getString($r('app.string.notification_with_buttons'));
            TITLE_FIRST_BUTTON = getString($r('app.string.first_button'));
            TITLE_SECOND_BUTTON = getString($r('app.string.second_button'));
            TITLE_CLICKABLE = getString($r('app.string.clickable_notification'));
        });

        beforeEach(async () => {
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0001
         * @tc.name testOperations0001
         * @tc.desc 构造注入 context 后发布链可观测：首次发布产生全新请求
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0001 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishBasicNotification();
            let arrived: boolean = await waitNewPublished(ID_BASIC, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_BASIC);
            expect(request.id).assertEqual(ID_BASIC);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request !== beforeRef));
            expect(request !== beforeRef).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0002
         * @tc.name testOperations0002
         * @tc.desc 构造注入的 basicContent 三字段来自 string.json 冻结值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0002 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishBasicNotification();
            let arrived: boolean = await waitNewPublished(ID_BASIC, beforeRef);
            expect(arrived).assertTrue();
            let normal: notification.NotificationBasicContent =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .content.normal) as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', normal.title, TITLE_BASIC);
            expect(normal.title).assertEqual(TITLE_BASIC);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', normal.text, TEXT_CONTENT);
            expect(normal.text).assertEqual(TEXT_CONTENT);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', normal.additionalText, TEXT_ADDITIONAL);
            expect(normal.additionalText).assertEqual(TEXT_ADDITIONAL);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0003
         * @tc.name testOperations0003
         * @tc.desc 构造注入的 text 跨发布类型共享：多行通知沿用构造文本、标题按类型覆写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0003 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishMultiLineNotification();
            let arrived: boolean = await waitNewPublished(ID_MULTI_LINE, beforeRef);
            expect(arrived).assertTrue();
            let multiLine: notification.NotificationMultiLineContent =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .content.multiLine) as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', multiLine.text, TEXT_CONTENT);
            expect(multiLine.text).assertEqual(TEXT_CONTENT);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', multiLine.title, TITLE_MULTILINE);
            expect(multiLine.title).assertEqual(TITLE_MULTILINE);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', multiLine.additionalText, TEXT_ADDITIONAL);
            expect(multiLine.additionalText).assertEqual(TEXT_ADDITIONAL);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0004
         * @tc.name testOperations0004
         * @tc.desc 同一实例连续发布两次：两次请求为不同引用、id 恒为 BASIC 冻结值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0004 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishBasicNotification();
            let firstArrived: boolean = await waitNewPublished(ID_BASIC, beforeRef);
            expect(firstArrived).assertTrue();
            let firstRef: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            operations.publishBasicNotification();
            let secondArrived: boolean = await waitNewPublished(ID_BASIC, firstRef);
            expect(secondArrived).assertTrue();
            let secondRef: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(secondRef !== firstRef));
            expect(secondRef !== firstRef).assertTrue();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', secondRef.id, ID_BASIC);
            expect(secondRef.id).assertEqual(ID_BASIC);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0005
         * @tc.name testOperations0005
         * @tc.desc 基本类型发布：请求 id 为 BASIC 冻结值且槽位意图同时组装
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0005 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishBasicNotification();
            let arrived: boolean = await waitNewPublished(ID_BASIC, beforeRef);
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_BASIC);
            expect(request.id).assertEqual(ID_BASIC);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot !== undefined));
            expect(slot !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0006
         * @tc.name testOperations0006
         * @tc.desc 基本类型发布：内容类型为 BASIC_TEXT 规格常量
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0006 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishBasicNotification();
            let arrived: boolean = await waitNewPublished(ID_BASIC, beforeRef);
            expect(arrived).assertTrue();
            let contentType: notification.ContentType =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .content.notificationContentType) as notification.ContentType;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                contentType, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(contentType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                (notificationUtil.getLastPublishedRequest() as notification.NotificationRequest).notificationSlotType,
                notification.SlotType.CONTENT_INFORMATION);
            expect((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                .notificationSlotType)
                .assertEqual(notification.SlotType.CONTENT_INFORMATION);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0007
         * @tc.name testOperations0007
         * @tc.desc 基本类型发布：槽位意图为 CONTENT_INFORMATION 与 LEVEL_DEFAULT
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0007 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishBasicNotification();
            let arrived: boolean = await waitNewPublished(ID_BASIC, beforeRef);
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            let slotType: notification.SlotType = (slot.notificationType) as notification.SlotType;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                slotType, notification.SlotType.CONTENT_INFORMATION);
            expect(slotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            let slotLevel: notification.SlotLevel = (slot.notificationLevel) as notification.SlotLevel;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                slotLevel, notification.SlotLevel.LEVEL_DEFAULT);
            expect(slotLevel).assertEqual(notification.SlotLevel.LEVEL_DEFAULT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0008
         * @tc.name testOperations0008
         * @tc.desc 默认开关全关：槽位意图不含声音与振动字段
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0008 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishBasicNotification();
            let arrived: boolean = await waitNewPublished(ID_BASIC, beforeRef);
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.sound === undefined));
            expect(slot.sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationEnabled === undefined));
            expect(slot.vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot.vibrationValues === undefined));
            expect(slot.vibrationValues === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0009
         * @tc.name testOperations0009
         * @tc.desc 长文本发布：请求 id 为 LONG_TEXT 冻结值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0009 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishLongTextNotification();
            let arrived: boolean = await waitNewPublished(ID_LONG_TEXT, beforeRef);
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_LONG_TEXT);
            expect(request.id).assertEqual(ID_LONG_TEXT);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot !== undefined));
            expect(slot !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0010
         * @tc.name testOperations0010
         * @tc.desc 长文本发布：longText 与 title 均为冻结值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0010 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishLongTextNotification();
            let arrived: boolean = await waitNewPublished(ID_LONG_TEXT, beforeRef);
            expect(arrived).assertTrue();
            let longText: notification.NotificationLongTextContent =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .content.longText) as notification.NotificationLongTextContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', longText.longText, TEXT_LONG_TEXT);
            expect(longText.longText).assertEqual(TEXT_LONG_TEXT);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', longText.title, TITLE_LONG_TEXT);
            expect(longText.title).assertEqual(TITLE_LONG_TEXT);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', longText.text, TEXT_CONTENT);
            expect(longText.text).assertEqual(TEXT_CONTENT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0011
         * @tc.name testOperations0011
         * @tc.desc 长文本发布：briefText 与 expandedTitle 为冻结值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0011 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishLongTextNotification();
            let arrived: boolean = await waitNewPublished(ID_LONG_TEXT, beforeRef);
            expect(arrived).assertTrue();
            let longText: notification.NotificationLongTextContent =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .content.longText) as notification.NotificationLongTextContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', longText.briefText, TEXT_BRIEF);
            expect(longText.briefText).assertEqual(TEXT_BRIEF);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', longText.expandedTitle, TEXT_EXPANDED);
            expect(longText.expandedTitle).assertEqual(TEXT_EXPANDED);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', longText.additionalText, TEXT_ADDITIONAL);
            expect(longText.additionalText).assertEqual(TEXT_ADDITIONAL);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0012
         * @tc.name testOperations0012
         * @tc.desc 长文本发布：内容类型为 LONG_TEXT 规格常量
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0012 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishLongTextNotification();
            let arrived: boolean = await waitNewPublished(ID_LONG_TEXT, beforeRef);
            expect(arrived).assertTrue();
            let contentType: notification.ContentType =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .content.notificationContentType) as notification.ContentType;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                contentType, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(contentType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_LONG_TEXT);
            expect(request.id).assertEqual(ID_LONG_TEXT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0013
         * @tc.name testOperations0013
         * @tc.desc 多行文本发布：请求 id 为 MULTI_LINE 冻结值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0013 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishMultiLineNotification();
            let arrived: boolean = await waitNewPublished(ID_MULTI_LINE, beforeRef);
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_MULTI_LINE);
            expect(request.id).assertEqual(ID_MULTI_LINE);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot !== undefined));
            expect(slot !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0014
         * @tc.name testOperations0014
         * @tc.desc 多行文本发布：内容类型为 MULTILINE 规格常量
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0014 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishMultiLineNotification();
            let arrived: boolean = await waitNewPublished(ID_MULTI_LINE, beforeRef);
            expect(arrived).assertTrue();
            let contentType: notification.ContentType =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .content.notificationContentType) as notification.ContentType;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                contentType, notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            expect(contentType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_MULTI_LINE);
            expect(request.id).assertEqual(ID_MULTI_LINE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0015
         * @tc.name testOperations0015
         * @tc.desc 多行文本发布：行数为 MULTI_LINE_CONTENT 冻结长度 4
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0015 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishMultiLineNotification();
            let arrived: boolean = await waitNewPublished(ID_MULTI_LINE, beforeRef);
            expect(arrived).assertTrue();
            let multiLine: notification.NotificationMultiLineContent =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .content.multiLine) as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', multiLine.lines.length, 4);
            expect(multiLine.lines.length).assertEqual(4);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', multiLine.lines[0].length, 'line0'.length);
            expect(multiLine.lines[0].length).assertEqual('line0'.length);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0016
         * @tc.name testOperations0016
         * @tc.desc 多行文本发布：四行内容逐行为冻结数据表基线
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0016 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishMultiLineNotification();
            let arrived: boolean = await waitNewPublished(ID_MULTI_LINE, beforeRef);
            expect(arrived).assertTrue();
            let multiLine: notification.NotificationMultiLineContent =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .content.multiLine) as notification.NotificationMultiLineContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', multiLine.lines[0], 'line0');
            expect(multiLine.lines[0]).assertEqual('line0');
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', multiLine.lines[3], 'line3');
            expect(multiLine.lines[3]).assertEqual('line3');
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', multiLine.briefText, TEXT_BRIEF);
            expect(multiLine.briefText).assertEqual(TEXT_BRIEF);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0016 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0017
         * @tc.name testOperations0017
         * @tc.desc 图片发布：自建像素图走发布链后请求 id 为 PICTURE 冻结值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0017 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await publishPictureContent();
            let arrived: boolean = await waitNewPublished(ID_PICTURE, beforeRef);
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_PICTURE);
            expect(request.id).assertEqual(ID_PICTURE);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot !== undefined));
            expect(slot !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0017 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0018
         * @tc.name testOperations0018
         * @tc.desc 图片发布：内容类型为 PICTURE 规格常量且图片像素图就位
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0018 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await publishPictureContent();
            let arrived: boolean = await waitNewPublished(ID_PICTURE, beforeRef);
            expect(arrived).assertTrue();
            let contentType: notification.ContentType =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .content.notificationContentType) as notification.ContentType;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                contentType, notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            expect(contentType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            let picture: notification.NotificationPictureContent =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .content.picture) as notification.NotificationPictureContent;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(picture.picture !== undefined));
            expect(picture.picture !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0018 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0019
         * @tc.name testOperations0019
         * @tc.desc 图片发布：briefText 为冻结值、标题按图片类型覆写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0019 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await publishPictureContent();
            let arrived: boolean = await waitNewPublished(ID_PICTURE, beforeRef);
            expect(arrived).assertTrue();
            let picture: notification.NotificationPictureContent =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .content.picture) as notification.NotificationPictureContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', picture.briefText, TEXT_BRIEF);
            expect(picture.briefText).assertEqual(TEXT_BRIEF);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', picture.title, TITLE_PICTURE);
            expect(picture.title).assertEqual(TITLE_PICTURE);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', picture.expandedTitle, TEXT_EXPANDED);
            expect(picture.expandedTitle).assertEqual(TEXT_EXPANDED);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0019 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0020
         * @tc.name testOperations0020
         * @tc.desc 按钮发布：请求 id 为 BUTTON 冻结值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0020 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await operations.publishNotificationWithButtons();
            let arrived: boolean = await waitNewPublished(ID_BUTTON, beforeRef);
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_BUTTON);
            expect(request.id).assertEqual(ID_BUTTON);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot !== undefined));
            expect(slot !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0020 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0021
         * @tc.name testOperations0021
         * @tc.desc 按钮发布：动作按钮恰为两个（接口上限）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0021 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await operations.publishNotificationWithButtons();
            let arrived: boolean = await waitNewPublished(ID_BUTTON, beforeRef);
            expect(arrived).assertTrue();
            let actionButtons: notification.NotificationActionButton[] =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .actionButtons) as notification.NotificationActionButton[];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actionButtons.length, 2);
            expect(actionButtons.length).assertEqual(2);
            let normal: notification.NotificationBasicContent =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .content.normal) as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', normal.title, TITLE_BUTTONS);
            expect(normal.title).assertEqual(TITLE_BUTTONS);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0021 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0022
         * @tc.name testOperations0022
         * @tc.desc 按钮发布：两枚按钮标题均为冻结值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0022 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await operations.publishNotificationWithButtons();
            let arrived: boolean = await waitNewPublished(ID_BUTTON, beforeRef);
            expect(arrived).assertTrue();
            let actionButtons: notification.NotificationActionButton[] =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .actionButtons) as notification.NotificationActionButton[];
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actionButtons[0].title,
                TITLE_FIRST_BUTTON);
            expect(actionButtons[0].title).assertEqual(TITLE_FIRST_BUTTON);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actionButtons[1].title,
                TITLE_SECOND_BUTTON);
            expect(actionButtons[1].title).assertEqual(TITLE_SECOND_BUTTON);
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_BUTTON);
            expect(request.id).assertEqual(ID_BUTTON);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0022 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0023
         * @tc.name testOperations0023
         * @tc.desc 按钮发布：两枚按钮均携带非空 wantAgent
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0023 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await operations.publishNotificationWithButtons();
            let arrived: boolean = await waitNewPublished(ID_BUTTON, beforeRef);
            expect(arrived).assertTrue();
            let actionButtons: notification.NotificationActionButton[] =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .actionButtons) as notification.NotificationActionButton[];
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(actionButtons[0].wantAgent !== undefined));
            expect(actionButtons[0].wantAgent !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(actionButtons[1].wantAgent !== undefined));
            expect(actionButtons[1].wantAgent !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0023 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0024
         * @tc.name testOperations0024
         * @tc.desc 点击跳转发布：请求 id 为 WANTAGENT 冻结值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testOperations0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0024 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await operations.publishNotificationWithWantAgent();
            let arrived: boolean = await waitNewPublished(ID_WANTAGENT, beforeRef);
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_WANTAGENT);
            expect(request.id).assertEqual(ID_WANTAGENT);
            let slot: notification.NotificationSlot | undefined = notificationUtil.getLastNotificationSlot();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(slot !== undefined));
            expect(slot !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0024 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0025
         * @tc.name testOperations0025
         * @tc.desc 点击跳转发布：请求携带非空 wantAgent 且内容类型为 BASIC_TEXT
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0025 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await operations.publishNotificationWithWantAgent();
            let arrived: boolean = await waitNewPublished(ID_WANTAGENT, beforeRef);
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request.wantAgent !== undefined));
            expect(request.wantAgent !== undefined).assertTrue();
            let contentType: notification.ContentType =
                (request.content.notificationContentType) as notification.ContentType;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                contentType, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(contentType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0025 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0026
         * @tc.name testOperations0026
         * @tc.desc 点击跳转发布：标题按可点击类型覆写为冻结值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0026 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await operations.publishNotificationWithWantAgent();
            let arrived: boolean = await waitNewPublished(ID_WANTAGENT, beforeRef);
            expect(arrived).assertTrue();
            let normal: notification.NotificationBasicContent =
                ((notificationUtil.getLastPublishedRequest() as notification.NotificationRequest)
                    .content.normal) as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', normal.title, TITLE_CLICKABLE);
            expect(normal.title).assertEqual(TITLE_CLICKABLE);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', normal.text, TEXT_CONTENT);
            expect(normal.text).assertEqual(TEXT_CONTENT);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', normal.additionalText, TEXT_ADDITIONAL);
            expect(normal.additionalText).assertEqual(TEXT_ADDITIONAL);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0026 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0027
         * @tc.name testOperations0027
         * @tc.desc 点击跳转发布：槽位意图类型为 CONTENT_INFORMATION
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testOperations0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0027 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await operations.publishNotificationWithWantAgent();
            let arrived: boolean = await waitNewPublished(ID_WANTAGENT, beforeRef);
            expect(arrived).assertTrue();
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            let slotType: notification.SlotType = (slot.notificationType) as notification.SlotType;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                slotType, notification.SlotType.CONTENT_INFORMATION);
            expect(slotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.notificationSlotType,
                notification.SlotType.CONTENT_INFORMATION);
            expect(request.notificationSlotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0027 end');
        });

        /**
         * @tc.number SUB_CustomNotification_OPERATIONS_0028
         * @tc.name testOperations0028
         * @tc.desc 组合状态：六种发布依序一轮后观测点指向末位 WANTAGENT 请求（图片步骤为自建像素图）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testOperations0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0028 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishBasicNotification();
            let step1: boolean = await waitNewPublished(ID_BASIC, beforeRef);
            expect(step1).assertTrue();
            let afterBasic: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            operations.publishLongTextNotification();
            let step2: boolean = await waitNewPublished(ID_LONG_TEXT, afterBasic);
            expect(step2).assertTrue();
            let afterLongText: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            operations.publishMultiLineNotification();
            let step3: boolean = await waitNewPublished(ID_MULTI_LINE, afterLongText);
            expect(step3).assertTrue();
            let afterMultiLine: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            await publishPictureContent();
            let step4: boolean = await waitNewPublished(ID_PICTURE, afterMultiLine);
            expect(step4).assertTrue();
            let afterPicture: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            await operations.publishNotificationWithButtons();
            let step5: boolean = await waitNewPublished(ID_BUTTON, afterPicture);
            expect(step5).assertTrue();
            let afterButtons: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            await operations.publishNotificationWithWantAgent();
            let step6: boolean = await waitNewPublished(ID_WANTAGENT, afterButtons);
            expect(step6).assertTrue();
            let finalRequest: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', finalRequest.id, ID_WANTAGENT);
            expect(finalRequest.id).assertEqual(ID_WANTAGENT);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(finalRequest !== afterButtons));
            expect(finalRequest !== afterButtons).assertTrue();
            let contentType: notification.ContentType =
                (finalRequest.content.notificationContentType) as notification.ContentType;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                contentType, notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            expect(contentType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testOperations0028 end');
        });
    });
}
