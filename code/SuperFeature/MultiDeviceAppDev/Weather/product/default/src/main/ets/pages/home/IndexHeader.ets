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

import { getHeaderDate, HeaderData, Style, WeatherSymbol } from '@ohos/common'

@Preview
@Component
export default struct IndexHeader {
  private headerDate: HeaderData = getHeaderDate(0)
  private index: number = 0

  build() {
    Column() {
      Row() {
        Text(this.headerDate.city)
          .fontColor($r('app.color.white'))
          .fontWeight(FontWeight.Regular)
          .fontSize(Style.FONT_SIZE_LARGE)
        if (this.index === 0) {
          Image($r('app.media.icon_location'))
            .size({ width: Style.ICON_SIZE_SMALL, height: Style.ICON_SIZE_SMALL })
            .objectFit(ImageFit.Contain)
        }
      }

      Row() {
        Text(this.headerDate.temp)
          .fontColor($r('app.color.white'))
          .fontWeight(Style.BIG_FONT_WEIGHT)
          .fontSize(Style.FONT_SIZE_MAIN_TEMP)
        Text($r('app.string.du'))
          .fontColor($r('app.color.white'))
          .fontWeight(FontWeight.Regular)
          .fontSize(Style.FONT_SIZE_TEMP_UNIT)
          .margin({ bottom: Style.TEMP_UNIT_MARGIN_BOTTOM })
      }
      .margin({ top: Style.TEMP_ROW_MARGIN_TOP })
      .padding({ left: Style.TEMP_ROW_PADDING_LEFT })

      Row() {
        Text(this.headerDate.max)
          .fontColor($r('app.color.white'))
          .fontWeight(FontWeight.Medium)
          .fontSize(Style.FONT_SIZE_MEDIUM)
        Text($r('app.string.du'))
          .fontColor($r('app.color.white'))
          .fontWeight(FontWeight.Medium)
          .fontSize(Style.FONT_SIZE_MEDIUM)
        Text(WeatherSymbol.TEMP_RANGE_SEPARATOR)
          .fontColor($r('app.color.white'))
          .fontWeight(FontWeight.Medium)
          .fontSize(Style.FONT_SIZE_MEDIUM)
        Text(this.headerDate.min)
          .fontColor($r('app.color.text_white_60'))
          .fontWeight(FontWeight.Medium)
          .fontSize(Style.FONT_SIZE_MEDIUM)
        Text($r('app.string.du'))
          .fontColor($r('app.color.text_white_60'))
          .fontWeight(FontWeight.Medium)
          .fontSize(Style.FONT_SIZE_MEDIUM)
      }
      .margin({ top: Style.HEADER_ROW_MARGIN_TOP })

      Row() {
        Text(`${this.headerDate.weatherType} `)
          .fontColor($r('app.color.white'))
          .fontWeight(FontWeight.Medium)
          .fontSize(Style.FONT_SIZE_MEDIUM)
        Text($r('app.string.air'))
          .fontColor($r('app.color.white'))
          .fontWeight(FontWeight.Medium)
          .fontSize(Style.FONT_SIZE_MEDIUM)
        Text(this.headerDate.airData.airDesc)
          .fontColor($r('app.color.white'))
          .fontWeight(FontWeight.Medium)
          .fontSize(Style.FONT_SIZE_MEDIUM)
      }
      .margin({ top: Style.HEADER_ROW_MARGIN_TOP })

      Row() {
        Image($r('app.media.icon_message'))
          .width(Style.ICON_SIZE_NORMAL)
          .height(Style.ICON_SIZE_NORMAL)
          .objectFit(ImageFit.Contain)
        Text(this.headerDate.airTips)
          .fontColor($r('app.color.white'))
          .fontSize(Style.FONT_SIZE_SMALL)
          .margin({ left: Style.AIR_TIPS_ICON_MARGIN_LEFT })
      }
      .width('100%')
      .margin({ top: Style.AIR_TIPS_MARGIN_TOP })
    }
    .width('100%')
    .margin({ top: Style.HEADER_CONTENT_MARGIN_TOP })
  }
}