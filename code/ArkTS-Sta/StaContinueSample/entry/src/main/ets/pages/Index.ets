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

import { Entry, Button, Text, Column, Row, Component, Button, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import { UIContext, FontWeight } from '@kit.ArkUI';
import { AbilityConstant, common } from '@kit.AbilityKit';

@Entry
@Component
struct Index {
  // 修改字符串
  private uiContext:UIContext = this.getUIContext();
  private context:common.UIAbilityContext = this.uiContext?.getHostContext() as common.UIAbilityContext;
  @State message: string = '目录'
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        // 添加按钮，以响应用户点击!
        Button('ACTIVE').onClick(() => {
          //点击该按钮时，将应用设置为可迁移状态
          this.context.setMissionContinueState(AbilityConstant.ContinueState.ACTIVE);
        })
          .width('40%')
          .height('5%')
          .margin(10)
        // 添加按钮，以响应用户点击!
        Button('INACTIVE').onClick(() => {
          //点击该按钮时，将应用设置为不可迁移状态
          this.context.setMissionContinueState(AbilityConstant.ContinueState.INACTIVE);
        })
          .width('40%')
          .height('5%')
          .margin(10)
      }
      .width('100%')
    }
    .height('100%')
  }
}