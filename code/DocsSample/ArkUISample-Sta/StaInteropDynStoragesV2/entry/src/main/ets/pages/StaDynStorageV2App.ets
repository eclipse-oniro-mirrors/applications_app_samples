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

// [Start StaDynStorageV2App]
// entry/src/main/ets/pages/StaDynStorageV2App.ets
import { Entry, Text, Column, Button, Divider, ComponentV2, Row } from '@ohos.arkui.component';
import { AppStorageV2, Local } from '@ohos.arkui.stateManagement';

import { AppStorageV2Page } from 'dynamic_module'; // 导入ArkTS-Dyn自定义组件
import { MessageModel, FONT_SIZE, STATIC_KEY, DYNAMIC_KEY, MARGIN } from 'static_module'; // 导入ArkTS-Sta数据类

@Entry
@ComponentV2
struct AppStorageV2Index {
  // 声明一个MessageModel对象
  @Local dynMessage: MessageModel = new MessageModel();
  @Local keys: Array<string> = AppStorageV2.keys();

  build() {
    Row() {
      Column() {
        Text('------ ArkTS-Sta ------')
          .fontSize(`${FONT_SIZE}`)
          .margin(`${MARGIN}`)

        // 使用connect在ArkTS-Sta模块的AppStorageV2中创建一个key为MessageStatic的MessageModel对象
        Button(`connect key: ${STATIC_KEY}`)
          .fontSize(`${FONT_SIZE}`)
          .margin(`${MARGIN}`)
          .onClick(() => {
            const message: MessageModel = AppStorageV2.connect<MessageModel>(
              Class.from<MessageModel>(),
              `${STATIC_KEY}`,
              () => new MessageModel(22, 'This is static message')
            )!;
          })

        // 在ArkTS-Sta模块调用connect函数, 会从ArkTS-Dyn模块的AppStorageV2中获取key为MessageDynamic的MessageModel的对象
        // 修改connect的返回值即可同步回ArkTS-Dyn模块的AppStorageV2
        // 如果ArkTS-Dyn模块的AppStorageV2中不存在key为MessageDynamic的MessageModel的对象，则会在ArkTS-Sta模块的AppStorageV2中创建一个key为MessageDynamic的MessageModel对象
        Button(`connect key: ${DYNAMIC_KEY}`)
          .fontSize(`${FONT_SIZE}`)
          .margin(`${MARGIN}`)
          .onClick(() => {
             this.dynMessage = AppStorageV2.connect<MessageModel>(
              Class.from<MessageModel>(),
              `${DYNAMIC_KEY}`,
              () => new MessageModel(11, 'This message is connected in Sta')
            )!;
          })

        // 在ArkTS-Sta模块调用remove函数, 会从ArkTS-Sta模块和ArkTS-Dyn模块的AppStorageV2中删除key为MessageDynamic的MessageModel的对象
        // remove之后，修改messageId，ArkTS-Sta模块和ArkTS-Dyn模块的组件能同步变化，因为remove只是从AppStorageV2删除，不会影响组件中已存在的数据
        Button(`remove key: ${DYNAMIC_KEY}`)
          .fontSize(`${FONT_SIZE}`)
          .margin(`${MARGIN}`)
          .onClick(() => {
            AppStorageV2.remove(`${DYNAMIC_KEY}`);
          })

        // 修改@Trace装饰的类属性，UI能同步刷新
        Text(`messageId: ${this.dynMessage.messageId}`)
          .fontSize(`${FONT_SIZE}`)
          .margin(`${MARGIN}`)
          .onClick(() => {
            this.dynMessage.messageId += 1;
          })

        // 修改非@Trace装饰的类属性，UI不会同步刷新，但修改的类属性已同步回AppStorageV2
        Text(`messageContent: ${this.dynMessage.messageContent}`)
          .fontSize(`${FONT_SIZE}`)
          .margin(`${MARGIN}`)
          .onClick(() => {
            this.dynMessage.messageContent += ' plus';
          })

        // connect或者remove操作后，查看AppStorageV2存储的MessageModel对象的所有key
        Text(`get all keys: ${this.keys}`)
          .fontSize(`${FONT_SIZE}`)
          .margin(`${MARGIN}`)
          .onClick(() => {
            this.keys = AppStorageV2.keys();
          })

        // 调用ArkTS-Dyn模块组件，初始化一个ArkTS-Dyn对象
        AppStorageV2Page()
      }
    }
  }
}
// [End StaDynStorageV2App]