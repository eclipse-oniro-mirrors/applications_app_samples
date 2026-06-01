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

// [Start StaDynStateV2]
// entry/src/main/ets/pages/StaDynStateV2.ets
import { Entry, ComponentV2, Column, Button, ClickEvent } from '@ohos.arkui.component';
import { Local, Provider } from '@ohos.arkui.stateManagement';

import { MainPage } from 'dynamic_module'; // 引入ArkTS-Dyn自定义组件

@Entry
@ComponentV2
struct ParentComp { // ArkTS-Sta主组件
  // 定义ArkTS-Sta状态变量
  @Local localMessage: string = 'Local Interop';
  @Provider() consumerMessage: string = 'Provider Interop';

  build() {
    Column() {
      Button(this.localMessage)
        .onClick((e: ClickEvent) => {
          // 通过@Local修改本组件的状态变量
          this.localMessage += '~';
        })
        .width(300)
        .margin(10)
      Button(this.consumerMessage)
        .onClick((e: ClickEvent) => {
          // 通过@Provider修改子节点的状态变量
          this.consumerMessage += '~';
        })
        .width(300)
        .margin(10)
      // 引入ArkTS-Dyn自定义组件，并传递状态变量
      MainPage({
        paramMessage: this.localMessage,
        changeFactory: () => {
          this.consumerMessage += '@Event';
        }
      })
    }
    .width('100%')
    .height('100%')
  }
}
// [End StaDynStateV2]
