'use static';
/**
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
import { Entry, Component } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Router } from '@ohos.arkui.UIContext'
import {
  Row, Column, Text, Button, TapGesture, LongPressGesture,
  FontWeight, ButtonType
} from '@ohos.arkui.component'

@Entry
@Component
struct Click {
  @State message: string = 'Hello World';
  private router: Router | null = null;

  aboutToAppear(): void {
    this.router = this.getUIContext().getRouter();
  }

  build() {
    Row() {
      Column() {
        Button('singleClick')
          .id('click_bt')
          .onClick(() => {
            this.router?.pushUrl({ url: 'pages/second' });
          })
        Button() {
          Text('Click twice')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 20 })
        .gesture(
          TapGesture({ count: 2 })
            .onAction(() => {
              this.router?.pushUrl({ url: 'pages/Third' });
            })
        )

        Button() {
          Text('LongClick')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 20 })
        .gesture(
          LongPressGesture({ repeat: false })
            .onAction(() => {
              this.router?.pushUrl({ url: 'pages/Fourth' });
            })
        )
      }
      .width('100%')
    }
    .height('100%')
  }
}
