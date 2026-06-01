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

// [Start DynInteropStaStatemgmtV2StaAppStorageV2]
// static_module/src/main/ets/components/StaAppStorageV2.ets
import {
  ComponentV2, Column, Text, Button, Divider, enableCompatibleObservedV2ForDynamic
} from '@ohos.arkui.component';
import { AppStorageV2, ObservedV2, Trace, Local } from '@ohos.arkui.stateManagement';

export const STATIC_KEY: string = 'MessageStatic';
export const DYNAMIC_KEY: string = 'MessageDynamic';
export const FONT_SIZE: int = 20;
export const MARGIN: int = 10;

// AppStorageV2所存储的数据模型
@ObservedV2
export class MessageModel {
  @Trace messageId: number;
  messageContent: string;

  constructor(messageId?: number, messageContent?: string) {
    this.messageId = messageId ?? 1;
    this.messageContent = messageContent ?? 'Hello';
  }
}

// 导出ArkTS-Sta中实现的enableCompatibleObservedV2ForDynamic方法
export function setEnableCompatibleObservedV2ForDynamicStorage(T: Object): void {
  // 调用enableCompatibleObservedV2ForDynamic方法，使ArkTS-Sta @Trace修饰的属性在ArkTS-Dyn中可观测
  enableCompatibleObservedV2ForDynamic(T);
}

@ComponentV2
export struct AppStorageV2Page {
  // 使用connect在ArkTS-Sta模块的AppStorageV2中创建一个key为MessageStatic的MessageModel对象
  // 修改connect的返回值即可同步回AppStorageV2
  @Local message: MessageModel = AppStorageV2.connect<MessageModel>(
    Class.from<MessageModel>(),
    `${STATIC_KEY}`,
    () => new MessageModel(12, 'This is static message')
  )!;

  build(): void {
    Column() {
      Divider()
        .margin(`${MARGIN}`)

      Text('------ ArkTS-Sta ------')
        .fontSize(`${FONT_SIZE}`)
        .margin(`${MARGIN}`)

      // 在ArkTS-Sta模块调用connect函数, 会从ArkTS-Sta模块的AppStorageV2中获取key为MessageStatic的MessageModel的对象
      // 在ArkTS-Dyn模块中remove之后，回到ArkTS-Sta模块重新connect添加，修改ArkTS-Dyn模块的组件的messageId，可以发现在ArkTS-Sta模块数据已经不同步，在ArkTS-Dyn模块中重新connect之后，数据一致
      Button(`connect key: ${STATIC_KEY}`)
        .fontSize(`${FONT_SIZE}`)
        .margin(`${MARGIN}`)
        .onClick(() => {
          this.message = AppStorageV2.connect<MessageModel>(
            Class.from<MessageModel>(),
            `${STATIC_KEY}`,
            () => new MessageModel(22, 'This is reconnected static message')
          )!;
        })

      // 修改@Trace装饰的类属性，UI能同步刷新
      Text(`messageId: ${this.message.messageId}`)
        .fontSize(`${FONT_SIZE}`)
        .margin(`${MARGIN}`)
        .onClick(() => {
          this.message.messageId += 5;
        })

      // 修改非@Trace装饰的类属性，UI不会同步刷新，但修改的类属性已同步回AppStorageV2
      Text(`messageContent: ${this.message.messageContent}`)
        .fontSize(`${FONT_SIZE}`)
        .margin(`${MARGIN}`)
        .onClick(() => {
          this.message.messageContent += ' plus';
        })
    }
  }
}
// [End DynInteropStaStatemgmtV2StaAppStorageV2]
