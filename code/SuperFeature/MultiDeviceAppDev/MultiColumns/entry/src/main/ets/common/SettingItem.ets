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

import {
  FONT_BODY,
  FONT_HARMONY_HEITI,
  FONT_SUBTITLE,
  ICON_LG,
  ICON_MD,
  ICON_XXS,
  LINE_HEIGHT_SUBTITLE,
  OPACITY_SECONDARY,
  RADIUS_CARD_SM,
  ROW_HEIGHT_LIST_ITEM,
  SWITCH_HEIGHT,
  SWITCH_WIDTH
} from './Constants';

@Component
export struct MainItem {
  itemDesc: Resource = $r('app.string.nonSense')
  src: Resource = $r('app.media.icon')
  isUserItem: boolean = false
  itemStatusDesc: Resource = $r('app.string.nonSense')

  build() {
    Row() {
      Image(this.src).width(ICON_LG).aspectRatio(1)

      if (this.isUserItem) {
        Column() {
          Text($r('app.string.userInfo')).fontSize(FONT_SUBTITLE).fontWeight(FontWeight.Medium)
          Text($r('app.string.aboutUserInfo'))
            .fontSize(FONT_BODY)
            .fontWeight(FontWeight.Regular)
            .opacity(OPACITY_SECONDARY)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }.alignItems(HorizontalAlign.Start).margin({ left: 12 }).flexShrink(1)
      } else {
        Text(this.itemDesc)
          .fontSize(FONT_SUBTITLE)
          .lineHeight(LINE_HEIGHT_SUBTITLE)
          .fontWeight(FontWeight.Medium)
          .fontFamily(FONT_HARMONY_HEITI)
          .fontColor($r('sys.color.ohos_id_color_text_primary'))
          .align(Alignment.Start)
          .margin({ left: 16 })
      }

      Blank()

      if (this.itemStatusDesc) {
        Text(this.itemStatusDesc).fontWeight(FontWeight.Regular).fontSize(FONT_BODY)
      }
      Image($r('app.media.ic_settings_arrow'))
        .width(ICON_XXS)
        .height(ICON_MD)
        .fillColor($r('sys.color.ohos_id_color_fourth'))
        .margin({ left: 4 })
    }.padding({ left: 12, right: 12 })
    .height(ROW_HEIGHT_LIST_ITEM)
    .borderRadius(RADIUS_CARD_SM)
    .width('100%')
  }
}

@Component
export struct SubItem {
  itemDesc: Resource = $r('app.string.nonSense')
  src: Resource = $r('app.media.icon')
  isShowButton: boolean = false
  isShowRightArrow: boolean = false
  itemStatusDesc: Resource = $r('app.string.nonSense')
  content: Resource = $r('app.string.nonSense')
  isLinkAddress: boolean = false
  @State switchOn: boolean = true

  build() {
    Row() {
      Column() {
        Text(this.itemDesc)
          .fontSize(FONT_SUBTITLE)
          .lineHeight(LINE_HEIGHT_SUBTITLE)
          .fontWeight(FontWeight.Medium)
          .fontFamily(FONT_HARMONY_HEITI)
          .fontColor(this.isLinkAddress ? $r('app.color.main_blue') : $r('sys.color.ohos_id_color_text_primary'))
          .align(Alignment.Start)
        if (this.content) {
          Text(this.content)
            .fontWeight(FontWeight.Regular)
            .fontSize(FONT_BODY)
            .fontColor($r('app.color.font_grey_60')).margin({ top: 1.5 })
        }
      }.alignItems(HorizontalAlign.Start)

      Blank()

      if (this.isShowButton) {
        Toggle({ type: ToggleType.Switch, isOn: this.switchOn })
          .id('ToggleSwitch')
          .width(SWITCH_WIDTH)
          .height(SWITCH_HEIGHT)
          .selectedColor($r('app.color.switch_blue'))
      } else if (this.isShowRightArrow) {
        if (this.itemStatusDesc) {
          Text(this.itemStatusDesc).fontWeight(FontWeight.Regular).fontSize(FONT_BODY)
        }
        Image($r('app.media.ic_settings_arrow'))
          .width(ICON_XXS)
          .height(ICON_MD)
          .fillColor($r('sys.color.ohos_id_color_fourth'))
          .margin({ left: 4
          })
      } else {
        Image(this.src)
          .width(ICON_MD)
          .height(ICON_MD)
          .fillColor($r('sys.color.ohos_id_color_primary'))
      }
    }
    .height(ROW_HEIGHT_LIST_ITEM)
    .borderRadius(RADIUS_CARD_SM)
    .width('100%')
    .padding({ left: 12, right: 12 })
  }
}
