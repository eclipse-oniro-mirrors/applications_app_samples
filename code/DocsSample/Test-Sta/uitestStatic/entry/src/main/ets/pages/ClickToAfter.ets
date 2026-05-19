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
import {
  Row, Column, Text,
  FontWeight, ClickEvent
} from '@ohos.arkui.component'

// [Start clickToAfter_sta]
@Entry
@Component
struct ClickToAfterIndex {
  @State message: string = 'Hello World';
  @State text: string = '';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
        Text('Next')
          .fontSize(10)
          .margin({ top: 20 })
          .fontWeight(FontWeight.Bold)
          .onClick((event?: ClickEvent) => {
            if (event) {
              this.text = 'after click';
            }
          })
          .width('100%')
        Text(this.text).margin(15)
      }
    }
    .height('100%')
  }
}

// [End clickToAfter_sta]
