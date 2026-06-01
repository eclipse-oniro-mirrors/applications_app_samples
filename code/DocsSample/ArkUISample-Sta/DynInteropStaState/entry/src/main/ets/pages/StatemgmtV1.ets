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

// [Start DynInteropStaStatemgmtV1]
// entry/src/main/ets/pages/StatemgmtV1.ets

import { Child } from 'static_module'; // 引入ArkTS-Sta子模块中的自定义组件Child

@Entry
@Component
struct ParentComp {
  @State message: string = 'Hello Interop';
  @Provide consumeMessage: string = 'Provide Interop';

  build() {
    Column() {
      Button(this.message)
        .onClick((e: ClickEvent) => {
          // 点击按钮，修改@State状态变量
          this.message += '~';
        })
        .width(300)
        .margin(10)
      // 使用ArkTS-Sta子组件Child，并通过状态绑定与其进行交互
      Child({
        stateMessage: this.message,
        linkMessage: this.message,
        propMessage: this.message,
        provideMessage: this.message
      })
    }
    .width('100%')
    .height('100%')
  }
}
// [End DynInteropStaStatemgmtV1]
