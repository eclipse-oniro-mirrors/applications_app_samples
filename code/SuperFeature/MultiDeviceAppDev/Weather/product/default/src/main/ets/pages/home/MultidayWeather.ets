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

import { getWeekWeatherData, MyDataSource, WeekWeather, Style, WeatherSymbol } from '@ohos/common'

@Preview
@Component
export default struct MultidayWeather {
  private weekData: WeekWeather[] = getWeekWeatherData(0)
  @State weekDataResource: MyDataSource<WeekWeather> = new MyDataSource(this.weekData)

  build() {
    List() {
      LazyForEach(this.weekDataResource, (item: WeekWeather, index: number) => {
        ListItem() {
          DayWeatherItem({weatherInfo: item, index: index})
            .opacity(index === 0 ? Style.OPACITY_SECONDARY : 1)
            .width(Style.WEATHER_ITEM_WIDTH)
            .padding({ top: Style.DAY_ITEM_PADDING_TOP, bottom: Style.DAY_ITEM_PADDING_BOTTOM })
        }
      }, (item: WeekWeather) => item.week)
    }
    .width('100%')
    .height(Style.CARD_HEIGHT)
    .listDirection(Axis.Horizontal)
    .borderRadius(Style.NORMAL_RADIUS)
    .backgroundColor(Style.CARD_BACKGROUND_COLOR)
  }

  aboutToAppear() {
    this.weekDataResource.setData(this.weekData)
  }
}

@Component
struct DayWeatherItem {
  @Prop index: number
  @Prop weatherInfo: WeekWeather

  build() {
    Column() {
      Text(this.index === 0 ? $r('app.string.yestoday') : this.index === 1 ? $r('app.string.today') : this.weatherInfo.week)
        .fontSize(Style.FONT_SIZE_SMALL)
        .fontColor($r('app.color.white'))
      Text(this.weatherInfo.date)
        .fontSize(Style.FONT_SIZE_TINY)
        .fontColor($r('app.color.white'))
        .margin({ top: Style.DAY_DATE_MARGIN_TOP })
      Row() {
        Image(this.weatherInfo.icon)
          .width(Style.ICON_SIZE_LARGE)
          .height(Style.ICON_SIZE_LARGE)
          .objectFit(ImageFit.Contain)
      }
      .margin({ top: Style.DAY_ICON_MARGIN_TOP })
      .justifyContent(FlexAlign.Center)

      Text(this.weatherInfo.weather)
        .fontSize(Style.FONT_SIZE_SMALL)
        .fontColor($r('app.color.white'))
        .margin({ top: Style.DAY_WEATHER_MARGIN_TOP })
      Text(`${this.weatherInfo.min}${WeatherSymbol.DEGREE}${WeatherSymbol.TEMP_DASH}${this.weatherInfo.max}${WeatherSymbol.DEGREE}`)
        .fontSize(Style.FONT_SIZE_NORMAL)
        .fontColor($r('app.color.white'))
        .margin({ top: Style.DAY_TEMP_MARGIN_TOP })
      Text(this.weatherInfo.airLevel)
        .fontSize(Style.FONT_SIZE_TINY)
        .fontColor($r('app.color.white'))
        .margin({ top: Style.DAY_AIR_MARGIN_TOP })
        .backgroundColor($r('app.color.tag_background'))
        .width(Style.AIR_TAG_WIDTH)
        .height(Style.AIR_TAG_HEIGHT)
        .textAlign(TextAlign.Center)
        .borderRadius(Style.TAG_RADIUS)
    }
  }
}