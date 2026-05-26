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
import { Entry, Component, Column, Row, Button, Text, FontWeight, ButtonType } from '@ohos.arkui.component'
import { Router } from '@ohos.arkui.UIContext'
import router from '@ohos.router'

@Entry
@Component
struct Index {
  private routerObj: Router | null = null;

  aboutToAppear(): void {
    this.routerObj = this.getUIContext().getRouter();
  }

  build() {
    Row() {
      Column() {
        Button('ListPage')
          .fontSize(25)
          .id('toPageList')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.routerObj?.pushUrl({ url: 'pages/PageListPage' });
          })
        Button() {
          Text('navigation')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .id('toNavigationPage')
        .type(ButtonType.Capsule)
        .margin({ top: 20 })
        .onClick(() => {
          this.routerObj?.pushUrl({ url: 'pages/navigationPage' });
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
