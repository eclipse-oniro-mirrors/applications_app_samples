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

// notificationRequestUtil 三个构造器 × 按钮数档位 × 内容类型。
// 期望值来源：Spec 常量（id 固定 1、slotType 固定 CONTENT_INFORMATION、最多 2 个按钮）。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { image } from '@kit.ImageKit';
import { wantAgent, WantAgent } from '@kit.AbilityKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationContentUtil, notificationRequestUtil, wantAgentUtil } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';
const BUNDLE_NAME: string = 'ohos.samples.customnotification';
const ABILITY_NAME: string = 'MainAbility';

async function createAgent(): Promise<WantAgent> {
    return await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME);
}

function buildButtons(count: number, agent: WantAgent): notification.NotificationActionButton[] {
    let buttons: notification.NotificationActionButton[] = [];
    for (let i: number = 0; i < count; i++) {
        buttons.push({ title: 'btn-' + i, wantAgent: agent });
    }
    return buttons;
}

function buildContentOfType(typeId: number): notification.NotificationContent {
    let basic: notification.NotificationBasicContent = { title: 'title', text: 'text' };
    if (typeId === notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT) {
        return notificationContentUtil.initNotificationLongTextContent(basic, 'long', 'brief', 'expanded');
    }
    if (typeId === notification.ContentType.NOTIFICATION_CONTENT_MULTILINE) {
        return notificationContentUtil.initNotificationMultiLineContent(basic, 'brief', 'longTitle',
            ['line-0', 'line-1']);
    }
    if (typeId === notification.ContentType.NOTIFICATION_CONTENT_PICTURE) {
        return notificationContentUtil.initNotificationPictureContent(basic, 'brief', 'expanded',
            image.createPixelMapSync({ size: { width: 1, height: 1 } }));
    }
    if (typeId === notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION ||
        typeId === notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW) {
        let content: notification.NotificationContent = {
            notificationContentType: typeId as notification.ContentType,
            normal: basic
        };
        return content;
    }
    return notificationContentUtil.initBasicNotificationContent(basic);
}

