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

import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationManagement, notificationRequestUtil } from '@ohos/notification';

/**
 * 归零 notificationManagement 的本地分组与角标缓存，保证用例间零依赖。
 */
export function resetManagementState(): void {
    notificationManagement.resetLocalState();
}

/**
 * 构造指定内容类型的 NotificationRequest，不触发系统发布。
 */
export function buildRequestOfType(typeId: number): notification.NotificationRequest {
    let content: notification.NotificationContent = {
        notificationContentType: typeId
    };
    return notificationRequestUtil.initBasicNotificationRequest(content);
}

/**
 * 构造带基本文本载荷的 NotificationRequest，不触发系统发布。
 */
export function buildBasicRequestOf(title: string, text: string): notification.NotificationRequest {
    let content: notification.NotificationContent = {
        notificationContentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: { title: title, text: text, additionalText: '' }
    };
    return notificationRequestUtil.initBasicNotificationRequest(content);
}
