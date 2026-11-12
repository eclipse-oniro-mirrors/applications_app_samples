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

import { PageConstants } from 'library';

/**
 * Info card component.
 * A generic information card containing a title and a content area.
 */
@Component
export struct InfoCard {
  /** Card title */
  @Prop title: ResourceStr = '';
  /** Card subtitle */
  @Prop subtitle: ResourceStr = '';
  /** Whether to show the divider */
  @Prop showDivider: boolean = true;
  /** Card content builder */
  @BuilderParam content: () => void = this.defaultContent;

  /**
   * Checks whether the subtitle is valid (supports both string and resource types).
   * @returns {boolean} Whether the subtitle should be displayed
   */
  private hasSubtitle(): boolean {
    if (typeof this.subtitle === 'string') {
      return this.subtitle.length > 0;
    }
    return this.subtitle !== undefined;
  }

  /**
   * Default content builder.
   * Shows placeholder text when no custom content is provided.
   */
  @Builder
  defaultContent() {
    Text($r('app.string.info_card_empty'))
      .fontSize(PageConstants.FONT_SIZE_BODY)
      .fontColor(PageConstants.COLOR_TEXT_HINT)
  }

  build() {
    Column() {
      // Card header area
      Column() {
        Text(this.title)
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
          .width('100%')

        if (this.hasSubtitle()) {
          Text(this.subtitle)
            .fontSize(PageConstants.FONT_SIZE_SMALL)
            .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
            .margin({ top: 4 })
            .width('100%')
        }
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      if (this.showDivider) {
        Divider()
          .color('#E0E0E0')
          .margin({ top: PageConstants.ITEM_SPACING, bottom: PageConstants.ITEM_SPACING })
      }

      // Card content area
      Column() {
        this.content()
      }
      .width('100%')
    }
    .width('100%')
    .padding(PageConstants.CARD_PADDING)
    .backgroundColor(PageConstants.COLOR_CARD)
    .borderRadius(PageConstants.CARD_BORDER_RADIUS)
    .shadow({
      radius: 4,
      color: PageConstants.COLOR_SHADOW,
      offsetX: 0,
      offsetY: 2
    })
  }
}
