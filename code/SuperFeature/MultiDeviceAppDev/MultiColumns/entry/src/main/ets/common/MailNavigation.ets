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

import { BreakpointType } from './BreakpointSystem';
import { MailContent } from './MailContent';
import {
  BREAKPOINT_LG,
  BREAKPOINT_MD,
  FAB_POSITION_X,
  FAB_POSITION_Y,
  FONT_BODY,
  FONT_CAPTION,
  FONT_DISPLAY,
  FONT_SUBTITLE,
  ICON_MD,
  ICON_XXL,
  KEY_CURRENT_BREAKPOINT,
  LINE_HEIGHT_BODY_TIGHT,
  LINE_HEIGHT_DISPLAY,
  LINE_HEIGHT_SUBTITLE,
  LINE_HEIGHT_SUBTITLE_TIGHT,
  MAIL_NAV_BAR_WIDTH_LG,
  MAIL_NAV_BAR_WIDTH_MD,
  MAIL_NAV_BAR_WIDTH_SM,
  NAV_PATH_FIRST,
  NAV_TITLE_HEIGHT,
  NAV_TITLE_WIDTH,
  OPACITY_SECONDARY,
  RADIUS_COMPACT,
  ROW_HEIGHT_LIST_ITEM,
  ROW_HEIGHT_MAIL_ITEM,
  SELECTED_MAIL_INDEX
} from './Constants';

@Component
export struct MailNavigation {
  @State pathInfo: NavPathStack = new NavPathStack()
  @State currentIndex: number = 0
  @State mailList: string[] = ['1', '1', '1', '1', '1', '1']
  @LocalStorageProp(KEY_CURRENT_BREAKPOINT) currentBreakPoint: string = BREAKPOINT_MD

  @Builder
  myRouter(name: string, param?: number | undefined) {
    MailContent()
  }

  @Builder
  NavigationMenus() {
    if (this.currentBreakPoint !== BREAKPOINT_MD) {
      Row() {
        Image($r('app.media.add'))
          .width(ICON_MD)
          .height(ICON_MD)
        Image($r('app.media.more'))
          .width(ICON_MD)
          .height(ICON_MD)
          .margin({ left: 24, right: 0 })
      }.height(ROW_HEIGHT_LIST_ITEM).padding({ top: 48 })
    }
  }

  @Builder
  NavigationTitle() {
    Column() {
      Text($r('app.string.recvBox'))
        .fontColor($r('app.color.font_black'))
        .fontSize(FONT_DISPLAY)
        .lineHeight(LINE_HEIGHT_DISPLAY)
        .fontWeight(FontWeight.Medium)
      Text($r('app.string.mailAccount'))
        .fontColor($r('app.color.font_grey_60'))
        .fontSize(FONT_BODY)
        .lineHeight(LINE_HEIGHT_SUBTITLE_TIGHT)
        .margin({ top: 2 })
    }.alignItems(HorizontalAlign.Start).height(NAV_TITLE_HEIGHT).width(NAV_TITLE_WIDTH).padding({ top: 80, left: 24 })
  }

  aboutToAppear() {
    this.pathInfo.pushPath({ name: NAV_PATH_FIRST })
  }

  build() {
    Navigation(this.pathInfo) {
      Stack({ alignContent: Alignment.Start }) {
        Column() {
          Row() {
            Search({ placeholder: $r('app.string.searchMail') }).margin({ left: 12, right: 12 })
          }.height(ROW_HEIGHT_LIST_ITEM)

          List() {
            ForEach(this.mailList, (item: string, index: number | undefined) => {
              ListItem() {
                Column() {
                  Row() {

                    Text($r('app.string.nonSense'))
                      .fontSize(FONT_SUBTITLE)
                      .lineHeight(LINE_HEIGHT_SUBTITLE)
                      .fontColor($r('app.color.font_title'))
                    Blank()
                    Text($r('app.string.mailDate')).fontSize(FONT_CAPTION).opacity(OPACITY_SECONDARY)
                  }.width('100%')

                  Column() {
                    Text($r('app.string.textPartOne'))
                      .lineHeight(LINE_HEIGHT_BODY_TIGHT)
                      .fontSize(FONT_BODY)
                      .fontColor($r('app.color.font_title'))
                    Text($r('app.string.textPartTwo'))
                      .fontSize(FONT_BODY)
                      .fontColor($r('app.color.font_title'))
                      .opacity(OPACITY_SECONDARY)
                      .lineHeight(LINE_HEIGHT_BODY_TIGHT)
                  }.width('100%').alignItems(HorizontalAlign.Start)
                }.height(ROW_HEIGHT_MAIL_ITEM).justifyContent(FlexAlign.Center)
              }.padding({ left: 12, right: 12 })
              .backgroundColor(index === SELECTED_MAIL_INDEX
                ? $r('app.color.list_selected_background')
                : $r('app.color.transparent'))
              .borderRadius(RADIUS_COMPACT)
            })
          }.divider({ strokeWidth: 1, startMargin: 12, endMargin: 12 })
          .layoutWeight(1)
        }.height('100%').width('100%')
        .padding({ left: 12, right: 12 })

        if (this.currentBreakPoint !== BREAKPOINT_LG) {
          Image($r('app.media.ic_public_list_add_light'))
            .width(ICON_XXL)
            .height(ICON_XXL)
            .position({ x: FAB_POSITION_X, y: FAB_POSITION_Y })
        }
      }
    }
    .navBarWidth(new BreakpointType(MAIL_NAV_BAR_WIDTH_SM, MAIL_NAV_BAR_WIDTH_MD, MAIL_NAV_BAR_WIDTH_LG)
      .GetValue(this.currentBreakPoint) as number | Length)
    .navDestination(this.myRouter)
    .menus(this.NavigationMenus)
    .width('100%')
    .title({ builder: this.NavigationTitle, height: 162 })
    .hideBackButton(true)
  }
}
