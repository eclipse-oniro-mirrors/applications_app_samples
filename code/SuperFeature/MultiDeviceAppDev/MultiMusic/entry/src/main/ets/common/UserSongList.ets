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

import { OffsetDataType, SongType } from '../model/DataType';
import { MusicPlayer } from '../pages/Index';
import { BreakpointType } from './BreakpointSystem';
import { BreakpointConstants, UserSongListConstants } from './Constants';

@Component
export struct UserSongList {
  @LocalStorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.SM;
  @State songList: SongType[] = [
    new SongType($r('app.media.list4'), $r('app.string.emo'), 16),
    new SongType($r('app.media.list12'), $r('app.string.noSleep'), 16),
    new SongType($r('app.media.list11'), $r('app.string.noise'), 16),
    new SongType($r('app.media.list10'), $r('app.string.bluce'), 16),
    new SongType($r('app.media.list9'), $r('app.string.jazz'), 16),
    new SongType($r('app.media.list8'), $r('app.string.coffee'), 24),
    new SongType($r('app.media.list7'), $r('app.string.noon'), 30),
    new SongType($r('app.media.list6'), $r('app.string.sunshine'), 16),
    new SongType($r('app.media.list5'), $r('app.string.sleep'), 18),
    new SongType($r('app.media.list4'), $r('app.string.rock'), 25),
    new SongType($r('app.media.list3'), $r('app.string.pops'), 30),
    new SongType($r('app.media.list2'), $r('app.string.oldYear'), 48),
    new SongType($r('app.media.list1'), $r('app.string.bgm'), 16),
  ];

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Row() {
          Text($r('app.string.mySongs'))
            .fontWeight(FontWeight.Medium)
            .fontSize(UserSongListConstants.TITLE_FONT_SIZE)
            .lineHeight(UserSongListConstants.TITLE_LINE_HEIGHT)
            .height(UserSongListConstants.TITLE_LINE_HEIGHT)
          Blank()
          Image($r('app.media.ic_search'))
            .width(UserSongListConstants.ICON_SIZE)
            .height(UserSongListConstants.ICON_SIZE)
            .margin({ right: UserSongListConstants.ICON_RIGHT_MARGIN })
          Image($r('app.media.ic_more'))
            .width(UserSongListConstants.ICON_SIZE)
            .height(UserSongListConstants.ICON_SIZE)
        }.width('100%').height(UserSongListConstants.HEADER_HEIGHT)

        Row() {
          Text() {
            Span($r('app.string.buildBySelf'))
            Span($r('app.string.build_self_song_count', UserSongListConstants.SELF_BUILD_SONG_COUNT))
          }
          .fontSize(UserSongListConstants.SUBTITLE_FONT_SIZE)
          .height(UserSongListConstants.SUBTITLE_LINE_HEIGHT)
          .lineHeight(UserSongListConstants.SUBTITLE_LINE_HEIGHT)
        }.width('100%').height(UserSongListConstants.SUBTITLE_ROW_HEIGHT)

        Grid() {
          ForEach(this.songList, (item: SongType) => {
            GridItem() {
              Column() {
                Flex({ direction: new BreakpointType(
                  FlexDirection.Row,
                  FlexDirection.Column,
                  FlexDirection.Column,
                ).getValue(this.currentBreakpoint) }) {
                  Stack({ alignContent: new BreakpointType(
                    Alignment.Center,
                    Alignment.BottomStart,
                    Alignment.BottomStart,
                  ).getValue(this.currentBreakpoint) }) {
                    Image(item.imageSrc)
                      .width(new BreakpointType(
                        UserSongListConstants.IMAGE_SIZE,
                        UserSongListConstants.IMAGE_FULL_SIZE,
                        UserSongListConstants.IMAGE_FULL_SIZE).getValue(this.currentBreakpoint))
                      .aspectRatio(1)
                      .borderRadius(UserSongListConstants.IMAGE_BORDER_RADIUS)
                    Image($r('app.media.play'))
                      .height(UserSongListConstants.PLAY_ICON_SIZE)
                      .width(UserSongListConstants.PLAY_ICON_SIZE)
                      .offset(new BreakpointType(
                        new OffsetDataType(0, 0),
                        new OffsetDataType(UserSongListConstants.PLAY_OFFSET_X, UserSongListConstants.PLAY_OFFSET_Y),
                        new OffsetDataType(UserSongListConstants.PLAY_OFFSET_X, UserSongListConstants.PLAY_OFFSET_Y))
                        .getValue(this.currentBreakpoint))
                  }

                  Column() {
                    Text(item.description)
                      .fontSize(UserSongListConstants.LABEL_FONT_SIZE)
                      .lineHeight(UserSongListConstants.LABEL_LINE_HEIGHT)
                      .height(UserSongListConstants.LABEL_HEIGHT)
                    Text(item.count.toString())
                      .fontSize(UserSongListConstants.COUNT_FONT_SIZE)
                      .lineHeight(UserSongListConstants.COUNT_LINE_HEIGHT)
                      .height(UserSongListConstants.COUNT_HEIGHT)
                      .fontColor($r('app.color.text_secondary_30'))
                  }.margin({
                    left: new BreakpointType(
                      UserSongListConstants.TEXT_LEFT_MARGIN,
                      UserSongListConstants.TEXT_LEFT_MARGIN_NONE,
                      UserSongListConstants.TEXT_LEFT_MARGIN_NONE).getValue(this.currentBreakpoint)
                  })
                  .height(UserSongListConstants.TEXT_BLOCK_HEIGHT)
                  .justifyContent(FlexAlign.Center)
                  .alignItems(HorizontalAlign.Start)

                  if (this.currentBreakpoint === BreakpointConstants.SM) {
                    Blank()
                    Row() {
                      Image($r('app.media.ic_public_arrow_right'))
                        .width(UserSongListConstants.ARROW_WIDTH)
                        .height(UserSongListConstants.ARROW_HEIGHT)
                    }.height(UserSongListConstants.ARROW_ROW_HEIGHT)
                  }
                }.width('100%')

                if (this.currentBreakpoint === BreakpointConstants.SM) {
                  Divider()
                    .width('100%')
                    .strokeWidth(UserSongListConstants.DIVIDER_STROKE_WIDTH)
                    .margin({ left: UserSongListConstants.DIVIDER_LEFT_MARGIN })
                }
              }
            }
          })
        }
        .columnsTemplate(new BreakpointType(
          UserSongListConstants.COLUMNS_SM,
          UserSongListConstants.COLUMNS_MD,
          UserSongListConstants.COLUMNS_LG
        ).getValue(this.currentBreakpoint))
        .columnsGap(UserSongListConstants.COLUMNS_GAP)
        .rowsGap(UserSongListConstants.ROWS_GAP)
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        .width('100%')
      }.width('100%').padding({
        left: UserSongListConstants.HORIZONTAL_PADDING,
        right: UserSongListConstants.HORIZONTAL_PADDING
      })

      if (this.currentBreakpoint !== BreakpointConstants.LG) {
        MusicPlayer()
      }
    }
  }
}
