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

/**
 * Reusable card container with a title, optional subtitle and caller-provided content.
 */
@ComponentV2
export struct SectionCard {
  // Prefix used to build the component ids of the inner components.
  @Param idPrefix: string = 'id_section';
  // Title text shown at the card top.
  @Param title: ResourceStr = '';
  // Optional subtitle under the title.
  @Param subtitle: ResourceStr = '';
  // Builder slot filled with the card body by the caller.
  @BuilderParam content: () => void = this.emptyContent;

  /**
   * Fallback body used when the caller provides no content builder.
   */
  @Builder
  emptyContent(): void {
  }

  /**
   * Build the card frame with the header block and the content slot.
   */
  build() {
    Column({ space: 12 }) {
      Column({ space: 4 }) {
        Text(this.title)
          .id(this.idPrefix + '_title')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .width('100%')
        // Render the subtitle only when the caller provided one.
        if (this.subtitle !== '') {
          Text(this.subtitle)
            .id(this.idPrefix + '_subtitle')
            .fontSize(12)
            .fontColor($r('app.color.text_secondary'))
            .lineHeight(18)
            .width('100%')
        }
      }
      .id(this.idPrefix + '_header')
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      // Render the caller-provided card body.
      this.content()
    }
    .id(this.idPrefix + '_card')
    .width('100%')
    .padding(16)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius($r('app.float.card_radius'))
    .alignItems(HorizontalAlign.Start)
  }
}
