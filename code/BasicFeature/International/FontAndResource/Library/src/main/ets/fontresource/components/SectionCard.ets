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

// A card container with a title, an optional subtitle and builder supplied content.
@ComponentV2
export struct SectionCard {
  // The unique id prefix used to build test ids for this card instance.
  @Param idPrefix: string = 'id_section';
  // The localized card title shown at the top.
  @Param title: ResourceStr = '';
  // The optional localized subtitle shown under the title.
  @Param subtitle: ResourceStr = '';
  // The builder content slot supplied by the caller page.
  @BuilderParam content: () => void = this.emptyContent;

  // The default empty builder used when the caller supplies no content.
  @Builder
  emptyContent(): void {
  }

  // Builds the card chrome with the header and the slotted content.
  build() {
    // Stack the header and the content vertically with a small gap.
    Column({ space: 12 }) {
      // Group the title and subtitle into one header block.
      Column({ space: 4 }) {
        // Render the card title in the primary text color.
        Text(this.title)
          .id(`${this.idPrefix}_title`)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .width('100%')
        // Render the subtitle only when a non-empty value was supplied.
        if (this.subtitle !== '') {
          // Render the muted subtitle text under the title.
          Text(this.subtitle)
            .id(`${this.idPrefix}_subtitle`)
            .fontSize(12)
            .fontColor($r('app.color.text_secondary'))
            .lineHeight(18)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .width('100%')
        }
      }
      // Attach the header test id.
      .id(`${this.idPrefix}_header`)
      // Stretch the header across the card width.
      .width('100%')
      // Align the header children to the leading edge.
      .alignItems(HorizontalAlign.Start)

      // Render the caller supplied content slot.
      this.content()
    }
    // Attach the card level test id.
    .id(`${this.idPrefix}_card`)
    // Stretch the card across the parent width.
    .width('100%')
    // Pad the card content on every side.
    .padding(16)
    // Paint the card background behind the content.
    .backgroundColor($r('app.color.card_bg'))
    // Round the card corners to match the design language.
    .borderRadius(12)
    // Align the stacked children to the leading edge.
    .alignItems(HorizontalAlign.Start)
  }
}
