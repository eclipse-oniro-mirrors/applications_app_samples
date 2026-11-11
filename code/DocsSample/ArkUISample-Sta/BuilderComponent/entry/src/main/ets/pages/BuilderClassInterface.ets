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

import { NavDestination, $r } from '@kit.ArkUI';
// [Start BuilderClassInterface]
import { Entry, Component, Column, Text, Builder, FontWeight, Button, ObservedV2, Trace } from '@kit.ArkUI';

interface TextBuilderInterface {
  // @Builder装饰interface成员函数
  @Builder showTextBuilder(): void;
}

@ObservedV2
class TextBuilder implements TextBuilderInterface {
  @Trace text: string = 'Hello World';
  // @Builder装饰class成员函数
  @Builder showTextBuilder() {
    //绑定class内声明的状态变量
    Text(this.text)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
  }
}

@Entry
@Component
struct BuilderDemo {
  textBuilder: TextBuilder = new TextBuilder();
  build() {
    Column() {
      // 在build()中调用@Builder函数
      this.textBuilder.showTextBuilder()
      Button('Change text')
        .onClick(() => {
          this.textBuilder.text += '!';
        })
    }.width('100%')
  }
}
// [End BuilderClassInterface]

@Builder
export function builderClassInterface(): void {
  NavDestination() {
    BuilderDemo();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builder_class_title'))
}
