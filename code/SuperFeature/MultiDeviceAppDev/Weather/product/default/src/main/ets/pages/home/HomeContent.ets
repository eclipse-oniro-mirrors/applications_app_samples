/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import AirQuality from './AirQuality'
import HoursWeather from './HoursWeather'
import IndexHeader from './IndexHeader'
import IndexEnd from './IndexEnd'
import LifeIndex from './LifeIndex'
import MultidayWeather from './MultidayWeather'
import SunCanvas from './SunCanvas'
import {
  CityListData,
  StorageKeys,
  Style,
  getCityListWeatherData
} from '@ohos/common'

@Component
export default struct HomeContent {
  // 默认取首条城市数据，父组件传入时会被覆盖，避免下游使用非空断言
  private cityListData: CityListData = getCityListWeatherData()[0]
  private index: number = 1
  private scroller: Scroller = new Scroller()
  @Prop showSideBar: boolean
  @StorageLink('titleText') titleText: string[] = []
  @StorageLink('swiperIndex') swiperIndex: number = 0
  @State headerOpacity: number = 1

  build() {
    Scroll(this.scroller) {
      GridRow({
        columns: {
          xs: Style.GRID_COLUMN_XS,
          sm: Style.GRID_COLUMN_SM,
          md: Style.GRID_COLUMN_MD,
          lg: this.showSideBar ? Style.GRID_COLUMN_LG_WITH_SIDEBAR : Style.GRID_COLUMN_LG
        },
        gutter: { x: Style.GRID_GUTTER, y: Style.GRID_GUTTER },
        breakpoints: { reference: BreakpointsReference.WindowSize } }) {
        GridCol({
          span: {
            xs: Style.GRID_COLUMN_XS,
            sm: Style.GRID_COLUMN_SM,
            md: Style.GRID_COLUMN_MD,
            lg: this.showSideBar ? Style.GRID_COLUMN_LG_WITH_SIDEBAR : Style.GRID_COLUMN_LG
          },
          order: 0
        }) {
          IndexHeader({ headerDate: this.cityListData.header, index: this.index })
            .opacity(this.headerOpacity)
        }

        GridCol({
          span: {
            xs: Style.GRID_COLUMN_XS,
            sm: Style.GRID_COLUMN_SM,
            md: Style.GRID_COLUMN_MD,
            lg: Style.GRID_COLUMN_LG_WITH_SIDEBAR
          },
          order: 1
        }) {
          HoursWeather({ hoursData: this.cityListData.hoursData })
        }

        GridCol({ span: 4, order: { xs: 2, sm: 2, md: 2, lg: this.showSideBar ? 2 : 3 } }) {
          MultidayWeather({ weekData: this.cityListData.weekData })
        }

        GridCol({ span: 4, order: { xs: 3, sm: 3, md: 3, lg: this.showSideBar ? 3 : 2 } }) {
          AirQuality({ airData: this.cityListData.airData, airIndexData: this.cityListData.airIndex })
        }

        GridCol({ span: 4, order: 4 }) {
          LifeIndex({ lifeData: this.cityListData.suitDate })
        }

        GridCol({ span: 4, order: 5 }) {
          SunCanvas()
        }

        GridCol({
          span: {
            xs: Style.GRID_COLUMN_XS,
            sm: Style.GRID_COLUMN_SM,
            md: Style.GRID_COLUMN_MD,
            lg: this.showSideBar ? Style.GRID_COLUMN_LG_WITH_SIDEBAR : Style.GRID_COLUMN_LG
          },
          order: 6
        }) {
          IndexEnd()
        }
      }
    }
    .id(`homeContent${this.index}`)
    .width('100%')
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .onScroll(() => {
      const offsetY: number = this.scroller.currentOffset().yOffset
      this.headerOpacity = 1 - (offsetY - Style.SCROLL_FADE_START) / Style.SCROLL_FADE_DISTANCE
      if (offsetY > Style.SCROLL_FADE_START) {
        if (this.titleText[this.index] !== this.cityListData.header.city) {
          this.titleText[this.index] = this.cityListData.header.city
          AppStorage.setOrCreate(StorageKeys.TITLE_TEXT, this.titleText)
        }
      } else if (offsetY < Style.SCROLL_FADE_START) {
        if (this.titleText[this.index] !== '') {
          this.titleText[this.index] = ''
          AppStorage.setOrCreate(StorageKeys.TITLE_TEXT, this.titleText)
        }
      }
    })
  }
}