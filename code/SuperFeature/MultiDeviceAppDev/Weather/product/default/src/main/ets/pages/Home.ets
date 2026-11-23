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

import { mediaquery } from '@kit.ArkUI'
import HomeContent from './home/HomeContent'
import IndexTitleBar from './home/IndexTitleBar'
import SideContent from './home/SideContent'
import {
  BreakpointConstants,
  CityListData,
  StorageKeys,
  Style,
  WeatherType,
  getBg,
  getCityListWeatherData,
  Logger
} from '@ohos/common'

const TAG: string = 'Home'

@Entry
@Component
struct Home {
  @StorageLink('isRefresh') @Watch('refreshChange') isRefresh: boolean = false
  @StorageLink('swiperIndex') swiperIndex: number = 0
  @State curBp: string = BreakpointConstants.MD
  @State cityListWeatherData: CityListData[] = getCityListWeatherData()
  @State popupState: boolean = false
  @State showSideBar: boolean = false
  private smListener: mediaquery.MediaQueryListener = mediaquery.matchMediaSync(BreakpointConstants.SM_QUERY)
  private mdListener: mediaquery.MediaQueryListener = mediaquery.matchMediaSync(BreakpointConstants.MD_QUERY)
  private lgListener: mediaquery.MediaQueryListener = mediaquery.matchMediaSync(BreakpointConstants.LG_QUERY)

  build() {
    SideBarContainer(SideBarContainerType.Embed) {
      SideContent({ showSideBar: $showSideBar })
        .height('100%')
      Column() {
        IndexTitleBar({ showSideBar: $showSideBar })
          .height(Style.TITLE_BAR_HEIGHT)
        Swiper() {
          ForEach(this.cityListWeatherData, (item: CityListData, index: number) => {
            HomeContent({ showSideBar: this.showSideBar, cityListData: item, index: index })
          }, (item: CityListData) => item.city)
        }
        .id('swiper')
        .padding({ left: Style.NORMAL_PADDING, right: Style.NORMAL_PADDING })
        .indicatorStyle({
          selectedColor: $r('app.color.white')
        })
        .onChange(index => {
          this.swiperIndex = index
          AppStorage.setOrCreate(StorageKeys.SWIPER_INDEX, this.swiperIndex)
        })
        .indicator(this.curBp !== BreakpointConstants.LG)
        .index(this.swiperIndex)
        .loop(false)
        .width('100%')
        .layoutWeight(1)
      }
      .height('100%')
    }
    .height('100%')
    .sideBarWidth(Style.SIDE_BAR_WIDTH)
    .minSideBarWidth(Style.SIDE_BAR_WIDTH)
    .maxSideBarWidth(Style.SIDE_BAR_WIDTH)
    .showControlButton(false)
    .showSideBar(this.showSideBar)
    .backgroundImageSize(ImageSize.Cover)
    .backgroundImage(getBg(this.getCurrentWeatherType()))
  }

  aboutToAppear() {
    this.smListener.on('change', this.isBreakpointSM)
    this.mdListener.on('change', this.isBreakpointMD)
    this.lgListener.on('change', this.isBreakpointLG)
  }

  aboutToDisappear() {
    this.smListener.off('change', this.isBreakpointSM)
    this.mdListener.off('change', this.isBreakpointMD)
    this.lgListener.off('change', this.isBreakpointLG)
  }

  // 取当前城市的天气类型，城市列表为空时回退到晴天背景，避免越界
  getCurrentWeatherType(): string {
    const current: CityListData | undefined = this.cityListWeatherData[this.swiperIndex]
    return current ? current.header.weatherType : WeatherType.SUNNY
  }

  isBreakpointSM = (mediaQueryResult: mediaquery.MediaQueryResult): void => {
    if (mediaQueryResult.matches) {
      this.curBp = BreakpointConstants.SM
      this.showSideBar = false
      AppStorage.setOrCreate(StorageKeys.CUR_BP, this.curBp)
      Logger.info(TAG, `this.curBp = ${this.curBp}`)
    }
  }
  isBreakpointMD = (mediaQueryResult: mediaquery.MediaQueryResult): void => {
    if (mediaQueryResult.matches) {
      this.curBp = BreakpointConstants.MD
      this.showSideBar = false
      AppStorage.setOrCreate(StorageKeys.CUR_BP, this.curBp)
      Logger.info(TAG, `this.curBp = ${this.curBp}`)
    }
  }
  isBreakpointLG = (mediaQueryResult: mediaquery.MediaQueryResult): void => {
    if (mediaQueryResult.matches) {
      if (this.curBp !== BreakpointConstants.LG) {
        this.showSideBar = true
      }
      this.curBp = BreakpointConstants.LG
      AppStorage.setOrCreate(StorageKeys.CUR_BP, this.curBp)
      Logger.info(TAG, `this.curBp = ${this.curBp}`)
    }
  }

  refreshChange(): void {
    Logger.info(TAG, 'refreshChange')
    if (this.isRefresh) {
      this.cityListWeatherData = getCityListWeatherData()
      AppStorage.setOrCreate(StorageKeys.IS_REFRESH, false)
    }
    Logger.info(TAG, `refreshChange, this.cityListWeatherData.length = ${this.cityListWeatherData.length}`)
  }
}