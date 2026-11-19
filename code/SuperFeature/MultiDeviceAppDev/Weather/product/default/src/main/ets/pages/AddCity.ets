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

import { router } from '@kit.ArkUI'
import { addCity, City, getCityList, MyDataSource, StorageKeys, Style } from '@ohos/common'

@Entry
@Component
struct AddCity {
  build() {
    Column() {
      Row() {
        Image($r('app.media.icon_back'))
          .width(Style.ICON_SIZE_NORMAL)
          .margin({ left: Style.BACK_ICON_MARGIN })
          .objectFit(ImageFit.Contain)
          .onClick(() => {
            router.back()
          })
        Text($r('app.string.add_city'))
          .fontSize(Style.FONT_SIZE_TITLE)
          .margin({ left: Style.NORMAL_MARGIN })
      }
      .width('100%')
      .height(Style.TITLE_BAR_HEIGHT)

      Scroll() {
        CityGrid()
      }
      .layoutWeight(1)
      .margin({ top: Style.CITY_GRID_MARGIN_TOP })
      .scrollBar(BarState.Off)
    }
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}

@Component
export struct CityGrid {
  @StorageLink('cityList') cities: Array<City> = []
  private cityList: MyDataSource<City> = new MyDataSource(getCityList())

  build() {
    GridRow({ columns: { sm: Style.GRID_COLUMN_SM, md: Style.GRID_COLUMN_MD, lg: Style.GRID_COLUMN_LG },
      breakpoints: { reference: BreakpointsReference.WindowSize } }) {
      GridCol({
        span: { sm: 4, md: 6, lg: 8 },
        offset: { sm: 0, md: 1, lg: 2 } }) {
        GridRow({ columns: { sm: Style.HOT_CITY_COLUMN_SM, md: Style.HOT_CITY_COLUMN_MD, lg: Style.HOT_CITY_COLUMN_LG },
          gutter: { x: vp2px(Style.HOT_CITY_GUTTER_X), y: vp2px(Style.HOT_CITY_GUTTER_Y) },
          breakpoints: { reference: BreakpointsReference.WindowSize } }) {
          GridCol({ span: { sm: Style.HOT_CITY_COLUMN_SM, md: Style.HOT_CITY_COLUMN_MD, lg: Style.HOT_CITY_COLUMN_LG } }) {
            Text($r('app.string.hot_city'))
              .width('100%')
              .fontSize(Style.FONT_SIZE_NORMAL)
              .fontWeight(FontWeight.Regular)
              .fontColor($r('app.color.text_secondary'))
              .margin({ bottom: Style.NORMAL_MARGIN })
          }

          LazyForEach(this.cityList, (item: City) => {
            GridCol({ span: 1 }) {
              Column() {
                Text(item.name)
                  .fontSize(Style.FONT_SIZE_NORMAL)
                  .fontColor(this.isCityAdded(item) ? $r('app.color.text_disabled') : $r('app.color.text_primary'))
              }
              .width('100%')
              .height(Style.CITY_CHIP_HEIGHT)
              .backgroundColor(this.isCityAdded(item) ? $r('app.color.chip_background_disabled') :
                $r('app.color.chip_background'))
              .justifyContent(FlexAlign.Center)
              .borderRadius(Style.CITY_TEXT_RADIUS)
              .onClick(() => {
                if (!this.isCityAdded(item)) {
                  addCity(item)
                  AppStorage.setOrCreate(StorageKeys.IS_REFRESH, true)
                  router.back()
                }
              })
            }
          }, (item: City) => item.name)
        }
      }
      .height('100%')
    }
    .padding({ left: Style.NORMAL_PADDING, right: Style.NORMAL_PADDING })
  }

  isCityAdded(city: City) {
    let isAdded: boolean = false
    this.cities.forEach(item => {
      if (item.name === city.name) {
        isAdded = true
      }
    })
    return isAdded
  }
}