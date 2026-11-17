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
// [Start FlingSpeedLimitModifier]
import { webview } from '@kit.ArkWeb';

class FlingSpeedLimitModifier implements AttributeModifier<WebAttribute> {
  private readonly speed: number;

  constructor(speed: number) {
    this.speed = speed;
  }

  applyNormalAttribute(instance: WebAttribute): void {
    instance.flingSpeedLimit(this.speed);
  }
}

@Entry
@Component
struct FlingSpeedLimitModifierPage {
  private controller: webview.WebviewController = new webview.WebviewController();

  // Must use @State and create a new instance to trigger modifier re-apply
  @State flingModifier: FlingSpeedLimitModifier = new FlingSpeedLimitModifier(5000);
  @State speed: number = 5000;

  private setSpeed(speed: number): void {
    this.speed = speed;
    // Create a new instance to trigger re-apply, modifying the property only will not take effect
    this.flingModifier = new FlingSpeedLimitModifier(speed);
    console.info(`[FlingSpeedLimit] set=${speed}`);
  }

  build() {
    Column() {
      Row({ space: 8 }) {
        Button($r('app.string.button_speed_1000'))
          .onClick(() => this.setSpeed(1000))
        Button($r('app.string.button_speed_5000'))
          .onClick(() => this.setSpeed(5000))
        Button($r('app.string.button_speed_9000'))
          .onClick(() => this.setSpeed(9000))
      }
      .margin(10)

      Text($r('app.string.current_speed_limit', this.speed))
        .id('speedLimitText')
        .fontSize(14)
        .margin(5)

      Web({ src: $rawfile('fling_demo.html'), controller: this.controller })
        .javaScriptAccess(true)
        .fileAccess(true)
        .domStorageAccess(true)
        .attributeModifier(this.flingModifier)
        .width('100%')
        .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}
// [End FlingSpeedLimitModifier]
