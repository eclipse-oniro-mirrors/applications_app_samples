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

// [Start DynInteropStaStatemgmtV2]
// entry/src/main/ets/pages/StatemgmtV2.ets
import { MainPageV2 } from 'static_module';

@Entry
@ComponentV2
struct ParentComp {
  @Local localMessage: string = 'Hello Interop';
  @Provider() consumerMessage: string = 'Provider Interop';
  
  build() {
    Column() {
      Button(this.localMessage)
        .onClick(() => {
          // 通过@Local修改本组件的状态变量
          this.localMessage += '~';
        })
        .width(300)
        .margin(10)
      Button(this.consumerMessage)
        .onClick(() => {
          // 通过@Provider修改本组件的状态变量
          this.consumerMessage += '~';
        })
        .width(300)
        .margin(10)
      MainPageV2({
        paramMessage: this.localMessage,
        changeFactory: () => {
          // 子组件调用，通过@Event修改父组件的状态变量
          this.consumerMessage += '@Event';
        }
      })
    }
    .width('100%')
    .height('100%')
  }
}
// [End DynInteropStaStatemgmtV2]
