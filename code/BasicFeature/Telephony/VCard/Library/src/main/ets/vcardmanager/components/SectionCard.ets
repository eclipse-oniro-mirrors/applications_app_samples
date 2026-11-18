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

@ComponentV2
export struct SectionCard {
  @Param idPrefix: string = 'id_section';
  @Param title: ResourceStr = '';
  @Param subtitle: ResourceStr = '';
  @BuilderParam content: () => void = this.emptyContent;

  @Builder
  emptyContent(): void {
  }

  build() {
    Column({ space: 12 }) {
      Column({ space: 4 }) {
        Text(this.title)
          .id(`${this.idPrefix}_title`)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .width('100%')
        if (this.subtitle !== '') {
          Text(this.subtitle)
            .id(`${this.idPrefix}_subtitle`)
            .fontSize(12)
            .fontColor($r('app.color.text_secondary'))
            .lineHeight(18)
            .maxLines(3)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .width('100%')
        }
      }
      .id(`${this.idPrefix}_header`)
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      this.content()
    }
    .id(`${this.idPrefix}_card`)
    .width('100%')
    .padding(16)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(12)
    .alignItems(HorizontalAlign.Start)
  }
}
