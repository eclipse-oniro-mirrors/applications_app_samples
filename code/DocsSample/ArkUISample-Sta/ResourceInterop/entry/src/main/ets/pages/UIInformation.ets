'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start ui_information]
// entry\src\main\ets\pages\UIInformation.ets
import { Entry, Button, ClickEvent, Column, Component, Text, FontWeight, ColumnOptions, State } from '@kit.ArkUI';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct UIInformation {
  @State message: string = "UI Information"

  build() {
    Column({space: 8} as ColumnOptions) {
      Text(this.message)
        .fontWeight(FontWeight.Bold)
        .fontSize(26)
      Button("px2lpx").onClick((event: ClickEvent) => {
        // [Start px2lpx]
        const result = this.getUIContext().px2lpx(100);
        // [End px2lpx]
        this.message = `px2lpx result: ${result}`;
      })
      Button("lpx2px").onClick((event: ClickEvent) => {
        // [Start lpx2px]
        const result = this.getUIContext().lpx2px(100);
        // [End lpx2px]
        this.message = `lpx2px result: ${result}`;
      })
      Button("px2fp").onClick((event: ClickEvent) => {
        // [Start px2fp]
        const result = this.getUIContext().px2fp(100);
        // [End px2fp]
        this.message = `px2fp result: ${result}`;
      })
      Button("fp2px").onClick((event: ClickEvent) => {
        // [Start fp2px]
        const result = this.getUIContext().fp2px(100);
        // [End fp2px]
        this.message = `fp2px result: ${result}`;
      })
      Button("px2vp").onClick((event: ClickEvent) => {
        // [Start px2vp]
        const result = this.getUIContext().px2vp(100);
        // [End px2vp]
        this.message = `px2vp result: ${result}`;
      })
      Button("vp2px").onClick((event: ClickEvent) => {
        // [Start vp2px]
        const result = this.getUIContext().vp2px(100);
        // [End vp2px]
        this.message = `vp2px result: ${result}`;
      })
    }
  }
}
// [End ui_information]
