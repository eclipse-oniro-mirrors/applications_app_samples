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

// [Start DynInteropStaStatemgmtV2AppStorageV2]
// entry/src/main/ets/pages/StatemgmtV2AppStorageV2.ets
import { AppStorageV2 } from '@kit.ArkUI';
import {
  STATIC_KEY, DYNAMIC_KEY, FONT_SIZE, MARGIN, MessageModel, setEnableCompatibleObservedV2ForDynamicStorage, AppStorageV2Page
} from 'static_module';

@Entry
@ComponentV2
struct Index {
  // 声明一个MessageModel对象
  @Local staMessage: MessageModel = new MessageModel(1, 'Hello');
  @Local keys: string[] = [];

  aboutToAppear() {
    // 调用setEnableCompatibleObservedV2ForDynamicStorage方法，使ArkTS-Sta @Trace修饰的属性在ArkTS-Dyn中可观测
    setEnableCompatibleObservedV2ForDynamicStorage(this.staMessage);
  }

  build() {
    Column() {
      Text('------ ArkTS-Dyn ------')
        .fontSize(`${FONT_SIZE}`)
        .margin(`${MARGIN}`)

      // 使用connect在ArkTS-Dyn模块的AppStorageV2中创建一个key为MessageDynamic的MessageModel对象
      Button(`connect key: ${DYNAMIC_KEY}`)
        .fontSize(`${FONT_SIZE}`)
        .margin(`${MARGIN}`)
        .onClick(() => {
          const dynMessage: MessageModel = AppStorageV2.connect(
            MessageModel,
            `${DYNAMIC_KEY}`,
            () => new MessageModel(11, 'This is dynamic message')
          )!;
        })

      // 在ArkTS-Dyn模块调用connect函数, 会从ArkTS-Sta模块的AppStorageV2中获取key为MessageStatic的MessageModel的对象
      // 修改connect的返回值即可同步回ArkTS-Sta模块的AppStorageV2
      // 如果ArkTS-Sta模块的AppStorageV2中不存在key为MessageStatic的MessageModel的对象，则会在ArkTS-Dyn模块的AppStorageV2中创建一个key为MessageStatic的MessageModel对象
      // 在this.staMessage被重新赋值时，需要调用setEnableCompatibleObservedV2ForDynamicStorage方法，使ArkTS-Sta @Trace修饰的属性可以在ArkTS-Dyn中重新被观测
      Button(`connect key: ${STATIC_KEY}`)
        .fontSize(`${FONT_SIZE}`)
        .margin(`${MARGIN}`)
        .onClick(() => {
          this.staMessage = AppStorageV2.connect(
            MessageModel,
            `${STATIC_KEY}`,
            () => new MessageModel(11, 'This message is connected in Dyn')
          )!;
          setEnableCompatibleObservedV2ForDynamicStorage(this.staMessage);
        })

      // 在ArkTS-Dyn模块调用remove函数, 会从ArkTS-Dyn模块和ArkTS-Sta模块的AppStorageV2中删除key为MessageStatic的MessageModel的对象
      // remove之后，修改messageId，ArkTS-Dyn模块和ArkTS-Sta模块的组件能同步变化，因为remove只是从AppStorageV2删除，不会影响组件中已存在的数据
      Button(`remove key: ${STATIC_KEY}`)
        .fontSize(`${FONT_SIZE}`)
        .margin(`${MARGIN}`)
        .onClick(() => {
          AppStorageV2.remove(`${STATIC_KEY}`);
        })

      // 修改@Trace装饰的类属性，UI能同步刷新
      Text(`messageId: ${this.staMessage.messageId}`)
        .fontSize(`${FONT_SIZE}`)
        .margin(`${MARGIN}`)
        .onClick(() => {
          this.staMessage.messageId += 1;
        })

      // 修改非@Trace装饰的类属性，UI不会同步刷新，但修改的类属性已同步回AppStorageV2
      Text(`messageContent: ${this.staMessage.messageContent}`)
        .fontSize(`${FONT_SIZE}`)
        .margin(`${MARGIN}`)
        .onClick(() => {
          this.staMessage.messageContent += ' plus';
        })

      // connect或者remove操作后，查看AppStorageV2存储的MessageModel对象的所有key
      Text(`get all keys: ${this.keys}`)
        .fontSize(`${FONT_SIZE}`)
        .margin(`${MARGIN}`)
        .onClick(() => {
          this.keys = AppStorageV2.keys();
        })

      // 注册绑定互操作并调用ArkTS-Sta模块组件，初始化一个ArkTS-Sta对象
      AppStorageV2Page()
    }
  }
}
// [End DynInteropStaStatemgmtV2AppStorageV2]
