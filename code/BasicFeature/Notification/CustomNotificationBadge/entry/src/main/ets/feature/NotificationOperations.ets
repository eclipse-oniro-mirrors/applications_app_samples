/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { image } from '@kit.ImageKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { logger, notificationUtil, notificationContentUtil, notificationRequestUtil } from '@ohos/notification';

const TAG: string = '[Sample_CustomNotificationBadge]';
const MULTI_LINE_CONTENT: string[] = ['line0', 'line1', 'line2', 'line3']; // 多行文本通知的多行文本内容

interface NOTIFICATION_GROUP_TYPE {
  BASIC: string
  LONG_TEXT: string
  MULTI_LINE: string
  PICTURE: string
  CONVERSATION: string
}

const NOTIFICATION_GROUP: NOTIFICATION_GROUP_TYPE = { // 定义不同类型通知的通知组
  BASIC: 'BASIC',
  LONG_TEXT: 'LONG_TEXT',
  MULTI_LINE: 'MULTI_LINE',
  PICTURE: 'PICTURE',
  CONVERSATION: 'CONVERSATION'
}

export default class NotificationOperations {
  private context: Context;
  private basicContent: notification.NotificationBasicContent;

  // 在初始化函数初始化基本通知类型的参数
  constructor(context: Context) {
    this.context = context;
    this.basicContent = {
      title: '',
      text: this.getResourceText($r('app.string.notification_content')),
      additionalText: this.getResourceText($r('app.string.notification_additional'))
    }
  }

  // 统一按资源 id 读取字符串，避免各构造方法里的调用链过长
  private getResourceText(resId: Resource): string {
    return this.context.resourceManager.getStringSync(resId);
  }

  // 获取当前基本通知内容快照，供外部观测构造结果
  getBasicContent(): notification.NotificationBasicContent {
    return {
      title: this.basicContent.title,
      text: this.basicContent.text,
      additionalText: this.basicContent.additionalText
    }
  }

  // 构造基本类型通知内容（仅构造，不发布）
  buildBasicContent(): notification.NotificationContent {
    this.basicContent.title = this.getResourceText($r('app.string.basic_notification'));
    return notificationContentUtil.initBasicNotificationContent(this.basicContent);
  }

  // 构造长文本类型通知内容（仅构造，不发布）
  buildLongTextContent(): notification.NotificationContent {
    this.basicContent.title = this.getResourceText($r('app.string.long_text_notification'));
    let notificationLongText: string = this.getResourceText($r('app.string.notification_long_text'));
    let notificationBriefText: string = this.getResourceText($r('app.string.notification_brief_text'));
    let notificationExpandedText: string =
      this.getResourceText($r('app.string.notification_expanded_title'));
    return notificationContentUtil.initNotificationLongTextContent(this.basicContent, notificationLongText,
      notificationBriefText, notificationExpandedText);
  }

  // 构造多行文本类型通知内容（仅构造，不发布）
  buildMultiLineContent(): notification.NotificationContent {
    this.basicContent.title = this.getResourceText($r('app.string.multiline_notification'));
    let notificationBriefText: string = this.getResourceText($r('app.string.notification_brief_text'));
    let notificationLongTitle: string =
      this.getResourceText($r('app.string.notification_expanded_title'));
    return notificationContentUtil.initNotificationMultiLineContent(this.basicContent, notificationBriefText,
      notificationLongTitle, MULTI_LINE_CONTENT);
  }

  // 构造图片类型通知内容（仅构造，不发布）
  buildPictureContent(picture: image.PixelMap): notification.NotificationContent {
    this.basicContent.title = this.getResourceText($r('app.string.picture_notification'));
    let notificationBriefText: string = this.getResourceText($r('app.string.notification_brief_text'));
    let notificationExpandedText: string =
      this.getResourceText($r('app.string.notification_expanded_title'));
    return notificationContentUtil.initNotificationPictureContent(this.basicContent, notificationBriefText,
      notificationExpandedText, picture);
  }

  // 构造社交类型通知内容（仅构造，不发布）
  buildConversationContent(): notification.NotificationContent {
    this.basicContent.title = this.getResourceText($r('app.string.conversation_notification'));
    return notificationContentUtil.initNotificationConversationContent(this.basicContent);
  }

  // 发布基本类型通知
  publishBasicNotification = (): void => {
    try {
      logger.info(TAG, 'publishBasicNotification');
      notificationUtil.publishNotification(
        notificationRequestUtil.initBasicNotificationRequest(this.buildBasicContent()));
    } catch (error) {
      logger.error(TAG, `publishBasicNotification error, error = ${JSON.stringify(error)}`);
    }
  }

  // 发布长文本类型通知
  publishLongTextNotification = (): void => {
    try {
      logger.info(TAG, 'publishLongTextNotification');
      notificationUtil.publishNotification(
        notificationRequestUtil.initBasicNotificationRequest(this.buildLongTextContent()));
    } catch (error) {
      logger.error(TAG, `publishLongTextNotification error, error = ${JSON.stringify(error)}`);
    }
  }

  // 发布多行文本类型通知
  publishMultiLineNotification = (): void => {
    try {
      logger.info(TAG, 'publishMultiLineNotification');
      notificationUtil.publishNotification(
        notificationRequestUtil.initBasicNotificationRequest(this.buildMultiLineContent()));
    } catch (error) {
      logger.error(TAG, `publishMultiLineNotification error, error = ${JSON.stringify(error)}`);
    }
  }

  // 发布图片类型通知
  publishPictureNotification = async (): Promise<void> => {
    try {
      logger.info(TAG, 'publishPictureNotification');
      let imageArray: Uint8Array =
        await this.context.resourceManager.getMediaContent($r('app.media.notification_icon').id);
      let imageResource: image.ImageSource = image.createImageSource(imageArray.buffer);
      let picture: image.PixelMap = await imageResource.createPixelMap();
      notificationUtil.publishNotification(
        notificationRequestUtil.initBasicNotificationRequest(this.buildPictureContent(picture)));
    } catch (error) {
      logger.error(TAG, `publishPictureNotification error, error = ${JSON.stringify(error)}`);
    }
  }

  // 发布社交类型的通知
  publishConversationNotification = async (): Promise<void> => {
    try {
      logger.info(TAG, 'publishConversationNotification');
      notificationUtil.publishNotification(
        notificationRequestUtil.initBasicNotificationRequest(this.buildConversationContent()),
        NOTIFICATION_GROUP.CONVERSATION);
    } catch (error) {
      logger.error(TAG, `publishNotificationWithWantAgent error, error = ${JSON.stringify(error)}`);
    }
  }
}
