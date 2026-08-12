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
      Text('USB Key 可信持有物认证')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('绑定 USB Key')
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(async () => {
          this.resultText = await bindUsbKey();
        })

      Button('解绑 USB Key')
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(async () => {
          this.resultText = await unbindUsbKey();
        })

      Button('查询已绑定凭据')
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(async () => {
          this.resultText = await queryCredentials();
        })

      Button('设置解锁策略')
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.resultText = setUnlockPolicy();
        })

      Button('查询解锁策略')
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.resultText = getUnlockPolicy();
        })

      Text(`结果：${this.resultText}`)
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
