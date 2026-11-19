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

import { BreakpointConstants, Forecast, getHoursData, MyDataSource, Style } from '@ohos/common'

@Preview
@Component
export default struct HoursWeather {
  private hoursData: Forecast[] = getHoursData(0)
  @StorageLink('curBp') curBp: string = BreakpointConstants.LG
  @State hoursDataResource: MyDataSource<Forecast> = new MyDataSource(this.hoursData)

  @Builder HoursWeatherItem(hoursItem: Forecast, itemWidth: number) {
    Column() {
      Text(`${hoursItem.desc}${hoursItem.date}`)
        .fontSize(Style.FONT_SIZE_SMALL)
        .fontColor($r('app.color.white'))
      Row() {
        Image(hoursItem.icon)
          .width(Style.ICON_SIZE_LARGE)
          .height(Style.ICON_SIZE_LARGE)
          .objectFit(ImageFit.Contain)
      }
      .margin({ top: Style.HOURS_ICON_MARGIN_TOP })
      .justifyContent(FlexAlign.Center)

      Text(hoursItem.degree)
        .fontSize(Style.FONT_SIZE_NORMAL)
        .fontColor($r('app.color.white'))
        .margin({ top: Style.HOURS_TEXT_MARGIN_TOP })
      Text(hoursItem.win)
        .fontSize(Style.FONT_SIZE_SMALL)
        .fontColor($r('app.color.white'))
        .margin({ top: Style.HOURS_TEXT_MARGIN_TOP })
      Text(hoursItem.winSpeed)
        .fontSize(Style.FONT_SIZE_SMALL)
        .fontColor($r('app.color.white'))
        .margin({ top: Style.HOURS_SPEED_MARGIN_TOP })
    }
    .width(itemWidth)
    .padding({ top: Style.HOURS_ITEM_PADDING, bottom: Style.HOURS_ITEM_PADDING })
  }

  build() {
    List() {
      LazyForEach(this.hoursDataResource, (hoursItem: Forecast) => {
        ListItem() {
          this.HoursWeatherItem(hoursItem,
            this.curBp === BreakpointConstants.LG ? Style.WEATHER_ITEM_WIDTH + Style.WEATHER_ITEM_EXTRA_WIDTH :
              Style.WEATHER_ITEM_WIDTH)
        }
      }, (item: Forecast) => `${item.desc}${item.date}:00`)
    }
    .width('100%')
    .height(Style.CARD_HEIGHT)
    .borderRadius(Style.NORMAL_RADIUS)
    .backgroundColor(Style.CARD_BACKGROUND_COLOR)
    .listDirection(Axis.Horizontal)
  }

  aboutToAppear() {
    this.hoursDataResource.setData(this.hoursData)
  }
}