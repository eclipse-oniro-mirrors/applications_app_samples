/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import {
  PAGE_WIDTH, HEADER_HEIGHT, HEADER_PADDING_LEFT, DESC_PADDING_HORIZONTAL,
  DESC_MARGIN_BOTTOM, SECTION_MARGIN_BOTTOM, ITEM_MARGIN_BOTTOM,
  TITLE_FONT_SIZE, DESC_FONT_SIZE, HINT_FONT_SIZE,
  BUTTON_WIDTH, BUTTON_HEIGHT, BUTTON_FONT_SIZE, BUTTON_BORDER_RADIUS,
  COLOR_PRIMARY, COLOR_PRIMARY_BG, COLOR_TEXT_SECONDARY, COLOR_TEXT_HINT
} from '../common/constants/UiConstants';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Row() {
        Text($r('app.string.index_title'))
          .fontSize(TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Bold)
      }
      .width(PAGE_WIDTH)
      .height(HEADER_HEIGHT)
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Center)
      .padding({ left: HEADER_PADDING_LEFT })

      Text($r('app.string.index_description'))
        .fontSize(DESC_FONT_SIZE)
        .fontColor(COLOR_TEXT_SECONDARY)
        .padding({ left: DESC_PADDING_HORIZONTAL, right: DESC_PADDING_HORIZONTAL })
        .margin({ bottom: DESC_MARGIN_BOTTOM })

      Column() {
        Button($r('app.string.scheme_one_default_duck'))
          .width(BUTTON_WIDTH)
          .height(BUTTON_HEIGHT)
          .fontSize(BUTTON_FONT_SIZE)
          .fontColor(COLOR_PRIMARY)
          .backgroundColor(COLOR_PRIMARY_BG)
          .borderRadius(BUTTON_BORDER_RADIUS)
          .margin({ bottom: ITEM_MARGIN_BOTTOM })
          .onClick(() => {
            router.pushUrl({ url: 'duck/pages/DuckPage' });
          })

        Text($r('app.string.scheme_one_desc'))
          .fontSize(HINT_FONT_SIZE)
          .fontColor(COLOR_TEXT_HINT)
          .margin({ bottom: SECTION_MARGIN_BOTTOM })

        Button($r('app.string.scheme_two_duck_session_btn'))
          .width(BUTTON_WIDTH)
          .height(BUTTON_HEIGHT)
          .fontSize(BUTTON_FONT_SIZE)
          .fontColor(COLOR_PRIMARY)
          .backgroundColor(COLOR_PRIMARY_BG)
          .borderRadius(BUTTON_BORDER_RADIUS)
          .margin({ bottom: ITEM_MARGIN_BOTTOM })
          .onClick(() => {
            router.pushUrl({ url: 'duck/pages/DuckSessionPage' });
          })

        Text($r('app.string.scheme_two_desc'))
          .fontSize(HINT_FONT_SIZE)
          .fontColor(COLOR_TEXT_HINT)
          .margin({ bottom: SECTION_MARGIN_BOTTOM })

        Button($r('app.string.scheme_three_mix_session_btn'))
          .width(BUTTON_WIDTH)
          .height(BUTTON_HEIGHT)
          .fontSize(BUTTON_FONT_SIZE)
          .fontColor(COLOR_PRIMARY)
          .backgroundColor(COLOR_PRIMARY_BG)
          .borderRadius(BUTTON_BORDER_RADIUS)
          .onClick(() => {
            router.pushUrl({ url: 'duck/pages/MixSessionPage' });
          })

        Text($r('app.string.scheme_three_desc'))
          .fontSize(HINT_FONT_SIZE)
          .fontColor(COLOR_TEXT_HINT)
      }
      .width('100%')
      .justifyContent(FlexAlign.End)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
  }
}
