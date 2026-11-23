/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { AirData, AirIndex, getAirIndexData, getHeaderDate, Style } from '@ohos/common'
import { initRound } from '../../feature/AirQualityFeature'

@Preview
@Component
export default struct AirQuality {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private airIndexData: AirIndex[] = getAirIndexData(0)
  private airData: AirData = getHeaderDate(0).airData

  build() {
    Row() {
      Column() {
        Text($r('app.string.air_quality'))
          .fontSize(Style.FONT_SIZE_CAPTION)
          .fontColor($r('app.color.white'))
          .fontWeight(FontWeight.Medium)
        Canvas(this.context)
          .height('65%')
          .aspectRatio(1)
          .onReady(() => {
            this.context.clearRect(0, 0, this.context.width, this.context.height)
            initRound(this.context, this.airData)
          })
      }
      .width('50%')
      .justifyContent(FlexAlign.Center)

      List({ space: Style.NORMAL_SPACE }) {
        ForEach(this.airIndexData, (item: AirIndex) => {
          ListItem() {
            Row() {
              Text(item.index)
                .width(Style.AIR_INDEX_WIDTH)
                .fontSize(Style.FONT_SIZE_SMALL)
                .fontColor($r('app.color.text_white_60'))
              Text(item.figure.toString())
                .width(Style.AIR_INDEX_WIDTH)
                .fontSize(Style.FONT_SIZE_SMALL)
                .fontColor($r('app.color.white'))
                .margin({ left: Style.NORMAL_SPACE })
            }
            .justifyContent(FlexAlign.Center)
          }
          .width('100%')
        }, (item: AirIndex) => item.index)
      }
      .width('50%')
      .margin({ left: Style.AIR_LIST_MARGIN_LEFT })
      .height('75%')
    }
    .height(Style.CARD_HEIGHT)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Style.CARD_BACKGROUND_COLOR)
    .borderRadius(Style.NORMAL_RADIUS)
  }
}