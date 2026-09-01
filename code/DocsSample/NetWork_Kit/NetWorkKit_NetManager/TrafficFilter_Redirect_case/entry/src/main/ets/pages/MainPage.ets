/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { router } from '@kit.ArkUI'

@Entry
@Component
struct MainPage {
  build() {
    Column() {
      Text('Traffic Redirector')
        .width('100%')
        .height(48)
        .margin({ top: '10%' })
        .fontColor('#000000')
        .fontSize(36)
        .fontWeight(500)
      Divider().color('gray').strokeWidth(1)
      Button({ type: ButtonType.Normal }) {
        Column() {
          Text('Redirector Management')
            .fontSize(20)
            .fontWeight(500)
            .fontColor('#FFFFFFFF')
        }
        .width(300)
        .height('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({ left: 5, top: 25 })
      }
      .width('100%')
      .height(80)
      .margin({ top: '15%' })
      .borderRadius(22)
      .onClick(() => {
        router.pushUrl({ url: 'pages/RedirectorPage' });
      })

      Button({ type: ButtonType.Normal }) {
        Column() {
          Text('Query Process Demo')
            .fontSize(20)
            .fontWeight(500)
            .fontColor('#FFFFFFFF')
        }
        .width(300)
        .height('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({ left: 5, top: 25 })
      }
      .width('100%')
      .height(80)
      .margin({ top: 20 })
      .borderRadius(22)
      .onClick(() => {
        router.pushUrl({ url: 'pages/QueryProcessPage' });
      })
    }
    .linearGradient({
      direction: GradientDirection.Top,
      repeating: true,
      colors: [['#FFFFFF', 0], ['#FFFFFF', 1]]
    })
    .height('100%')
    .width('100%')
    .padding({ left: '16vp', right: '16vp' })
    .alignItems(HorizontalAlign.Start)
  }
}
