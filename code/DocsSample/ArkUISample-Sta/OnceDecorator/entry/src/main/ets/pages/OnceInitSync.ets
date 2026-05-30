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
// [Start OnceInitSync]
import { Button, ClickEvent, Column, ComponentV2, Entry, Local, Once, Param, Text } from '@kit.ArkUI';

@ComponentV2
struct ChildComponent {
  @Param @Once onceParam: string = '';

  build() {
    Column() {
      // onceParam变量只在初始化时接收父组件传值。
      Text(`onceParam: ${this.onceParam}`)
        .fontSize(20)
        .margin(10)
    }
    .width('100%')
  }
}

@Entry
@ComponentV2
struct MyComponent {
  @Local message: string = 'Hello World';

  build() {
    Column() {
      Button('change message')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 修改message变量，并不会同步给子组件。
          this.message = 'Hello Tomorrow';
        })
      Text(`Parent message: ${this.message}`)
        .fontSize(20)
        .margin(10)
      ChildComponent({ onceParam: this.message })
    }
    .width('100%')
  }
}

// [End OnceInitSync]
@Builder
export function onceInitSync(): void {
  NavDestination() {
    MyComponent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.once_init_sync_title'))
}