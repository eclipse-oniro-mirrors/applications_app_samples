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

import { AssetPath, City, getSideBg, MyDataSource, StorageKeys, Style } from '@ohos/common'

@Component
export default struct SideContent {
  @StorageLink('cityList') @Watch('cityListChange') cities: Array<City> = []
  @StorageLink('swiperIndex') swiperIndex: number = 0
  private cityList: MyDataSource<City> = new MyDataSource(this.cities)
  @Link showSideBar: boolean

  @Builder header() {
    Row() {
      Blank()
      Image($r('app.media.icon_subarea'))
        .id('cancelSubarea')
        .size({ width: Style.ICON_SIZE_NORMAL, height: Style.ICON_SIZE_NORMAL })
        .objectFit(ImageFit.Contain)
        .onClick(() => {
          this.showSideBar = !this.showSideBar
        })
    }
    .width('100%')

    Text($r('app.string.weather'))
      .fontColor($r('app.color.white'))
      .fontSize(Style.FONT_SIZE_DISPLAY)
      .fontWeight(FontWeight.Medium)
      .width('100%')
    Search({ placeholder: $r('app.string.search_placeholder'), icon: AssetPath.SEARCH_ICON })
      .placeholderFont({ size: Style.FONT_SIZE_MEDIUM })
      .placeholderColor($r('app.color.text_white_38'))
      .width('100%')
      .backgroundColor($r('app.color.search_background'))
      .margin({ top: Style.SEARCH_MARGIN_TOP })
      .borderRadius(Style.SEARCH_RADIUS)
  }

  build() {
    Column({ space: Style.NORMAL_SPACE }) {
      this.header()
      List({ space: Style.NORMAL_SPACE }) {
        LazyForEach(this.cityList, (item: City, index: number) => {
          ListItem() {
            CityItem({ cityInfo: item, index: index })
          }
          .id(`sliderCity${index}`)
          .onClick(() => {
            this.swiperIndex = index
            AppStorage.setOrCreate(StorageKeys.SWIPER_INDEX, index)
          })
        }, (item: City) => item.name)
      }
      .margin({ top: Style.CITY_LIST_MARGIN_TOP })
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .padding(Style.NORMAL_PADDING)
    .backgroundColor($r('app.color.sidebar_mask'))
  }

  cityListChange() {
    this.cityList.setData(this.cities)
    this.cityList.notifyDataReload()
  }
}

@Component
struct CityItem {
  @Prop cityInfo: City
  @Prop index: number
  @StorageLink('swiperIndex') swiperIndex: number = 0

  build() {
    Row() {
      Text(this.cityInfo.name)
        .fontColor($r('app.color.white'))
        .fontSize(Style.FONT_SIZE_HEADLINE)
      if (this.index === 0) {
        Image($r('app.media.icon_location'))
          .size({ width: Style.ICON_SIZE_SMALL, height: Style.ICON_SIZE_SMALL })
          .objectFit(ImageFit.Contain)
      }
      Blank()
      Column() {
        Row() {
          Text(this.cityInfo.temp)
            .fontColor($r('app.color.white'))
            .fontWeight(Style.BIG_FONT_WEIGHT)
            .fontSize(Style.FONT_SIZE_CITY_TEMP)
          Text($r('app.string.du'))
            .fontColor($r('app.color.white'))
            .fontSize(Style.FONT_SIZE_TITLE)
            .margin({ bottom: Style.CITY_SIDE_TEMP_UNIT_MARGIN_BOTTOM })
        }

        Text(this.cityInfo.weather)
          .fontColor($r('app.color.white'))
          .fontSize(Style.FONT_SIZE_NORMAL)
      }
    }
    .width('100%')
    .height(Style.CITY_SIDE_CARD_HEIGHT)
    .alignItems(VerticalAlign.Center)
    .padding(Style.NORMAL_PADDING)
    .border({
      radius: Style.NORMAL_RADIUS,
      width: Style.DIVIDER_WIDTH,
      color: this.swiperIndex === this.index ? $r('app.color.border_selected') : $r('app.color.border_unselected')
    })
    .alignItems(VerticalAlign.Center)
    .backgroundImageSize(ImageSize.Cover)
    .backgroundImage(getSideBg(this.cityInfo.weather))
  }
}
