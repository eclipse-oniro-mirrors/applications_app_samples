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

import { songsList } from '../model/DataSummary';
import { IconItem, PaddingDataType } from '../model/DataType';
import { MusicPlayer } from '../pages/Index';
import { BreakpointType } from './BreakpointSystem';
import {
  BannerConstants,
  BreakpointConstants,
  ListModuleConstants,
  RecommendPageConstants,
  SongGridConstants
} from './Constants';
import TitleBar from './TitleBar';

@Component
export default struct RecommendPage {
  @LocalStorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.MD;
  @State bannerList: Resource[] = [
  $r('app.media.banner1'),
  $r('app.media.banner2'),
  $r('app.media.banner3'),
  ];

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        TitleBar()

        Column() {
          Scroll() {
            Column() {
              Row() {
                if (this.currentBreakpoint === BreakpointConstants.LG) {
                  BannerColumn({ bannerList: $bannerList })
                } else {
                  BannerSwiper({ bannerList: $bannerList })
                }
              }.margin({ top: RecommendPageConstants.BANNER_TOP_MARGIN })

              ListModule().margin({ top: RecommendPageConstants.MODULE_TOP_MARGIN })

              SongList().margin({ top: RecommendPageConstants.SONG_LIST_TOP_MARGIN })
            }
          }.scrollBar(BarState.Off)
        }.layoutWeight(1)
      }
      .justifyContent(FlexAlign.Start)
      .height('100%')
      .padding(new BreakpointType(
        new PaddingDataType(RecommendPageConstants.PADDING, RecommendPageConstants.PADDING),
        new PaddingDataType(RecommendPageConstants.PADDING, RecommendPageConstants.PADDING),
        new PaddingDataType(RecommendPageConstants.PADDING_LG, RecommendPageConstants.PADDING_LG))
        .getValue(this.currentBreakpoint))

      if (this.currentBreakpoint !== BreakpointConstants.LG) {
        MusicPlayer()
      }
    }.backgroundColor($r('app.color.page_background'))
  }
}

@Component
struct BannerColumn {
  @Link bannerList: Resource[];

  build() {
    Row({ space: BannerConstants.COLUMN_SPACE }) {
      Image(this.bannerList[0])
        .borderRadius(BannerConstants.BORDER_RADIUS)
        .height(BannerConstants.MAIN_HEIGHT)
        .width(BannerConstants.MAIN_WIDTH)
      Column({ space: BannerConstants.COLUMN_ITEM_SPACE }) {
        Image(this.bannerList[1])
          .height(BannerConstants.SIDE_HEIGHT)
          .borderRadius(BannerConstants.BORDER_RADIUS)
          .width(BannerConstants.SIDE_WIDTH)
        Image(this.bannerList[2])
          .height(BannerConstants.SIDE_HEIGHT)
          .borderRadius(BannerConstants.BORDER_RADIUS)
          .width(BannerConstants.SIDE_WIDTH)
      }
    }.width('100%')
  }
}

@Component
struct SongList {
  @State data: IconItem[] = songsList;
  @LocalStorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.MD;
  @State gridHeight: number = SongGridConstants.DEFAULT_HEIGHT;

