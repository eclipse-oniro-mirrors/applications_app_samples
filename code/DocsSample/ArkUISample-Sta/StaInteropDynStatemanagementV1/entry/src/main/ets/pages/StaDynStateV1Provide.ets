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

// [Start StaDynStateV1Provide]
// entry/src/main/ets/pages/StaDynStateV1Provide.ets
import { Entry, Component, Column, Text, Button, ClickEvent } from '@ohos.arkui.component';
import { State, Provide } from '@ohos.arkui.stateManagement';

import { ProvideChild } from 'dynamic_module'; // 导入包含@Provide成员属性的子组件

@Entry
@Component
struct Index { // 使用包含@Provide成员属性的子组件
  @State message: string = 'Hello World';
  // 通过名称count与ArkTS-Dyn子孙组件的@Consume状态变量建立联系
  @Provide count: number = 0;

  build() {
    Column() {
      // 支持初始化子组件的@Provide成员属性
      ProvideChild({ message: this.message })
      // 显示祖先组件count状态
      Text(`parent count: ${this.count}`)
        .fontSize(20)
        .margin(10)
      Button('parent change value')
        .onClick((value: ClickEvent) => {
          // 祖先组件状态的变化会同步给ArkTS-Dyn子孙组件，祖先组件和包含对应@Consume的子孙组件的UI都会刷新
          this.count += 2;
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End StaDynStateV1Provide]
