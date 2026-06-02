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
// [Start att_update_sta]
import { Button, ClickEvent, Color, Column, Component, Entry, Row, Text, TextAlign, TextAttribute } from '@kit.ArkUI';
import { AttributeUpdater } from '@ohos.arkui.modifier';

export class MyTextModifier extends AttributeUpdater<TextAttribute> {
  initializeModifier(instance: TextAttribute): void {
  }
}

@Entry
@Component
struct MyStateSample {
  modifier: MyTextModifier = new MyTextModifier();

  build(): void {
    Row() {
      Column() {
        Text("Text")
          .attributeModifier(this.modifier)
          .fontColor(Color.White)
          .fontSize(14)
          .border({ width: 1 })
          .textAlign(TextAlign.Center)
          .lineHeight(20)
          .width(200)
          .height(50)
          .backgroundColor('#2787D9')
          .onClick((e: ClickEvent) => {
            // 调用updateConstructorParams方法，直接更新组件的构造参数
            this.modifier.updateConstructorParams('Update');
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End att_update_sta]
