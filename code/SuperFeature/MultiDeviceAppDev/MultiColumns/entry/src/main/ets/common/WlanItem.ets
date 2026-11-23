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

import { SubItem } from './SettingItem';
import {
  BREAKPOINT_MD,
  BREAKPOINT_SM,
  FONT_SUBTITLE,
  FONT_TITLE,
  ICON_MD,
  KEY_CURRENT_BREAKPOINT,
  RADIUS_CARD,
  ROW_HEIGHT_TITLE_BAR
} from './Constants';

@Component
export struct WlanItem {
  @State netWorkStatus: Resource = $r('app.string.closed')
  @LocalStorageProp(KEY_CURRENT_BREAKPOINT) currentBreakPoint: string = BREAKPOINT_MD

  @Builder CustomDivider() {
    Divider()
      .strokeWidth('1px')
      .color($r('sys.color.ohos_id_color_list_separator'))
      .margin({ left: 8, right: 8 })
  }

  build() {
    NavDestination() {
      Row() {
        if (this.currentBreakPoint === BREAKPOINT_SM) {
          Image($r('app.media.ic_public_back')).width(ICON_MD).height(ICON_MD).margin({ right: 16 })
        }
        Text($r('app.string.WLAN')).fontSize(FONT_TITLE).fontWeight(FontWeight.Medium)
        Blank()
        Image($r('app.media.ic_public_help')).width(ICON_MD).aspectRatio(1)
      }.width('100%').height(ROW_HEIGHT_TITLE_BAR).margin({ top: 38, bottom: 24 })
      .padding({ left: 24, right: 24 })

      List({ space: 20 }) {
        ListItem() {
          SubItem({ itemDesc: $r('app.string.WLAN'), isShowButton: true })
        }.width('100%')
        .borderRadius(RADIUS_CARD)
        .backgroundColor($r('sys.color.ohos_id_color_foreground_contrary'))
        .padding({ top: 4, bottom: 4 })

        ListItem() {
          SubItem({
            itemDesc: $r('app.string.networkAcceleration'),
            isShowRightArrow: true,
            itemStatusDesc: this.netWorkStatus
          })
        }.width('100%')
        .borderRadius(RADIUS_CARD)
        .backgroundColor($r('sys.color.ohos_id_color_foreground_contrary'))
        .padding({ top: 4, bottom: 4 })

        ListItem() {
          SubItem({ itemDesc: $r('app.string.moreWLANSettings'), isShowRightArrow: true })
        }.width('100%')
        .borderRadius(RADIUS_CARD)
        .backgroundColor($r('sys.color.ohos_id_color_foreground_contrary'))
        .padding({ top: 4, bottom: 4 })

        ListItem() {
          Column() {
            Text($r('app.string.wlanConnected'))
              .fontSize(FONT_SUBTITLE)
              .fontColor($r('app.color.font_grey_40'))
              .width('100%')
              .padding({ left: 12 })
            SubItem({
              itemDesc: $r('app.string.wifiName'),
              content: $r('app.string.connected'),
              src: $r('app.media.wlan2'),
              isLinkAddress: true
            })
              .margin({ top: 8 })
              .width('100%')
              .borderRadius(RADIUS_CARD)
              .backgroundColor($r('sys.color.ohos_id_color_foreground_contrary'))
              .padding({ top: 4, bottom: 4 })
          }
        }

        ListItem() {
          Column() {
            Row() {
              Text($r('app.string.wlanUseful'))
                .fontSize(FONT_SUBTITLE)
                .fontColor($r('app.color.font_grey_40'))
                .width('100%')
                .padding({ left: 12 })
            }

            Column() {
              SubItem({
                itemDesc: $r('app.string.wifiName'),
                content: $r('app.string.useful'),
                src: $r('app.media.wlan1')
              })
              this.CustomDivider()
              SubItem({
                itemDesc: $r('app.string.wifiName'),
                content: $r('app.string.useful'),
                src: $r('app.media.wlan2')
              })
              this.CustomDivider()
              SubItem({
                itemDesc: $r('app.string.wifiName'),
                content: $r('app.string.useless'),
                src: $r('app.media.wlan3')
              })
            }
            .width('100%')
            .borderRadius(RADIUS_CARD)
            .backgroundColor($r('sys.color.ohos_id_color_foreground_contrary'))
            .padding({ top: 4, bottom: 4 })
            .margin({ top: 8 })
          }
        }

        ListItem() {
          SubItem({ itemDesc: $r('app.string.addNetWork'), isLinkAddress: true })
        }.width('100%')
        .borderRadius(RADIUS_CARD)
        .backgroundColor($r('sys.color.ohos_id_color_foreground_contrary'))
        .padding({ top: 4, bottom: 4 })

      }.padding({ left: 12, right: 12 })
    }.title($r('app.string.WLAN'))
    .hideTitleBar(true)
    .backgroundColor($r('app.color.side_bar_background'))
  }
}


