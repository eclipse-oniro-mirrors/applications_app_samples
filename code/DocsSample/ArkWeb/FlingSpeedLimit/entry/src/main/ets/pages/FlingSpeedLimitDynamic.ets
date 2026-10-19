/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
// [Start FlingSpeedLimitDynamic]
import { webview } from '@kit.ArkWeb';

@Entry
@Component
struct FlingSpeedLimitDynamic {
  private controller: webview.WebviewController = new webview.WebviewController();
  @State speedLimit: number = 5000;

  build() {
    Column() {
      // [StartExclude FlingSpeedLimitDynamic]
      Row({ space: 8 }) {
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
      // [EndExclude FlingSpeedLimitDynamic]
      Web({ src: $rawfile('fling_demo.html'), controller: this.controller })
        .flingSpeedLimit(this.speedLimit)
        // [StartExclude FlingSpeedLimitDynamic]
        .javaScriptAccess(true)
        .fileAccess(true)
        .domStorageAccess(true)
        .width('100%')
        .layoutWeight(1)
        // [EndExclude FlingSpeedLimitDynamic]
    }
    // [StartExclude FlingSpeedLimitDynamic]
    .width('100%')
    .height('100%')
    // [EndExclude FlingSpeedLimitDynamic]
  }
}
// [End FlingSpeedLimitDynamic]
