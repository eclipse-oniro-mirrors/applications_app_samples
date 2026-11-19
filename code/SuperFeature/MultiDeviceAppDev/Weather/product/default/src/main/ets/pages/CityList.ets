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
import { BreakpointConstants, City, getSideBg, MyDataSource, RouteConstants, Style } from '@ohos/common'

@Entry
@Component
struct CityList {
  @StorageLink('cityList') cities: Array<City> = []
  @StorageLink('curBp') curBp: string = BreakpointConstants.LG
  private cityList: MyDataSource<City> = new MyDataSource(this.cities)

  getOffsetMD(index: number) {
    if (index === 0) {
      return 1
    }
    if (index % 2 === 0) {
      return 2
    }
    return 0
  }

  getOffsetLG(index: number) {
    if (index === 0) {
      return 2
    }
    if (index % 2 === 0) {
      return 4
    }
    return 0
  }

  @Builder CityInfo(item: City, index: number) {
    Row() {
      Text(item.name)
        .fontColor($r('app.color.white'))
        .fontSize(Style.FONT_SIZE_TITLE)
      if (index === 0) {
        Image($r('app.media.icon_location'))
          .size({ width: Style.ICON_SIZE_SMALL, height: Style.ICON_SIZE_SMALL })
          .objectFit(ImageFit.Contain)
      }
      Blank()
      Column() {
        Row() {
          Text(item.temp)
            .fontColor($r('app.color.white'))
            .fontWeight(Style.BIG_FONT_WEIGHT)
            .fontSize(Style.FONT_SIZE_TEMP)
          Text($r('app.string.du'))
            .fontColor($r('app.color.white'))
            .fontSize(Style.FONT_SIZE_MEDIUM)
            .margin({ bottom: Style.CITY_TEMP_UNIT_MARGIN_BOTTOM })
        }

        Text(item.weather)
          .fontColor($r('app.color.white'))
          .fontSize(Style.FONT_SIZE_SMALL)
      }
    }
    .width('100%')
    .height(Style.CITY_CARD_HEIGHT)
    .alignItems(VerticalAlign.Center)
    .padding(Style.NORMAL_PADDING)
    .borderRadius(Style.NORMAL_RADIUS)
    .alignItems(VerticalAlign.Center)
    .backgroundImageSize(ImageSize.Cover)
    .backgroundImage(getSideBg(item.weather))
  }

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
        Text($r('app.string.manage_city'))
          .fontSize(Style.FONT_SIZE_TITLE)
          .margin({ left: Style.NORMAL_MARGIN })
      }
      .width('100%')
      .height(Style.TITLE_BAR_HEIGHT)

      Scroll() {
        GridRow({
          columns: { sm: Style.GRID_COLUMN_SM, md: Style.GRID_COLUMN_MD, lg: Style.GRID_COLUMN_LG },
          gutter: { x: Style.GRID_GUTTER, y: Style.GRID_GUTTER }
        }) {
          LazyForEach(this.cityList, (item: City, index: number) => {
            GridCol({ span: {sm: 4, md: 3, lg: 4},
              offset: {sm: 0, md: this.getOffsetMD(index), lg: this.getOffsetLG(index)}}) {
              this.CityInfo(item, index)
            }
          }, (item: City) => item.name)
        }
      }
      .layoutWeight(1)
      .margin({ top: Style.NORMAL_SPACE })
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
      .padding({ left: Style.NORMAL_PADDING, right: Style.NORMAL_PADDING })

      Column() {
        Image($r('app.media.icon_add'))
          .width(Style.ICON_SIZE_NORMAL)
          .height(Style.ICON_SIZE_NORMAL)
          .objectFit(ImageFit.Contain)
        Text($r('app.string.add_city'))
          .fontSize(Style.FONT_SIZE_TINY)
      }
      .id('addCity')
      .justifyContent(FlexAlign.Center)
      .padding({ bottom: this.curBp === BreakpointConstants.LG ? Style.ADD_CITY_BOTTOM_LG : Style.ADD_CITY_BOTTOM })
      .onClick(() => {
        router.pushUrl({ url: RouteConstants.ADD_CITY })
      })
    }
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }

  onPageShow() {
    this.cityList.setData(this.cities)
    this.cityList.notifyDataReload()
  }
}