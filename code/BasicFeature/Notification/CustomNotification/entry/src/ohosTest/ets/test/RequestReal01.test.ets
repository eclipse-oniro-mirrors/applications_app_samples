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

// 请求域截断边界、入参保持与引用语义。
// 期望值来源：main 修复后语义（slice 不破坏入参）+ 引用传递推演。
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
    return notificationContentUtil.initNotificationMultiLineContent(basic, 'brief', 'longTitle', ['line-0', 'line-1']);
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

export default function requestReal01Test() {
  describe('RequestReal01', () => {
    /**
     * @tc.number SUB_CustomNotification_VREQUEST_REAL_0001
     * @tc.name testVRequestReal0001
     * @tc.desc 3 个按钮触发截断，入参数组保持 3 个（slice 修复回归）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testVRequestReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequestReal0001 begin');
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
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons[1].title), String('btn-1'));
      expect(actionButtons[1].title).assertEqual('btn-1');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons[0].title), String('btn-0'));
      expect(buttons[0].title).assertEqual('btn-0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequestReal0001 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_REAL_0002
     * @tc.name testVRequestReal0002
     * @tc.desc 0 个按钮返回空列表且内容对象按引用透传
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testVRequestReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequestReal0002 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(0, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(0));
      expect(actionButtons.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request.content === content));
      expect(request.content === content).assertTrue();
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequestReal0002 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_REAL_0003
     * @tc.name testVRequestReal0003
     * @tc.desc 12 个按钮只保留前两个，入参保持 12 个（slice 修复回归）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testVRequestReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequestReal0003 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(12, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(2));
      expect(actionButtons.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons.length), String(12));
      expect(buttons.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(buttons[0].title), String('btn-0'));
      expect(buttons[0].title).assertEqual('btn-0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequestReal0003 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_REAL_0004
     * @tc.name testVRequestReal0004
     * @tc.desc WantAgent 请求保留 agent 引用且 operationType 为 START_ABILITY
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testVRequestReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequestReal0004 begin');
      let agent: WantAgent = await createAgent();
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_PICTURE);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initWantAgentNotificationRequest(content, agent);
      let actualAgent: WantAgent = request.wantAgent as WantAgent;
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(actualAgent === agent));
      expect(actualAgent === agent).assertTrue();
      let operationType: number = await wantAgent.getOperationType(actualAgent);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(operationType),
          String(wantAgent.OperationType.START_ABILITY));
      expect(operationType).assertEqual(wantAgent.OperationType.START_ABILITY);
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(request.content === content));
      expect(request.content === content).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequestReal0004 end');
    });

    /**
     * @tc.number SUB_CustomNotification_VREQUEST_REAL_0005
     * @tc.name testVRequestReal0005
     * @tc.desc 恰好 2 个按钮不触发截断，返回与入参同引用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVRequestReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequestReal0005 begin');
      let agent: WantAgent = await createAgent();
      let buttons: notification.NotificationActionButton[] = buildButtons(2, agent);
      let content: notification.NotificationContent =
          buildContentOfType(notification.ContentType.NOTIFICATION_CONTENT_CONVERSATION);
      let request: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(content, buttons);
      let actionButtons: notification.NotificationActionButton[] =
          request.actionButtons as notification.NotificationActionButton[];
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actionButtons.length), String(2));
      expect(actionButtons.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'condition=%{public}s, expected=true', String(actionButtons === buttons));
      expect(actionButtons === buttons).assertTrue();
      let requestId: number = request.id as number;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(requestId), String(1));
      expect(requestId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVRequestReal0005 end');
    });

  });
}
