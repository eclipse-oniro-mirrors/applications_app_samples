/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { WantAgent } from '@kit.AbilityKit';
import { image } from '@kit.ImageKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import {
  logger,
  notificationUtil,
  notificationContentUtil,
  notificationRequestUtil,
  wantAgentUtil
} from '@ohos/notification';

const TAG: string = '[Sample_CustomNotification]';
const BUNDLE_NAME: string = 'ohos.samples.customnotification';
const ABILITY_NAME: string = 'MainAbility';
const MULTI_LINE_CONTENT: string[] = ['line0', 'line1', 'line2', 'line3']; // 多行文本通知的多行文本内容
const enum NOTIFICATION_ID { // 定义不同类型通知的通知id
  BASIC = 1,
  LONG_TEXT = 2,
  MULTI_LINE = 3,
  PICTURE = 4,
  BUTTON = 5,
  WANTAGENT = 6
};

export default class NotificationOperations {
  private context: Context | undefined = undefined;
  private basicContent: notification.NotificationBasicContent | undefined = undefined;

  // 在初始化函数初始化基本通知类型的参数
  constructor(context: Context) {
    this.context = context;
    let notificationTitle: string =
      this.context.resourceManager.getStringSync($r('app.string.basic_notification'));
    let notificationText: string = this.context.resourceManager.getStringSync($r('app.string.notification_content'));
    let notificationAdditional: string =
      this.context.resourceManager.getStringSync($r('app.string.notification_additional'));
    this.basicContent = {
      title: notificationTitle,
      text: notificationText,
      additionalText: notificationAdditional
    };
  }

  // 发布基本类型通知
  public publishBasicNotification = (): void => {
    try {
      if (this.context !== undefined && this.context !== null && this.basicContent !== undefined) {
        logger.info(TAG, `publishBasicNotification`);
        this.basicContent.title = this.context.resourceManager.getStringSync($r('app.string.basic_notification'));
        let notificationContent: notification.NotificationContent =
          notificationContentUtil.initBasicNotificationContent(this.basicContent);
        notificationUtil.publishNotification(notificationRequestUtil.initBasicNotificationRequest(notificationContent),
          NOTIFICATION_ID.BASIC);
      }
    } catch (error) {
      logger.error(TAG, `publishBasicNotification error, error = ${JSON.stringify(error)}`);
    }
  }

  // 发布长文本类型通知
  public publishLongTextNotification = (): void => {
    try {
      if (this.context !== undefined && this.context !== null && this.basicContent !== undefined &&
        this.basicContent !== null) {
        logger.info(TAG, `publishLongTextNotification`);
        this.basicContent.title = this.context.resourceManager.getStringSync($r('app.string.long_text_notification'));
        let notificationLongText: string =
          this.context.resourceManager.getStringSync($r('app.string.notification_long_text'));
        let notificationBriefText: string =
          this.context.resourceManager.getStringSync($r('app.string.notification_brief_text'));
        let notificationExpandedText: string =
          this.context.resourceManager.getStringSync($r('app.string.notification_expanded_title'));
        let notificationContent: notification.NotificationContent =
          notificationContentUtil.initNotificationLongTextContent(this.basicContent, notificationLongText,
            notificationBriefText, notificationExpandedText);
        notificationUtil.publishNotification(notificationRequestUtil.initBasicNotificationRequest(notificationContent),
          NOTIFICATION_ID.LONG_TEXT);
      }
    } catch (error) {
      logger.error(TAG, `publishLongTextNotification error, error = ${JSON.stringify(error)}`);
    }
  }

  // 发布多行文本类型通知
  public publishMultiLineNotification = (): void => {
    try {
      if (this.context !== undefined && this.context !== null && this.basicContent !== undefined &&
        this.basicContent !== null) {
        logger.info(TAG, `publishMultiLineNotification`);
        this.basicContent.title = this.context.resourceManager.getStringSync($r('app.string.multiline_notification'));
        let notificationBriefText: string =
          this.context.resourceManager.getStringSync($r('app.string.notification_brief_text'));
        let notificationLongTitle: string =
          this.context.resourceManager.getStringSync($r('app.string.notification_expanded_title'));
        let notificationContent: notification.NotificationContent =
          notificationContentUtil.initNotificationMultiLineContent(this.basicContent, notificationBriefText,
            notificationLongTitle, MULTI_LINE_CONTENT);
        notificationUtil.publishNotification(notificationRequestUtil.initBasicNotificationRequest(notificationContent),
          NOTIFICATION_ID.MULTI_LINE);
      }
    } catch (error) {
      logger.error(TAG, `publishMultiLineNotification error, error = ${JSON.stringify(error)}`);
    }
  }

