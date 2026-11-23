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

import { MailType } from '../model/DataType';
import {
  FONT_BADGE,
  FONT_BODY,
  FONT_SUBTITLE,
  ICON_MD,
  ICON_SM,
  ICON_XS,
  ICON_XXS,
  RADIUS_CARD,
  RADIUS_CIRCLE,
  RADIUS_TAG,
  ROW_HEIGHT_LIST_ITEM,
  ROW_HEIGHT_TOOLBAR
} from './Constants';

@Extend(Text) function TextStyle() {
  .backgroundColor($r('app.color.main_blue'))
  .fontColor($r('app.color.white'))
  .fontSize(FONT_BADGE)
  .textAlign(TextAlign.Center)
}

@Component
export struct MailSideBar {
  build() {
    Column() {
      AccountInfo()

      MailStatusList()
    }.width('100%')
  }
}

@Component
struct AccountInfo {
  @State accountList: Resource[] = [
    $r('app.string.mailAccount'),
    $r('app.string.mailAccountSecond'),
  ]

  @Builder accountInfo() {
    Column() {
      Row() {
        Text($r('app.string.account'))
          .fontSize(FONT_BODY)
          .fontColor($r('sys.color.ohos_id_color_text_secondary'))
          .fontWeight(FontWeight.Medium)
        Blank()
        Text($r('app.string.addAccount'))
          .fontSize(FONT_BODY)
          .fontColor($r('app.color.add_account_blue'))
          .fontWeight(FontWeight.Medium)
      }.width('100%').height(ROW_HEIGHT_TOOLBAR)
    }.margin({ top: 78 }).padding({ left: 16, right: 16 })
  }

  build() {
    Column() {
      this.accountInfo()
      List() {
        ForEach(this.accountList, (item: Resource, index: number | undefined) => {
          ListItem() {
            Row() {
              Text()
                .width(ICON_XXS)
                .height(ICON_XXS)
                .borderRadius(RADIUS_TAG)
                .backgroundColor(index === 0 ? $r('app.color.account_green') : $r('app.color.account_yellow'))
              Text(item)
                .fontSize(FONT_SUBTITLE)
                .fontColor(index === 0 ? $r('app.color.font_black') : $r('app.color.font_black_90'))
                .margin({ left: 13 })
              Blank()
              if (index === 0) {
                Image($r('app.media.ic_confirm')).width(ICON_XS)
                  .height(ICON_XS).fillColor($r('app.color.main_blue'))
              } else {
                Text($r('app.string.unreadBadge'))
                  .width(ICON_SM)
                  .height(ICON_SM)
                  .borderRadius(RADIUS_CIRCLE)
                  .TextStyle()
              }
            }.width('100%').height(ROW_HEIGHT_LIST_ITEM)
          }
        })
      }
      .width('100%')
      .padding({ left: 16, right: 16 })
      .divider({ strokeWidth: 1 })
    }
  }
}

@Component
struct MailStatusList {
  @State mailState: MailType[] = [
    new MailType($r('app.string.recvBox'), 3, $r('app.media.inbox')),
    new MailType($r('app.string.unRead'), 5, $r('app.media.unread')),
    new MailType($r('app.string.sended'), 9, $r('app.media.ic_favourites')),
    new MailType($r('app.string.allFolders'), 0, $r('app.media.allFolders'))
  ]

  @Builder accountInfo() {
    Column() {
      Row() {
        Text($r('app.string.account')).fontSize(FONT_BODY)
        Blank()
        Text($r('app.string.addAccount'))
          .fontSize(FONT_BODY)
          .fontColor($r('app.color.add_account_blue'))
      }.width('100%').height(ROW_HEIGHT_TOOLBAR)
    }
  }

  build() {
    List() {
      ListItem() {
        this.accountInfo()
      }.padding({ left: 9, right: 9 })

      ForEach(this.mailState, (item: MailType, index: number | undefined) => {
        ListItem() {
          Row() {
            Image(item.src).width(ICON_MD).height(ICON_MD)
            Text(item.type)
              .fontSize(FONT_SUBTITLE)
              .margin({ left: 16 })
              .fontColor(index === 0 ? $r('app.color.font_black') : $r('app.color.font_black_90'))
              .fontWeight(FontWeight.Medium)
            Blank()
            if (index === this.mailState.length - 1) {
              Image($r('app.media.ic_settings_arrow')).width(ICON_XXS).height(ICON_MD).rotate({ angle: 90 })
            } else {
              Text(item.num.toString())
                .fontColor($r('app.color.font_title'))
                .fontSize(FONT_BODY)
            }
          }.width('100%')
        }.padding({ left: 14, right: 24 })
        .height(ROW_HEIGHT_LIST_ITEM)
        .backgroundColor(index === 0 ? $r('app.color.list_selected_background') : $r('app.color.transparent'))
        .borderRadius(RADIUS_CARD)
      })
    }.width('100%')
    .padding({ left: 7, right: 7 })
    .margin({ top: 8 })
    .divider({ strokeWidth: 1, startMargin: 12, endMargin: 12 })
  }
}
