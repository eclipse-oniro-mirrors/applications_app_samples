/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { BreakpointType } from '../common/BreakpointSystem';
import { BreakpointConstants, MusicPlayerConstants, TabBarConstants } from '../common/Constants';
import RecommendPage from '../common/RecommendPage';
import { UserSongList } from '../common/UserSongList';
import { IconItem } from '../model/DataType';

@Entry
@Component
struct Index {
  tabBarList: IconItem[] = [
    new IconItem($r('app.media.ic_public_home'), $r('app.string.index')),
    new IconItem($r('app.media.ic_radio'), $r('app.string.radio')),
    new IconItem($r('app.media.ic_find'), $r('app.string.discovery')),
    new IconItem($r('app.media.ic_mine'), $r('app.string.mine')),
  ];
  @LocalStorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.SM;
  private controller: TabsController = new TabsController();
  @State currentIndex: number = 0;
  @State selectIconList: Resource[] = [
  $r('app.media.ic_public_home_filled'),
  $r('app.media.ic_radio_h'),
  $r('app.media.ic_find_h'),
  $r('app.media.ic_mine_h'),
  ];

  @Builder
  TabBuilder(index: number) {
    Column() {
      Image(this.currentIndex === index ? this.selectIconList[index] : this.tabBarList[index].imageSrc)
        .height(TabBarConstants.ICON_SIZE).width(TabBarConstants.ICON_SIZE)
      Text(this.tabBarList[index].description)
        .fontColor(this.currentIndex === index ?
          $r('app.color.tab_bar_text_selected') : $r('app.color.tab_bar_text_normal'))
        .margin({ top: TabBarConstants.LABEL_TOP_MARGIN })
        .height(TabBarConstants.LABEL_HEIGHT)
        .fontSize(TabBarConstants.LABEL_FONT_SIZE)
        .lineHeight(TabBarConstants.LABEL_LINE_HEIGHT)
    }
    .justifyContent(FlexAlign.Center)
    .height(TabBarConstants.HEIGHT)
    .width('100%')
    .id('tabs' + index)
  }

  build() {
    GridRow({
      columns: {
        sm: TabBarConstants.GRID_COLUMNS_SM,
        md: TabBarConstants.GRID_COLUMNS_MD,
        lg: TabBarConstants.GRID_COLUMNS_LG
      }
    }) {
      GridCol({
        span: {
          sm: TabBarConstants.GRID_COLUMNS_SM,
          md: TabBarConstants.GRID_COLUMNS_MD,
          lg: TabBarConstants.GRID_COLUMNS_LG
        }
      }) {
        Column() {
          Tabs({
            controller: this.controller,
            barPosition: new BreakpointType(BarPosition.End, BarPosition.End, BarPosition.Start).getValue(this.currentBreakpoint),
            index: this.currentIndex
          }) {
            TabContent() {
              Column() {
                RecommendPage()
              }.height('100%').width('100%')
            }.tabBar(this.TabBuilder(0))

            TabContent() {
              Column()
                .backgroundColor($r('app.color.placeholder_background_blue'))
                .height('100%')
                .width('100%')
            }.tabBar(this.TabBuilder(1))

            TabContent() {
              Column()
                .backgroundColor($r('app.color.placeholder_background_yellow'))
                .height('100%')
                .width('100%')
            }.tabBar(this.TabBuilder(2))

            TabContent() {
              Column() {
                UserSongList()
              }.width('100%').height('100%')
            }.tabBar(this.TabBuilder(3))
          }
          .vertical(new BreakpointType(false, false, true).getValue(this.currentBreakpoint))
          .scrollable(false)
          .layoutWeight(1)
          .backgroundColor($r('sys.color.ohos_id_color_toolbar_sub_bg'))
          .onChange((index: number) => {
            this.currentIndex = index;
          })

          if (this.currentBreakpoint === BreakpointConstants.LG) {
            MusicPlayer()
          }
        }
      }
    }.onBreakpointChange((breakpoint: string) => {
      animateTo({ duration: TabBarConstants.BREAKPOINT_ANIMATION_DURATION, curve: Curve.Smooth }, () => {
        this.currentBreakpoint = breakpoint;
      })
    })
  }
}

@Component
export struct MusicPlayer {
  build() {
    Row() {
      Image($r('app.media.list1')).height(MusicPlayerConstants.COVER_SIZE).width(MusicPlayerConstants.COVER_SIZE)
      Column() {
        Text($r('app.string.player_song_name'))
          .fontColor($r('app.color.player_title_text'))
          .fontWeight(FontWeight.Regular)
          .fontSize(MusicPlayerConstants.TITLE_FONT_SIZE)
        Text($r('app.string.player_artist_name'))
          .opacity(MusicPlayerConstants.ARTIST_OPACITY)
          .fontWeight(FontWeight.Regular)
          .fontSize(MusicPlayerConstants.ARTIST_FONT_SIZE)
      }.margin({ left: MusicPlayerConstants.COVER_LEFT_MARGIN }).alignItems(HorizontalAlign.Start)

      Blank()
      Image($r('app.media.icon_play'))
        .height(MusicPlayerConstants.ICON_SIZE)
        .width(MusicPlayerConstants.ICON_SIZE)
      Image($r('app.media.ic_play'))
        .margin({ left: MusicPlayerConstants.ICON_LEFT_MARGIN })
        .height(MusicPlayerConstants.ICON_SIZE)
        .width(MusicPlayerConstants.ICON_SIZE)
      Image($r('app.media.ic_playList'))
        .margin({ left: MusicPlayerConstants.ICON_LEFT_MARGIN })
        .height(MusicPlayerConstants.ICON_SIZE)
        .width(MusicPlayerConstants.ICON_SIZE)
    }.width('100%')
    .backgroundColor($r('app.color.player_background'))
    .padding({ left: MusicPlayerConstants.HORIZONTAL_PADDING, right: MusicPlayerConstants.HORIZONTAL_PADDING })
    .height(MusicPlayerConstants.HEIGHT)
  }
}
