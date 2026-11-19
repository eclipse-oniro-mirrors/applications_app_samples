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

// 通知请求夹具：只构造数据，不做系统调用，供计数/分组类用例复用。
// typeId 允许传入任意数字（含越界值），用于驱动被测代码的越界分支。
import { notificationManager as notification } from '@kit.NotificationKit';

const FIXTURE_TEXT: string = 'fixture text';
const FIXTURE_ADDITIONAL: string = 'fixture additional';

export function makeRequest(typeId: number, id: number, title: string): notification.NotificationRequest {
    const request: notification.NotificationRequest = {
        id: id,
        notificationSlotType: notification.SlotType.CONTENT_INFORMATION,
        content: {
            notificationContentType: typeId as notification.ContentType,
            normal: {
                title: title,
                text: FIXTURE_TEXT,
                additionalText: FIXTURE_ADDITIONAL
            }
        }
    };
    return request;
}
