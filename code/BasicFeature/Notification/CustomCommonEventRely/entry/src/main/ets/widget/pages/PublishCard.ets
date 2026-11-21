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

import { CommonEventConstants, UiConstants } from '../../util/Constants';

let storage: LocalStorage = new LocalStorage();

interface CardAction {
  action: string;
  params: Record<string, string>;
}

/**
 * Service widget that publishes the custom common event when it is clicked.
 */
@Entry(storage)
@Component
struct PublishCard {
  @LocalStorageProp('publishCount') publishCount: number = 0;
  @State isClicked: boolean = false;

  build() {
    Row() {
      Column() {
        Text($r('app.string.card_title'))
          .id('card_title_text')
          .fontSize(UiConstants.CARD_TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.primary_text'))
          .width(UiConstants.FULL_WIDTH_PERCENT)
          .textAlign(TextAlign.Start)
        Text($r('app.string.card_subtitle'))
          .id('card_subtitle_text')
          .fontSize(UiConstants.CAPTION_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(UiConstants.FULL_WIDTH_PERCENT)
          .margin({ top: UiConstants.ITEM_SPACING })
          .textAlign(TextAlign.Start)
        Text($r('app.string.card_publish_count', this.publishCount))
          .id('card_publish_count_text')
          .fontSize(UiConstants.CAPTION_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
          .width(UiConstants.FULL_WIDTH_PERCENT)
          .margin({ top: UiConstants.ITEM_SPACING })
          .textAlign(TextAlign.Start)
      }
      .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
        .padding(UiConstants.CARD_PADDING)

      Button(this.isClicked ? $r('app.string.card_button_again') : $r('app.string.card_button'))
        .id('card_publish_button')
        .height(UiConstants.BUTTON_HEIGHT)
        .fontSize(UiConstants.BODY_FONT_SIZE)
        .backgroundColor($r('app.color.primary_button_background'))
        .fontColor($r('app.color.primary_button_font'))
        .margin({ right: UiConstants.CARD_PADDING })
        .onClick(() => {
          this.isClicked = true;
          this.publishEvent();
        })
    }
    .width(UiConstants.FULL_WIDTH_PERCENT)
      .height(UiConstants.FULL_HEIGHT_PERCENT)
      .backgroundColor($r('app.color.card_background'))
      .borderRadius(UiConstants.CARD_RADIUS)
  }

  private publishEvent(): void {
    let params: Record<string, string> = {};
    params[CommonEventConstants.FORM_MESSAGE_KEY] = CommonEventConstants.DATA_OUT_APP;
    let action: CardAction = {
      action: 'message',
      params: params
    };
    postCardAction(this, action);
  }
}
