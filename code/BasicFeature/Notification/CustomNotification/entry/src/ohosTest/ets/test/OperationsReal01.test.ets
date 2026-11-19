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

// 发布入口的边界（异步最重路径的开关联动）、主流程、竞态收敛、
// 开关状态切换与按钮链跨调用场景。期望值来源：状态推演 + 冻结常量。
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

const ID_BASIC: number = 1;
const ID_LONG_TEXT: number = 2;
const ID_PICTURE: number = 4;
const ID_BUTTON: number = 5;
const ID_WANTAGENT: number = 6;
const SOUND_PATH: string = 'file:///system/etc/capture.ogg';
// 与 main 同名同值的资源，按设备语言取值：写死英文会在中文设备上恒失败
let TITLE_BUTTONS: string = '';

async function sleep(ms: number): Promise<void> {
    return new Promise<void>((resolve: () => void) => setTimeout(resolve, ms));
}

async function waitNewPublished(id: number, beforeRef: notification.NotificationRequest | undefined,
    timeoutMs: number = 5000): Promise<boolean> {
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
        title: getString($r('app.string.picture_notification')),
        text: getString($r('app.string.notification_content')),
        additionalText: getString($r('app.string.notification_additional'))
    };
    let pixelMap: image.PixelMap = image.createPixelMapSync({ size: { width: 1, height: 1 } });
    let content: notification.NotificationContent = notificationContentUtil.initNotificationPictureContent(basic,
        getString($r('app.string.notification_brief_text')),
        getString($r('app.string.notification_expanded_title')), pixelMap);
    await notificationUtil.publishNotification(notificationRequestUtil.initBasicNotificationRequest(content),
        ID_PICTURE);
}

export default function operationsReal01Test() {
    describe('OperationsReal01', () => {
        beforeAll(() => {
            TITLE_BUTTONS = getString($r('app.string.notification_with_buttons'));
        });

        beforeEach(async () => {
            notificationUtil.promptTone(false);
            notificationUtil.vibrationEffect(false);
            await notificationUtil.cancelAllNotifications();
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_REAL_0001
         * @tc.name testVOperationsReal0001
         * @tc.desc 振动开启下走异步最重路径（图片发布）：振动档 200 与图片意图同时成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVOperationsReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperationsReal0001 begin');
            notificationUtil.vibrationEffect(true);
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await publishPictureContent();
            let arrived: boolean = await waitNewPublished(ID_PICTURE, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_PICTURE);
            expect(request.id).assertEqual(ID_PICTURE);
            let contentType: notification.ContentType =
                (request.content.notificationContentType) as notification.ContentType;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                contentType, notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            expect(contentType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
            let slot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            let vibrationValues: number[] = (slot.vibrationValues) as number[];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', vibrationValues[0], 200);
            expect(vibrationValues[0]).assertEqual(200);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperationsReal0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_REAL_0002
         * @tc.name testVOperationsReal0002
         * @tc.desc 主流程：点击跳转发布请求携带非空 wantAgent 与冻结 id
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testVOperationsReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperationsReal0002 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await operations.publishNotificationWithWantAgent();
            let arrived: boolean = await waitNewPublished(ID_WANTAGENT, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_WANTAGENT);
            expect(request.id).assertEqual(ID_WANTAGENT);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request.wantAgent !== undefined));
            expect(request.wantAgent !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.notificationSlotType,
                notification.SlotType.CONTENT_INFORMATION);
            expect(request.notificationSlotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperationsReal0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_REAL_0003
         * @tc.name testVOperationsReal0003
         * @tc.desc 连续发布：先基础后长文本依次到达，观测点指向末位长文本请求
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testVOperationsReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperationsReal0003 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishBasicNotification();
            let firstArrived: boolean = await waitNewPublished(ID_BASIC, beforeRef);
            expect(firstArrived).assertTrue();
            let afterBasic: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            operations.publishLongTextNotification();
            let arrived: boolean = await waitNewPublished(ID_LONG_TEXT, afterBasic);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_LONG_TEXT);
            expect(request.id).assertEqual(ID_LONG_TEXT);
            let contentType: notification.ContentType =
                (request.content.notificationContentType) as notification.ContentType;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                contentType, notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(contentType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperationsReal0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_REAL_0004
         * @tc.name testVOperationsReal0004
         * @tc.desc 状态切换：提示音先开后关，末次发布槽位意图不含声音字段
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVOperationsReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperationsReal0004 begin');
            notificationUtil.promptTone(true);
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            operations.publishBasicNotification();
            let firstArrived: boolean = await waitNewPublished(ID_BASIC, beforeRef);
            expect(firstArrived).assertTrue();
            let firstSlot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', firstSlot.sound, SOUND_PATH);
            expect(firstSlot.sound).assertEqual(SOUND_PATH);
            notificationUtil.promptTone(false);
            let afterFirst: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            operations.publishBasicNotification();
            let secondArrived: boolean = await waitNewPublished(ID_BASIC, afterFirst);
            expect(secondArrived).assertTrue();
            let secondSlot: notification.NotificationSlot =
                notificationUtil.getLastNotificationSlot() as notification.NotificationSlot;
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(secondSlot.sound === undefined));
            expect(secondSlot.sound === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true',
                String(secondSlot.vibrationEnabled === undefined));
            expect(secondSlot.vibrationEnabled === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperationsReal0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_VOPERATIONS_REAL_0005
         * @tc.name testVOperationsReal0005
         * @tc.desc showcase：按钮发布链携带两枚带 wantAgent 的按钮与冻结标题
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testVOperationsReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperationsReal0005 begin');
            let beforeRef: notification.NotificationRequest | undefined = notificationUtil.getLastPublishedRequest();
            await operations.publishNotificationWithButtons();
            let arrived: boolean = await waitNewPublished(ID_BUTTON, beforeRef);
            hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(arrived));
            expect(arrived).assertTrue();
            let request: notification.NotificationRequest =
                notificationUtil.getLastPublishedRequest() as notification.NotificationRequest;
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', request.id, ID_BUTTON);
            expect(request.id).assertEqual(ID_BUTTON);
            let actionButtons: notification.NotificationActionButton[] =
                (request.actionButtons) as notification.NotificationActionButton[];
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actionButtons.length, 2);
            expect(actionButtons.length).assertEqual(2);
            let normal: notification.NotificationBasicContent =
                (request.content.normal) as notification.NotificationBasicContent;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', normal.title, TITLE_BUTTONS);
            expect(normal.title).assertEqual(TITLE_BUTTONS);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVOperationsReal0005 end');
        });
    });
}
