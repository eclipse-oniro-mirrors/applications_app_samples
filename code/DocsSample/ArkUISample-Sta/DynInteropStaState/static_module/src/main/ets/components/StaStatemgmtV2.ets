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

// [Start DynInteropStaStatemgmtV2StaStateMgmtV2]
// static_module/src/main/ets/components/StaStatemgmtV2.ets
import { Entry, ComponentV2, Column, Button, ClickEvent, Text, Color } from '@ohos.arkui.component';
import { Param, Consumer, Event } from '@ohos.arkui.stateManagement';

@ComponentV2
export struct MainPageV2 {
  // 通过@Param接收ArkTS-Dyn父组件传递的状态变量
  @Param paramMessage: string = 'static Param';
  // 通过@Consumer与ArkTS-Dyn父组件进行交互
  @Consumer() consumerMessage: string = 'static Consumer';
  // 通过@Event与ArkTS-Dyn父组件进行交互
  @Event changeFactory: () => void = () => {};

  build(): void {
    Column() {
      Text(this.paramMessage)
        .fontSize(20)
        .margin(10)
      Text(this.consumerMessage)
        .fontSize(20)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 通过@Consumer修改ArkTS-Dyn父组件的状态变量
          this.consumerMessage += '!';
        })
      Button('excute changeFactory')
        .onClick((e: ClickEvent) => {
          // 通过@Event修改ArkTS-Dyn父组件的状态变量
          this.changeFactory();
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End DynInteropStaStatemgmtV2StaStateMgmtV2]
