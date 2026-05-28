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

// [Start DynInteropStaStatemgmtV1StaStateMgmtV1]
// static_module/src/main/ets/components/StaStatemgmtV1.ets
import { Component, Column, Text, Color } from '@ohos.arkui.component';
import { State, Link, PropRef, Provide, Consume } from '@ohos.arkui.stateManagement';

@Component
export struct Child { // ArkTS-Sta自定义组件
  @State stateMessage: string = 'static State';
  @Link linkMessage: string;
  @PropRef propMessage: string = 'static PropRef';
  @Provide provideMessage: string = 'static Provide';
  @Consume consumeMessage: string;

  build(): void {
    Column() {
      Text(this.stateMessage)
        .fontSize(20)
        .margin(10)
        .onClick(() => {
          // 点击文本，修改@State状态变量
          this.stateMessage += '!';
        })
      Text(this.linkMessage)
        .fontSize(20)
        .margin(10)
        .onClick(() => {
          // 点击文本，修改@Link状态变量
          this.linkMessage += '!';
        })
      Text(this.propMessage)
        .fontSize(20)
        .margin(10)
        .onClick(() => {
          // 点击文本，修改@PropRef状态变量
          this.propMessage += '!';
        })
      Text(this.provideMessage)
        .fontSize(20)
        .margin(10)
        .onClick(() => {
          // 点击文本，修改@Provide状态变量
          this.provideMessage += '!';
        })
      Text(this.consumeMessage)
        .fontSize(20)
        .margin(10)
        .onClick(() => {
          // 点击文本，修改@Consume状态变量
          this.consumeMessage += '!';
        })
    }
    .width('100%')
  }
}
// [End DynInteropStaStatemgmtV1StaStateMgmtV1]