export default function requestVolume01Test() {
    describe('RequestVolume01', () => {
    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0001
     * @tc.name testVRequest0001
     * @tc.desc 0 个按钮（下边界）不截断，返回空按钮列表
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testVRequest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0001 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(0, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(0));
      expect(actionButtons.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons.length), String(0));
      expect(buttons.length).assertEqual(0);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0001 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0002
     * @tc.name testVRequest0002
     * @tc.desc 按钮数 1 档：返回 1 个，入参剩余 1 个
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0002 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(1, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(1));
      expect(actionButtons.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons.length), String(1));
      expect(buttons.length).assertEqual(1);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0002 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0003
     * @tc.name testVRequest0003
     * @tc.desc 按钮数 2 档：返回 2 个，入参剩余 2 个
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0003 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(2, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(2));
      expect(actionButtons.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons.length), String(2));
      expect(buttons.length).assertEqual(2);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0003 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0004
     * @tc.name testVRequest0004
     * @tc.desc 按钮数 3 档：返回前 2 个，入参 3 个不被修改
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0004 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(3, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(2));
      expect(actionButtons.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons.length), String(3));
      expect(buttons.length).assertEqual(3);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0004 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0005
     * @tc.name testVRequest0005
     * @tc.desc 按钮数 4 档：返回前 2 个，入参 4 个不被修改
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0005 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(4, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(2));
      expect(actionButtons.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons.length), String(4));
      expect(buttons.length).assertEqual(4);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0005 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0006
     * @tc.name testVRequest0006
     * @tc.desc 按钮数 5 档：返回前 2 个，入参 5 个不被修改
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0006 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(5, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(2));
      expect(actionButtons.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons.length), String(5));
      expect(buttons.length).assertEqual(5);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0006 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0007
     * @tc.name testVRequest0007
     * @tc.desc 按钮数 6 档：返回前 2 个，入参 6 个不被修改
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0007 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(6, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(2));
      expect(actionButtons.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons.length), String(6));
      expect(buttons.length).assertEqual(6);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0007 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0008
     * @tc.name testVRequest0008
     * @tc.desc 按钮数 7 档：返回前 2 个，入参 7 个不被修改
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0008 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(7, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(2));
      expect(actionButtons.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons.length), String(7));
      expect(buttons.length).assertEqual(7);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0008 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0009
     * @tc.name testVRequest0009
     * @tc.desc 按钮数 8 档：返回前 2 个，入参 8 个不被修改
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0009 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(8, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(2));
      expect(actionButtons.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons.length), String(8));
      expect(buttons.length).assertEqual(8);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0009 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0010
     * @tc.name testVRequest0010
     * @tc.desc 按钮数 9 档：返回前 2 个，入参 9 个不被修改
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0010 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(9, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(2));
      expect(actionButtons.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons.length), String(9));
      expect(buttons.length).assertEqual(9);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0010 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0011
     * @tc.name testVRequest0011
     * @tc.desc 按钮数 10 档：返回前 2 个，入参 10 个不被修改
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0011 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(10, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(2));
      expect(actionButtons.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons.length), String(10));
      expect(buttons.length).assertEqual(10);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0011 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0012
     * @tc.name testVRequest0012
     * @tc.desc 按钮数 11 档：返回前 2 个，入参 11 个不被修改
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0012 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(11, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(2));
      expect(actionButtons.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons.length), String(11));
      expect(buttons.length).assertEqual(11);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0012 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0013
     * @tc.name testVRequest0013
     * @tc.desc 按钮数 12 档：返回前 2 个，入参 12 个不被修改
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0013 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(12, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(2));
      expect(actionButtons.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons.length), String(12));
      expect(buttons.length).assertEqual(12);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0013 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0014
     * @tc.name testVRequest0014
     * @tc.desc initBasicNotificationRequest 保留内容类型 NOTIFICATION_CONTENT_BASIC_TEXT
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0014 begin');
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      let slotType: number = request.notificationSlotType as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(slotType),
          String(notification.SlotType.CONTENT_INFORMATION));
      expect(slotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0014 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0015
     * @tc.name testVRequest0015
     * @tc.desc initBasicNotificationRequest 保留内容类型 NOTIFICATION_CONTENT_LONG_TEXT
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0015 begin');
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let request: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      let slotType: number = request.notificationSlotType as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(slotType),
          String(notification.SlotType.CONTENT_INFORMATION));
      expect(slotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0015 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0016
     * @tc.name testVRequest0016
     * @tc.desc initBasicNotificationRequest 保留内容类型 NOTIFICATION_CONTENT_PICTURE
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0016 begin');
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let request: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      let slotType: number = request.notificationSlotType as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(slotType),
          String(notification.SlotType.CONTENT_INFORMATION));
      expect(slotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0016 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0017
     * @tc.name testVRequest0017
     * @tc.desc initBasicNotificationRequest 保留内容类型 NOTIFICATION_CONTENT_CONVERSATION
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0017 begin');
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
      let request: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      let slotType: number = request.notificationSlotType as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(slotType),
          String(notification.SlotType.CONTENT_INFORMATION));
      expect(slotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0017 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0018
     * @tc.name testVRequest0018
     * @tc.desc initBasicNotificationRequest 保留内容类型 NOTIFICATION_CONTENT_MULTILINE
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0018 begin');
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let request: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      let slotType: number = request.notificationSlotType as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(slotType),
          String(notification.SlotType.CONTENT_INFORMATION));
      expect(slotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0018 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0019
     * @tc.name testVRequest0019
     * @tc.desc initBasicNotificationRequest 保留内容类型 NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0019 begin');
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
      let request: notification.NotificationRequest = notificationRequestUtil.initBasicNotificationRequest(content);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      let slotType: number = request.notificationSlotType as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(slotType),
          String(notification.SlotType.CONTENT_INFORMATION));
      expect(slotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0019 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0020
     * @tc.name testVRequest0020
     * @tc.desc initWantAgentNotificationRequest 保留内容类型与 agent（NOTIFICATION_CONTENT_BASIC_TEXT）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0020 begin');
      let agent: WantAgent = await createAgent();
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initWantAgentNotificationRequest(content, agent);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let actualAgent: WantAgent = request.wantAgent as WantAgent;
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(actualAgent === agent));
      expect(actualAgent === agent).assertTrue();
      let operationType: number = await wantAgent.getOperationType(actualAgent);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(operationType),
          String(wantAgent.OperationType.START_ABILITY));
      expect(operationType).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0020 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0021
     * @tc.name testVRequest0021
     * @tc.desc initWantAgentNotificationRequest 保留内容类型与 agent（NOTIFICATION_CONTENT_LONG_TEXT）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0021 begin');
      let agent: WantAgent = await createAgent();
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initWantAgentNotificationRequest(content, agent);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let actualAgent: WantAgent = request.wantAgent as WantAgent;
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(actualAgent === agent));
      expect(actualAgent === agent).assertTrue();
      let operationType: number = await wantAgent.getOperationType(actualAgent);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(operationType),
          String(wantAgent.OperationType.START_ABILITY));
      expect(operationType).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0021 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0022
     * @tc.name testVRequest0022
     * @tc.desc initWantAgentNotificationRequest 保留内容类型与 agent（NOTIFICATION_CONTENT_PICTURE）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0022 begin');
      let agent: WantAgent = await createAgent();
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initWantAgentNotificationRequest(content, agent);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let actualAgent: WantAgent = request.wantAgent as WantAgent;
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(actualAgent === agent));
      expect(actualAgent === agent).assertTrue();
      let operationType: number = await wantAgent.getOperationType(actualAgent);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(operationType),
          String(wantAgent.OperationType.START_ABILITY));
      expect(operationType).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0022 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0023
     * @tc.name testVRequest0023
     * @tc.desc initWantAgentNotificationRequest 保留内容类型与 agent（NOTIFICATION_CONTENT_CONVERSATION）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0023 begin');
      let agent: WantAgent = await createAgent();
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initWantAgentNotificationRequest(content, agent);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
      let actualAgent: WantAgent = request.wantAgent as WantAgent;
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(actualAgent === agent));
      expect(actualAgent === agent).assertTrue();
      let operationType: number = await wantAgent.getOperationType(actualAgent);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(operationType),
          String(wantAgent.OperationType.START_ABILITY));
      expect(operationType).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0023 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0024
     * @tc.name testVRequest0024
     * @tc.desc initWantAgentNotificationRequest 保留内容类型与 agent（NOTIFICATION_CONTENT_MULTILINE）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0024 begin');
      let agent: WantAgent = await createAgent();
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initWantAgentNotificationRequest(content, agent);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let actualAgent: WantAgent = request.wantAgent as WantAgent;
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(actualAgent === agent));
      expect(actualAgent === agent).assertTrue();
      let operationType: number = await wantAgent.getOperationType(actualAgent);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(operationType),
          String(wantAgent.OperationType.START_ABILITY));
      expect(operationType).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0024 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0025
     * @tc.name testVRequest0025
     * @tc.desc initWantAgentNotificationRequest 保留内容类型与 agent（NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0025 begin');
      let agent: WantAgent = await createAgent();
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initWantAgentNotificationRequest(content, agent);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
      let actualAgent: WantAgent = request.wantAgent as WantAgent;
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(actualAgent === agent));
      expect(actualAgent === agent).assertTrue();
      let operationType: number = await wantAgent.getOperationType(actualAgent);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(operationType),
          String(wantAgent.OperationType.START_ABILITY));
      expect(operationType).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0025 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0026
     * @tc.name testVRequest0026
     * @tc.desc initButtonNotificationRequest 单按钮下与内容类型无关（NOTIFICATION_CONTENT_BASIC_TEXT）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0026 begin');
      let agent: WantAgent = await createAgent();
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let buttons: notification.NotificationActionButton[] = buildButtons(1, agent);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(1));
      expect(actionButtons.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request.content === content));
      expect(request.content === content).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0026 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0027
     * @tc.name testVRequest0027
     * @tc.desc initButtonNotificationRequest 单按钮下与内容类型无关（NOTIFICATION_CONTENT_LONG_TEXT）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0027 begin');
      let agent: WantAgent = await createAgent();
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let buttons: notification.NotificationActionButton[] = buildButtons(1, agent);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(1));
      expect(actionButtons.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request.content === content));
      expect(request.content === content).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0027 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0028
     * @tc.name testVRequest0028
     * @tc.desc initButtonNotificationRequest 单按钮下与内容类型无关（NOTIFICATION_CONTENT_PICTURE）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0028 begin');
      let agent: WantAgent = await createAgent();
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let buttons: notification.NotificationActionButton[] = buildButtons(1, agent);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_PICTURE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(1));
      expect(actionButtons.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request.content === content));
      expect(request.content === content).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0028 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0029
     * @tc.name testVRequest0029
     * @tc.desc initButtonNotificationRequest 单按钮下与内容类型无关（NOTIFICATION_CONTENT_CONVERSATION）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0029 begin');
      let agent: WantAgent = await createAgent();
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
      let buttons: notification.NotificationActionButton[] = buildButtons(1, agent);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(1));
      expect(actionButtons.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request.content === content));
      expect(request.content === content).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0029 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0030
     * @tc.name testVRequest0030
     * @tc.desc initButtonNotificationRequest 单按钮下与内容类型无关（NOTIFICATION_CONTENT_MULTILINE）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0030 begin');
      let agent: WantAgent = await createAgent();
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let buttons: notification.NotificationActionButton[] = buildButtons(1, agent);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(1));
      expect(actionButtons.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request.content === content));
      expect(request.content === content).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0030 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_0031
     * @tc.name testVRequest0031
     * @tc.desc initButtonNotificationRequest 单按钮下与内容类型无关（NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0031 begin');
      let agent: WantAgent = await createAgent();
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
      let buttons: notification.NotificationActionButton[] = buildButtons(1, agent);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actualType: number = notificationContentUtil.getContentTypeId(request.content);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actualType),
          String(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW));
      expect(actualType).assertEqual(notification.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(1));
      expect(actionButtons.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request.content === content));
      expect(request.content === content).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequest0031 end');
    });

    });
}
