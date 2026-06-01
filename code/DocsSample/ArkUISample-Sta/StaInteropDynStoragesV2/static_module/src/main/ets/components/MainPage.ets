'use static'

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

// [Start StaDynStorageV2StaticMainPage]
// static_module/src/main/ets/components/MainPage.ets
import { ObservedV2, Trace } from '@ohos.arkui.stateManagement';
import { enableCompatibleObservedV2ForDynamic } from '@ohos.arkui.component';

export const STATIC_KEY: string = 'MessageStatic';
export const DYNAMIC_KEY: string = 'MessageDynamic';
export const FONT_SIZE: int = 20;
export const MARGIN: int = 10;

// AppStorageV2所存储的数据模型
@ObservedV2
export class MessageModel { // 定义MessageModel数据类
  @Trace messageId: number;
  messageContent: string;

  constructor(messageId?: number, messageContent?: string) {
    this.messageId = messageId ?? 1;
    this.messageContent = messageContent ?? 'Hello';
  }
}

// 导出ArkTS-Sta中实现的enableCompatibleObservedV2ForDynamic方法
export function setEnableCompatibleObservedV2ForDynamic(T: Object): void {
  // 调用enableCompatibleObservedV2ForDynamic方法，使ArkTS-Sta @Trace修饰的属性在ArkTS-Dyn中可观测
  enableCompatibleObservedV2ForDynamic(T);
}
// [End StaDynStorageV2StaticMainPage]