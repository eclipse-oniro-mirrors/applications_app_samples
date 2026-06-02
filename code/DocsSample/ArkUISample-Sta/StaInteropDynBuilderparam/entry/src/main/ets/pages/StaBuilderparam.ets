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

// [Start StaBuilderparam]
// entry/src/main/ets/pages/StaBuilderparam.ets
import { Entry, Component, Builder, Column, Text, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

import { CustomContainer } from 'dynamic_module';

@Entry
@Component
struct CustomContainerUser { // 主模块中使用ArkTS-Dyn自定义组件
  @State text: int = 0;

  @Builder
  localBuilder() {
    Text(`${this.text}`)
      .fontSize(20)
      .margin(10)
      .onClick((value: ClickEvent) => {
        // 修改成员属性text的值
        this.text++;
      })
  }

  build() {
    Column() {
      // 创建CustomContainer，在创建CustomContainer时，通过其后紧跟一个大括号"{}"形成尾随闭包
      // 作为传递给子组件CustomContainer的@BuilderParam参数closer
      CustomContainer({ text: this.text }) {
        Column() {
          Text(`${this.text}`)
            .fontSize(20)
            .margin(10)
        }
        .onClick((value: ClickEvent) => {
          this.text++;
        })
      }
      // 通过参数初始化@BuilderParam成员
      CustomContainer({ text: this.text, closer: this.localBuilder })
    }
    .width('100%')
  }
}
// [End StaBuilderparam]
