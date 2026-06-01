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

// [Start StaDynStorageV2AppMainPage]
// dynamic_module/src/main/ets/components/AppStorageV2Page.ets
import { AppStorageV2 } from '@kit.ArkUI';
import {
  STATIC_KEY, DYNAMIC_KEY, FONT_SIZE, MARGIN, MessageModel, setEnableCompatibleObservedV2ForDynamic
} from 'static_module';

@ComponentV2
export struct AppStorageV2Page {
  // 使用connect在ArkTS-Dyn模块的AppStorageV2中创建一个key为MessageDynamic的MessageModel对象
  // 修改connect的返回值即可同步回AppStorageV2
  @Local message: MessageModel = AppStorageV2.connect(
    MessageModel,
    `${DYNAMIC_KEY}`,
    () => new MessageModel(11, 'this is dynamic message')
  )!;

  aboutToAppear() {
    // 调用setEnableCompatibleObservedV2ForDynamic方法，使ArkTS-Sta @Trace修饰的属性在ArkTS-Dyn中可观测
    setEnableCompatibleObservedV2ForDynamic(this.message);
  }

  build() {
    Column() {
      Divider()
        .margin(`${MARGIN}`)

      Text('------ ArkTS-Dyn ------')
        .fontSize(`${FONT_SIZE}`)
        .margin(`${MARGIN}`)

      // 在ArkTS-Dyn模块调用connect函数, 会从ArkTS-Dyn模块的AppStorageV2中获取key为MessageDynamic的MessageModel的对象
      // 在ArkTS-Sta模块中remove之后，回到ArkTS-Dyn模块重新connect添加，修改ArkTS-Sta模块的组件的messageId，可以发现在ArkTS-Dyn模块数据已经不同步，在ArkTS-Sta模块中重新connect之后，数据一致
      // 在this.message被重新赋值时，需要调用setEnableCompatibleObservedV2ForDynamic方法，使ArkTS-Sta @Trace修饰的属性可以在ArkTS-Dyn中重新被观测
      Button(`connect key: ${DYNAMIC_KEY}`)
        .fontSize(`${FONT_SIZE}`)
        .margin(`${MARGIN}`)
        .onClick(() => {
          const msg = AppStorageV2.connect(
            MessageModel,
            `${DYNAMIC_KEY}`,
            () => new MessageModel(11, 'This is reconnected dynamic message')
          )!;
          if (this.message !== msg) {
            this.message = msg;
            setEnableCompatibleObservedV2ForDynamic(this.message);
          }
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
// [End StaDynStorageV2AppMainPage]