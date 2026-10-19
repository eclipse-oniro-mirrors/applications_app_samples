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
// [Start FlingSpeedLimitStatic]
import webview from '@ohos.web.webview';
import { Entry, Column, Component, Web, WebOptions, Button, ClickEvent, Text, Row, RowOptions, $rawfile, $r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct FlingSpeedLimitStatic {
  private controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State speedLimit: number = 5000;

  build() {
    Column() {
      // [StartExclude FlingSpeedLimitStatic]
      Row({ space: 8 } as RowOptions) {
        Button($r('app.string.button_speed_1000'))
          .onClick(() => {
            this.speedLimit = 1000;
          })
        Button($r('app.string.button_speed_5000'))
          .onClick(() => {
            this.speedLimit = 5000;
          })
        Button($r('app.string.button_speed_9000'))
          .onClick(() => {
            this.speedLimit = 9000;
          })
      }
      .margin(10)

      Text($r('app.string.current_speed_limit', this.speedLimit))
        .id('speedLimitText')
        .fontSize(14)
        .margin(5)
      // [EndExclude FlingSpeedLimitStatic]
      Web({ src: $rawfile('fling_demo.html'), controller: this.controller } as WebOptions)
        .flingSpeedLimit(this.speedLimit)
        // [StartExclude FlingSpeedLimitStatic]
        .javaScriptAccess(true)
        .fileAccess(true)
        .domStorageAccess(true)
        .width('100%')
        .layoutWeight(1)
        // [EndExclude FlingSpeedLimitStatic]
    }
    // [StartExclude FlingSpeedLimitStatic]
    .width('100%')
    .height('100%')
    // [EndExclude FlingSpeedLimitStatic]
  }
}
// [End FlingSpeedLimitStatic]