  // 发布图片类型通知
  public publishPictureNotification = async (): Promise<void> => {
    try {
      if (this.context !== undefined && this.context !== null && this.basicContent !== undefined &&
        this.basicContent !== null) {
        logger.info(TAG, `publishPictureNotification`);
        this.basicContent.title = this.context.resourceManager.getStringSync($r('app.string.picture_notification'));
        let notificationBriefText: string =
          this.context.resourceManager.getStringSync($r('app.string.notification_brief_text'));
        let notificationExpandedText: string =
          this.context.resourceManager.getStringSync($r('app.string.notification_expanded_title'));
        let imageArray: Uint8Array = await this.context.resourceManager.getMedia($r('app.media.notification_icon').id);
        let imageResource: image.ImageSource = image.createImageSource(imageArray.buffer);
        let picture: image.PixelMap = await imageResource.createPixelMap();
        let notificationContent: notification.NotificationContent =
          notificationContentUtil.initNotificationPictureContent(this.basicContent, notificationBriefText,
            notificationExpandedText, picture);
        notificationUtil.publishNotification(notificationRequestUtil.initBasicNotificationRequest(notificationContent),
          NOTIFICATION_ID.PICTURE);
      }
    } catch (error) {
      logger.error(TAG, `publishPictureNotification error, error = ${JSON.stringify(error)}`);
    }
  }

  // 发布带按钮的通知
  public publishNotificationWithButtons = async (): Promise<void> => {
    try {
      if (this.context !== undefined && this.context !== null && this.basicContent !== undefined &&
        this.basicContent !== null) {
        logger.info(TAG, `publishNotificationWithButtons`);
        this.basicContent.title =
          this.context.resourceManager.getStringSync($r('app.string.notification_with_buttons'));
        let actionButtons: notification.NotificationActionButton[] = [
          {
            title: this.context.resourceManager.getStringSync($r('app.string.first_button')),
            wantAgent: await wantAgentUtil.createWantAgentForCommonEvent('')
          },
          {
            title: this.context.resourceManager.getStringSync($r('app.string.second_button')),
            wantAgent: await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME)
          }
        ];
        let notificationContent: notification.NotificationContent =
          notificationContentUtil.initBasicNotificationContent(this.basicContent);
        let notificationRequest: notification.NotificationRequest =
          notificationRequestUtil.initButtonNotificationRequest(notificationContent, actionButtons);
        notificationUtil.publishNotification(notificationRequest, NOTIFICATION_ID.BUTTON);
      }
    } catch (error) {
      logger.error(TAG, `publishNotificationWithButtons error, error = ${JSON.stringify(error)}`);
    }
  }

  // 发布点击跳转到应用的通知
  public publishNotificationWithWantAgent = async (): Promise<void> => {
    try {
      logger.info(TAG, `publishNotificationWithWantAgent`);
      if (this.context !== undefined && this.context !== null && this.basicContent !== undefined &&
        this.basicContent !== null) {
        this.basicContent.title = this.context.resourceManager.getStringSync($r('app.string.clickable_notification'));
        let notificationWantAgent: WantAgent =
          await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME);
        let notificationContent: notification.NotificationContent =
          notificationContentUtil.initBasicNotificationContent(this.basicContent);
        let notificationRequest: notification.NotificationRequest =
          notificationRequestUtil.initWantAgentNotificationRequest(notificationContent, notificationWantAgent);
        notificationUtil.publishNotification(notificationRequest, NOTIFICATION_ID.WANTAGENT);
      }
    } catch (error) {
      logger.error(TAG, `publishNotificationWithWantAgent error, error = ${JSON.stringify(error)}`);
    }
  }
}