  build() {
    Column() {
      Row() {
        Text($r('app.string.singRecommend'))
          .fontWeight(FontWeight.Medium)
          .fontSize(SongGridConstants.TITLE_FONT_SIZE)
        Blank()
        Text($r('app.string.more'))
          .fontColor($r('sys.color.ohos_id_color_text_secondary'))
          .fontWeight(FontWeight.Regular)
          .fontSize(SongGridConstants.ACTION_FONT_SIZE)
        Image($r('app.media.ic_public_arrow_right'))
          .height(SongGridConstants.ARROW_HEIGHT)
          .opacity(SongGridConstants.ARROW_OPACITY)
          .width(SongGridConstants.ARROW_WIDTH)
      }
      .height(SongGridConstants.HEADER_HEIGHT)
      .width('100%')

      Grid() {
        ForEach(this.data, (item: IconItem) => {
          GridItem() {
            Column() {
              Stack({ alignContent: Alignment.BottomStart }) {
                Image(item.imageSrc).width('100%').aspectRatio(1)
                Image($r('app.media.play'))
                  .offset({ x: SongGridConstants.PLAY_ICON_OFFSET_X, y: SongGridConstants.PLAY_ICON_OFFSET_Y })
                  .aspectRatio(1)
                  .height(SongGridConstants.PLAY_ICON_SIZE)
              }

              Text(item.description)
                .textOverflow({ overflow: TextOverflow.Clip })
                .maxLines(2)
                .fontWeight(FontWeight.Regular)
                .fontSize(SongGridConstants.LABEL_FONT_SIZE)
                .margin({ top: SongGridConstants.LABEL_TOP_MARGIN })
                .height(SongGridConstants.LABEL_HEIGHT)
            }.onAreaChange((oldArea: Area, newArea: Area) => {
              let value = new BreakpointType(
                SongGridConstants.COLUMNS_SM,
                SongGridConstants.COLUMNS_MD,
                SongGridConstants.COLUMNS_LG).getValue(this.currentBreakpoint);
              if (value) {
                let rowNum = Math.ceil(this.data.length / value);
                let itemHeight = Number(newArea.height);
                let rowGap = SongGridConstants.ROW_GAP;
                this.gridHeight = (rowGap + itemHeight) * rowNum - rowGap;
                if (this.currentBreakpoint !== BreakpointConstants.LG) {
                  this.gridHeight += SongGridConstants.PLAYER_EXTRA_HEIGHT;
                }
              }
            })
          }.width('100%')
        })
      }
      .rowsGap(SongGridConstants.ROW_GAP)
      .columnsGap(SongGridConstants.COLUMN_GAP)
      .height(this.gridHeight)
      .width('100%')
      .columnsTemplate(new BreakpointType(
        SongGridConstants.COLUMNS_TEMPLATE_SM,
        SongGridConstants.COLUMNS_TEMPLATE_MD,
        SongGridConstants.COLUMNS_TEMPLATE_LG,
      ).getValue(this.currentBreakpoint))
    }
  }
}

@Component
struct ListModule {
  @LocalStorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.MD;
  @State data: IconItem[] = [
    new IconItem($r('app.media.ic_music_privatefm'), $r('app.string.privacy')),
    new IconItem($r('app.media.ic_music_singer'), $r('app.string.singer')),
    new IconItem($r('app.media.ic_music_songsheet'), $r('app.string.singList')),
    new IconItem($r('app.media.ic_music_ranking'), $r('app.string.rank')),
    new IconItem($r('app.media.ic_music_musicfm'), $r('app.string.musicFM')),
    new IconItem($r('app.media.ic_music_hires'), $r('app.string.hiRes')),
    new IconItem($r('app.media.ic_music_children'), $r('app.string.child')),
    new IconItem($r('app.media.ic_music_Album'), $r('app.string.digital')),
  ];

  build() {
    List({
      space: new BreakpointType(
        ListModuleConstants.SPACE_SM,
        ListModuleConstants.SPACE_MD,
        ListModuleConstants.SPACE_LG).getValue(this.currentBreakpoint)
    }) {
      ForEach(this.data, (item: IconItem) => {
        ListItem() {
          Column() {
            Image(item.imageSrc).height(ListModuleConstants.ICON_SIZE).width(ListModuleConstants.ICON_SIZE)
            Text(item.description)
              .margin({ top: ListModuleConstants.LABEL_TOP_MARGIN })
              .fontSize(ListModuleConstants.LABEL_FONT_SIZE)
          }.height(ListModuleConstants.ITEM_SIZE).width(ListModuleConstants.ITEM_SIZE)
        }
      })
    }
    .scrollBar(BarState.Off)
    .height(ListModuleConstants.HEIGHT)
    .listDirection(Axis.Horizontal)
  }
}

@Component
struct BannerSwiper {
  @Link bannerList: Resource[];
  @LocalStorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.MD;

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: Resource) => {
        Image(item)
          .backgroundColor($r('app.color.banner_placeholder_background'))
          .borderRadius(BannerConstants.SWIPER_BORDER_RADIUS)
          .height('100%')
          .width('100%')
      })
    }
    .height(BannerConstants.SWIPER_HEIGHT)
    .loop(true)
    .indicatorStyle({ selectedColor: $r('app.color.common_white') })
    .indicator(new BreakpointType(true, false, false).getValue(this.currentBreakpoint))
    .displayCount(new BreakpointType(
      BannerConstants.SWIPER_DISPLAY_COUNT_SM,
      BannerConstants.SWIPER_DISPLAY_COUNT_MD,
      BannerConstants.SWIPER_DISPLAY_COUNT_LG).getValue(this.currentBreakpoint))
    .itemSpace(BannerConstants.SWIPER_ITEM_SPACE)
    .cachedCount(BannerConstants.SWIPER_CACHED_COUNT)
  }
}
