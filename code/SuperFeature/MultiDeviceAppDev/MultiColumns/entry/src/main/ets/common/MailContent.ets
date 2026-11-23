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

import { OperateTabs } from '../model/DataType';
import {
  BREAKPOINT_MD,
  BREAKPOINT_SM,
  FONT_BADGE,
  FONT_BODY,
  FONT_SUBTITLE,
  FONT_TITLE,
  ICON_MD,
  ICON_XXS,
  KEY_CURRENT_BREAKPOINT,
  LINE_HEIGHT_BADGE,
  LINE_HEIGHT_BODY,
  LINE_HEIGHT_TITLE,
  MAIL_BODY_CONTENT_HEIGHT,
  MAIL_BODY_IMAGE_HEIGHT,
  MAIL_CONTENT_PADDING_MD_LG,
  MAIL_CONTENT_PADDING_SM,
  OPACITY_SECONDARY,
  OPACITY_TERTIARY,
  RADIUS_COMPACT,
  ROW_HEIGHT_LIST_ITEM,
  ROW_HEIGHT_TOOLBAR
} from './Constants';

@Component
export struct MailContent {
  @State buttonList: OperateTabs[] = [
    new OperateTabs($r('app.media.reply'), $r('app.string.reply')),
    new OperateTabs($r('app.media.replyAll'), $r('app.string.replyAll')),
    new OperateTabs($r('app.media.forward'), $r('app.string.send')),
    new OperateTabs($r('app.media.ic_public_delete'), $r('app.string.delete')),
    new OperateTabs($r('app.media.more'), $r('app.string.more')),
  ]
  @LocalStorageProp(KEY_CURRENT_BREAKPOINT) currentBreakPoint: string = BREAKPOINT_MD

  build() {
    NavDestination() {
      Column() {
        Column() {
          Row() {
            if (this.currentBreakPoint === BREAKPOINT_SM) {
              Row().width(ICON_MD).height(ICON_MD)
            } else {
              Image($r('app.media.ic_expand'))
                .width(ICON_MD)
                .height(ICON_MD)
            }
            Text($r('app.string.mailSenderTitle'))
              .fontSize(FONT_TITLE)
              .lineHeight(LINE_HEIGHT_TITLE)
              .margin({ left: 21 })
              .fontWeight(FontWeight.Medium)
          }.width('100%').height(ROW_HEIGHT_LIST_ITEM)

          Row() {
            Text($r('app.string.recUser')).fontSize(FONT_BODY).fontWeight(FontWeight.Regular)
            Text($r('app.string.mailDesc')).padding({ left: 12 }).fontSize(FONT_SUBTITLE).fontWeight(FontWeight.Medium)
            Blank()
            Image($r('app.media.right_expend_grey'))
              .width(ICON_MD)
              .height(ICON_XXS)
              .opacity(OPACITY_TERTIARY)
              .rotate({ angle: 90 })
          }.width('100%').height(ROW_HEIGHT_TOOLBAR)

          Text($r('app.string.mailSender'))
            .fontSize(FONT_TITLE)
            .fontColor($r('app.color.font_deep_grey'))
            .lineHeight(LINE_HEIGHT_TITLE)
          Text($r('app.string.mailTime'))
            .margin({ top: 2 })
            .fontColor($r('app.color.font_title'))
            .opacity(OPACITY_SECONDARY)

          Column() {
            Text($r('app.string.textData'))
              .fontSize(FONT_SUBTITLE)
              .fontWeight(FontWeight.Regular)
              .lineHeight(LINE_HEIGHT_BODY)
            Text($r('app.string.bodyTextPartOne'))
              .fontSize(FONT_SUBTITLE)
              .fontWeight(FontWeight.Regular)
              .lineHeight(LINE_HEIGHT_BODY)
              .margin({ bottom: LINE_HEIGHT_BODY })
            Image($r('app.media.orange'))
              .width('100%')
              .height(MAIL_BODY_IMAGE_HEIGHT)
              .borderRadius(RADIUS_COMPACT)
            Text($r('app.string.bodyTextPartTwo'))
              .fontSize(FONT_SUBTITLE)
              .fontWeight(FontWeight.Regular)
              .lineHeight(LINE_HEIGHT_BODY)
              .margin({ top: LINE_HEIGHT_BODY })
            Text($r('app.string.bodyTextPartThree'))
              .fontSize(FONT_SUBTITLE)
              .fontWeight(FontWeight.Regular)
              .lineHeight(LINE_HEIGHT_BODY)
          }.margin({ top: 20 }).height(MAIL_BODY_CONTENT_HEIGHT).width('100%').alignItems(HorizontalAlign.Start)
        }.layoutWeight(1).padding({ left: 20, right: 20, top: 24 }).alignItems(HorizontalAlign.Start)

        Row() {
          ForEach(this.buttonList, (item: OperateTabs) => {
            Column() {
              Image(item.src).width(ICON_MD).height(ICON_MD)
              Text(item.name).fontSize(FONT_BADGE).margin({ top: 3 }).lineHeight(LINE_HEIGHT_BADGE)
            }
          })
        }
        .width('100%')
        .height(ROW_HEIGHT_LIST_ITEM)
        .justifyContent(FlexAlign.SpaceBetween)
        .padding(this.currentBreakPoint === BREAKPOINT_SM
          ? { left: MAIL_CONTENT_PADDING_SM, right: MAIL_CONTENT_PADDING_SM }
          : { left: MAIL_CONTENT_PADDING_MD_LG, right: MAIL_CONTENT_PADDING_MD_LG })
        .backgroundColor($r('app.color.white'))
      }
    }
    .width('100%')
    .height('100%')
    .hideTitleBar(true)
  }
}
