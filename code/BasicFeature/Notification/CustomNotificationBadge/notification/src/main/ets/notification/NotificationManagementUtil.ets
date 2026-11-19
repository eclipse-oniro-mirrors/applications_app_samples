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

import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationContentUtil } from './NotificationContentUtil';
import { logger } from '../util/Logger';

// ContentType 枚举共 7 个成员（0~6，含 SYSTEM_LIVE_VIEW 与 LIVE_VIEW）
const NOTIFICATION_TYPE_SIZE: number = 6;

export interface GetAllNotificationsResultType {
  groupNotifications: notification.NotificationRequest[][]
  countsByType: number[]
}

// 通知管理
class NotificationManagementUtil {
  public typeNotifications: notification.NotificationRequest[][] =
    new Array<notification.NotificationRequest[]>(NOTIFICATION_TYPE_SIZE + 1);
  public countsByType: number[] = new Array<number>(NOTIFICATION_TYPE_SIZE + 1);
  public badgeNum: number = 0;

  constructor() {
    this.resetLocalState();
    // 获取当前应用所有通知
    notification.getActiveNotifications().then((notifications) => {
      for (let i = 0; i < notifications.length; i++) {
        const typeId: number = notificationContentUtil.getContentTypeId(notifications[i].content);
        if (typeId < 0 || typeId >= this.typeNotifications.length) {
          continue;
        }
        this.countsByType[typeId] += 1;
        this.typeNotifications[typeId].push(notifications[i]);
      }
      logger.info(`getAllActiveNotifications success, data: ${JSON.stringify(notifications)}`)
      // 计算角标数量
      this.countsByType.forEach((num: number) => {
        this.badgeNum += num;
      })
    })
  }

  // 重置本地缓存的分组与角标计数（不影响系统已发布的通知）
  resetLocalState(): void {
    this.countsByType.fill(0);
    for (let i = 0; i < NOTIFICATION_TYPE_SIZE + 1; i++) {
      this.typeNotifications[i] = [];
    }
    this.badgeNum = 0;
  }

  // 取消属于该类型的通知
  cancelNotificationType(typeId: number): void {
    if (typeId < 0 || typeId >= this.typeNotifications.length) {
      return;
    }
    this.typeNotifications[typeId].forEach((item: notification.NotificationRequest) => {
      notification.cancel(item.id);
    })
    // 同步清空本地缓存，避免取消后仍从本地列表中查询到已取消的通知
    this.badgeNum -= this.countsByType[typeId];
    this.badgeNum = this.badgeNum < 0 ? 0 : this.badgeNum;
    this.countsByType[typeId] = 0;
    this.typeNotifications[typeId] = [];
  }

  // 设置角标
  async setBadgeNumber(num: number): Promise<void> {
    try {
      await notification.setBadgeNumber(num);
      this.badgeNum = num;
      logger.info("displayBadge success");
    } catch (err) {
      logger.info(`displayBadge failed, error = ${JSON.stringify(err)}`);
    }
  }

  // 获取角标数量
  getBadgeNumber(): number {
    return this.badgeNum;
  }

  // 添加一条消息
  async addNotification(notificationRequest: notification.NotificationRequest): Promise<void> {
    const typeId: number = notificationContentUtil.getContentTypeId(notificationRequest.content);
    if (typeId >= 0 && typeId < this.typeNotifications.length) {
      this.typeNotifications[typeId].push(notificationRequest);
      this.countsByType[typeId] += 1;
      this.badgeNum += 1;
    }
    await this.setBadgeNumber(this.badgeNum);
    logger.info("add Message success");
  }

  // 获取当前所有消息及数量
  async getAllNotifications(): Promise<GetAllNotificationsResultType> {
    let result: GetAllNotificationsResultType = {
      groupNotifications: this.typeNotifications,
      countsByType: this.countsByType
    }
    return result;
  }
}

export let notificationManagement: NotificationManagementUtil = new NotificationManagementUtil();