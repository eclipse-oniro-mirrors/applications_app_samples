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

export interface GetAllNotificationsResultType {
  groupNotifications: notification.NotificationRequest[][];
  countsByType: number[];
}

// ContentType 枚举共 7 个成员（0~6，含 SYSTEM_LIVE_VIEW=5 与 LIVE_VIEW=6）
const NOTIFICATION_TYPE_SIZE: number = 6;

// 通知管理
class NotificationManagementUtil {
  public typeNotifications: notification.NotificationRequest[][] = new Array(NOTIFICATION_TYPE_SIZE + 1);
  public countsByType: number[] = new Array(NOTIFICATION_TYPE_SIZE + 1);
  public badgeNum: number = 0;

  constructor() {
    this.countsByType.fill(0);
    for (let i: number = 0; i < NOTIFICATION_TYPE_SIZE + 1; i++) {
      this.typeNotifications[i] = [];
    }
    this.refreshFromActive();
  }

  // 从系统当前活动通知刷新本地分组与角标（可重复调用，逐次累加）
  async refreshFromActive(): Promise<void> {
    try {
      const activeNotifications: notification.NotificationRequest[] = await notification.getActiveNotifications();
      const refreshedCounts: number[] = new Array(this.typeNotifications.length);
      refreshedCounts.fill(0);
      for (let i: number = 0; i < activeNotifications.length; i++) {
        const typeId: number = notificationContentUtil.getContentTypeId(activeNotifications[i].content);
        if (typeId < 0 || typeId >= this.typeNotifications.length) {
          continue;
        }
        refreshedCounts[typeId] += 1;
        this.typeNotifications[typeId].push(activeNotifications[i]);
      }
      for (let i: number = 0; i < refreshedCounts.length; i++) {
        this.countsByType[i] += refreshedCounts[i];
        this.badgeNum += refreshedCounts[i];
      }
      logger.info(`refreshFromActive success, data: ${JSON.stringify(activeNotifications)}`);
    } catch (err) {
      logger.error(`refreshFromActive err ${JSON.stringify(err)}`);
    }
  }

  // 取消属于该类型的通知，同步清空该类型分组与计数，并同步系统角标
  async cancelNotificationType(typeId: number): Promise<void> {
    if (typeId < 0 || typeId >= this.typeNotifications.length) {
      return;
    }
    const cancelledCount: number = this.countsByType[typeId];
    this.typeNotifications[typeId].forEach((item: notification.NotificationRequest) => {
      notification.cancel(item.id);
    });
    this.typeNotifications[typeId] = [];
    this.countsByType[typeId] = 0;
    if (cancelledCount > 0) {
      this.badgeNum = this.badgeNum > cancelledCount ? this.badgeNum - cancelledCount : 0;
      await this.syncBadgeNumber(this.badgeNum);
    }
  }

  // 重置状态：本地分组、计数与系统角标一并归零
  async resetTypeNotificationState(): Promise<void> {
    for (let i: number = 0; i < NOTIFICATION_TYPE_SIZE + 1; i++) {
      this.typeNotifications[i] = [];
    }
    this.badgeNum = 0;
    this.countsByType.fill(0);
    await this.syncBadgeNumber(0);
  }

  // 设置角标（系统拒绝时向调用方抛出）
  async setBadgeNumber(num: number): Promise<void> {
    await notification.setBadgeNumber(num).then(() => {
      this.badgeNum = num;
      logger.info('displayBadge success');
    });
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
    logger.info('add Message success');
  }

  // 获取当前所有消息及数量
  async getAllNotifications(): Promise<GetAllNotificationsResultType> {
    let result: GetAllNotificationsResultType = {
      groupNotifications: this.typeNotifications,
      countsByType: this.countsByType
    };
    return result;
  }

  // 同步系统角标；系统拒绝时只记录日志，不打断本地计数
  private async syncBadgeNumber(num: number): Promise<void> {
    try {
      await notification.setBadgeNumber(num);
      logger.info(`sync badge success, num: ${num}`);
    } catch (err) {
      logger.error(`sync badge err ${JSON.stringify(err)}`);
    }
  }
}

export let notificationManagement: NotificationManagementUtil = new NotificationManagementUtil();
