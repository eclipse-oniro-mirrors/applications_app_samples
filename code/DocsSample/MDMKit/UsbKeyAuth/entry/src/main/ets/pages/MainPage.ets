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

import {
  bindUsbKey,
  unbindUsbKey,
  queryCredentials,
  setUnlockPolicy,
  getUnlockPolicy
} from '../service/UsbKeyAuthService';

@Entry
@Component
struct MainPage {
  @State resultText: string = '';

  build() {
    Column() {
      Text($r('app.string.main_page_title'))
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button($r('app.string.bind_usb_key'))
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(async () => {
          this.resultText = await bindUsbKey(this.getUIContext());
        })

      Button($r('app.string.unbind_usb_key'))
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(async () => {
          this.resultText = await unbindUsbKey(this.getUIContext());
        })

      Button($r('app.string.query_credentials'))
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(async () => {
          this.resultText = await queryCredentials();
        })

      Button($r('app.string.set_unlock_policy'))
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.resultText = setUnlockPolicy();
        })

      Button($r('app.string.get_unlock_policy'))
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.resultText = getUnlockPolicy();
        })

      Text() {
        Span($r('app.string.result_prefix'))
        Span(this.resultText)
      }
      .fontSize(14)
      .margin({ top: 20 })
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
