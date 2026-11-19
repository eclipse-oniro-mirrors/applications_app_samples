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

import { BreakpointType } from '../common/BreakpointSystem';
import { StyleConfiguration } from '../common/Configuration';
import {
  BreakpointKey,
  Color,
  Dimen,
  DimenText,
  FontSize,
  GridColumns,
  ListSpacing,
  Radius,
  Spacing,
  SwiperConfig
} from '../common/Constants';

class ItemType {
  name: Resource;
  src: Resource;

  constructor(name: Resource, src: Resource) {
    this.name = name;
    this.src = src;
  }
}

@Component
export struct RecommendationList {
  @LocalStorageProp("currentBreakpoint") currentBreakpoint: string = BreakpointKey.MD;
  @State bannerList: Resource[] = [
  $r('app.media.ic_public_swiper1'),
  $r('app.media.ic_public_swiper2'),
  $r('app.media.ic_public_swiper3'),
  ];
  @State gridList: ItemType[] = [
    new ItemType($r('app.string.category'), $r('app.media.entrances')),
    new ItemType($r('app.string.rank'), $r('app.media.entrances2')),
    new ItemType($r('app.string.quickApp'), $r('app.media.entrances4')),
    new ItemType($r('app.string.garden'), $r('app.media.entrances5')),
    new ItemType($r('app.string.education'), $r('app.media.entrances6')),
  ];
  @State appIconList: ItemType[] = [
    new ItemType($r('app.string.double'), $r('app.media.ic_public_app1')),
    new ItemType($r('app.string.photoEditing'), $r('app.media.ic_public_app2')),
    new ItemType($r('app.string.mathematicsSquare'), $r('app.media.ic_public_app3')),
    new ItemType($r('app.string.carefree'), $r('app.media.ic_public_app4')),
    new ItemType($r('app.string.explorer'), $r('app.media.ic_public_app5')),
    new ItemType($r('app.string.double'), $r('app.media.ic_public_app6')),
    new ItemType($r('app.string.photoEditing'), $r('app.media.ic_public_app7')),
    new ItemType($r('app.string.mathematicsSquare'), $r('app.media.ic_public_app8')),
    new ItemType($r('app.string.carefree'), $r('app.media.ic_public_app9')),
    new ItemType($r('app.string.double'), $r('app.media.ic_public_app10')),
  ];
  @State gameIconList: ItemType[] = [
    new ItemType($r('app.string.romance'), $r('app.media.ic_public_game1')),
    new ItemType($r('app.string.dreaming'), $r('app.media.ic_public_game2')),
    new ItemType($r('app.string.ambush'), $r('app.media.ic_public_game3')),
    new ItemType($r('app.string.dreaming'), $r('app.media.ic_public_game4')),
    new ItemType($r('app.string.ambush'), $r('app.media.ic_public_game5')),
    new ItemType($r('app.string.romance'), $r('app.media.ic_public_game6')),
    new ItemType($r('app.string.ambush'), $r('app.media.ic_public_game7')),
    new ItemType($r('app.string.dreaming'), $r('app.media.ic_public_game8')),
    new ItemType($r('app.string.ambush'), $r('app.media.ic_public_game9')),
    new ItemType($r('app.string.romance'), $r('app.media.ic_public_game10')),
  ];

  @Builder
  Banner() {
    Swiper() {
      ForEach(this.bannerList, (item: Resource) => {
        Image(item).width(DimenText.FULL).height(DimenText.FULL).borderRadius(Radius.MD)
          .backgroundColor(Color.IMAGE_PLACEHOLDER)
      })
    }
    .cachedCount(SwiperConfig.CACHED_COUNT)
    .itemSpace(SwiperConfig.ITEM_SPACE)
    .displayCount(new BreakpointType(SwiperConfig.DISPLAY_COUNT_SM, SwiperConfig.DISPLAY_COUNT_MD,
      SwiperConfig.DISPLAY_COUNT_LG).GetValue(this.currentBreakpoint))
    .indicator(new BreakpointType(true, false, false).GetValue(this.currentBreakpoint))
    .indicatorStyle({ selectedColor: Color.CONTENT_BACKGROUND })
    .loop(true)
    .height(StyleConfiguration.getBreakpointStyle(this.currentBreakpoint).recommendCompGridItemHeight)
  }

  @Builder
  ApplicationList(data: ItemType[]) {
    List({
      space: new BreakpointType(ListSpacing.SM, ListSpacing.MD, ListSpacing.LG).GetValue(this.currentBreakpoint)
    }) {
      ForEach(data, (item: ItemType) => {
        ListItem() {
          Column() {
            Image(item.src).width(Dimen.APP_ICON).height(Dimen.APP_ICON)
            Text(item.name).fontSize(FontSize.CAPTION).margin({ top: Spacing.SM })
            Button($r('app.string.install'))
              .fontSize(FontSize.CAPTION)
              .fontColor(Color.PRIMARY)
              .backgroundColor(Color.BUTTON_BACKGROUND)
              .fontWeight(FontWeight.Medium)
              .width(Dimen.INSTALL_BUTTON_WIDTH)
              .height(Dimen.INSTALL_BUTTON_HEIGHT)
              .margin({ top: Spacing.XS })
          }
        }
      })
    }.listDirection(Axis.Horizontal).scrollBar(BarState.Off)
  }

  @Builder
  ApplicationType(desc: Resource) {
    Row() {
      Text(desc).fontSize(FontSize.SECTION_TITLE).fontWeight(FontWeight.Medium)
      Blank()
      Text($r('app.string.more')).fontSize(FontSize.BODY).fontWeight(FontWeight.Regular)
      Image($r('app.media.ic_settings_arrow')).width(Dimen.ARROW_ICON_WIDTH).height(Dimen.ICON)
    }
    .width(DimenText.FULL)
    .height(Dimen.LIST_ITEM_HEIGHT)
    .margin({ top: Spacing.XXS })
  }

  build() {
    Scroll() {
      GridRow({ columns: GridColumns.RECOMMEND }) {
        GridCol({ span: GridColumns.RECOMMEND }) {
          this.Banner()
        }

        GridCol({ span: GridColumns.RECOMMEND }) {
          Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
            ForEach(this.gridList, (item: ItemType) => {
              Column() {
                Image(item.src).width(Dimen.ICON_LARGE).height(Dimen.ICON_LARGE)
                Text(item.name).fontSize(FontSize.CAPTION).fontWeight(FontWeight.Regular).margin({ top: Spacing.XXS })
              }
            })
          }.height(Dimen.GRID_ROW_HEIGHT).margin({ top: Dimen.GRID_ROW_MARGIN_TOP })
        }


        GridCol({ span: GridColumns.RECOMMEND }) {
          this.ApplicationType($r('app.string.excellentGame'))
        }

        GridCol({ span: GridColumns.RECOMMEND }) {
          this.ApplicationList(this.appIconList)
        }

        GridCol({ span: GridColumns.RECOMMEND }) {
          this.ApplicationType($r('app.string.excellentApp'))
        }.margin({ top: Spacing.XXS })

        GridCol({ span: GridColumns.RECOMMEND }) {
          this.ApplicationList(this.gameIconList)
        }

        GridCol({ span: GridColumns.RECOMMEND }) {
          this.ApplicationType($r('app.string.excellentGame'))
        }.margin({ top: Spacing.XXS })

        GridCol({ span: GridColumns.RECOMMEND }) {
          this.Banner()
        }.margin({ top: Spacing.XXS }).layoutWeight(1)
      }
    }.scrollBar(BarState.Off).padding({ bottom: Dimen.CONTENT_MARGIN_BOTTOM })
  }
}
